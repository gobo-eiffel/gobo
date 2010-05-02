note

	description:

		"Recursive xsl:function bodies with tail call"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_function: like containing_function
			l_finished: BOOLEAN
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_value: DS_CELL [XM_XPATH_VALUE]
		do
			l_context ?= a_context
			check
				xslt_context: l_context /= Void
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			end
			from
			until
				l_finished
			loop
				base_expression.evaluate_item (a_result, l_context)
				if a_result.item /= Void and then a_result.item.is_error then
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
						l_context.reset_stack_frame_map (l_function.slot_manager, l_function.parameter_definitions.count)
						create l_value.make (Void)
						l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
						if l_function.body.is_error then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_function.body.error_value))
						elseif l_value.item.is_singleton_node then
							a_result.put (l_value.item.as_singleton_node.node)
						else
							check
								item: l_value.item.is_atomic_value
								-- because we are in `evaluate_item'
							end
							a_result.put (l_value.item.as_atomic_value)
						end
						l_finished := True
					else
						check
							no_result: a_result.item = Void
							-- tail call
						end
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		local
			l_function: like containing_function
			l_finished: BOOLEAN
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_value: DS_CELL [XM_XPATH_VALUE]
			l_closure: XM_XPATH_VALUE
		do
			l_context ?= a_context
			check
				xslt_context: l_context /= Void
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			end
			from
			until
				l_finished
			loop
				base_expression.create_iterator (l_context)
				if base_expression.last_iterator.is_error then
					last_iterator := base_expression.last_iterator
					set_last_error (last_iterator.error_value)
					l_finished := True
				else
					expression_factory.create_sequence_extent (base_expression.last_iterator)
					l_function := l_context.tail_call_function
					l_context.clear_tail_call_function
					if l_function = Void then
						l_finished := True
						l_closure := expression_factory.last_created_closure
						if l_closure.is_error then
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_closure.error_value)
						else
							l_closure.create_iterator (l_context)
							last_iterator := expression_factory.last_created_closure.last_iterator
						end
					elseif l_function /= containing_function then
						l_context.reset_stack_frame_map (l_function.slot_manager, l_function.parameter_definitions.count)
						create l_value.make (Void)
						l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
						if l_function.body.is_error then
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_function.body.error_value)
						else
							l_value.item.create_iterator (l_context)
							last_iterator := l_value.item.last_iterator
						end
						l_finished := True
					else
						--	next loop iteration
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		local
			l_function: like containing_function
			l_finished: BOOLEAN
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_value: DS_CELL [XM_XPATH_VALUE]
			l_closure: XM_XPATH_VALUE
		do
			l_context ?= a_context
			check
				xslt_context: l_context /= Void
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			end
			from
			until
				l_finished
			loop
				base_expression.create_node_iterator (l_context)
				if base_expression.last_node_iterator.is_error then
					last_node_iterator := base_expression.last_node_iterator
					set_last_error (last_node_iterator.error_value)
					l_finished := True
				else
					expression_factory.create_sequence_extent (base_expression.last_node_iterator)
					l_function := l_context.tail_call_function
					l_context.clear_tail_call_function
					if l_function = Void then
						l_finished := True
						l_closure := expression_factory.last_created_closure
						if l_closure.is_error then
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_closure.error_value)
						else
							l_closure.create_node_iterator (l_context)
							last_node_iterator := l_closure.last_node_iterator
						end
					elseif l_function /= containing_function then
						l_context.reset_stack_frame_map (l_function.slot_manager, l_function.parameter_definitions.count)
						create l_value.make (Void)
						l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
						if l_function.body.is_error then
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_function.body.error_value)
						else
							l_value.item.create_node_iterator (l_context)
							last_node_iterator := l_value.item.last_node_iterator
						end
						l_finished := True
					else
						--	next loop iteration
					end
				end
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_function: like containing_function
			l_finished: BOOLEAN
			l_context: XM_XSLT_EVALUATION_CONTEXT
			l_value: DS_CELL [XM_XPATH_VALUE]
		do
			l_context ?= a_context
			check
				xslt_context: l_context /= Void
				-- this is XSLT
				major_context: not l_context.is_minor
				--ensured by logic of `Current' and XM_XSLT_COMPILED_USER_FUNCTION
			end
			from
			until
				l_finished
			loop
				base_expression.generate_events (l_context)
				if base_expression.is_error then
					l_finished := True
					set_last_error (base_expression.error_value)
				else
					l_function := l_context.tail_call_function
					l_context.clear_tail_call_function
					if l_function = Void then
						l_finished := True
					elseif l_function /= containing_function then
						l_context.reset_stack_frame_map (l_function.slot_manager, l_function.parameter_definitions.count)
						create l_value.make (Void)
						l_function.body.evaluate (l_value, l_function.evaluation_mode, 1, l_context)
						if l_function.body.is_error then
							set_last_error (l_function.body.error_value)
						else
							l_value.item.generate_events (l_context)
							l_finished := True
						end
					else
						--	next loop iteration
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
