note

	description:

		"Objects that trace expression execution"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TRACE_WRAPPER

inherit

	XM_XSLT_INSTRUCTION
		redefine
			item_type, compute_cardinality, is_trace_wrapper,
			compute_dependencies, creates_new_nodes, evaluate_item,
			create_iterator, create_node_iterator, sub_expressions, set_unsorted,
			set_unsorted_if_homogeneous, native_implementations
		end

feature -- Access

	trace_details: XM_XSLT_TRACE_DETAILS
			-- Tracing information
		deferred
		ensure
			result_not_void: Result /= Void
		end

	child: XM_XPATH_EXPRESSION
			-- Expression to be traced

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := child.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (child, 1)
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			child.display (a_level)
		end

	compute_dependencies
			-- Compute dependencies on context.
		do
			compute_intrinsic_dependencies
			if child.is_computed_expression then
				if not child.are_dependencies_computed then
					child.as_computed_expression.compute_dependencies
				end
				set_dependencies (child)
			else
				initialize_dependencies
			end
		end

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do

			-- Suppress such optimizations as promotion out of loops when tracing

			Result := True
		end

	is_trace_wrapper: BOOLEAN
			-- Is `Current' an `XM_XSLT_TRACE_WRAPPER'?
		do
			Result := True
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			child.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_child (l_replacement_item)
			end
			a_replacement.put (Current)
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			child.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_child (l_replacement_item)
			end
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			child.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				set_child (l_replacement_item)
			end
			a_replacement.put (Current)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_trace_listener: detachable XM_XSLT_TRACE_LISTENER
			l_is_tracing: BOOLEAN
			l_transformer: XM_XSLT_TRANSFORMER
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- This is XSLT
				attached l_evaluation_context.transformer as l_evaluation_context_transformer
			then
				l_transformer := l_evaluation_context_transformer
				l_is_tracing := l_transformer.is_tracing
				l_trace_listener := l_transformer.trace_listener
				if l_trace_listener /= Void then
					check l_is_tracing: l_is_tracing end
					l_trace_listener.trace_instruction_entry (trace_details)
				end
				child.evaluate_item (a_result, a_context)
				if l_trace_listener /= Void then
					check l_is_tracing: l_is_tracing end
					l_trace_listener.trace_instruction_exit (trace_details)
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence.
		local
			a_trace_listener: detachable XM_XSLT_TRACE_LISTENER
			is_tracing: BOOLEAN
			a_transformer: XM_XSLT_TRANSFORMER
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as an_evaluation_context
				-- This is XSLT
				attached an_evaluation_context.transformer as l_evaluation_context_transformer
			then
				a_transformer := l_evaluation_context_transformer
				is_tracing := a_transformer.is_tracing
				a_trace_listener := a_transformer.trace_listener
				if a_trace_listener /= Void then
					check is_tracing: is_tracing end
					a_trace_listener.trace_instruction_entry (trace_details)
				end
				child.create_iterator (a_context)
				last_iterator := child.last_iterator
				if a_trace_listener /= Void then
					check is_tracing: is_tracing end
					a_trace_listener.trace_instruction_exit (trace_details)
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_trace_listener: detachable XM_XSLT_TRACE_LISTENER
			l_is_tracing: BOOLEAN
			l_transformer: XM_XSLT_TRANSFORMER
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- This is XSLT
				attached l_evaluation_context.transformer as l_evaluation_context_transformer

			then
				l_transformer := l_evaluation_context_transformer
				l_is_tracing := l_transformer.is_tracing
				l_trace_listener := l_transformer.trace_listener
				if l_trace_listener /= Void then
					check l_is_tracing: l_is_tracing end
					l_trace_listener.trace_instruction_entry (trace_details)
				end
				child.create_node_iterator (a_context)
				last_node_iterator := child.last_node_iterator
				if l_trace_listener /= Void then
					check l_is_tracing: l_is_tracing end
					l_trace_listener.trace_instruction_exit (trace_details)
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_trace_listener: detachable XM_XSLT_TRACE_LISTENER
			is_tracing: BOOLEAN
		do
			check attached a_context.transformer as l_context_transformer then
				a_transformer := l_context_transformer
				is_tracing := a_transformer.is_tracing
				a_trace_listener := a_transformer.trace_listener
				if a_trace_listener /= Void then
					check is_tracing: is_tracing end
					a_trace_listener.trace_instruction_entry (trace_details)
				end
				child.generate_events (a_context)
				if a_trace_listener /= Void then
					check is_tracing: is_tracing end
					a_trace_listener.trace_instruction_exit (trace_details)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := child.native_implementations
		end

	compute_cardinality
			-- Compute cardinality.
		do
			if child.is_computed_expression then
				if not child.are_cardinalities_computed then
					child.as_computed_expression.compute_cardinality
				end
			end
			set_cardinalities (child)
		end

	set_unsorted (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; eliminate_duplicates: BOOLEAN)
			-- Remove unwanted sorting from an expression, at compile time.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			create l_replacement.make (Void)
			child.set_unsorted (l_replacement, eliminate_duplicates)
			check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
				set_child (l_replacement_item)
			end
		end

	set_unsorted_if_homogeneous  (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; eliminate_duplicates: BOOLEAN)
			-- Remove unwanted sorting from an expression, at compile time,
			--  but only if all nodes or all atomic values.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			a_replacement.put (Current)
			create l_replacement.make (Void)
			child.set_unsorted_if_homogeneous (l_replacement, eliminate_duplicates)
			check postcondition_of_set_unsorted_if_homogeneous: attached l_replacement.item as l_replacement_item then
				set_child (l_replacement_item)
			end
		end

feature {NONE} -- Implementation

	set_child (a_child: XM_XPATH_EXPRESSION)
			-- Ensure `child' = `a_child'.
		do
			if child /= a_child then
				child := a_child
				if child /= Void then
					adopt_child_expression (child)
					reset_static_properties
				end
			end
		ensure
			set: child = a_child
		end


invariant

	child_not_void: child /= Void

end

