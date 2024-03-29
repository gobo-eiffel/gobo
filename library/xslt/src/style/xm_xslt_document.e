﻿note

	description:

		"xsl:document element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_DOCUMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

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
			validation: INTEGER
			an_expanded_name: STRING
			a_validation_attribute, a_type_attribute: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
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
					if STRING_.same_string (an_expanded_name, Validation_attribute) then
						a_validation_attribute:= attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Type_attribute) then
						a_type_attribute:= attribute_value_by_index (a_cursor.index)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
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
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_last_generated_expression: like last_generated_expression
		do
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
			l_last_generated_expression := last_generated_expression
			if l_last_generated_expression = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} l_last_generated_expression.make
				last_generated_expression := l_last_generated_expression
			end
			check attached base_uri as l_base_uri then
				create {XM_XSLT_COMPILED_DOCUMENT} last_generated_expression.make (an_executable, False, Void, l_base_uri, l_last_generated_expression)
			end
		end

end
