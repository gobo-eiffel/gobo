indexing

	description:

		"Objects that encapsulate a call to a template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CALL_TEMPLATE_PACKAGE

inherit

	XM_XSLT_TAIL_CALL

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_target: XM_XSLT_COMPILED_TEMPLATE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT) is
			-- Establish invariant.
		require
			target_not_void: a_target /= Void
			saved_context_not_void: a_saved_context /= Void
			some_parameters_not_void: some_parameters /= Void
			some_tunnel_parameters_not_void: some_tunnel_parameters /= Void
		do
			target := a_target
			actual_parameters := some_parameters
			tunnel_parameters := some_tunnel_parameters
			execution_context := a_saved_context
		ensure
			target_set: target = a_target
			actual_parameters_set: actual_parameters = some_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
			execution_context_saved: execution_context = a_saved_context
		end

feature -- Evaluation

	process_leaving_tail (a_transformer: XM_XSLT_TRANSFORMER) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT
			a_bindery: XM_XSLT_BINDERY
		do
			a_saved_context := a_transformer.saved_context
			a_transformer.restore_context (execution_context)
			a_bindery := a_transformer.bindery
			a_bindery.open_stack_frame (actual_parameters, tunnel_parameters)
			last_tail_call := Void
			if a_transformer.is_tracing then
				todo ("process_leaving_tail", True)
			else
				target.expand (a_transformer)
			end
			a_bindery.close_stack_frame
			a_transformer.restore_context (a_saved_context)
		end

feature {NONE} -- Implementation
	
	target: XM_XSLT_COMPILED_TEMPLATE
			-- Target template

	actual_parameters: XM_XSLT_PARAMETER_SET
			-- Non-tunnel parameters

	tunnel_parameters: XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

	execution_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT
			-- Saved execution context

invariant

	target_not_void: target /= Void
	saved_context_not_void: execution_context /= Void
	parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void
	
end
	
