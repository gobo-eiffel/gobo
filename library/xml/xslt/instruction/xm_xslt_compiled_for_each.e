indexing

	description: "Objects that represent an xsl:for-each,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_FOR_EACH

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			item_type, creates_new_nodes, compute_dependencies, promote_instruction,
			sub_expressions, native_implementations, create_iterator, create_node_iterator
		end

	XM_XPATH_PROMOTION_ACTIONS

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, an_action: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: an_action /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			action := an_action
			adopt_child_expression (action)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			action_set: action = an_action
		end

feature -- Access
	
	action: XM_XPATH_EXPRESSION
			-- Action to be performed within the loop
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := action.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (action, 2)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := not action.non_creating
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:for-each")
			std.error.put_string (a_string); std.error.put_new_line
			select_expression.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "return")
			std.error.put_string (a_string); std.error.put_new_line
			action.display (a_level + 1)
		end
	
feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			set_dependencies (select_expression.dependencies)
			merge_dependencies (action.dependencies)
			if not select_expression.depends_upon_context_item then
				set_context_item_independent
			end
			if not select_expression.depends_upon_position then
				set_position_independent
			end
			if not select_expression.depends_upon_last then
				set_last_independent
			end
			if not select_expression.depends_upon_context_document then
				set_context_document_independent
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			select_expression.simplify
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			action.simplify
			if action.was_expression_replaced then
				action := action.replacement_expression
				adopt_child_expression (action)
			end			
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			mark_unreplaced
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void or select_expression.is_error then
				set_replacement (select_expression)
			else
				action.check_static_type (a_context, select_expression.item_type)
				if action.was_expression_replaced then
					action := action.replacement_expression
					adopt_child_expression (action)
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void or action.is_error then
					set_replacement (action)
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_promotion_offer: XM_XPATH_PROMOTION_OFFER
			a_let_expression: XM_XPATH_LET_EXPRESSION
			an_expression: XM_XPATH_EXPRESSION
		do
			mark_unreplaced
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void or select_expression.is_error then
				set_replacement (select_expression)
			else
				action.optimize (a_context, select_expression.item_type)
				if action.was_expression_replaced then
					action := action.replacement_expression
					adopt_child_expression (action)
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void or action.is_error then
					set_replacement (action)
				else

					-- If any subexpressions within the body of the for-each are not dependent on the focus,
					--  promote them: this causes them to be evaluated once, outside the for-each loop

					create a_promotion_offer.make (Focus_independent, Void, Current, False, select_expression.context_document_nodeset)
					a_promotion_offer.disallow_promoting_xslt_functions
					action.promote (a_promotion_offer)
					if action.was_expression_replaced then
						action := action.replacement_expression
						adopt_child_expression (action)
						reset_static_properties
					end
					a_let_expression ?= a_promotion_offer.containing_expression
					if a_let_expression /= Void then
						a_let_expression.check_static_type (a_context, a_context_item_type)
						if a_let_expression.was_expression_replaced then
							an_expression := a_let_expression.replacement_expression
						else
							an_expression := a_let_expression
						end
						an_expression.optimize (a_context, a_context_item_type)
						if an_expression.was_expression_replaced then
							an_expression := an_expression.replacement_expression
						end
						a_promotion_offer.set_containing_expression (an_expression)
					end
					if a_promotion_offer.containing_expression /= Current then
						if a_promotion_offer.containing_expression.was_expression_replaced then
							set_replacement (a_promotion_offer.containing_expression.replacement_expression)
						else
							set_replacement (a_promotion_offer.containing_expression)
						end
					end
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
			action.promote (an_offer)
			if action.was_expression_replaced then
				action := action.replacement_expression
				adopt_child_expression (action)
				reset_static_properties
			end
		end	

feature -- Evaluation

	process_leaving_tail (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_inner_context: XM_XSLT_EVALUATION_CONTEXT
			a_trace_listener: XM_XSLT_TRACE_LISTENER
		do
			a_transformer := a_context.transformer
			select_expression.create_iterator (a_context)
			an_iterator := select_expression.last_iterator
			an_inner_context := a_context.new_context
			an_inner_context.set_current_iterator (an_iterator)
			if a_transformer.is_tracing then
				a_trace_listener := a_transformer.trace_listener
			end
			if an_iterator.is_error then
				an_iterator.error_value.set_location (system_id, line_number)
				a_transformer.report_fatal_error (an_iterator.error_value)
			else
				from
					an_iterator.start
				until
					a_transformer.is_error or else an_iterator.is_error or else an_iterator.after
				loop
					if a_transformer.is_tracing then
						a_trace_listener.trace_current_item_start (an_iterator.item)
					end
					action.process (an_inner_context)
					if a_transformer.is_tracing then
						a_trace_listener.trace_current_item_finish (an_iterator.item)
					end
					an_iterator.forth
					if an_iterator.is_error then
						an_iterator.error_value.set_location (system_id, line_number)
						a_transformer.report_fatal_error (an_iterator.error_value)
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			select_expression.create_iterator (a_context)
			last_iterator := select_expression.last_iterator
			a_new_context ?= a_context.new_context
			check
				evaluation_context: a_new_context /= Void
				-- This is XSLT
			end
			a_new_context.set_current_template (Void)
			a_new_context.set_current_iterator (last_iterator)
			if not last_iterator.is_error then
				if last_iterator.is_node_iterator and action.is_node_sequence then
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (last_iterator.as_node_iterator, Current, a_new_context)
				else
					create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (last_iterator, Current, a_new_context)
				end
			end
		end
	
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			action.create_iterator (a_context)
			create last_mapped_item.make_sequence (action.last_iterator)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence.
		local
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			select_expression.create_iterator (a_context)
			l_iterator := select_expression.last_iterator
			l_new_context ?= a_context.new_context
			check
				evaluation_context: l_new_context /= Void
				-- This is XSLT
			end
			l_new_context.set_current_template (Void)
			l_new_context.set_current_iterator (l_iterator)
			if l_iterator.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_iterator.error_value)
			else
				create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_iterator, Current, l_new_context)
			end
		end
	
	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			check
				node_sequence: action.is_node_sequence
				-- See `create_iterator'
			end
			action.create_node_iterator (a_context)
			last_node_iterator := action.last_node_iterator
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_iterator
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	action_not_void: initialized implies action /= Void

end
	
