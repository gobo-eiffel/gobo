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
			process
		end

creation

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
			tunnel_parameters := some_tunnel_parameters
			instruction_name := "apply-templates"
			create children.make (0)
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
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

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
			a_mode: XM_XSLT_MODE
			a_transformer: XM_XSLT_TRANSFORMER
			some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]
		do
			a_transformer := a_context.transformer
			if is_current_mode_used then
				a_mode := a_transformer.current_mode
			else
				a_mode := mode
			end

			-- handle any parameters

			some_parameters := assembled_parameters (a_context, actual_parameters)
			some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)

			if returns_tail_call then
				select_expression.lazily_evaluate (a_context, False)
				create {XM_XSLT_APPLY_TEMPLATES_PACKAGE} last_tail_call.make ( select_expression.last_evaluation,
																									a_mode, some_parameters,
																									some_tunnel_parameters,
																									a_transformer.saved_context
																								  )
			else

				-- Get an iterator to iterate through the selected nodes in original order.

				an_iterator := select_expression.iterator (a_context)

				-- quick exit if the iterator is empty

				an_empty_iterator ?= an_iterator
				if an_empty_iterator = Void then

					-- Process the selected nodes now.

					from
						a_transformer.apply_templates (an_iterator, a_mode, some_parameters,	some_tunnel_parameters)
						last_tail_call := a_transformer.last_tail_call
					until
						last_tail_call = Void
					loop
						last_tail_call.process_leaving_tail (a_transformer)
						last_tail_call := last_tail_call.last_tail_call
					end
				end
			end
		end

invariant

	select_expression_not_void: select_expression /= Void
	actual_parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void
	current_mode: not is_current_mode_used implies mode /= Void

end
	
