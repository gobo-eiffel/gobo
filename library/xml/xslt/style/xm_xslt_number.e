indexing

	description:

		"xsl:number element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
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
			an_expanded_name, a_select_attribute, a_value_attribute: STRING
			a_count_attribute, a_from_attribute, a_level_attribute: STRING
			a_lang_attribute, a_letter_value_attribute, a_grouping_size_attribute: STRING
			a_grouping_separator_attribute, an_ordinal_attribute, a_format_attribute: STRING
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
				elseif STRING_.same_string (an_expanded_name, Value_attribute) then
					a_value_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Count_attribute) then
					a_count_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, From_attribute) then
					a_from_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Level_attribute) then
					a_level_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Lang_attribute) then
					a_lang_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Letter_value_attribute) then
					a_letter_value_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Grouping_size_attribute) then
					a_grouping_size_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Grouping_separator_attribute) then
					a_grouping_separator_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Ordinal_attribute) then
					an_ordinal_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Format_attribute) then
					a_format_attribute := attribute_value_by_index (a_cursor.index)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute,
										 a_count_attribute,a_lang_attribute, a_from_attribute,
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute,
										 a_grouping_separator_attribute, a_format_attribute)
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

	Single_level, Multiple_levels, Any_level, Simple_numbering: INTEGER is unique
			-- Level-numbering values

	level: INTEGER

	has_variables_in_patterns: BOOLEAN
			-- Do any supplied patterns include variable references?

	select_expression: XM_XPATH_EXPRESSION
			-- Selected node

	value_expression: XM_XPATH_EXPRESSION
			-- Supplied value

	count_pattern: XM_XSLT_PATTERN
			-- Nodes which are to be counted 

	from_pattern: XM_XSLT_PATTERN
			-- Node from which counted is to be started

	format: XM_XPATH_EXPRESSION
			-- Format for formatted number

	grouping_size, grouping_separator: XM_XPATH_EXPRESSION
			-- Grouping parameters

	language: XM_XPATH_EXPRESSION
			-- Language

	letter_value: XM_XPATH_EXPRESSION
			-- Letter value

	ordinal: XM_XPATH_EXPRESSION
			-- Ordinal marker

	prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute: STRING;
										 a_count_attribute,a_lang_attribute, a_from_attribute: STRING;
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute: STRING;
										 a_grouping_separator_attribute, a_format_attribute: STRING) is
			-- Prepare attributes some more.
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			end
			if a_value_attribute /= Void then
				generate_expression (a_value_attribute)
				value_expression := last_generated_expression
				if a_select_attribute /= Void then
					report_compile_error ("The select attribute and value attribute must not both be present")
				elseif a_count_attribute /= Void then
					report_compile_error ("The count attribute and value attribute must not both be present")
				elseif a_from_attribute /= Void then
					report_compile_error ("The from attribute and value attribute must not both be present")
				elseif a_level_attribute /= Void then
					report_compile_error ("The level attribute and value attribute must not both be present")
				end
			end
			if a_count_attribute /= Void then
				generate_pattern (a_count_attribute)
				count_pattern := last_generated_pattern
				if a_count_attribute.index_of ('$', 1) > 0 then -- Crude, and might produce false positives, but good enough
					has_variables_in_patterns := True
				end
			end
			if a_from_attribute /= Void then
				generate_pattern (a_from_attribute)
				from_pattern := last_generated_pattern
				if a_from_attribute.index_of ('$', 1) > 0 then -- Crude, and might produce false positives, but good enough
					has_variables_in_patterns := True
				end
			end
			if a_level_attribute = Void then
				level := Simple_numbering
			elseif STRING_.same_string (a_level_attribute, "single") then
				level := Single_level
			elseif STRING_.same_string (a_level_attribute, "multiple") then
				level := Multiple_levels
			elseif STRING_.same_string (a_level_attribute, "any") then
				level := Any_level				
			else
				report_compile_error ("Invalid value for level attribute")
			end
			if level = Single_level and then from_pattern = Void and then count_pattern = Void then
				level := Simple_numbering
			end
			prepare_attributes_3 (an_ordinal_attribute, a_lang_attribute, a_letter_value_attribute,
										  a_grouping_size_attribute, a_grouping_separator_attribute, a_format_attribute)			
		end

	prepare_attributes_3 (an_ordinal_attribute, a_lang_attribute, a_letter_value_attribute: STRING;
		a_grouping_size_attribute, a_grouping_separator_attribute, a_format_attribute: STRING) is
			-- Prepare attributes even more.
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			if a_format_attribute /= Void then
				generate_attribute_value_template (a_format_attribute, static_context)
				format := last_generated_expression
				todo ("prepare_attributes_3 - number formatter", True)
			else
				todo ("prepare_attributes_3 - number formatter", True)
			end
			if a_grouping_size_attribute /= Void and then a_grouping_separator_attribute /= Void then

				-- the spec says that if only one is specified, it is ignored

				generate_attribute_value_template (a_grouping_size_attribute, static_context)
				grouping_size :=  last_generated_expression
				generate_attribute_value_template (a_grouping_separator_attribute, static_context)
				grouping_separator :=  last_generated_expression
			end
			if a_lang_attribute = Void then
				todo ("prepare_attributes_3 - numberer", True)
			else
				generate_attribute_value_template (a_lang_attribute, static_context)
				language := last_generated_expression
				a_string_value ?= language
				todo ("prepare_attributes_3 - numberer", True)
			end
			if a_letter_value_attribute /= Void then
				generate_attribute_value_template (a_letter_value_attribute, static_context)
				letter_value := last_generated_expression
			end
			if an_ordinal_attribute /= Void then
				generate_attribute_value_template (an_ordinal_attribute, static_context)
				ordinal := last_generated_expression
			end
		end

invariant

	instruction: is_instruction = True
	level: level > 0 implies level >= Single_level and then level <= Simple_numbering

end
