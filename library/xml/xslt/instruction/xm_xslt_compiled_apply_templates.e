indexing

	description: "Objects that represent an xsl:apply-templates,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_APPLY_TEMPLATES

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, promote_instruction, process, creates_new_nodes
		end

	XM_XSLT_TEMPLATE_ROUTINES

	XM_XSLT_WITH_PARAM_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; some_actual_parameters, some_tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM];
			use_current_mode, use_tail_recusrion: BOOLEAN; a_mode: XM_XSLT_MODE) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			actual_parameters_not_void: some_actual_parameters /= Void
			tunnel_parameters_not_void: some_tunnel_parameters /= Void
			current_mode: not use_current_mode implies a_mode /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			mode := a_mode
			is_current_mode_used := use_current_mode
			is_tail_recursion_used := use_tail_recusrion
			actual_parameters := some_actual_parameters
			set_with_params_parent (actual_parameters, Current)
			tunnel_parameters := some_tunnel_parameters
			set_with_params_parent (tunnel_parameters, Current)
			adopt_child_expression (select_expression)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			mode_set: mode = a_mode
			current_mode_set: is_current_mode_used = use_current_mode
			tail_recursion_set: is_tail_recursion_used = use_tail_recusrion
			actual_parameters_set: actual_parameters = some_actual_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
		end

feature -- Access
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make_default
			Result.put (select_expression, 1)
			Result.append_last (xpath_expressions (actual_parameters))
			Result.append_last (xpath_expressions (tunnel_parameters))
			Result.set_equality_tester (expression_tester)
		end

feature -- Status report

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

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
			a_cursor:  DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			a_param: XM_XSLT_COMPILED_WITH_PARAM
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:apply templates")
			std.error.put_string (a_string); std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "node selection criteria:")
			std.error.put_string (a_string); std.error.put_new_line
			select_expression.display (a_level + 2)
			if is_current_mode_used then
				a_string := STRING_.appended_string (indentation (a_level + 1), "applies to current mode.")
			else
				a_string := STRING_.appended_string (indentation (a_level + 1), "applies to mode ")
				std.error.put_string (a_string)
				std.error.put_string (mode.name)
				std.error.put_string (" %N")
			end
			if actual_parameters.count > 0 then
				a_string := STRING_.appended_string (indentation (a_level + 1), "The following parameters will be passed:%N")
				std.error.put_string (a_string)
				from
					a_cursor := actual_parameters.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_param := a_cursor.item
					a_param.display (a_level + 1)
					a_cursor.forth
				end
			end
			if tunnel_parameters.count > 0 then
				a_string := STRING_.appended_string (indentation (a_level + 1), "The following tunnel parameters are in scope:%N")
				std.error.put_string (a_string)
				from
					a_cursor := tunnel_parameters.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_param := a_cursor.item
					a_param.display (a_level + 1)
					a_cursor.forth
				end
			end
		end
	
feature -- Optimization

	simplify is
			-- Preform context-independent static optimizations
		do
			simplify_with_params (actual_parameters)
			simplify_with_params (tunnel_parameters)
			select_expression.simplify
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression) end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			check_with_params (actual_parameters, a_context, a_context_item_type)
			check_with_params (tunnel_parameters, a_context, a_context_item_type)
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression) end
			if select_expression.is_empty_sequence then set_replacement (select_expression.as_empty_sequence) end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			optimize_with_params (actual_parameters, a_context, a_context_item_type)
			optimize_with_params (tunnel_parameters, a_context, a_context_item_type)

			-- More information is avialble, so:

			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression) end
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression) end
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then select_expression := select_expression.replacement_expression; adopt_child_expression (select_expression) end
			if select_expression.is_empty_sequence then set_replacement (select_expression.as_empty_sequence) end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
				reset_static_properties				
			end
			promote_with_params (actual_parameters, an_offer)
			promote_with_params (tunnel_parameters, an_offer)
		end

feature -- Evaluation

	process (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			apply (a_context, False)
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			apply (a_context, is_tail_recursion_used)
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

	actual_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Non-tunnel parameters

	tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Tunnel parameters

	is_current_mode_used: BOOLEAN
			-- Should we use `mode' or the current mode?

	is_tail_recursion_used: BOOLEAN
			-- Should we make taiul-recursive calls?
	
	mode: XM_XSLT_MODE
			-- Mode to use

	apply (a_context: XM_XSLT_EVALUATION_CONTEXT; returns_tail_call: BOOLEAN) is
			-- Apply `Current'.
		require
			context_not_void: a_context /= void
		local
			an_evaluation_context, a_new_context: XM_XSLT_EVALUATION_CONTEXT
			a_mode: XM_XSLT_MODE
			some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			last_tail_call := Void
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- as this is XSLT
			end
			if is_current_mode_used then
				a_mode := an_evaluation_context.current_mode
			else
				a_mode := mode
			end

			-- handle any parameters

			some_parameters := assembled_parameters (a_context, actual_parameters)
			some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)

			if returns_tail_call then
				a_new_context := a_context.new_context
				select_expression.lazily_evaluate (a_context, 1)
				create {XM_XSLT_APPLY_TEMPLATES_PACKAGE} last_tail_call.make ( select_expression.last_evaluation,
																									a_mode, some_parameters,
																									some_tunnel_parameters,
																									a_new_context
																								  )
			else

				-- Get an iterator to iterate through the selected nodes in original order.

				select_expression.create_iterator (a_context)
				an_iterator := select_expression.last_iterator
				if an_iterator.is_error then
					if not an_iterator.error_value.is_location_known then
						an_iterator.error_value.set_location (system_id, line_number)
					end
					a_context.transformer.report_fatal_error (an_iterator.error_value)
				else
					-- quick exit if the iterator is empty
					
					if not an_iterator.is_empty_iterator then
						
						-- Process the selected nodes now.
						
						from
							a_new_context := a_context.new_context
							apply_templates (an_iterator, a_mode, some_parameters, some_tunnel_parameters, a_new_context)
						until
							a_new_context.transformer.is_error or else last_tail_call = Void
						loop
							last_tail_call.process_leaving_tail (a_new_context)
							last_tail_call := last_tail_call.last_tail_call
						end
					end
				end
			end
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	actual_parameters_not_void: initialized implies actual_parameters /= Void
	tunnel_parameters_not_void: initialized implies tunnel_parameters /= Void
	current_mode: initialized and then not is_current_mode_used implies mode /= Void

end
	
