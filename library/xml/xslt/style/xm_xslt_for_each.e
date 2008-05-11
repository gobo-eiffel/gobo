indexing

	description:

		"xsl:for-each element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FOR_EACH

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, may_contain_sequence_constructor,
			is_permitted_child, is_for_each
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN is
			-- Is `a_style_element' a permitted child of `Current'?
		do
			Result := a_style_element.is_sort
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
				variant
					attribute_collection.number_of_attributes + 1 - a_cursor.index				
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
			check_sort_comes_first (False)
			if select_expression.is_error then
				report_compile_error (select_expression.error_value)
			else
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", select_expression)
				select_expression := l_replacement.item
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			l_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			l_sorted_sequence: XM_XPATH_EXPRESSION
			l_content: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_sorted_sequence := select_expression
			assemble_sort_keys
			if not any_compile_errors then
				l_sort_key_list := sort_keys
				if l_sort_key_list.count > 0 then
					create {XM_XSLT_SORT_EXPRESSION} l_sorted_sequence.make (select_expression, l_sort_key_list)
					create l_replacement.make (Void)
					l_sorted_sequence.check_static_type (l_replacement, static_context, any_item)
					l_sorted_sequence := l_replacement.item
					l_replacement.put (Void)
					l_sorted_sequence.optimize (l_replacement, static_context, any_item)
					l_sorted_sequence := l_replacement.item
				end
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				l_content := last_generated_expression
				if l_content = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
				end
				create {XM_XSLT_COMPILED_FOR_EACH} last_generated_expression.make (an_executable, l_sorted_sequence, l_content)
			end
		end

feature -- Conversion
	
	is_for_each: BOOLEAN is
			-- Is `Current' an xsl:for-each?
		do
			Result := True
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Select expression


end
