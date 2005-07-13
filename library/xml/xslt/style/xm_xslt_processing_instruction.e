indexing

	description:

		"xsl:processing-instruction element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PROCESSING_INSTRUCTION

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	name: XM_XPATH_EXPRESSION
			-- Name of processing-instruction

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_select_attribute: STRING
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
				elseif STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_name_attribute)
					STRING_.right_adjust (a_name_attribute)
				end				
				a_cursor.forth
			end

			if a_name_attribute = Void then
				report_absence ("name")
			else
				generate_attribute_value_template (a_name_attribute, static_context)
				name := last_generated_expression
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			type_check_expression ("select", select_expression)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			type_check_expression ("name", name)
			if name.was_expression_replaced then
				name := name.replacement_expression
			end				
			Precursor
		end
			
	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_pi: XM_XSLT_COMPILED_PROCESSING_INSTRUCTION
			a_separator: STRING
		do
			create a_pi.make (an_executable, name)
			if select_expression.is_string_value then
				a_string_value := select_expression.as_string_value
				a_separator := " "
			else
				a_separator := ""
			end
			create a_string_value.make (a_separator)
			compile_content (an_executable, a_pi, a_string_value)
			last_generated_expression := a_pi
		end

end
