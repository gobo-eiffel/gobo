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

creation

	make

feature {NONE} -- Initialization

	make (a_select_expression: XM_XPATH_EXPRESSION; some_actual_parameters, some_tunnel_parameters: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM];
			use_current_mode, use_tail_recusrion: BOOLEAN; a_mode: XM_XSLT_MODE) is
			-- Establish invariant.
		require
			select_expression_not_void: a_select_expression /= Void
			actual_parameters_not_void: some_actual_parameters /= Void
			tunnel_parameters_not_void: some_tunnel_parameters /= Void
			current_mode: not use_current_mode implies a_mode /= Void
		do
			select_expression := a_select_expression
			mode := a_mode
			is_current_mode_used := use_current_mode
			is_tail_recursion_used := use_tail_recusrion
			actual_parameters := some_actual_parameters
			tunnel_parameters := some_tunnel_parameters
			instruction_name := "apply-templates"
			create children.make (0)
		ensure
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

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
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

invariant

	select_expression_not_void: select_expression /= Void
	actual_parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void
	current_mode: not is_current_mode_used implies mode /= Void

end
	
