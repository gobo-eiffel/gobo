indexing

	description: "Routines to support template execution,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEMPLATE_ROUTINES

inherit

	XM_XPATH_TYPE

	XM_XPATH_AXIS

feature -- Status report

	last_set_tail_call: XM_XPATH_TAIL_CALL is
			-- Last tail call set by `set_last_tail_call'
		deferred
		end

feature -- Status setting

	set_last_tail_call (a_tail_call: XM_XPATH_TAIL_CALL) is
			-- Set residue from `apply_templates'
		deferred
		ensure
			tail_call_set: last_set_tail_call = a_tail_call
		end

feature -- Evaluation
	
	apply_templates (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mode:  XM_XSLT_MODE;
		some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Apply templates to `an_iterator'.
		require
			iterator_before: an_iterator /= Void and then not an_iterator.is_error and then an_iterator.before
			major_context_not_void: a_context /= Void and then not a_context.is_minor
			no_previous_error: not a_context.transformer.is_error
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_node: XM_XPATH_NODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
			a_last_tail_call: XM_XPATH_TAIL_CALL
		do
			a_transformer := a_context.transformer
			a_context.set_current_iterator (an_iterator)
			a_context.set_current_mode (a_mode)
			from
				an_iterator.start
			until
				a_transformer.is_error or else an_iterator.after
			loop
				if not a_transformer.is_error and then not an_iterator.after then
					check
						item_is_a_node: an_iterator.item.is_node
						-- guarenteed by static type checking during stylesheet compilation
					end
					a_node := an_iterator.item.as_node

					-- find the node handler [i.e., the template rule] for this node
					
					a_node_handler := a_transformer.rule_manager.template_rule (a_node, a_mode, a_context)
					if not a_transformer.is_error then
						if a_node_handler = Void then
							
							-- Use the default action for the node. No need to open a new stack frame!
							
							perform_default_action (a_node, some_parameters, some_tunnel_parameters, a_context)
						else
							if some_tunnel_parameters /= Void and then some_tunnel_parameters.count > 0
								or else a_node_handler.is_stack_frame_needed then
								a_context.open_stack_frame (a_node_handler.slot_manager)
								a_context.set_local_parameters (some_parameters)
								a_context.set_tunnel_parameters (some_tunnel_parameters)
								if a_transformer.is_tracing then
									a_transformer.trace_listener.trace_current_item_start (a_node)
								end
								a_node_handler.process_leaving_tail (a_context)
								a_last_tail_call := a_node_handler.last_tail_call
								if a_transformer.is_tracing then
									a_transformer.trace_listener.trace_current_item_finish (a_node)
								end
							else
								if a_transformer.is_tracing then
									a_transformer.trace_listener.trace_current_item_start (a_node)
								end
								a_node_handler.process_leaving_tail (a_context)
								a_last_tail_call := a_node_handler.last_tail_call
								if a_transformer.is_tracing then
									a_transformer.trace_listener.trace_current_item_finish (a_node)
								end
							end
						end
					end
				end
				
				-- process any tail calls returned from previous nodes

				from
				until
					a_transformer.is_error or else a_last_tail_call = Void
				loop
					a_last_tail_call.process_leaving_tail (a_context)
					a_last_tail_call := a_last_tail_call.last_tail_call
				end
				if not an_iterator.after then an_iterator.forth end
				if an_iterator.is_error then
					a_transformer.report_fatal_error (an_iterator.error_value)
				end
			end
			set_last_tail_call (a_last_tail_call)
		end

	perform_default_action (a_node: XM_XPATH_NODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Perform default action for `a_node'.
		require
			node_not_void: a_node /= Void
			major_context_not_void: a_context /= Void and then not a_context.is_minor
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_last_tail_call: XM_XPATH_TAIL_CALL
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			inspect
				a_node.node_type
			when Document_node, Element_node then
				from
					an_iterator := a_node.new_axis_iterator (Child_axis)
					a_new_context := a_context.new_context
					apply_templates (an_iterator, a_context.current_mode, some_parameters, some_tunnel_parameters, a_new_context)
					a_last_tail_call := last_set_tail_call
				until
					a_last_tail_call = Void
				loop
					a_last_tail_call.process_leaving_tail (a_new_context)
					a_last_tail_call := a_last_tail_call.last_tail_call
				end
			when Text_node, Attribute_node then
				a_context.current_receiver.notify_characters (a_node.string_value, 0)
			when Comment_node, Processing_instruction_node then

				-- No action

			end
		end

end
	
