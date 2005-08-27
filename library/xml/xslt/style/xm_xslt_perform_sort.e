indexing

	description:

		"xsl:perform-sort element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PERFORM_SORT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, is_permitted_child,
			may_contain_sequence_constructor
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
				a_cursor.after
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
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_sort: XM_XSLT_SORT
			a_fallback: XM_XSLT_FALLBACK
			finished: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_within_template
			check_sort_comes_first (True)
			if select_expression /= Void then
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
				if has_child_nodes then
					from
						a_child_iterator := new_axis_iterator (Child_axis)
						a_child_iterator.start
					until
						finished or else a_child_iterator.after
					loop
						a_sort ?= a_child_iterator.item
						if a_sort = Void then

							-- may be a whitespace text node or xsl:fallback

							if a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
								-- do nothing
							else
								a_fallback ?= a_child_iterator.item
								if a_fallback = Void then
									create an_error.make_from_string (STRING_.concat (node_name, " may only have xsl:sort children or insignificant whaitespace"), Xpath_errors_uri, "XTSE1040", Static_error)
									report_compile_error (an_error)
									finished := True
								end
							end
						end
						a_child_iterator.forth
					end
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
			create {XM_XSLT_SORT_EXPRESSION} a_sorted_sequence.make (select_expression, a_sort_key_list)
			a_sorted_sequence.check_static_type (static_context, any_item)
			if a_sorted_sequence.was_expression_replaced then a_sorted_sequence := a_sorted_sequence.replacement_expression end
			a_sorted_sequence.optimize (static_context, any_item)
			if a_sorted_sequence.was_expression_replaced then a_sorted_sequence := a_sorted_sequence.replacement_expression end
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
			a_content := last_generated_expression
			if a_content = Void then create {XM_XPATH_EMPTY_SEQUENCE} a_content.make end 
			a_content.simplify
			if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
			create {XM_XSLT_SORT_EXPRESSION} last_generated_expression.make (a_content, a_sort_key_list)
			last_generated_expression.check_static_type (static_context, any_item)
			if last_generated_expression.was_expression_replaced then last_generated_expression := last_generated_expression.replacement_expression end
			last_generated_expression.optimize (static_context, any_item)
			if last_generated_expression.was_expression_replaced then last_generated_expression := last_generated_expression.replacement_expression end
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
