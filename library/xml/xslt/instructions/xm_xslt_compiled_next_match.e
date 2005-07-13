indexing

	description: "Objects that represent an xsl:next-match,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_NEXT_MATCH

inherit
	
	XM_XSLT_COMPILED_APPLY_IMPORTS
		redefine
			process_leaving_tail, make
		end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; some_actual_parameters, some_tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]) is
			-- Establish invariant.
		do
			Precursor (an_executable, some_actual_parameters, some_tunnel_parameters)
			-- TODO: remove this re-defintion (?) instruction_name := "xsl:next-match"
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
			a_current_template: XM_XSLT_COMPILED_TEMPLATE
			an_error: XM_XPATH_ERROR_VALUE
			a_mode: XM_XSLT_MODE
			a_node_handler: XM_XSLT_COMPILED_TEMPLATE
			a_current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_transformer := a_context.transformer
			
			-- handle any parameters

			some_parameters := assembled_parameters (a_context, actual_parameters)
			some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)
			a_current_template := a_context.current_template
			if a_current_template = Void then
				create an_error.make_from_string ("Current template rule is null whilst evaluating xsl:next-match.", "", "XTDE0560", Dynamic_error)
				a_transformer.report_fatal_error (an_error, Current)
			else
				a_mode := a_context.current_mode
				if a_mode = Void then a_mode := a_transformer.rule_manager.mode (Default_mode) end
				a_current_iterator := a_context.current_iterator
				if a_current_iterator = Void or else a_current_iterator.is_error or else a_current_iterator.off then
					create an_error.make_from_string ("Context item is not set whilst evaluating xsl:next-match.", "", "XTDE0565", Dynamic_error)
					a_transformer.report_fatal_error (an_error, Void)
				else
					if not a_current_iterator.item.is_node then
						create an_error.make_from_string ("Context item is not a node whilst evaluating xsl:next-match.", "", "XTDE0565", Dynamic_error)
						a_transformer.report_fatal_error (an_error, Void)
					else
						a_node_handler := a_transformer.rule_manager.next_match_handler (a_current_iterator.item.as_node, a_mode, a_current_template, a_context)
						if a_node_handler = Void then
	
							-- Use the default action for the node.
							
							perform_default_action (a_current_iterator.item.as_node, some_parameters, some_tunnel_parameters, a_context)
						else
							another_context := a_context.new_context
							another_context.set_local_parameters (some_parameters)
							another_context.set_tunnel_parameters (some_tunnel_parameters)
							another_context.open_stack_frame (a_node_handler.slot_manager)
							a_node_handler.process (another_context)
						end
					end
				end
			end
			last_tail_call := Void
		end

invariant

	actual_parameters_not_void: initialized implies actual_parameters /= Void
	tunnel_parameters_not_void: initialized implies tunnel_parameters /= Void

end
	
