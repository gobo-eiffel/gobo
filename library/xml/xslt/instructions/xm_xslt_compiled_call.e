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
		redefine
			process
		end

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_target: XM_XSLT_COMPILED_TEMPLATE; an_actual_parameter_list, a_tunnel_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]; a_use_tail_recursion: BOOLEAN) is
			-- Establish invariant.
		require
			target_not_void: a_target /= Void
			actual_parameter_list_not_void: an_actual_parameter_list /= Void
			tunnel_parameter_list_not_void: a_tunnel_parameter_list /= Void
		do
			executable := an_executable
			target := a_target
			actual_parameter_list := an_actual_parameter_list
			tunnel_parameter_list := a_tunnel_parameter_list
			use_tail_recursion := a_use_tail_recursion
			instruction_name := "call-template"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			target_set: target = a_target
			actual_parameter_list_set: actual_parameter_list = an_actual_parameter_list
			tunnel_parameter_list_set: tunnel_parameter_list = a_tunnel_parameter_list
			tail_recursion_set: use_tail_recursion = a_use_tail_recursion
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

		process (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_bindery: XM_XSLT_BINDERY
			a_tail_call: XM_XSLT_TAIL_CALL
		do
			a_transformer := a_context.transformer
			a_bindery := a_transformer.bindery
			a_bindery.open_stack_frame (assembled_parameters (a_context, actual_parameter_list),
												 assembled_tunnel_parameters (a_context, tunnel_parameter_list)
												 )
			if a_transformer.is_tracing then
				todo ("process", True)
			else
				target.expand (a_transformer)
			end
			from
				a_tail_call := target.last_tail_call
			until
				a_tail_call = Void
			loop
				a_tail_call.process_leaving_tail (a_transformer)
				a_tail_call := a_tail_call.last_tail_call
			end
			a_bindery.close_stack_frame
			last_tail_call := Void
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
		do
			if not use_tail_recursion then
				process (a_context)
				last_tail_call := Void
			else

				-- Handle any parameters.

				some_parameters := assembled_parameters (a_context, actual_parameter_list)
				some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameter_list)

				-- Call the named template. Actually, don't call it; rather construct a call package
				--  and return it to the caller, who will then process this package.

				create {XM_XSLT_CALL_TEMPLATE_PACKAGE} last_tail_call.make (target,
																								some_parameters,
																								some_tunnel_parameters,
																								a_context.transformer.saved_context)
			end
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
	
