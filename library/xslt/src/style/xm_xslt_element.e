note

	description:

		"xsl:element element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			is_instruction := True
			validation_action := Validation_strip
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_namespace_attribute,
			a_type_attribute, a_validation_attribute, an_inherit_namespaces_attribute: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
			l_use_attribute_sets: like use_attribute_sets
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Name_attribute) then
						a_name_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_name_attribute)
						STRING_.right_adjust (a_name_attribute)
					elseif STRING_.same_string (an_expanded_name, Namespace_attribute) then
						a_namespace_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_namespace_attribute)
						STRING_.right_adjust (a_namespace_attribute)
					elseif STRING_.same_string (an_expanded_name, Type_attribute) then
						a_type_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_type_attribute)
						STRING_.right_adjust (a_type_attribute)
					elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
						a_validation_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_validation_attribute)
						STRING_.right_adjust (a_validation_attribute)
					elseif STRING_.same_string (an_expanded_name, Inherit_namespaces_attribute) then
						an_inherit_namespaces_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (an_inherit_namespaces_attribute)
						STRING_.right_adjust (an_inherit_namespaces_attribute)
					elseif STRING_.same_string (an_expanded_name, Use_attribute_sets_attribute) then
						l_use_attribute_sets := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_use_attribute_sets)
						STRING_.right_adjust (l_use_attribute_sets)
						use_attribute_sets := l_use_attribute_sets
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_name_attribute /= Void then
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (a_name_attribute, l_static_context)
				end
				check postconition_of_generate_attribute_value_template: attached last_generated_expression as l_element_name then
					element_name := l_element_name
					if attached l_element_name.error_value as l_error_value then
						check is_error: l_element_name.is_error end
						report_compile_error (l_error_value)
					else
						if l_element_name.is_string_value then
							if not is_qname (l_element_name.as_string_value.string_value) then
								create an_error.make_from_string ("Element name is not a valid QName", Xpath_errors_uri, "XTDE0820", Static_error)
								report_compile_error (an_error)

								-- Prevent a duplicate error message.

								create {XM_XPATH_STRING_VALUE} element_name.make ("gexslt-error-element")
							end
						end
					end
				end
			else
				report_absence ("name")
			end
			if a_namespace_attribute /= Void then
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (a_namespace_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_namespace then
					namespace := l_namespace
					if attached l_namespace.error_value as l_error_value then
						check is_error: l_namespace.is_error end
						report_compile_error (l_error_value)
					elseif l_namespace.is_string_value and then l_namespace.as_string_value.string_value.occurrences ('#') > 1 then
						report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Namespace attribute is not a valid xs:anyURI", Xpath_errors_uri, "XTDE0835", Static_error))
					end
				end
			end
			prepare_attributes_2 (a_validation_attribute, a_type_attribute, an_inherit_namespaces_attribute)
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			if attached use_attribute_sets as l_use_attribute_sets then
				accumulate_attribute_sets (l_use_attribute_sets, Void)
			else
				create used_attribute_sets.make (0)
			end
			create l_replacement.make (Void)
			check attached element_name as l_element_name then
				type_check_expression (l_replacement, "name", l_element_name)
			end
			element_name := l_replacement.item
			if attached namespace as l_namespace then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "namespace", l_namespace)
				namespace := l_replacement.item
			end
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_name_code: INTEGER
			l_namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			l_element: XM_XSLT_COMPILED_ELEMENT
			l_content: detachable XM_XPATH_EXPRESSION
			l_attributes_usage: XM_XSLT_ATTRIBUTE_USAGE
			l_namespace_uri: like namespace_uri
		do

			last_generated_expression := Void

			-- Deal specially with the case where the element name is known statically.

			check attached element_name as l_element_name then
				if l_element_name.is_string_value then
					set_qname_parts (l_element_name.as_string_value)
					if not any_compile_errors and then attached namespace_uri as l_namespace_uri_2 then
						check
							attached qname_prefix as l_qname_prefix
							attached local_name as l_local_name
						then
							if shared_name_pool.is_name_code_allocated (l_qname_prefix, l_namespace_uri_2, l_local_name) then
								l_name_code := shared_name_pool.name_code (l_qname_prefix, l_namespace_uri_2, l_local_name)
							else
								shared_name_pool.allocate_name (l_qname_prefix, l_namespace_uri_2, l_local_name)
								l_name_code := shared_name_pool.last_name_code
							end
						end
					end
					if not attached namespace as l_namespace then
						if namespace_uri = Void then
							report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Prefix for element name is not in scope", Xpath_errors_uri, "XTDE0830", Static_error))
						else
							compile_fixed_element (a_executable, l_name_code)
						end
					elseif namespace_uri /= Void and then l_namespace.is_string_value then
						l_namespace_uri := l_namespace.as_string_value.string_value
						namespace_uri := l_namespace_uri
						if l_namespace_uri.count = 0 then
							qname_prefix := ""
						end
						check
							attached qname_prefix as l_qname_prefix
							attached local_name as l_local_name
						then
							if shared_name_pool.is_name_code_allocated (l_qname_prefix, l_namespace_uri, l_local_name) then
								l_name_code := shared_name_pool.name_code (l_qname_prefix, l_namespace_uri, l_local_name)
							else
								shared_name_pool.allocate_name (l_qname_prefix, l_namespace_uri, l_local_name)
								l_name_code := shared_name_pool.last_name_code
							end
							compile_fixed_element (a_executable, l_name_code)
						end
					end
				end
			end

			if last_generated_expression = Void and not any_compile_errors then

				-- If the namespace URI must be deduced at run-time from the element name prefix,
				--  we need to save the namespace context of the instruction.

				if namespace = Void then
					l_namespace_context := namespace_context
				end
				compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
				l_content := last_generated_expression
				check attached used_attribute_sets as l_used_attribute_sets then
					if not l_used_attribute_sets.is_empty then
						create l_attributes_usage.make (a_executable, l_used_attribute_sets)
						if l_content = Void then
							l_content := l_attributes_usage
						else
							check attached principal_stylesheet as l_principal_stylesheet then
								create {XM_XSLT_BLOCK} l_content.make (a_executable, l_attributes_usage, l_content, l_principal_stylesheet.module_number (system_id), line_number)
							end
						end
					end
				end
				if l_content = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
				end
				check attached element_name as l_element_name then
					create l_element.make (a_executable, l_element_name, namespace, l_namespace_context, used_attribute_sets, Void, validation_action, is_inherit_namespaces, l_content)
					last_generated_expression := l_element
				end
			end
		end

