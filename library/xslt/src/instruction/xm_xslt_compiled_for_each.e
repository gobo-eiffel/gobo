note

	description: "Objects that represent an xsl:for-each,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
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

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, an_action: XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: an_action /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			action := an_action
			adopt_child_expression (select_expression)
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := action.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (action, 2)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := not action.non_creating
		end

	display (a_level: INTEGER)
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

	compute_dependencies
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			set_dependencies (select_expression)
			merge_dependencies (action)
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

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				if select_expression /= l_replacement_item then
					select_expression := l_replacement_item
					adopt_child_expression (select_expression)
					reset_static_properties
				end
			end
			if attached select_expression.error_value as l_error_value then
				check is_error: select_expression.is_error end
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
			else
				l_replacement.put (Void)
				action.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					if action /= l_replacement_item then
						action := l_replacement_item
						adopt_child_expression (action)
						reset_static_properties
					end
				end
				if attached action.error_value as l_error_value then
					check is_error: action.is_error end
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
				else
					a_replacement.put (Current)
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if select_expression /= l_replacement_item then
					select_expression := l_replacement_item
					adopt_child_expression (select_expression)
					reset_static_properties
				end
			end
			if attached select_expression.error_value as l_error_value then
				check is_error: select_expression.is_error end
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
			elseif select_expression.is_empty_sequence then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				action.check_static_type (l_replacement, a_context, select_expression.item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
					if action /= l_replacement_item then
						action := l_replacement_item
						adopt_child_expression (action)
						reset_static_properties
					end
				end
				if attached action.error_value as l_error_value then
					check is_error: action.is_error end
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
				elseif action.is_empty_sequence then
					set_replacement (a_replacement, action)
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if select_expression /= l_replacement_item then
					select_expression := l_replacement_item
					adopt_child_expression (select_expression)
					reset_static_properties
				end
			end
			if attached select_expression.error_value as l_error_value then
				check is_error: select_expression.is_error end
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
			elseif select_expression.is_empty_sequence then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				action.optimize (l_replacement, a_context, select_expression.item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
					if action /= l_replacement_item then
						action := l_replacement_item
						adopt_child_expression (action)
						reset_static_properties
					end
				end
				if attached action.error_value as l_error_value then
					check is_error: action.is_error end
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_error_value))
				elseif action.is_empty_sequence then
					set_replacement (a_replacement, action)
				else
					promote_sub_expressions (a_replacement, a_context, a_context_item_type)
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if select_expression /= l_replacement_item then
					select_expression := l_replacement_item
					adopt_child_expression (select_expression)
					reset_static_properties
				end
			end
			l_replacement.put (Void)
			action.promote (l_replacement, a_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if action /= l_replacement_item then
					action := l_replacement_item
					adopt_child_expression (action)
					reset_static_properties
				end
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_inner_context: XM_XSLT_EVALUATION_CONTEXT
			l_trace_listener: detachable XM_XSLT_TRACE_LISTENER
		do
			check attached a_context.transformer as l_context_transformer then
				l_transformer := l_context_transformer
				select_expression.create_iterator (a_context)
				check postcondition_of_create_iterator: attached select_expression.last_iterator as l_last_iterator then
					l_iterator := l_last_iterator
					l_inner_context := a_context.new_context
					l_inner_context.set_current_iterator (l_iterator)
					l_inner_context.set_current_template (Void)
					if l_transformer.is_tracing then
						l_trace_listener := l_transformer.trace_listener
					end
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						l_error_value.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error_value)
					else
						from
							l_iterator.start
							if attached l_iterator.error_value as l_error_value then
								check is_error: l_iterator.is_error end
								l_transformer.report_fatal_error (l_error_value)
							end
						until
							l_transformer.is_error or else l_iterator.is_error or else l_iterator.after
						loop
							if l_trace_listener /= Void then
								check is_tracing: l_transformer.is_tracing end
								l_trace_listener.trace_current_item_start (l_iterator.item)
							end
							action.generate_events (l_inner_context)
							if l_trace_listener /= Void then
								check is_tracing: l_transformer.is_tracing end
								l_trace_listener.trace_current_item_finish (l_iterator.item)
							end
							l_iterator.forth
							if attached l_iterator.error_value as l_error_value then
								check is_error: l_iterator.is_error end
								l_error_value.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error_value)
							end
						end
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterate over the values of a sequence
		do
			last_iterator := Void
			select_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached select_expression.last_iterator as l_last_iterator then
				last_iterator := l_last_iterator
				check
					evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context.new_context as a_new_context
					-- This is XSLT
				then
					a_new_context.set_current_template (Void)
					a_new_context.set_current_iterator (last_iterator)
					if not l_last_iterator.is_error then
						if l_last_iterator.is_node_iterator and action.is_node_sequence then
							create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (l_last_iterator.as_node_iterator, Current, a_new_context)
						else
							create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (l_last_iterator, Current, a_new_context)
						end
					end
				end
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `an_item' to a sequence
		do
			action.create_iterator (a_context)
			check postcondition_of_create_iterator: attached action.last_iterator as l_last_iterator then
				create last_mapped_item.make_sequence (l_last_iterator)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			last_node_iterator := Void
			select_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached select_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				check
					evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context.new_context as l_new_context
					-- This is XSLT
				then
					l_new_context.set_current_template (Void)
					l_new_context.set_current_iterator (l_iterator)
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
					else
						create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_iterator, Current, l_new_context)
					end
				end
			end
		end

	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
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

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_iterator
		end

	promote_sub_expressions (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Promote any subexpressions within body which are not dependent on the focus,
			--  This causes them to be evaluated once, outside the for-each loop
		require
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
			a_context_not_void: a_context /= Void
		local
			l_promotion_offer: XM_XPATH_PROMOTION_OFFER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_let_expression: XM_XPATH_LET_EXPRESSION
			l_expression: XM_XPATH_EXPRESSION
		do
			create l_promotion_offer.make (Focus_independent, Void, Current, False, select_expression.context_document_nodeset)
			l_promotion_offer.disallow_promoting_xslt_functions
			create l_replacement.make (Void)
			action.promote (l_replacement, l_promotion_offer)
			check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
				if action /= l_replacement_item then
					action := l_replacement_item
					adopt_child_expression (action)
					reset_static_properties
				end
			end
			check attached l_promotion_offer.containing_expression as l_promotion_offer_containing_expression then
				if l_promotion_offer_containing_expression.is_let_expression then
					l_let_expression := l_promotion_offer_containing_expression.as_let_expression
					l_replacement.put (Void)
					l_let_expression.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_check_static_type: attached l_replacement.item as l_replacement_item then
						l_expression := l_replacement_item
						if not ANY_.same_objects (Current, l_let_expression.action) then
							l_replacement.put (Void)
							l_expression.optimize (l_replacement, a_context, a_context_item_type)
							check postcondition_optimize: attached l_replacement.item as l_replacement_item_2 then
								l_expression := l_replacement_item_2
							end
						end
						l_promotion_offer.set_containing_expression (l_expression)
					end
				end
			end
			check attached l_promotion_offer.containing_expression as l_promotion_offer_containing_expression then
				if l_promotion_offer_containing_expression /= Current then
					set_replacement (a_replacement, l_promotion_offer_containing_expression)
				else
					a_replacement.put (Current)
				end
			end
		ensure
			replaced: a_replacement.item /= Void
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	action_not_void: initialized implies action /= Void

end

