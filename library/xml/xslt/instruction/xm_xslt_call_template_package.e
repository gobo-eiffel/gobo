note

	description:

		"Objects that encapsulate a call to a template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CALL_TEMPLATE_PACKAGE

inherit

	XM_XPATH_TAIL_CALL

create

	make

feature {NONE} -- Initialization

	make (a_target: XM_XSLT_COMPILED_TEMPLATE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Establish invariant.
		require
			target_not_void: a_target /= Void
			saved_context_not_void: a_context /= Void
			some_parameters_not_void: some_parameters /= Void
			some_tunnel_parameters_not_void: some_tunnel_parameters /= Void
		do
			target := a_target
			actual_parameters := some_parameters
			tunnel_parameters := some_tunnel_parameters
			execution_context := a_context
		ensure
			target_set: target = a_target
			actual_parameters_set: actual_parameters = some_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
			execution_context_saved: execution_context = a_context
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_new_context := execution_context.new_context
			a_new_context.set_local_parameters (actual_parameters)
			a_new_context.set_tunnel_parameters (tunnel_parameters)
			a_new_context.open_stack_frame (target.slot_manager)
			target.expand (a_tail, a_new_context)
		end

feature {NONE} -- Implementation

	target: XM_XSLT_COMPILED_TEMPLATE
			-- Target template

	actual_parameters: XM_XSLT_PARAMETER_SET
			-- Non-tunnel parameters

	tunnel_parameters: XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

	execution_context: XM_XSLT_EVALUATION_CONTEXT
			-- Saved execution context

invariant

	target_not_void: target /= Void
	saved_context_not_void: execution_context /= Void
	parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void

end

