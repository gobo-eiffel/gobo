note

	description:

		"xsl:copy-of element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COPY_OF

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			a_select_attribute, a_copy_namespaces_attribute, a_validation_attribute, a_type_attribute: detachable STRING
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
					if STRING_.same_string (an_expanded_name, Select_attribute) then
						a_select_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Copy_namespaces_attribute) then
						a_copy_namespaces_attribute:= attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
						a_validation_attribute:= attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Type_attribute) then
						a_type_attribute:= attribute_value_by_index (a_cursor.index)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			prepare_attributes_2 (a_select_attribute, a_copy_namespaces_attribute, a_validation_attribute, a_type_attribute)

			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			check_empty
			create l_replacement.make (Void)
			check attached select_expression as l_select_expression then
				type_check_expression (l_replacement, "select", l_select_expression)
			end
			select_expression := l_replacement.item
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			check
				attached select_expression as l_select_expression
				attached base_uri as l_base_uri
			then
				create {XM_XSLT_COMPILED_COPY_OF} last_generated_expression.make (an_executable, l_select_expression, copy_namespaces, l_base_uri)
			end
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Selected node

	copy_namespaces: BOOLEAN
			-- Do we copy namespaces?

	prepare_attributes_2 (a_select_attribute, a_copy_namespaces_attribute, a_validation_attribute, a_type_attribute: detachable STRING)
			-- Continue preparing attributes.
		local
			validation: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_last_generated_expression then
					select_expression := l_last_generated_expression
					if attached l_last_generated_expression.error_value as l_error_value then
						check is_error: l_last_generated_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				report_absence ("select")
			end

			if a_copy_namespaces_attribute = Void then
				copy_namespaces := True
			else
            if STRING_.same_string (a_copy_namespaces_attribute, "yes") then
					copy_namespaces := True
				elseif STRING_.same_string (a_copy_namespaces_attribute, "no") then
					copy_namespaces := False
				else
					create an_error.make_from_string ("Value of copy-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			if a_validation_attribute /= Void then
				validation := validation_code (a_validation_attribute)
				if validation /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
				elseif validation = Validation_invalid then
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

end
