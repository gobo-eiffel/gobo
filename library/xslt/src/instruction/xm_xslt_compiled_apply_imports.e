note

	description: "Objects that represent an xsl:apply-imports,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_APPLY_IMPORTS

inherit

	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, creates_new_nodes, promote_instruction
		end

	XM_XSLT_TEMPLATE_ROUTINES

	XM_XSLT_WITH_PARAM_ROUTINES

	XM_XSLT_MODE_CONSTANTS

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; some_actual_parameters, some_tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM])
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			actual_parameters_not_void: some_actual_parameters /= Void
			tunnel_parameters_not_void: some_tunnel_parameters /= Void
		do
			executable := an_executable
			actual_parameters := some_actual_parameters
			tunnel_parameters := some_tunnel_parameters
			set_with_params_parent (actual_parameters, Current)
			set_with_params_parent (tunnel_parameters, Current)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			actual_parameters_set: actual_parameters = some_actual_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
		end

feature -- Access

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			Result := xpath_expressions (actual_parameters)
			Result.append_last (xpath_expressions (tunnel_parameters))
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "xsl:apply-imports"))
			std.error.put_new_line
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			a_replacement.put (Current)
			simplify_with_params (actual_parameters)
			simplify_with_params (tunnel_parameters)
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
			check_with_params (actual_parameters, a_context, a_context_item_type)
			check_with_params (tunnel_parameters, a_context, a_context_item_type)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
			optimize_with_params (actual_parameters, a_context, a_context_item_type)
			optimize_with_params (tunnel_parameters, a_context, a_context_item_type)
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		do
			promote_with_params (actual_parameters, a_offer)
			promote_with_params (tunnel_parameters, a_offer)
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_parameters, l_tunnel_parameters: XM_XSLT_PARAMETER_SET
			l_current_template: detachable XM_XSLT_COMPILED_TEMPLATE
			l_template: XM_XSLT_COMPILED_TEMPLATE
			l_error: XM_XPATH_ERROR_VALUE
			l_mode: detachable XM_XSLT_MODE
			l_minimum_precedence, l_maximum_precedence: INTEGER
			l_current_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_other_context: XM_XSLT_EVALUATION_CONTEXT
			l_rule: detachable XM_XSLT_RULE
		do
			check attached a_context.transformer as l_context_transformer then
				l_transformer := l_context_transformer
			end

			-- handle any parameters

			l_parameters := assembled_parameters (a_context, actual_parameters)
			l_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)
			l_rule := a_context.current_template
			if l_rule /= Void then
				l_current_template := l_rule.handler.as_template
			end
			if l_current_template = Void then
				create l_error.make_from_string ("Current template rule is null whilst evaluating xsl:apply-imports.",
															 Xpath_errors_uri, "XTDE0560", Dynamic_error)
				l_error.set_location (system_id, line_number)
				l_transformer.report_fatal_error (l_error)
			else
				l_minimum_precedence := l_current_template.minimum_import_precedence
				l_maximum_precedence := l_current_template.precedence - 1
				l_mode := a_context.current_mode
				l_current_iterator := a_context.current_iterator
				if l_mode = Void then l_mode := l_transformer.rule_manager.mode (Default_mode) end
				if l_current_iterator = Void or else l_current_iterator.is_error or else l_current_iterator.off then
					create l_error.make_from_string ("Context item is not set whilst applying imports.",
																 Xpath_errors_uri, "XTDE0565", Dynamic_error)
					l_error.set_location (system_id, line_number)
					l_transformer.report_fatal_error (l_error)
				else
					if not l_current_iterator.item.is_node then
						create l_error.make_from_string ("Context item is not a node whilst applying imports.",
																	 Xpath_errors_uri, "XTDE0565", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					else
						l_transformer.rule_manager.find_imported_template_rule (l_current_iterator.item.as_node, l_mode, l_minimum_precedence, l_maximum_precedence, a_context)
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
							check attached l_template.slot_manager as l_slot_manager then
								l_other_context.open_stack_frame (l_slot_manager)
							end
							l_template.generate_events (l_rule, l_other_context)
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	actual_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Non-tunnel parameters

	tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Tunnel parameters

invariant

	actual_parameters_not_void: initialized implies actual_parameters /= Void
	tunnel_parameters_not_void: initialized implies tunnel_parameters /= Void

end