feature {NONE} -- Implementation

	element_name: detachable XM_XPATH_EXPRESSION
			-- QName of element

	namespace: detachable XM_XPATH_EXPRESSION
			-- Namespace URI of element

	use_attribute_sets: detachable STRING
			-- -- Attribute sets to be used

	qname_prefix, local_name, qname: detachable STRING
	namespace_uri: detachable STRING
			-- Used for communicating with `compile'

	validation_action: INTEGER

	is_inherit_namespaces: BOOLEAN
		-- Do we inherit namespaces?

	prepare_attributes_2 (a_validation_attribute, a_type_attribute, an_inherit_namespaces_attribute: detachable STRING)
			-- Continue prparing attributes.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if an_inherit_namespaces_attribute = Void then
				is_inherit_namespaces := True
			else
				if STRING_.same_string (an_inherit_namespaces_attribute, "no") then
					is_inherit_namespaces := False
				elseif STRING_.same_string (an_inherit_namespaces_attribute, "yes") then
					is_inherit_namespaces := True
				else
					create an_error.make_from_string ("Value of inherit-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if a_validation_attribute /= Void then
				validation_action := validation_code (a_validation_attribute)
				if validation_action /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
				elseif validation_action = Validation_invalid then
					create an_error.make_from_string ("Invalid value of validation attribute", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end

			if a_type_attribute /= Void then
				create an_error.make_from_string ("The type attribute is available only with a schema-aware XSLT processor", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
			end

			if a_type_attribute /= Void and then a_validation_attribute /= Void then
				create an_error.make_from_string ("The validation and type attributes are mutually exclusive", Xpath_errors_uri, "XTSE1505", Static_error)
				report_compile_error (an_error)
			end
		end

	set_qname_parts (a_string_value: XM_XPATH_STRING_VALUE)
			-- Analyze and set qname parts.
		require
			string_value_not_void: a_string_value /= Void
		local
			a_parser: XM_XPATH_QNAME_PARSER
			an_error: XM_XPATH_ERROR_VALUE
			l_qname: like qname
		do
			l_qname := a_string_value.string_value
			qname := l_qname
			STRING_.left_adjust (l_qname)
			STRING_.right_adjust (l_qname)
			if l_qname.count = 0 then
				create an_error.make_from_string ("Element name must not be zero length", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			else
				create a_parser.make (l_qname)
				if a_parser.is_valid then
					check a_parser_is_valid: attached a_parser.local_name as l_local_name then
						local_name := l_local_name
					end
					check a_parser_is_valid: attached a_parser.optional_prefix as l_optional_prefix then
						qname_prefix := l_optional_prefix
					end
				else
					create an_error.make_from_string (STRING_.concat ("Invalid element name: ", l_qname), Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
				if namespace = Void then
					check attached qname_prefix as l_qname_prefix then
						namespace_uri := uri_for_prefix (l_qname_prefix, True)
					end
				end
			end
		end

	compile_fixed_element (a_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER)
			-- Compile to a fixed element.
		require
			executable_not_void: a_executable /= Void
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		local
			a_fixed_element: XM_XSLT_FIXED_ELEMENT
			some_namespace_codes: DS_ARRAYED_LIST [INTEGER]
			a_content: detachable XM_XPATH_EXPRESSION
		do
			create some_namespace_codes.make (0)
			compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
			a_content := last_generated_expression
			if a_content = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} a_content.make
			end
			create a_fixed_element.make (a_executable, a_name_code, some_namespace_codes, used_attribute_sets, Void, validation_action, is_inherit_namespaces, a_content)
			a_fixed_element.set_base_uri (base_uri)
			last_generated_expression := a_fixed_element
		end

invariant

	instruction: is_instruction = True

end
