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

creation

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
			tunnel_parameters := some_tunnel_parameters
			instruction_name := "apply-imports"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			actual_parameters_set: actual_parameters = some_actual_parameters
			tunnel_parameters_set: tunnel_parameters = some_tunnel_parameters
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			some_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET
			a_current_template: XM_XSLT_COMPILED_TEMPLATE
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_transformer := a_context.transformer
			
			-- handle any parameters

			some_parameters := assembled_parameters (a_context, actual_parameters)
			some_tunnel_parameters := assembled_tunnel_parameters (a_context, tunnel_parameters)
			a_current_template := a_transformer.current_template
			if a_current_template = Void then
				create an_error.make_from_string ("Current template rule is null whilst evaluating xsl:apply-imports.", "", "XT0560", Dynamic_error)
				a_transformer.report_fatal_error (an_error, Current)
			else
				a_transformer.apply_imports (a_current_template.minimum_import_precedence,a_current_template.precedence - 1, some_parameters, some_tunnel_parameters)
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

	actual_parameters_not_void: actual_parameters /= Void
	tunnel_parameters_not_void: tunnel_parameters /= Void

end
	
