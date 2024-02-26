note

	description:

		"xsl:comment element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_COMMENT

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
			Result := "XTSE0940"
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute: detachable STRING
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
						STRING_.left_adjust (a_select_attribute)
						STRING_.right_adjust (a_select_attribute)
					else
					check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_select_expression then
					select_expression := l_new_select_expression
					if attached l_new_select_expression.error_value as l_error_value then
						check is_error: l_new_select_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if attached select_expression as l_select_expression then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", l_select_expression)
				select_expression := l_replacement.item
			end
			check_within_template
			Precursor
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			a_comment: XM_XSLT_COMPILED_COMMENT
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create a_comment.make (an_executable)
			create a_string_value.make (" ")
			compile_content (an_executable, a_comment, a_string_value)
			last_generated_expression := a_comment
		end

end
