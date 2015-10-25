note

	description:

		"xsl:attribute element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ATTRIBUTE

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	select_and_content_error: STRING
			-- Error code when both select expression and content are mutually exclusive
		do
			Result := "XTSE0840"
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_namespace_attribute, a_type_attribute: detachable STRING
			a_select_attribute, a_separator_attribute, a_validation_attribute: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			validation_action := Validation_strip
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
					elseif STRING_.same_string (an_expanded_name, Namespace_attribute) then
						a_namespace_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Select_attribute) then
						a_select_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Separator_attribute) then
						a_separator_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
						a_validation_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Type_attribute) then
						a_type_attribute := attribute_value_by_index (a_cursor.index)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_name_attribute = Void then
				report_absence ("name")
			else
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (a_name_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_attribute_name then
					attribute_name := l_new_attribute_name
					if attached l_new_attribute_name.error_value as l_error_value then
						check is_error: l_new_attribute_name.is_error end
						report_compile_error (l_error_value)
					else
						if l_new_attribute_name.is_string_value then
							if not is_qname (l_new_attribute_name.as_string_value.string_value) then
								create an_error.make_from_string ("Attribute name is not a valid QName",
																			 Xpath_errors_uri, "XTDE0850", Static_error)
								report_compile_error (an_error)

								-- Prevent a duplicate error message.

								create {XM_XPATH_STRING_VALUE} attribute_name.make ("gexslt-error-attribute")
							end
						end
					end
				end
			end
			if a_namespace_attribute /= Void then
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (a_namespace_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_namespace then
					namespace := l_new_namespace
					if attached l_new_namespace.error_value as l_error_value then
						check is_error: l_new_namespace.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_select_expression then
					select_expression := l_select_expression
					if attached l_select_expression.error_value as l_error_value then
						check is_error: l_select_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_separator_attribute /= Void then
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (a_separator_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_separator_expression then
					separator_expression := l_new_separator_expression
					if attached l_new_separator_expression.error_value as l_error_value then
						check is_error: l_new_separator_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				if a_select_attribute = Void then
					create {XM_XPATH_STRING_VALUE} separator_expression.make ("")
				else
					create {XM_XPATH_STRING_VALUE} separator_expression.make (" ")
				end
			end
			prepare_attributes_2 (a_validation_attribute, a_type_attribute)
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if not attached {XM_XSLT_ATTRIBUTE_SET} parent then
				check_within_template
			end
			create l_replacement.make (Void)
			check attached attribute_name as l_attribute_name then
				type_check_expression (l_replacement, "name", l_attribute_name)
			end
			attribute_name := l_replacement.item
			if attached namespace as l_namespace then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "namespace", l_namespace)
				namespace := l_replacement.item
			end
			if attached select_expression as l_select_expression then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "select", l_select_expression)
				select_expression := l_replacement.item
			end
			if attached separator_expression as l_separator_expression then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "separator", l_separator_expression)
				separator_expression := l_replacement.item
			end
			Precursor
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			a_name_code: INTEGER
			a_namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			an_attribute: XM_XSLT_COMPILED_ATTRIBUTE
			l_uri: UT_URI
			l_error: XM_XPATH_ERROR_VALUE
			l_namespace_uri: like namespace_uri
			l_qname_prefix: like qname_prefix
		do
			last_generated_expression := Void

			-- Deal specially with the case where the attribute name is known statically.

			check attached attribute_name as l_attribute_name then
				if l_attribute_name.is_string_value then
					set_qname_parts (l_attribute_name.as_string_value)
					l_namespace_uri := namespace_uri
					if not any_compile_errors and then l_namespace_uri /= Void then
						l_qname_prefix := qname_prefix
						check
							l_qname_prefix /= Void
							attached local_name as l_local_name
						then
							if shared_name_pool.is_name_code_allocated (l_qname_prefix, l_namespace_uri, l_local_name) then
								a_name_code := shared_name_pool.name_code (l_qname_prefix, l_namespace_uri, l_local_name)
							else
								shared_name_pool.allocate_name (l_qname_prefix, l_namespace_uri, l_local_name)
								a_name_code := shared_name_pool.last_name_code
							end
						end
						if not attached namespace as l_namespace then
							compile_fixed_attribute (an_executable, a_name_code)
						elseif l_namespace.is_string_value then
							l_namespace_uri := l_namespace.as_string_value.string_value
							namespace_uri := l_namespace_uri
							if Url_encoding.has_excluded_characters (l_namespace_uri) or l_namespace_uri.occurrences ('#') > 1 then
								create l_error.make_from_string ("Namespace does not conform to xs:anyURI", Xpath_errors_uri, "XTDE0865", Dynamic_error)
								report_compile_error (l_error)
							elseif l_namespace_uri.count > 0 then
								create l_uri.make (l_namespace_uri)
								-- TODO: - need validation checking in UT_URI
							end
							if not any_compile_errors then
								if l_namespace_uri.count = 0 then
									l_qname_prefix := ""
									qname_prefix := l_qname_prefix
								elseif l_qname_prefix.count = 0 then
									choose_arbitrary_qname_prefix
									check postcondition_of_choose_arbitrary_qname_prefix: attached qname_prefix as l_qname_prefix2 then
										l_qname_prefix := l_qname_prefix2
									end
								end
								check attached local_name as l_local_name then
									if shared_name_pool.is_name_code_allocated (l_qname_prefix, l_namespace_uri, l_local_name) then
										a_name_code := shared_name_pool.name_code (l_qname_prefix, l_namespace_uri, l_local_name)
									else
										shared_name_pool.allocate_name (l_qname_prefix, l_namespace_uri, l_local_name)
										a_name_code := shared_name_pool.last_name_code
									end
								end
								compile_fixed_attribute (an_executable, a_name_code)
							end
						end
					end
				end
			end

			if last_generated_expression = Void then

				-- If the namespace URI must be deduced at run-time from the attribute name prefix,
				--  we need to save the namespace context of the instruction.

				if namespace = Void then
					a_namespace_context := namespace_context
				end

				check attached attribute_name as l_attribute_name then
					create an_attribute.make (an_executable, l_attribute_name, namespace, a_namespace_context, validation_action, Void, -1)
				end
				compile_content (an_executable, an_attribute, separator_expression)
				last_generated_expression := an_attribute
			end
		end

