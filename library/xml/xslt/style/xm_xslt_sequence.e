indexing

	description:

		"xsl:sequence element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: XM_XSLT_STYLE_ELEMENT
		do
			a_last_instruction := last_child_instruction
			if a_last_instruction /= Void then
				a_last_instruction.mark_tail_calls
			elseif select_expression /= Void then
				select_expression.mark_tail_function_calls
			end
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := False
		end

	may_contain_fallback: BOOLEAN is
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute: STRING
		do
			if attribute_collection /= Void then
				from
					a_cursor := attribute_collection.name_code_cursor
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
					attribute_collection.number_of_attributes + 1 - a_cursor.index
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

	validate is
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			check_within_template
			check_empty
			create l_replacement.make (Void)
			type_check_expression (l_replacement, "select", select_expression)
			select_expression := l_replacement.item
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			if select_expression.is_computed_expression then
				select_expression.as_computed_expression.set_source_location (principal_stylesheet.module_number (system_id), line_number)
			end
			last_generated_expression := select_expression
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			if select_expression /= Void then
				Result := select_expression.item_type
			else
				Result := common_child_item_type
			end
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Optional select expression

end
