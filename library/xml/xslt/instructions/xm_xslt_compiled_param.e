indexing

	description:

		"Objects that represent the compiled form of xsl:param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_PARAM

inherit

	XM_XSLT_COMPILED_VARIABLE_DEFINITION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		do
			executable := an_executable
			variable_name := a_name
			slot_number := a_slot_number
			instruction_name := "param"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			name_set: variable_name = a_name
			slot_number: slot_number = a_slot_number
		end

feature -- Status setting

	set_conversion (a_conversion: XM_XPATH_EXPRESSION) is
			-- Set conversion expression.
		do
			conversion := a_conversion
		ensure
			set: conversion = a_conversion
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_bindery: XM_XSLT_BINDERY
			a_transformer: XM_XSLT_TRANSFORMER
			was_supplied: BOOLEAN
			a_value: XM_XPATH_VALUE
			an_error: XM_XPATH_ERROR_VALUE
			a_singleton_node: XM_XPATH_SINGLETON_NODE
			an_error_code: STRING
		do
			a_transformer := a_context.transformer
			a_bindery := a_transformer.bindery
			if is_global_variable then
				was_supplied := a_bindery.is_global_parameter_supplied (variable_fingerprint)
				if was_supplied then
					a_bindery.bind_global_parameter (Current, variable_fingerprint)
					if a_bindery.last_binding_failure /= Void then
						create an_error.make_from_string (a_bindery.last_binding_failure, Gexslt_eiffel_type_uri, "PARAMETER_BINDING_FAILURE", Dynamic_error)
						a_transformer.report_fatal_error (an_error, Current)
					end
				end
			else
				was_supplied := a_bindery.is_local_parameter_supplied (variable_fingerprint, is_tunnel_parameter)
				if was_supplied then
					a_singleton_node ?= a_bindery.supplied_local_parameter_value (variable_fingerprint, is_tunnel_parameter)
					a_bindery.set_local_variable (slot_number, a_bindery.supplied_local_parameter_value (variable_fingerprint, is_tunnel_parameter))
					if a_bindery.last_binding_failure /= Void then
						create an_error.make_from_string (a_bindery.last_binding_failure, Gexslt_eiffel_type_uri, "PARAMETER_BINDING_FAILURE", Dynamic_error)
						a_transformer.report_fatal_error (an_error, Current)
					else
						if conversion /= Void then
							conversion.eagerly_evaluate (a_context)
							a_bindery.set_local_variable (slot_number, conversion.last_evaluation)
						end
					end
				end
			end

			-- Don't evaluate the default if a value has been supplied or if it has already been
			--  evaluated by virtue of a forwards reference

			if not a_transformer.is_error and then not was_supplied then
				if is_required_parameter then
					if is_global_variable then
						an_error_code := "XT0050"
					else
						an_error_code := "XT0700"
					end
					create an_error.make_from_string ("No value supplied for required parameter", "", an_error_code, Dynamic_error)
					a_transformer.report_fatal_error (an_error, Current)
				else
					a_value := value (a_context)
					if is_global_variable then
						a_bindery.define_global_variable (slot_number, a_value)
					else
						a_bindery.set_local_variable (slot_number, a_value)
					end
				end
			end
		end

feature {NONE} -- Implementation

	conversion: XM_XPATH_EXPRESSION
			-- Conversion expression

invariant

	instruction_name: STRING_.same_string (instruction_name, "param")

end
