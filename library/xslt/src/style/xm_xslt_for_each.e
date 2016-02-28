note

	description:

		"xsl:for-each element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
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

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN
			-- Is `a_style_element' a permitted child of `Current'?
		do
			Result := a_style_element.is_sort
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
			check_sort_comes_first (False)
			check attached select_expression as l_select_expression then
				if attached l_select_expression.error_value as l_error_value then
					check is_error: l_select_expression.is_error end
					report_compile_error (l_error_value)
				else
					create l_replacement.make (Void)
					type_check_expression (l_replacement, "select", l_select_expression)
					select_expression := l_replacement.item
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_sort_key_list: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			l_sorted_sequence: XM_XPATH_EXPRESSION
			l_content: detachable XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached select_expression as l_select_expression then
				l_sorted_sequence := l_select_expression
				assemble_sort_keys
				if not any_compile_errors then
					check attached sort_keys as l_sort_keys then
						l_sort_key_list := l_sort_keys
					end
					if l_sort_key_list.count > 0 then
						create {XM_XSLT_SORT_EXPRESSION} l_sorted_sequence.make (l_select_expression, l_sort_key_list)
						create l_replacement.make (Void)
						check attached static_context as l_static_context then
							l_sorted_sequence.check_static_type (l_replacement, l_static_context, any_item)
							check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
								l_sorted_sequence := l_replacement_item
							end
							l_replacement.put (Void)
							l_sorted_sequence.optimize (l_replacement, l_static_context, any_item)
							check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
								l_sorted_sequence := l_replacement_item
							end
						end
					end
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					l_content := last_generated_expression
					if l_content = Void then
						create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
					end
					create {XM_XSLT_COMPILED_FOR_EACH} last_generated_expression.make (an_executable, l_sorted_sequence, l_content)
				end
			end
		end

feature -- Conversion

	is_for_each: BOOLEAN
			-- Is `Current' an xsl:for-each?
		do
			Result := True
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Select expression


end
