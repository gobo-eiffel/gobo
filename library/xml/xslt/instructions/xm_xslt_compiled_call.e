indexing

	description: "Objects that represent an xsl:call-template,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_CALL

inherit
	
	XM_XSLT_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_target: XM_XSLT_COMPILED_TEMPLATE; an_actual_parameter_list, a_tunnel_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_use_tail_recursion: BOOLEAN) is
			-- Establish invariant.
		require
			target_not_void: a_target /= Void
			actual_parameter_list_not_void: an_actual_parameter_list /= Void
			tunnel_parameter_list_not_void: a_tunnel_parameter_list /= Void
		do
			target := a_target
			actual_parameter_list := an_actual_parameter_list
			tunnel_parameter_list := a_tunnel_parameter_list
			use_tail_recursion := a_use_tail_recursion
			instruction_name := "call-template"
			create children.make (0)
		ensure
			target_set: target = a_target
			actual_parameter_list_set: actual_parameter_list = an_actual_parameter_list
			tunnel_parameter_list_set: tunnel_parameter_list = a_tunnel_parameter_list
			tail_recursion_set: use_tail_recursion = a_use_tail_recursion
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
	
	target: XM_XSLT_COMPILED_TEMPLATE
			-- Target template

	actual_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Actual (non-tunnel) parameters

	tunnel_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]
			-- Tunnel parameters
	
	use_tail_recursion: BOOLEAN
			-- Is tail recursion used?

invariant

	target_not_void: target /= Void
	actual_parameter_list_not_void: actual_parameter_list /= Void
	tunnel_parameter_list_not_void: tunnel_parameter_list /= Void
	
end
	
