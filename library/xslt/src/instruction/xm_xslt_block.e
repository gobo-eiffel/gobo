note

	description:

		"Objects that represent a hypothetical xsl:block instruction%
		%which simply evaluates it's contents.%
		%Used for top-level templates, xsl:otherwise, etc."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_BLOCK

inherit

	XM_XSLT_INSTRUCTION
		undefine
			sub_expressions, item_type, compute_cardinality,
			contains_recursive_tail_function_calls,
			create_iterator, creates_new_nodes,
			mark_tail_function_calls, same_expression,
			is_sequence_expression, create_node_iterator,
			as_sequence_expression, promote
		redefine
			promote_instruction, native_implementations, compute_special_properties
		end

	XM_XPATH_SEQUENCE_EXPRESSION
		rename
			make as make_sequence
		undefine
			is_tail_call, evaluate_item, native_implementations,
			as_tail_call, generate_events, system_id_from_module_number,
			processed_eager_evaluation
		redefine
			compute_special_properties
		end

create

	make

feature {NONE} -- Initialization

	make (a_executable: XM_XSLT_EXECUTABLE; a_head, a_tail: XM_XPATH_EXPRESSION; a_module_number, a_line_number: INTEGER)
			-- Create a general-purpose block.
		require
			a_executable_not_void: a_executable /= Void
			a_head_not_void: a_head /= Void
			a_tail_not_void: a_tail /= Void
			strictly_positive_module_number: a_module_number > 0
			positive_line_number: a_line_number >= 0
		do
			executable := a_executable
			make_sequence (a_head, a_tail)
			set_source_location (a_module_number, a_line_number)
		ensure
			executable_set: executable = a_executable
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if children.count > 0 then
				from
					a_cursor := children.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					if not a_cursor.item.non_creating then
						Result := True
						a_cursor.go_after
					else
						a_cursor.forth
					end
				variant
					children.count + 1 - a_cursor.index
				end
			end
		end

feature -- Optimization

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_child: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			from
				create l_replacement.make (Void)
				l_cursor := children.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_child := l_cursor.item
				l_child.promote (l_replacement, a_offer)
				check postcondition_of_promote: attached l_replacement.item as l_replacement_item then
					if l_replacement_item /= l_child then
						l_cursor.replace (l_replacement_item)
						reset_static_properties
					end
				end
				l_replacement.put (Void)
				l_cursor.forth
			variant
				children.count + 1 - l_cursor.index
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_child: XM_XPATH_EXPRESSION
			l_function, l_previous_function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
			l_finished: BOOLEAN
		do
			check attached a_context.transformer as l_transformer then
				from
					l_cursor := children.new_cursor; l_cursor.start
				until
					l_transformer.is_error or else l_cursor.after
				loop
					l_child := l_cursor.item
					a_tail.put (Void)
					if attached {XM_XSLT_INSTRUCTION} l_child as l_instruction then
						l_instruction.generate_tail_call (a_tail, a_context)
					else
						l_child.generate_events (a_context)
						if a_context.tail_call_function /= Void then
							from
								l_finished := False
							until l_finished loop
								l_function := a_context.tail_call_function
								a_context.clear_tail_call_function
								if l_previous_function = Void and l_child.is_user_function_call then
									check attached {XM_XSLT_USER_FUNCTION_CALL} l_child as l_user_call then
										l_previous_function := l_user_call.function
									end
								end
								if l_function /= Void then
									if l_function /= l_previous_function then
										check attached l_function.parameter_definitions as l_function_parameter_definitions then
											a_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
										end
									end
									l_previous_function := l_function
									create l_value.make (Void)
									l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, a_context)
									check postcondition_of_evaluate: attached l_value.item as l_value_item then
										l_value_item.generate_events (a_context)
									end
								else
									l_finished := True
								end
							end
						end
					end
					l_cursor.forth
				variant
					children.count + 1 - l_cursor.index
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties
			-- Compute special properties.
		do
			Precursor {XM_XPATH_SEQUENCE_EXPRESSION}
			if not creates_new_nodes then
				set_non_creating
			end
		end

feature {NONE} -- Implementation

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_iterator
		end

end

