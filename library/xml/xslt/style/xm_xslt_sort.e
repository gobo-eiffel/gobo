indexing

	description:

		"xsl:sort element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

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
				an_expanded_name := document.name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)
					a_select_attribute.left_adjust
					a_select_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Order_attribute) then
					an_order_attribute := attribute_value_by_index (a_cursor.index)
					an_order_attribute.left_adjust
					an_order_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Data_type_attribute) then
					a_data_type_attribute := attribute_value_by_index (a_cursor.index)
					a_data_type_attribute.left_adjust
					a_data_type_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Case_order_attribute) then
					a_case_order_attribute := attribute_value_by_index (a_cursor.index)
					a_case_order_attribute.left_adjust
					a_case_order_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Lang_attribute) then
					a_lang_attribute := attribute_value_by_index (a_cursor.index)
					a_lang_attribute.left_adjust
					a_lang_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
					a_collation_attribute := attribute_value_by_index (a_cursor.index)
					a_collation_attribute.left_adjust
					a_collation_attribute.right_adjust					
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
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
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
			else
				create {XM_XPATH_CONTEXT_ITEM_EXPRESSION} select_expression.make
			end
			if an_order_attribute /= Void then
				generate_attribute_value_template (an_order_attribute, static_context)
				order := last_generated_expression
			else
				create {XM_XPATH_STRING_VALUE} order.make ("ascending")
			end
			if a_case_order_attribute /= Void then
				generate_attribute_value_template (a_case_order_attribute, static_context)
				case_order := last_generated_expression
			else
				create {XM_XPATH_STRING_VALUE} case_order.make ("#default") -- TODO - check this out - what about validating?  ditto order
			end			
			if a_data_type_attribute /= Void then
				generate_attribute_value_template (a_data_type_attribute, static_context)
				data_type := last_generated_expression
			else
				create {XM_XPATH_EMPTY_SEQUENCE} data_type.make
			end
			if a_lang_attribute = Void then
				create {XM_XPATH_STRING_VALUE} language.make ("") -- TODO
			else
				generate_attribute_value_template (a_lang_attribute, static_context)
				language := last_generated_expression
			end
			if a_collation_attribute /= Void then
				generate_attribute_value_template (a_collation_attribute, static_context)
				collation_name := last_generated_expression
			end
		end

end
