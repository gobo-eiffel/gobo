indexing

	description:

		"xsl:param element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PARAM

inherit

	XM_XSLT_VARIABLE_DECLARATION
		redefine
			make_style_element, validate, allows_required, allows_value, is_param
		end

	XM_XSLT_STRING_ROUTINES

	XM_XPATH_ROLE

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			cached_variable_fingerprint := -1
			create references.make (5)
			allows_tunnel := True
			create slot_manager.make
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of the variable
		do
			if as_type /= Void then
				Result := as_type
			else
				create Result.make_any_sequence
			end
		end

	allows_required: BOOLEAN is
			-- Is the "required" attribute allowed?
		local
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= parent_node
			Result := a_function = Void
		end

	allows_value: BOOLEAN is
			-- Is the "select" attribute allowed?
		local
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= parent_node
			Result := a_function = Void
		end

feature -- Element change

	validate is
			-- Check that the stylesheet element is valid.
		local
			is_local: BOOLEAN
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_template: XM_XSLT_TEMPLATE
			a_function: XM_XSLT_FUNCTION
			a_parameter: XM_XSLT_PARAM
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_template ?= parent; a_function ?= parent
			is_local := a_template /= Void or else a_function /= Void
			if not is_local and then not is_global_variable then
				create an_error.make_from_string ("xsl:param must be immediately within a template, function or stylesheet", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			else
				if not is_global_variable then
					from
						a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
						a_preceding_iterator.start
					until
						any_compile_errors or else a_preceding_iterator.after
					loop
						a_node := a_preceding_iterator.item
						a_parameter ?= a_node
						if a_parameter /= Void then
							if variable_fingerprint = a_parameter.variable_fingerprint then
								create an_error.make_from_string ("The name of the parameter is not unique", Xpath_errors_uri, "XTSE0580", Static_error)
								report_compile_error (an_error)
							end
						else
							a_style_element ?= a_node
							if a_style_element /= Void then
								create an_error.make_from_string ("xsl:param must be the first element within a template or function", Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (an_error)
							else

								-- must be a text node - allow it only if all white-space

								if not is_all_whitespace (a_node.string_value) then
									create an_error.make_from_string ("xsl:param must not be preceded by text", Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (an_error)
								end
							end
						end
						a_preceding_iterator.forth
					end
				end
				if is_required_parameter then
					if select_expression /= Void then

						-- NB, we do this test before setting the default select attribute

						create an_error.make_from_string ("The select attribute should be omitted when required='yes'", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
					if has_child_nodes then
						create an_error.make_from_string ("A parameter specifying required='yes' must have empty content", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
				end
				
			end
			if not any_compile_errors then
				Precursor
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_function: XM_XSLT_FUNCTION
			a_slot_number: INTEGER
			a_conversion: XM_XPATH_EXPRESSION
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			a_supplied_parameter_reference: XM_XSLT_SUPPLIED_PARAMETER_REFERENCE
			a_param: XM_XSLT_COMPILED_GENERAL_VARIABLE
			a_global_param: XM_XSLT_GLOBAL_PARAM
			a_local_param: XM_XSLT_LOCAL_PARAM
		do
			last_generated_expression := Void
			a_function ?= parent
			if a_function /= Void then
				
				-- For Function arguments, the XM_XSLT_USER_FUNCTION_PARAMETER is more efficient than
				--  the general-purpose XM_XSLT_COMPILED_PARAM object, and these are compiled
				--  when compiling the parent xsl:function

				last_generated_expression := Void
			elseif not is_redundant_variable then
				check
					strictly_positive_slot_number: slot_number > 0
				end
				a_slot_number := slot_number
				if as_type /= Void then
					create a_type_checker
					create a_role.make (Variable_role, variable_name, 1, Xpath_errors_uri, "XPTY0004")
					create a_supplied_parameter_reference.make (a_slot_number)
					a_type_checker.static_type_check (static_context, a_supplied_parameter_reference, as_type, False, a_role)
					if a_type_checker.is_static_type_check_error then
						report_compile_error (a_type_checker.static_type_check_error)
					else
						a_conversion := a_type_checker.checked_expression
					end
				end
				if is_error then
					report_compile_error (error_value)
				else
					if is_global_variable then
						create a_global_param.make_global_variable (an_executable, variable_name, a_slot_number, slot_manager)
						a_global_param.set_static_context (static_context)
						if select_expression /= Void and then select_expression.is_computed_expression then select_expression.as_computed_expression.set_parent (a_global_param) end
						a_param := a_global_param
					else
						create a_local_param.make (an_executable, variable_name, a_slot_number)
						a_local_param.set_conversion (a_conversion)
						a_param := a_local_param
					end
					initialize_instruction (an_executable, a_param)
					a_param.set_required_type (required_type)
					fixup_binding (a_param)
					last_generated_expression := a_param
				end
			end
		end

feature -- Conversion

	is_param: BOOLEAN is
			-- Is `Current' an xsl:param?
		do
			Result := False
		end

end
