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
					a_select_attribute.left_adjust
					a_select_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Disable_output_escaping_attribute) then
					a_disable_attribute := attribute_value_by_index (a_cursor.index)
					a_disable_attribute.left_adjust
					a_disable_attribute.right_adjust
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
				separator := last_generated_expression
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			Precursor
			todo ("validate", False)
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			-- compile_content
			todo ("compile", False)
		end

feature {NONE} -- Implementation

	separator: XM_XPATH_EXPRESSION
			-- String used to separate adjacent items in the output sequence

end
