note

	description:

		"xsl:sort element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor, is_sort, is_non_white_following_sibling
		end

	XM_XPATH_ROLE

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	is_non_white_following_sibling: BOOLEAN
			-- Is `Current' such that an immediate preceding-sibling all-whitspace text node should be stripped in xslt stylesheets?
		do
			Result := True
		end

	sort_key_definition: detachable XM_XSLT_SORT_KEY_DEFINITION
			-- Sort key

	stable_attribute_value: detachable XM_XPATH_EXPRESSION
			-- Optional value of stable attribute

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name, l_select_attribute, l_order_attribute, l_lang_attribute,
			l_data_type_attribute, l_case_order_attribute, l_collation_attribute, l_stable_attribute: detachable STRING
		do
			if attached attribute_collection as l_attribute_collection then
				from
					l_cursor := l_attribute_collection.name_code_cursor
					l_cursor.start
				until
					l_cursor.after or any_compile_errors
				loop
					l_name_code := l_cursor.item
					l_expanded_name := shared_name_pool.expanded_name_from_name_code (l_name_code)
					if STRING_.same_string (l_expanded_name, Select_attribute) then
						l_select_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_select_attribute)
						STRING_.right_adjust (l_select_attribute)
					elseif STRING_.same_string (l_expanded_name, Order_attribute) then
						l_order_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_order_attribute)
						STRING_.right_adjust (l_order_attribute)
					elseif STRING_.same_string (l_expanded_name, Data_type_attribute) then
						l_data_type_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_data_type_attribute)
						STRING_.right_adjust (l_data_type_attribute	)
					elseif STRING_.same_string (l_expanded_name, Case_order_attribute) then
						l_case_order_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_case_order_attribute)
						STRING_.right_adjust (l_case_order_attribute	)
					elseif STRING_.same_string (l_expanded_name, Lang_attribute) then
						l_lang_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_lang_attribute)
						STRING_.right_adjust (l_lang_attribute	)
					elseif STRING_.same_string (l_expanded_name, Collation_attribute) then
						l_collation_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_collation_attribute)
						STRING_.right_adjust (l_collation_attribute)
					elseif STRING_.same_string (l_expanded_name, Stable_attribute) then
						l_stable_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_stable_attribute)
						STRING_.right_adjust (l_stable_attribute)
					else
						check_unknown_attribute (l_name_code)
					end
					l_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - l_cursor.index
				end
			end
			prepare_attributes_2 (l_select_attribute, l_order_attribute, l_case_order_attribute,
										 l_data_type_attribute,	l_lang_attribute, l_collation_attribute, l_stable_attribute)
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			if select_expression /= Void then
				if has_child_nodes then
					create l_error.make_from_string ("xsl:sort must be empty when a 'select' attribute is supplied", Xpath_errors_uri, "XTSE1015", Static_error)
					report_compile_error (l_error)
				elseif not attached {XM_XSLT_STYLE_ELEMENT} parent as l_style_element or else
					(not l_style_element.is_for_each and then
					 not l_style_element.is_for_each_group and then
					 not l_style_element.is_perform_sort and then
					 not l_style_element.is_apply_templates)
				 then
					create l_error.make_from_string ("xsl:sort must be child of xsl:apply-templates, xsl:for-each[-group], or xsl:perform-sort", Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (l_error)
				end
			else
				if not has_child_nodes then
					create {XM_XPATH_CONTEXT_ITEM_EXPRESSION} select_expression.make
				end
			end
			if not any_compile_errors then
				validate_2
			end
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_content: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if select_expression = Void then
				compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
				if not attached last_generated_expression as l_last_generated_expression then
					create {XM_XPATH_EMPTY_SEQUENCE} l_content.make
				else
					l_content := l_last_generated_expression
				end
				create l_replacement.make (Void)
				l_content.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
					l_content := l_replacement_item
					check attached sort_key_definition as l_sort_key_definition then
						l_sort_key_definition.set_sort_key (l_content)
					end
				end
			end
			-- TODO: simplify sort key definition
			last_generated_expression := Void
		end

feature -- Conversion

	is_sort: BOOLEAN
			-- Is `Current' an xsl:sort?
		do
			Result := True
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Sort-key-component

	order: detachable XM_XPATH_EXPRESSION
			-- Sort order

	case_order: detachable XM_XPATH_EXPRESSION
			-- Case order

	data_type: detachable XM_XPATH_EXPRESSION
			-- Data type to which sort-key-values will be coerced

	language: detachable XM_XPATH_EXPRESSION
			-- Language

	collation_name: detachable XM_XPATH_EXPRESSION
			-- Name of collation

	prepare_attributes_2 (a_select_attribute, a_order_attribute, a_case_order_attribute,
		a_data_type_attribute,	a_lang_attribute, a_collation_attribute, a_stable_attribute: detachable STRING)
			-- Prepare attributes some more.
			-- TODO: take advantage of stable="no"
		do
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
			if a_order_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_order_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_order then
					order := l_new_order
					if attached l_new_order.error_value as l_error_value then
						check is_error: l_new_order.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				create {XM_XPATH_STRING_VALUE} order.make ("ascending")
			end
			if a_case_order_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_case_order_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_case_order then
					case_order := l_new_case_order
					if attached l_new_case_order.error_value as l_error_value then
						check is_error: l_new_case_order.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				create {XM_XPATH_STRING_VALUE} case_order.make ("#default")
			end
			if a_data_type_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_data_type_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_data_type then
					data_type := l_new_data_type
					if attached l_new_data_type.error_value as l_error_value then
						check is_error: l_new_data_type.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				create {XM_XPATH_EMPTY_SEQUENCE} data_type.make
			end
			if a_lang_attribute = Void then
				create {XM_XPATH_STRING_VALUE} language.make ("")
			else
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_lang_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_language then
					language := l_new_language
					if attached l_new_language.error_value as l_error_value then
						check is_error: l_new_language.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_collation_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_collation_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_collation_name then
					collation_name := l_new_collation_name
					if attached l_new_collation_name.error_value as l_error_value then
						check is_error: l_new_collation_name.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_stable_attribute /= Void then
				if STRING_.same_string (a_stable_attribute, "yes") then
					create {XM_XPATH_STRING_VALUE} stable_attribute_value.make ("yes")
				elseif STRING_.same_string (a_stable_attribute, "no") then
					create {XM_XPATH_STRING_VALUE} stable_attribute_value.make ("no")
				else
					check attached static_context as l_static_context then
						generate_attribute_value_template (a_stable_attribute, l_static_context)
					end
					check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_stable_attribute_value then
						stable_attribute_value := l_new_stable_attribute_value
						if attached l_new_stable_attribute_value.error_value as l_error_value then
							check is_error: l_new_stable_attribute_value.is_error end
							report_compile_error (l_error_value)
						end
					end
				end
			end
		end

	validate_2
			-- Perform further validation.
		local
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_role: XM_XPATH_ROLE_LOCATOR
			l_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if attached select_expression as l_select_expression then
				type_check_expression (l_replacement, "select", l_select_expression)
				check attached l_replacement.item as l_new_select_expression then
					select_expression := l_new_select_expression
					if attached l_new_select_expression.error_value as l_error_value then
						check is_error: l_new_select_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached order as l_order then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "order", l_order)
				check attached l_replacement.item as l_new_order then
					order := l_new_order
					if attached l_new_order.error_value as l_error_value then
						check is_error: l_new_order.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached case_order as l_case_order then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "case-order", l_case_order)
				check attached l_replacement.item as l_new_case_order then
					case_order := l_new_case_order
					if attached l_new_case_order.error_value as l_error_value then
						check is_error: l_new_case_order.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached language as l_language then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "lang", l_language)
				check attached l_replacement.item as l_new_language then
					language := l_new_language
					if attached l_new_language.error_value as l_error_value then
						check is_error: l_new_language.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached data_type as l_data_type then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "data-type", l_data_type)
				check attached l_replacement.item as l_new_data_type then
					data_type := l_new_data_type
					if attached l_new_data_type.error_value as l_error_value then
						check is_error: l_new_data_type.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached collation_name as l_collation_name then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "collation", l_collation_name)
				check attached l_replacement.item as l_new_collation_name then
					collation_name := l_new_collation_name
					if attached l_new_collation_name.error_value as l_error_value then
						check is_error: l_new_collation_name.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached stable_attribute_value as l_stable_attribute_value then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "stable", l_stable_attribute_value)
				check attached l_replacement.item as l_new_stable_attribute_value then
					stable_attribute_value := l_new_stable_attribute_value
					if attached l_new_stable_attribute_value.error_value as l_error_value then
						check is_error: l_new_stable_attribute_value.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if attached select_expression as l_select_expression then
				create l_role.make (Instruction_role, "xsl:sort/select", 1, Xpath_errors_uri, "XPTY0004")
				create l_type_checker
				create l_atomic_sequence.make_atomic_sequence
				l_type_checker.static_type_check (static_context, l_select_expression, l_atomic_sequence, False, l_role)
				if l_type_checker.is_static_type_check_error	then
					check attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					check attached l_type_checker.checked_expression as l_checked_expression then
						select_expression := l_checked_expression
						create sort_key_definition.make (l_checked_expression, order, case_order, language, data_type, collation_name)
					end
				end
			else
				create sort_key_definition.make (create {XM_XPATH_EMPTY_SEQUENCE}.make, order, case_order, language, data_type, collation_name)
			end
		end

end
