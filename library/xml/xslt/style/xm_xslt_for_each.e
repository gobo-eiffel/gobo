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
		do
			check_within_template
			check_sort_comes_first (False)
			if select_expression.is_error then
				report_compile_error (select_expression.error_value)
			else
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			a_sorted_sequence: XM_XPATH_EXPRESSION
			a_content: XM_XPATH_EXPRESSION
		do
			a_sorted_sequence := select_expression
			a_sort_key_list := sort_keys
			if a_sort_key_list.count > 0 then
				create {XM_XSLT_SORT_EXPRESSION} a_sorted_sequence.make (select_expression, a_sort_key_list)
				a_sorted_sequence.check_static_type (static_context, any_item)
				if a_sorted_sequence.was_expression_replaced then a_sorted_sequence := a_sorted_sequence.replacement_expression end
				a_sorted_sequence.optimize (static_context, any_item)
				if a_sorted_sequence.was_expression_replaced then a_sorted_sequence := a_sorted_sequence.replacement_expression end
			end
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
			a_content := last_generated_expression
			if a_content = Void then create {XM_XPATH_EMPTY_SEQUENCE} a_content.make end
			if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
			create {XM_XSLT_COMPILED_FOR_EACH} last_generated_expression.make (an_executable, a_sorted_sequence, a_content)
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
