note

	description:

		"Recursive xsl:function bodies with tail call"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FUNCTION_TAIL_CALL

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			create_iterator, create_node_iterator, evaluate_item, generate_events,
			native_implementations
		end

create

	make

feature {NONE} -- Initialization

	make (a_function: like containing_function)
			-- Initialize `Current'.
		require
			a_function_not_void: a_function /= Void
		do
			containing_function := a_function
			make_unary (a_function.body)
			compute_static_properties
		end

feature -- Access

	containing_function: XM_XSLT_COMPILED_USER_FUNCTION
			-- Parent xsl:function of `body'

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_function: detachable like containing_function
			l_finished: BOOLEAN
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
		do
			check
				xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			then
				from
				until
					l_finished
				loop
					base_expression.evaluate_item (a_result, l_context)
					if attached a_result.item as l_result_item and then l_result_item.is_error then
						l_finished := True
					else
						l_function := l_context.tail_call_function
						l_context.clear_tail_call_function
						if l_function = Void then
							l_finished := True
						elseif l_function /= containing_function then
							check
								no_result: a_result.item = Void
								-- tail call
							end
							check attached l_function.parameter_definitions as l_function_parameter_definitions then
								l_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
								create l_value.make (Void)
								l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
								check postcondition_of_evaluate: attached l_value.item as l_value_item then
									if attached l_function.body.error_value as l_error_value then
										check is_error: l_function.body.is_error end
										a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
									elseif l_value_item.is_singleton_node then
										a_result.put (l_value_item.as_singleton_node.node)
									else
										check
											item: l_value_item.is_atomic_value
											-- because we are in `evaluate_item'
										end
										a_result.put (l_value_item.as_atomic_value)
									end
									l_finished := True
								end
							end
						else
							check
								no_result: a_result.item = Void
								-- tail call
							end
						end
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			l_function: detachable like containing_function
			l_finished: BOOLEAN
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
			l_closure: XM_XPATH_VALUE
		do
			check
				xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			then
				from
				until
					l_finished
				loop
					base_expression.create_iterator (l_context)
					check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
						if attached l_last_iterator.error_value as l_error_value then
							check is_error: l_last_iterator.is_error end
							last_iterator := l_last_iterator
							set_last_error (l_error_value)
							l_finished := True
						else
							expression_factory.create_sequence_extent (l_last_iterator)
							l_function := l_context.tail_call_function
							l_context.clear_tail_call_function
							if l_function = Void then
								l_finished := True
								check postcondition_of_create_sequence_extent: attached expression_factory.last_created_closure as l_last_created_closure then
									l_closure := l_last_created_closure
									if attached l_closure.error_value as l_error_value then
										check is_error: l_closure.is_error end
										create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
									else
										l_closure.create_iterator (l_context)
										last_iterator := l_closure.last_iterator
									end
								end
							elseif l_function /= containing_function then
								check attached l_function.parameter_definitions as l_function_parameter_definitions then
									l_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
									create l_value.make (Void)
									l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
									if attached l_function.body.error_value as l_error_value then
										check is_error: l_function.body.is_error end
										create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
									else
										check postcondition_of_evaluate: attached l_value.item as l_value_item then
											l_value_item.create_iterator (l_context)
											last_iterator := l_value_item.last_iterator
										end
									end
									l_finished := True
								end
							else
								--	next loop iteration
							end
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			l_function: detachable like containing_function
			l_finished: BOOLEAN
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
			l_closure: XM_XPATH_VALUE
		do
			check
				xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			then
				from
				until
					l_finished
				loop
					base_expression.create_node_iterator (l_context)
					check postcondition_of_create_node_iterator: attached base_expression.last_node_iterator as l_last_node_iterator then
						if attached l_last_node_iterator.error_value as l_error_value then
							check is_error: l_last_node_iterator.is_error end
							last_node_iterator := l_last_node_iterator
							set_last_error (l_error_value)
							l_finished := True
						else
							expression_factory.create_sequence_extent (l_last_node_iterator)
							l_function := l_context.tail_call_function
							l_context.clear_tail_call_function
							if l_function = Void then
								l_finished := True
								check postcondition_of_create_sequence_extent: attached expression_factory.last_created_closure as l_last_created_closure then
									l_closure := l_last_created_closure
									if attached l_closure.error_value as l_error_value then
										check is_error: l_closure.is_error end
										create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
									else
										l_closure.create_node_iterator (l_context)
										last_node_iterator := l_closure.last_node_iterator
									end
								end
							elseif l_function /= containing_function then
								check attached l_function.parameter_definitions as l_function_parameter_definitions then
									l_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
									create l_value.make (Void)
									l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
									if attached l_function.body.error_value as l_error_value then
										check is_error: l_function.body.is_error end
										create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
									else
										check postcondition_of_evaluate: attached l_value.item as l_value_item then
											l_value_item.create_node_iterator (l_context)
											last_node_iterator := l_value_item.last_node_iterator
										end
									end
									l_finished := True
								end
							else
								--	next loop iteration
							end
						end
					end
				end
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_function: detachable like containing_function
			l_finished: BOOLEAN
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
		do
			check
				xslt_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			then
				from
				until
					l_finished
				loop
					base_expression.generate_events (l_context)
					if attached base_expression.error_value as l_error_value then
						check is_error: base_expression.is_error end
						l_finished := True
						set_last_error (l_error_value)
					else
						l_function := l_context.tail_call_function
						l_context.clear_tail_call_function
						if l_function = Void then
							l_finished := True
						elseif l_function /= containing_function then
							check attached l_function.parameter_definitions as l_function_parameter_definitions then
								l_context.reset_stack_frame_map (l_function.slot_manager, l_function_parameter_definitions.count)
								create l_value.make (Void)
								l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
								if attached l_function.body.error_value as l_error_value then
									check is_error: l_function.body.is_error end
									set_last_error (l_error_value)
								else
									check postcondition_of_evaluate: attached l_value.item as l_value_item then
										l_value_item.generate_events (l_context)
										l_finished := True
									end
								end
							end
						else
							--	next loop iteration
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "tail-recursive function body"
		end

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := base_expression.native_implementations
		end

invariant

	containing_function_not_void: containing_function /= Void

end
