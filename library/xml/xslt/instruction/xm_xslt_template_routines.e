indexing

	description: "Routines to support template execution,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEMPLATE_ROUTINES

inherit

	XM_XPATH_TYPE

	XM_XPATH_AXIS

feature -- Evaluation

	apply_templates (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mode:  XM_XSLT_MODE;
	                 a_parameters, a_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Apply templates to `a_iterator'.
		require
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
			iterator_before: a_iterator /= Void and then not a_iterator.is_error and then a_iterator.before
			major_context_not_void: a_context /= Void and then not a_context.is_minor
			no_previous_error: not a_context.transformer.is_error
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_tail_call: XM_XPATH_TAIL_CALL
			l_lookahead, l_finished: BOOLEAN
		do
			l_transformer := a_context.transformer
			a_context.set_current_iterator (a_iterator)
			a_context.set_current_mode (a_mode)
			l_lookahead := a_iterator.is_last_position_finder
			from
			until l_finished loop
				-- process any tail calls returned from previous nodes, before changing context
				if l_tail_call /= Void then
					if l_lookahead and then a_iterator.as_last_position_finder.after then
						l_finished := True
					else
						from  until l_transformer.is_error or else l_tail_call = Void loop
							a_tail.put (Void)
							l_tail_call.generate_tail_call (a_tail, a_context)
							l_tail_call := a_tail.item
							if l_transformer.is_error then l_finished := True end
						end
					end
				end
				if l_transformer.is_error then
					l_finished := True
				else
					if a_iterator.before then
						a_iterator.start
					elseif not a_iterator.after then
						a_iterator.forth
					end
				end
				if a_iterator.is_error then
					l_transformer.report_fatal_error (a_iterator.error_value)
					l_finished := True
				elseif a_iterator.after then
					l_finished := True
				end
				if not l_finished then
					a_tail.put (Void)
					apply_templates_2 (a_tail, l_transformer, a_iterator.item.as_node, a_mode, a_parameters, a_tunnel_parameters, a_context)
					l_tail_call := a_tail.item
				end
			end
		end

	apply_templates_2 (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_transformer: XM_XSLT_TRANSFORMER; a_node: XM_XPATH_NODE; a_mode:  XM_XSLT_MODE;
	                   a_parameters, a_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
								 -- Apply templates to `a_iterator'.
		require
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
			a_transformer_not_void: a_transformer /= Void
			a_mode_not_void: a_node /= Void
			major_context_not_void: a_context /= Void and then not a_context.is_minor
			no_previous_error: not a_context.transformer.is_error
		local
			l_node_handler: XM_XSLT_COMPILED_TEMPLATE
		do
			-- find the node handler [i.e., the template rule] for this node

			a_transformer.rule_manager.find_template_rule (a_node, a_mode, a_context)
			if not a_transformer.is_error then
				l_node_handler := a_transformer.rule_manager.last_found_template
				if l_node_handler = Void then

					-- Use the default action for the node. No need to open a new stack frame!

					perform_default_action (a_node, a_parameters, a_tunnel_parameters, a_context)
				else
					if a_tunnel_parameters /= Void and then a_tunnel_parameters.count > 0
						or else l_node_handler.is_stack_frame_needed then
							a_context.open_stack_frame (l_node_handler.slot_manager)
							a_context.set_local_parameters (a_parameters)
							a_context.set_tunnel_parameters (a_tunnel_parameters)
						if a_transformer.is_tracing then
							a_transformer.trace_listener.trace_current_item_start (a_node)
						end
						l_node_handler.generate_tail_call (a_tail, a_context)
						if a_transformer.is_tracing then
							a_transformer.trace_listener.trace_current_item_finish (a_node)
						end
					else
						if a_transformer.is_tracing then
							a_transformer.trace_listener.trace_current_item_start (a_node)
						end
						l_node_handler.generate_tail_call (a_tail, a_context)
						if a_transformer.is_tracing then
							a_transformer.trace_listener.trace_current_item_finish (a_node)
						end
					end
				end
			end
		end

	perform_default_action (a_node: XM_XPATH_NODE; a_parameters, a_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Perform default action for `a_node'.
		require
			node_not_void: a_node /= Void
			major_context_not_void: a_context /= Void and then not a_context.is_minor
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			if a_context.configuration.default_action_suppressed then
				-- nothing to do
			else
				if a_context.configuration.warns_on_default_action then
					a_context.transformer.report_warning (STRING_.concat ("Default template invoked for ", a_node.type_name), Void)
				end
				inspect
					a_node.node_type
				when Document_node, Element_node then
					from
						l_iterator := a_node.new_axis_iterator (Child_axis)
						l_new_context := a_context.new_context
						create l_tail.make (Void)
						apply_templates (l_tail, l_iterator, a_context.current_mode, a_parameters, a_tunnel_parameters, l_new_context)
						l_tail_call := l_tail.item
					until
						l_tail_call = Void
					loop
						l_tail.put (Void)
						l_tail_call.generate_tail_call (l_tail, l_new_context)
						l_tail_call := l_tail.item
					end
				when Text_node, Attribute_node then
					a_context.current_receiver.notify_characters (STRING_.cloned_string (a_node.string_value), 0)
				when Comment_node, Processing_instruction_node then

					-- No action

				end
			end
		end

end

