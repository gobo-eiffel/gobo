indexing

	description:

		"xsl:value-of element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_VALUE_OF

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate, returned_item_type
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_disable_attribute, a_separator_attribute: STRING
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
					STRING_.left_adjust (a_select_attribute)
					STRING_.left_adjust (a_select_attribute)
				elseif STRING_.same_string (an_expanded_name, Disable_output_escaping_attribute) then
					a_disable_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_disable_attribute)
					STRING_.right_adjust (a_disable_attribute)
				elseif STRING_.same_string (an_expanded_name, Separator_attribute) then
					a_separator_attribute := attribute_value_by_index (a_cursor.index)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			end
			if a_disable_attribute /= Void then
				if STRING_.same_string (a_disable_attribute, "no") then
					do_nothing
				elseif STRING_.same_string (a_disable_attribute, "yes") then
					report_compile_error ("This processor does not support setting 'disable-output-escaping' to 'yes'")
				else
					report_compile_error ("The 'disable-output-escaping' attribute must be either 'yes' or 'no' (and this processor only supports 'no'")
				end
			end
			if a_separator_attribute /= Void then
				generate_attribute_value_template (a_separator_attribute, static_context)
				seperator_expression := last_generated_expression
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			Precursor
			check_within_template
			if select_expression /= Void and then not select_expression.is_error then
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			if seperator_expression /= Void and then not seperator_expression.is_error then
				type_check_expression ("separator", seperator_expression)
				if seperator_expression.was_expression_replaced then
					seperator_expression := seperator_expression.replacement_expression
				end
			end			
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_value_of: XM_XSLT_COMPILED_VALUE_OF
		do
			if seperator_expression = Void and then select_expression /= Void
			 and then is_backwards_compatible_processing_enabled then
				if not is_sub_type (select_expression.item_type, type_factory.any_atomic_type) then
					create {XM_XPATH_ATOMIZER_EXPRESSION} select_expression.make (select_expression)
				end
				if select_expression.cardinality_allows_many then
					create {XM_XPATH_FIRST_ITEM_EXPRESSION} select_expression.make (select_expression)
				end
				if not is_sub_type (select_expression.item_type, type_factory.string_type) then
					create {XM_XPATH_ATOMIC_SEQUENCE_CONVERTER} select_expression.make (select_expression, type_factory.string_type)
				end
			elseif seperator_expression = Void then
				if select_expression = Void then
					create {XM_XPATH_STRING_VALUE} seperator_expression.make ("")
				else
					create {XM_XPATH_STRING_VALUE} seperator_expression.make (" ")
				end
			end
			create a_value_of.make (an_executable, select_expression)
			compile_content (an_executable, a_value_of)
			a_value_of.set_separator_expression (seperator_expression)
			last_generated_instruction := a_value_of
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

	seperator_expression: XM_XPATH_EXPRESSION
			-- String used to separate adjacent items in the output sequence

end
