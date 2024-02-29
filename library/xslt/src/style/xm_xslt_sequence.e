note

	description:

		"xsl:sequence element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SEQUENCE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, mark_tail_calls,
			may_contain_sequence_constructor, may_contain_fallback
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status setting

	mark_tail_calls
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: detachable XM_XSLT_STYLE_ELEMENT
		do
			a_last_instruction := last_child_instruction
			if a_last_instruction /= Void then
				a_last_instruction.mark_tail_calls
			elseif attached select_expression as l_select_expression then
				l_select_expression.mark_tail_function_calls
			end
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := False
		end

	may_contain_fallback: BOOLEAN
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := True
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
				select_expression := last_generated_expression
			else
				report_absence ("select")
			end
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
			check attached select_expression as l_select_expression then
				if l_select_expression.is_computed_expression then
					check attached principal_stylesheet as l_principal_stylesheet then
						l_select_expression.as_computed_expression.set_source_location (l_principal_stylesheet.module_number (system_id), line_number)
					end
				end
				last_generated_expression := select_expression
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			if attached select_expression as l_select_expression then
				Result := l_select_expression.item_type
			else
				Result := common_child_item_type
			end
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Optional select expression

end
