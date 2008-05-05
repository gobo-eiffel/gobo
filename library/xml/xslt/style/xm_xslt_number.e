indexing

	description:

		"xsl:number element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBER

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type
		end

	ST_XSLT_NUMBER_ROUTINES

	XM_XPATH_ROLE

create {XM_XSLT_NODE_FACTORY}

	make_style_element

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
			if attribute_collection /= Void then
				from
					a_cursor := attribute_collection.name_code_cursor
					a_cursor.start
				variant
					attribute_collection.number_of_attributes + 1 - a_cursor.index
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
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
			end
			prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute,
										 a_count_attribute,a_lang_attribute, a_from_attribute,
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute,
										 a_grouping_separator_attribute, a_format_attribute)
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_single_node: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			check_within_template
			check_empty
			create l_replacement.make (Void)
			if select_expression /= Void then
				type_check_expression (l_replacement, "select", select_expression)
				select_expression := l_replacement.item
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:number/select", 1, Xpath_errors_uri, "XTTE1000")
				create l_single_node.make_single_node
				l_type_checker.static_type_check (static_context, select_expression, l_single_node, False, l_role)
				if l_type_checker.is_static_type_check_error	then
					report_compile_error (l_type_checker.static_type_check_error)
				else
					select_expression := l_type_checker.checked_expression
				end
			end
			if value_expression /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "value", value_expression)
				value_expression := l_replacement.item
			end
			if format /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "format", format)
				format := l_replacement.item
			end
			if grouping_size /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "grouping-size", grouping_size)
				grouping_size := l_replacement.item
			end
			if grouping_separator /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "grouping-separator", grouping_separator)
				grouping_separator := l_replacement.item
			end
			if letter_value /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "letter-value", letter_value)
				letter_value := l_replacement.item
			end
			if ordinal /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "ordinal", ordinal)
					ordinal := l_replacement.item
			end
			if language /= Void then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "lang", language)
				language := l_replacement.item
			end
			if from_pattern /= Void then
				type_check_pattern ("from", from_pattern)
			end
			if count_pattern /= Void then
				type_check_pattern ("count", count_pattern)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			l_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_hash_code: INTEGER
		do
			l_compiler := stylesheet_compiler
			l_compiler.increment_counter
			l_hash_code := l_compiler.counter
			create {XM_XSLT_COMPILED_NUMBER} last_generated_expression.make (an_executable, select_expression,
																								  level, l_hash_code, count_pattern,
																								  from_pattern,
																								  value_expression, format,
																								  grouping_size,
																								  grouping_separator,
																								  letter_value, ordinal,
																								  language, formatter,
																								  numberer, has_variables_in_patterns, static_context.is_backwards_compatible_mode)
			-- TODO: consider wrapping this in a value-of
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

	level: INTEGER
			-- Level

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

	formatter: XM_XSLT_NUMBER_FORMATTER
			-- Formatter

	numberer: ST_XSLT_NUMBERER
			-- Numberer

	prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute: STRING;
										 a_count_attribute,a_lang_attribute, a_from_attribute: STRING;
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute: STRING;
										 a_grouping_separator_attribute, a_format_attribute: STRING) is
			-- Prepare attributes some more.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			if a_value_attribute /= Void then
				generate_expression (a_value_attribute)
				value_expression := last_generated_expression
				if value_expression.is_error then
					report_compile_error (value_expression.error_value)
				end
				if a_select_attribute /= Void then
					create an_error.make_from_string ("The select attribute and value attribute must not both be present", Xpath_errors_uri, "XTSE0975", Static_error)
					report_compile_error (an_error)
				elseif a_count_attribute /= Void then
					create an_error.make_from_string ("The count attribute and value attribute must not both be present", Xpath_errors_uri, "XTSE0975", Static_error)
					report_compile_error (an_error)
				elseif a_from_attribute /= Void then
					create an_error.make_from_string ("The from attribute and value attribute must not both be present", Xpath_errors_uri, "XTSE0975", Static_error)
					report_compile_error (an_error)
				elseif a_level_attribute /= Void then
					create an_error.make_from_string ("The level attribute and value attribute must not both be present", Xpath_errors_uri, "XTSE0975", Static_error)
					report_compile_error (an_error)
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
				level := Single_level
			elseif STRING_.same_string (a_level_attribute, "single") then
				level := Single_level
			elseif STRING_.same_string (a_level_attribute, "multiple") then
				level := Multiple_levels
			elseif STRING_.same_string (a_level_attribute, "any") then
				level := Any_level
			else
				create an_error.make_from_string ("Invalid value for level attribute", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
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
		do
			if a_format_attribute /= Void then
				generate_attribute_value_template (a_format_attribute, static_context)
				format := last_generated_expression
				if format.is_string_value then
					create formatter.make (format.as_string_value.string_value)
				else
					-- We must allocate the formatter at run time
				end
			else
				create formatter.make ("1") -- default
			end
			if a_grouping_size_attribute /= Void and then a_grouping_separator_attribute /= Void then

				-- the spec says that if only one is specified, it is ignored

				generate_attribute_value_template (a_grouping_size_attribute, static_context)
				grouping_size :=  last_generated_expression
				generate_attribute_value_template (a_grouping_separator_attribute, static_context)
				grouping_separator :=  last_generated_expression
			end
			if a_lang_attribute = Void then
				numberer := selected_numberer ("en")
			else
				generate_attribute_value_template (a_lang_attribute, static_context)
				language := last_generated_expression
				if language.is_string_value then
					numberer := selected_numberer (language.as_string_value.string_value)
					if numberer = Void then
						numberer := selected_numberer ("en")
					end
				else
					-- we allocate the numberer at run-time
				end
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

	level: level > 0 implies level >= Single_level and then level <= Simple_numbering

end
