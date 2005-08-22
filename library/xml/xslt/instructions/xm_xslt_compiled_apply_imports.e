indexing

	description: "Objects that represent an xsl:apply-imports,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make (an_executable: XM_XSLT_EXECUTABLE; some_actual_parameters, some_tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			actual_parameters_not_void: some_actual_parameters /= Void
			tunnel_parameters_not_void: some_tunnel_parameters /= Void
		do
			executable := an_executable
			actual_parameters := some_actual_parameters
			set_with_params_parent (actual_parameters, Current)
			tunnel_parameters := some_tunnel_parameters
			set_with_params_parent (tunnel_parameters, Current)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			actual_parameters_set: actual_parameters = some_actual_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
		end

feature -- Access
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			Result := xpath_expressions (actual_parameters)
			Result.append_last (xpath_expressions (tunnel_parameters))
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

	last_set_tail_call: XM_XPATH_TAIL_CALL is
			-- Last tail call set by `set_last_tail_call'
		do
			Result := last_tail_call
		end

feature -- Status setting

	set_last_tail_call (a_tail_call: XM_XPATH_TAIL_CALL) is
			-- Set residue from `apply_templates'
		do
			last_tail_call := a_tail_call
		end

feature -- Optimization

	simplify is
			-- Preform context-independent static optimizations
		do
			simplify_with_params (actual_parameters)
			simplify_with_params (tunnel_parameters)
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			check_with_params (actual_parameters, a_context, a_context_item_type)
			check_with_params (tunnel_parameters, a_context, a_context_item_type)
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			optimize_with_params (actual_parameters, a_context, a_context_item_type)
			optimize_with_params (tunnel_parameters, a_context, a_context_item_type)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			promote_with_params (actual_parameters, an_offer)
			promote_with_params (tunnel_parameters, an_offer)
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
			a_minimum_precedence, a_maximum_precedence: INTEGER
			a_current_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_transformer := a_context.transformer
			
			-- handle any parameters

			some_parameters := assembled_parameters (a_context, actual_parameters)
			some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)
			a_current_template := a_context.current_template
			if a_current_template = Void then
				create an_error.make_from_string ("Current template rule is null whilst evaluating xsl:apply-imports.",
															 Xpath_errors_uri, "XTDE0560", Dynamic_error)
				an_error.set_location (system_id, line_number)
				a_transformer.report_fatal_error (an_error)
			else
				a_minimum_precedence := a_current_template.minimum_import_precedence
				a_maximum_precedence := a_current_template.precedence - 1
				a_mode := a_context.current_mode
				a_current_iterator := a_context.current_iterator
				if a_mode = Void then a_mode := a_transformer.rule_manager.mode (Default_mode) end
				if a_current_iterator = Void or else a_current_iterator.is_error or else a_current_iterator.off then
					create an_error.make_from_string ("Context item is not set whilst applying imports.",
																 Xpath_errors_uri, "XTDE0565", Dynamic_error)
					an_error.set_location (system_id, line_number)
					a_transformer.report_fatal_error (an_error)
				else
					if not a_current_iterator.item.is_node then
						create an_error.make_from_string ("Context item is not a node whilst applying imports.",
																	 Xpath_errors_uri, "XTDE0565", Dynamic_error)
						an_error.set_location (system_id, line_number)
						a_transformer.report_fatal_error (an_error)
					else
						a_node_handler := a_transformer.rule_manager.imported_template_rule (a_current_iterator.item.as_node, a_mode, a_minimum_precedence, a_maximum_precedence, a_context)
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

			-- We never treat apply-imports as a tail call, though we could.

			last_tail_call := Void
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
	
