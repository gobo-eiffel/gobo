indexing

	description:

		"xsl:for-each-group element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FOR_EACH_GROUP

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_group_by_attribute, a_group_adjacent_attribute,
			a_group_starting_with_attribute, a_group_ending_with_attribute, a_collation_attribute: STRING
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
				elseif STRING_.same_string (an_expanded_name, Group_by_attribute) then
					a_group_by_attribute := attribute_value_by_index (a_cursor.index)
					a_group_by_attribute.left_adjust
					a_group_by_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Group_adjacent_attribute) then
					a_group_adjacent_attribute := attribute_value_by_index (a_cursor.index)
					a_group_adjacent_attribute.left_adjust
					a_group_adjacent_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Group_starting_with_attribute) then
					a_group_starting_with_attribute := attribute_value_by_index (a_cursor.index)
					a_group_starting_with_attribute.left_adjust
					a_group_starting_with_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Group_ending_with_attribute) then
					a_group_ending_with_attribute := attribute_value_by_index (a_cursor.index)
					a_group_ending_with_attribute.left_adjust
					a_group_ending_with_attribute.right_adjust					
				elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
					a_collation_attribute := attribute_value_by_index (a_cursor.index)
					a_collation_attribute.left_adjust
					a_collation_attribute.right_adjust					
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			prepare_attributes_2 (a_select_attribute, a_group_by_attribute, a_group_starting_with_attribute,
										 a_group_adjacent_attribute,	a_group_ending_with_attribute, a_collation_attribute)
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
			-- Population selector
	
	collation_name: XM_XPATH_EXPRESSION
			-- Name of collation

	group_by: XM_XPATH_EXPRESSION
			-- Group-by expression

	group_adjacent: XM_XPATH_EXPRESSION
			-- Group-ajacent expression

	group_starting_with: XM_XSLT_PATTERN
			-- Group-starting-with pattern

	group_ending_with: XM_XSLT_PATTERN
			-- Group-ending-with pattern
	
	prepare_attributes_2 (a_select_attribute, a_group_by_attribute, a_group_starting_with_attribute,
								 a_group_adjacent_attribute,	a_group_ending_with_attribute, a_collation_attribute: STRING) is
			-- Prepare attributes some more.
		local
			count_of_grouping_attributes: INTEGER
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			else
				report_absence ("select")
			end
			if a_collation_attribute /= Void then
				generate_attribute_value_template (a_collation_attribute, static_context)
				collation_name := last_generated_expression
			end

			if a_group_by_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_expression (a_group_by_attribute)
				group_by := last_generated_expression 
			end
			if a_group_adjacent_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_expression (a_group_adjacent_attribute)
				group_adjacent := last_generated_expression 
			end
			if a_group_starting_with_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_pattern (a_group_starting_with_attribute)
				group_starting_with := last_generated_pattern
			end
			if a_group_ending_with_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_pattern (a_group_ending_with_attribute)
				group_ending_with := last_generated_pattern
			end

			if count_of_grouping_attributes /= 1 then
				report_compile_error ("Exactly one of the attributes group-by, group-adjacent, group-starting-with, and group-ending-with must be specified")
			end
			if a_collation_attribute /= Void and then a_group_by_attribute = Void and then a_group_adjacent_attribute = Void then
				report_compile_error ("A collation may be specified only if group-by or group-adjacent is specified")
			end
		end

invariant

	instruction: is_instruction = True

end
