note

	description:

		"Objects that encapsulate an application of a template"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_APPLY_TEMPLATES_PACKAGE

inherit

	XM_XPATH_TAIL_CALL

	XM_XSLT_TEMPLATE_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_value: XM_XPATH_VALUE; a_mode: detachable XM_XSLT_MODE; some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Establish invariant.
 		require
			selected_nodes_not_void: a_value /= Void
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

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			selected_nodes.create_iterator (new_dummy_context)
			check postcondition_of_create_iterator: attached selected_nodes.last_iterator as l_last_iterator then
				if attached l_last_iterator.error_value as l_error_value then
					check is_error: l_last_iterator.is_error end
					check attached a_context.transformer as l_transformer then
						l_transformer.report_fatal_error (l_error_value)
					end
				else
					apply_templates (a_tail, l_last_iterator,
										  mode,
										  actual_parameters,
										  tunnel_parameters,
										  execution_context
										  )
				end
			end
		end

feature {NONE} -- Implementation

	selected_nodes: XM_XPATH_VALUE
			-- Sequence of nodes to be evaluated.

	mode: detachable XM_XSLT_MODE
			-- mode

	actual_parameters: XM_XSLT_PARAMETER_SET
			-- Non-tunnel parameters

	tunnel_parameters: XM_XSLT_PARAMETER_SET
			-- Tunnel parameters

	execution_context: XM_XSLT_EVALUATION_CONTEXT
			-- Saved execution context

	new_dummy_context: XM_XPATH_CONTEXT
			-- New dummy context
		local
			l_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			create l_function_library.make
			create {XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT} Result.make_restricted (l_function_library)
		ensure
			new_dummy_context_not_void: Result /= Void
		end

invariant

	selected_nodes_not_void: selected_nodes /= Void
	saved_context_not_void: execution_context /= Void
	parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void

end

