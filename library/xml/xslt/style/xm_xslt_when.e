indexing

	description:

		"xsl:when element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_WHEN

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
			an_expanded_name, a_test_attribute: STRING
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
				if STRING_.same_string (an_expanded_name, Test_attribute) then
					a_test_attribute := attribute_value_by_index (a_cursor.index)
					a_test_attribute.left_adjust
					a_test_attribute.right_adjust
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_test_attribute /= Void then
				generate_expression (a_test_attribute)
				test_expression := last_generated_expression
			else
				report_absence ("test")
			end
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

	test_expression: XM_XPATH_EXPRESSION
			-- Test expression

end
