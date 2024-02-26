note

	description:

		"xsl:message element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_MESSAGE

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
			an_expanded_name, a_terminate_attribute, a_select_attribute: detachable STRING
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
					if STRING_.same_string (an_expanded_name, Terminate_attribute) then
						a_terminate_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_terminate_attribute)
						STRING_.right_adjust (a_terminate_attribute)
					elseif STRING_.same_string (an_expanded_name, Select_attribute) then
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
			if a_terminate_attribute = Void then a_terminate_attribute := "no" end
			check precondition_static_context_not_void: attached static_context as l_static_context then
				generate_attribute_value_template (a_terminate_attribute, l_static_context)
			end
			check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_terminate then
				terminate := l_new_terminate
				if attached l_new_terminate.error_value as l_error_value then
					check is_error: l_new_terminate.is_error end
					report_compile_error (l_error_value)
				end
				if l_new_terminate.is_string_value then
					a_terminate_attribute := l_new_terminate.as_string_value.string_value
					if STRING_.same_string (a_terminate_attribute, "no") then
						-- OK
					elseif STRING_.same_string (a_terminate_attribute, "yes") then
						-- OK
					else
						create an_error.make_from_string ("xsl:message terminate attribute must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (an_error)
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
			if not attached {XM_XSLT_FUNCTION} parent_node then
				check_within_template
			end
			if attached select_expression as l_select_expression then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", l_select_expression)
				select_expression := l_replacement.item
			end
			if attached terminate as l_terminate then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "terminate", l_terminate)
				terminate := l_replacement.item
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_select_expression: like select_expression
		do
			last_generated_expression := Void
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), true)
			if attached last_generated_expression as l_last_generated_expression then
				if not attached select_expression as l_select_expression_2 then
					select_expression := last_generated_expression
				else
					check attached principal_stylesheet as l_principal_stylesheet then
						create {XM_XSLT_BLOCK} select_expression.make (an_executable, l_select_expression_2, l_last_generated_expression, l_principal_stylesheet.module_number (system_id), line_number)
					end
				end
			end
			l_select_expression := select_expression
			if l_select_expression = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} l_select_expression.make
				select_expression := l_select_expression
			end
			create {XM_XSLT_COMPILED_MESSAGE} last_generated_expression.make (an_executable, l_select_expression, terminate)
		end

feature {NONE} -- Implementation

	terminate: detachable XM_XPATH_EXPRESSION
			-- Value of terminate attribute

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Value of select attribute

end
