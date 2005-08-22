indexing

	description:

		"Objects that encapsulate an application of a template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_APPLY_TEMPLATES_PACKAGE

inherit

	XM_XPATH_TAIL_CALL

	XM_XSLT_TEMPLATE_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_value: XM_XPATH_VALUE; a_mode: XM_XSLT_MODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Establish invariant.
 		require
			selected_nodes_not_void: a_value /= Void
			mode_not_void: a_mode /= Void
			major_context_not_void: a_context /= Void and then not a_context.is_minor
			some_parameters_not_void: some_parameters /= Void
			some_tunnel_parameters_not_void: some_tunnel_parameters /= Void
		do
			selected_nodes := a_value
			mode := a_mode
			actual_parameters := some_parameters
			tunnel_parameters := some_tunnel_parameters
			execution_context := a_context
		ensure
			mode_set: mode = a_mode
			selected_nodes_set: selected_nodes = a_value
			actual_parameters_set: actual_parameters = some_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
			execution_context_saved: execution_context = a_context
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

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			last_tail_call := Void
			selected_nodes.create_iterator (Void)
			if selected_nodes.last_iterator.is_error then
				a_context.transformer.report_fatal_error (selected_nodes.last_iterator.error_value)
			else
				apply_templates (selected_nodes.last_iterator,
									  mode,
									  actual_parameters,
									  tunnel_parameters,
									  execution_context
									  )
			end
		end

feature {NONE} -- Implementation

	selected_nodes: XM_XPATH_VALUE
			-- Sequence of nodes to be evaluated.

	mode: XM_XSLT_MODE
			-- mode

	actual_parameters: XM_XSLT_PARAMETER_SET
			-- Non-tunnel parameters

	tunnel_parameters: XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

	execution_context: XM_XSLT_EVALUATION_CONTEXT
			-- Saved execution context

invariant

	selected_nodes_not_void: selected_nodes /= Void
	mode_not_void: mode /= Void
	saved_context_not_void: execution_context /= Void
	parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void
	
end
	
