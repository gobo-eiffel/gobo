note

	description: "Objects that represent an xsl:next-match,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_NEXT_MATCH

inherit
	
	XM_XSLT_COMPILED_APPLY_IMPORTS
		redefine
			generate_tail_call
		end

create

	make

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_parameters, l_tunnel_parameters: XM_XSLT_PARAMETER_SET
			l_current_rule, l_rule: XM_XSLT_RULE
			l_error: XM_XPATH_ERROR_VALUE
			l_mode: XM_XSLT_MODE
			l_template: XM_XSLT_COMPILED_TEMPLATE
			l_current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_other_context: XM_XSLT_EVALUATION_CONTEXT
			
		do
			l_transformer := a_context.transformer
			
			-- handle any parameters

			l_parameters := assembled_parameters (a_context, actual_parameters)
			l_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)
			l_current_rule := a_context.current_template
			if l_current_rule = Void then
				create l_error.make_from_string ("Current template rule is Void whilst evaluating xsl:next-match.",
					Xpath_errors_uri, "XTDE0560", Dynamic_error)
				l_error.set_location (system_id, line_number)
				l_transformer.report_fatal_error (l_error)
			else
				l_mode := a_context.current_mode
				if l_mode = Void then l_mode := l_transformer.rule_manager.mode (Default_mode) end
				l_current_iterator := a_context.current_iterator
				if l_current_iterator = Void or else l_current_iterator.is_error or else l_current_iterator.off then
					create l_error.make_from_string ("Context item is not set whilst evaluating xsl:next-match.",
						Xpath_errors_uri, "XTDE0565", Dynamic_error)
					l_error.set_location (system_id, line_number)
					l_transformer.report_fatal_error (l_error)
				else
					if not l_current_iterator.item.is_node then
						create l_error.make_from_string ("Context item is not a node whilst evaluating xsl:next-match.",
							Xpath_errors_uri, "XTDE0565", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					else
						l_transformer.rule_manager.find_next_match_handler (l_current_iterator.item.as_node, l_mode, l_current_rule, a_context)
						l_rule := l_transformer.rule_manager.last_found_template
						if l_transformer.is_error then
							-- nothing to do
						elseif l_rule = Void then
							
							-- Use the default action for the node.
							
							perform_default_action (l_current_iterator.item.as_node, l_parameters, l_tunnel_parameters, a_context)
						else
							l_template := l_rule.handler.as_template
							l_other_context := a_context.new_context
							l_other_context.set_local_parameters (l_parameters)
							l_other_context.set_tunnel_parameters (l_tunnel_parameters)
							l_other_context.open_stack_frame (l_template.slot_manager)
							l_template.generate_events (l_rule, l_other_context)
						end
					end
				end
			end
		end

invariant

	actual_parameters_not_void: initialized implies actual_parameters /= Void
	tunnel_parameters_not_void: initialized implies tunnel_parameters /= Void

end
	
