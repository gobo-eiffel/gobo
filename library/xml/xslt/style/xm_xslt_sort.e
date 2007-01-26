indexing

	description:

		"xsl:sort element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor, is_sort
		end

	XM_XPATH_ROLE

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	sort_key_definition: XM_XSLT_SORT_KEY_DEFINITION
			-- Sort key

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, an_order_attribute, a_lang_attribute,
			a_data_type_attribute, a_case_order_attribute, a_collation_attribute: STRING
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
				elseif STRING_.same_string (an_expanded_name, Order_attribute) then
					an_order_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (an_order_attribute)
					STRING_.right_adjust (an_order_attribute)
				elseif STRING_.same_string (an_expanded_name, Data_type_attribute) then
					a_data_type_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_data_type_attribute)
					STRING_.right_adjust (a_data_type_attribute	)
				elseif STRING_.same_string (an_expanded_name, Case_order_attribute) then
					a_case_order_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_case_order_attribute)
					STRING_.right_adjust (a_case_order_attribute	)
				elseif STRING_.same_string (an_expanded_name, Lang_attribute) then
					a_lang_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_lang_attribute)
					STRING_.right_adjust (a_lang_attribute	)
				elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
					a_collation_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_collation_attribute)
					STRING_.right_adjust (a_collation_attribute)
				elseif STRING_.same_string (an_expanded_name, Stable_attribute) then
					-- Ignored - default is yes
					-- TODO: take advantage of stable="no"
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			prepare_attributes_2 (a_select_attribute, an_order_attribute, a_case_order_attribute,
										 a_data_type_attribute,	a_lang_attribute, a_collation_attribute)
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_style_element: XM_XSLT_STYLE_ELEMENT
			an_error: XM_XPATH_ERROR_VALUE
		do
			if select_expression /= Void then
				if has_child_nodes then
					create an_error.make_from_string ("xsl:sort must be empty when a 'select' attribute is supplied", Xpath_errors_uri, "XTSE0015", Static_error)
				else
					a_style_element ?= parent
					if a_style_element = Void or else
						(not a_style_element.is_for_each and then
						 not a_style_element.is_for_each_group and then
						 not a_style_element.is_perform_sort and then
						 not a_style_element.is_apply_templates)
					 then
						create an_error.make_from_string ("xsl:sort must be child of xsl:apply-templates, xsl:for-each[-group], or xsl:perform-sort", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
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

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_content: XM_XPATH_EXPRESSION
		do
			if select_expression = Void then
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				if last_generated_expression = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} a_content.make
				else
					a_content := last_generated_expression
				end
				a_content.simplify
				if a_content.was_expression_replaced then a_content := a_content.replacement_expression end
				create sort_key_definition.make (a_content, order, case_order, language, data_type, collation_name)
			end
			-- TODO: simplify sort key definition
			last_generated_expression := Void
		end

feature -- Conversion

	is_sort: BOOLEAN is
			-- Is `Current' an xsl:sort?
		do
			Result := True
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Sort-key-component

	order: XM_XPATH_EXPRESSION
			-- Sort order

	case_order: XM_XPATH_EXPRESSION
			-- Case order
	
	data_type: XM_XPATH_EXPRESSION
			-- Data type to which sort-key-values will be coerced

	language: XM_XPATH_EXPRESSION
			-- Language

	collation_name: XM_XPATH_EXPRESSION
			-- Name of collation

	prepare_attributes_2 (a_select_attribute, an_order_attribute, a_case_order_attribute,
								 a_data_type_attribute,	a_lang_attribute, a_collation_attribute: STRING) is
			-- Prepare attributes some more.
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			if an_order_attribute /= Void then
				generate_attribute_value_template (an_order_attribute, static_context)
				order := last_generated_expression
				if order.is_error then
					report_compile_error (order.error_value)
				end
			else
				create {XM_XPATH_STRING_VALUE} order.make ("ascending")
			end
			if a_case_order_attribute /= Void then
				generate_attribute_value_template (a_case_order_attribute, static_context)
				case_order := last_generated_expression
				if case_order.is_error then
					report_compile_error (case_order.error_value)
				end				
			else
				create {XM_XPATH_STRING_VALUE} case_order.make ("#default") -- TODO - check this out - what about validating?  ditto order
			end			
			if a_data_type_attribute /= Void then
				generate_attribute_value_template (a_data_type_attribute, static_context)
				data_type := last_generated_expression
				if data_type.is_error then
					report_compile_error (data_type.error_value)
				end
			else
				create {XM_XPATH_EMPTY_SEQUENCE} data_type.make
			end
			if a_lang_attribute = Void then
				create {XM_XPATH_STRING_VALUE} language.make ("")
			else
				generate_attribute_value_template (a_lang_attribute, static_context)
				language := last_generated_expression
				if language.is_error then
					report_compile_error (language.error_value)
				end
			end
			if a_collation_attribute /= Void then
				generate_attribute_value_template (a_collation_attribute, static_context)
				collation_name := last_generated_expression
				if collation_name.is_error then
					report_compile_error (collation_name.error_value)
				end
			end
		end

	validate_2 is
			-- Perform further validation.
		local
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			an_atomic_sequence: XM_XPATH_SEQUENCE_TYPE
		do
			if select_expression /= Void then
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			if order /= Void then
				type_check_expression ("order", order)
				if order.was_expression_replaced then
					order := order.replacement_expression
				end
			end
			if case_order /= Void then
				type_check_expression ("case-order", case_order)
				if case_order.was_expression_replaced then
					case_order := case_order.replacement_expression
				end
			end
			if language /= Void then
				type_check_expression ("lang", language)
				if language.was_expression_replaced then
					language := language.replacement_expression
				end
			end
			if data_type /= Void then
				type_check_expression ("data-type", data_type)
				if data_type.was_expression_replaced then
					data_type := data_type.replacement_expression
				end
			end
			if select_expression /= Void then
				create a_role.make (Instruction_role, "xsl:sort/select", 1, Xpath_errors_uri, "XPTY0004")
				create a_type_checker
				create an_atomic_sequence.make_atomic_sequence
				a_type_checker.static_type_check (static_context, select_expression, an_atomic_sequence, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
				else
					select_expression := a_type_checker.checked_expression
					create sort_key_definition.make (select_expression, order, case_order, language, data_type, collation_name)
				end
			end
		end

end