feature {NONE} -- Implementation

	validation_action: INTEGER

	attribute_name: detachable XM_XPATH_EXPRESSION
			-- Value of name attribute

	namespace: detachable XM_XPATH_EXPRESSION
			-- Value of namespace attribute

	separator_expression: detachable XM_XPATH_EXPRESSION
			-- Value of separator attribute

	qname_prefix, namespace_uri, local_name, qname: detachable STRING
			-- Used for communicating with `compile'

	prepare_attributes_2 (a_validation_attribute, a_type_attribute: detachable STRING)
			-- Continue prparing attributes.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_validation_attribute /= Void then
				validation_action := validation_code (a_validation_attribute)
				if validation_action /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed",
																 Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
				elseif validation_action = Validation_invalid then
					create an_error.make_from_string ("Invalid value of validation attribute",
																 Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end

			if a_type_attribute /= Void then
				create an_error.make_from_string ("The type attribute is available only with a schema-aware XSLT processor",
															 Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
			end

			if a_type_attribute /= Void and then a_validation_attribute /= Void then
				create an_error.make_from_string ("The validation and type attributes are mutually exclusive",
															 Xpath_errors_uri, "XTSE1505", Static_error)
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
			l_qname_prefix: like qname_prefix
		do
			namespace_uri := ""
			qname_prefix := Void
			local_name := Void
			l_qname := a_string_value.string_value
			STRING_.left_adjust (l_qname)
			STRING_.right_adjust (l_qname)
			qname := l_qname
			if l_qname.count = 0 then
				create an_error.make_from_string ("Attribute name must not be zero length", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			elseif STRING_.same_string (l_qname, "xmlns") and namespace = Void then
				create an_error.make_from_string ("Invalid attribute name: xmlns", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			else
				create a_parser.make (l_qname)
				if a_parser.is_valid then
					l_qname_prefix := a_parser.optional_prefix
					check
						a_parser_valid: attached a_parser.local_name as l_local_name
						a_parser_valid_2: l_qname_prefix /= Void
					then
						local_name := l_local_name
						qname_prefix := l_qname_prefix
						if STRING_.same_string (l_qname_prefix, "xmlns") then
							if namespace = Void then
								create an_error.make_from_string (STRING_.concat ("Invalid attribute name: ", l_qname), Xpath_errors_uri, "XTSE0020", Static_error)
								report_compile_error (an_error)
							else
								l_qname_prefix := "" -- We ignore it anyway when the namespace attribute is present
								qname_prefix := l_qname_prefix
							end
						end
						if namespace = Void then
							namespace_uri := uri_for_prefix (l_qname_prefix, False)
						end
					end
				else
					create an_error.make_from_string (STRING_.concat ("Invalid attribute name: ", l_qname), Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
		ensure
			parts_set_or_error: not any_compile_errors implies qname_prefix /= Void and then local_name /= Void
			namespace_uri: not any_compile_errors and then namespace = Void implies namespace_uri /= Void
		end

	compile_fixed_attribute (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER)
			-- Compile to a fixed attribute.
		require
			executable_not_void: an_executable /= Void
		local
			a_fixed_attribute: XM_XSLT_FIXED_ATTRIBUTE
		do
			create a_fixed_attribute.make (an_executable, a_name_code, validation_action, Void, -1)
			compile_content (an_executable, a_fixed_attribute, separator_expression)
			last_generated_expression := a_fixed_attribute
		end

	choose_arbitrary_qname_prefix
			-- Choose an arbitrary XML prefix.
		require
			namespace_uri_not_void: attached namespace_uri as l_namespace_uri
			namespace_uri_not_empty: not l_namespace_uri.is_empty
			qname_prefix_not_void: attached qname_prefix as l_qname_prefix
			empty_prefix: l_qname_prefix.is_empty
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			found: BOOLEAN
		do
			check precondition_namespace_uri_not_void: attached namespace_uri as l_namespace_uri then
				-- First see if we already have a binding in the stylesheet
				from l_cursor := namespace_codes_in_scope.new_cursor; l_cursor.start until l_cursor.after loop
					if STRING_.same_string (shared_name_pool.uri_from_namespace_code (l_cursor.item), l_namespace_uri) then
						qname_prefix := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
						found := True
						l_cursor.go_after
					else
						l_cursor.forth
					end
				end
				-- Maybe the namespace is already known to the name pool
				if not found then
					qname_prefix := shared_name_pool.suggested_prefix_for_uri (l_namespace_uri)
				end
				if not attached qname_prefix as l_qname_prefix or else l_qname_prefix.is_empty then
					-- the following arbitrary prefix will be change if it clashes
					qname_prefix := "ns0"
				end
			end
		ensure
			chosen_prefix_not_void: attached qname_prefix as l_qname_prefix
			chosen_prefix_empty: not l_qname_prefix.is_empty
		end

end
