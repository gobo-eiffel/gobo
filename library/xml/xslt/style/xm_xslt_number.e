note

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

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_value_attribute: detachable STRING
			a_count_attribute, a_from_attribute, a_level_attribute: detachable STRING
			a_lang_attribute, a_letter_value_attribute, a_grouping_size_attribute: detachable STRING
			a_grouping_separator_attribute, an_ordinal_attribute, a_format_attribute: detachable STRING
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
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
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute,
										 a_count_attribute,a_lang_attribute, a_from_attribute,
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute,
										 a_grouping_separator_attribute, a_format_attribute)
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_single_node: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			check_empty
			create l_replacement.make (Void)
			if attached select_expression as l_select_expression then
				type_check_expression (l_replacement, "select", l_select_expression)
				select_expression := l_replacement.item
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:number/select", 1, Xpath_errors_uri, "XTTE1000")
				create l_single_node.make_single_node
				check attached select_expression as l_select_expression_2 then
					l_type_checker.static_type_check (static_context, l_select_expression_2, l_single_node, False, l_role)
				end
				if l_type_checker.is_static_type_check_error	then
					check attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					select_expression := l_type_checker.checked_expression
				end
			end
			if attached value_expression as l_value_expression then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "value", l_value_expression)
				value_expression := l_replacement.item
			end
			if attached format as l_format then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "format", l_format)
				format := l_replacement.item
			end
			if attached grouping_size as l_grouping_size then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "grouping-size", l_grouping_size)
				grouping_size := l_replacement.item
			end
			if attached grouping_separator as l_grouping_separator then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "grouping-separator", l_grouping_separator)
				grouping_separator := l_replacement.item
			end
			if attached letter_value as l_letter_value then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "letter-value", l_letter_value)
				letter_value := l_replacement.item
			end
			if attached ordinal as l_ordinal then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "ordinal", l_ordinal)
					ordinal := l_replacement.item
			end
			if attached language as l_language then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "lang", l_language)
				language := l_replacement.item
			end
			if attached from_pattern as l_from_pattern then
				type_check_pattern ("from", l_from_pattern)
			end
			if attached count_pattern as l_count_pattern then
				type_check_pattern ("count", l_count_pattern)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_hash_code: INTEGER
		do
			check attached stylesheet_compiler as l_stylesheet_compiler then
				l_compiler := l_stylesheet_compiler
			end
			l_compiler.increment_counter
			l_hash_code := l_compiler.counter
			check attached static_context as l_static_context then
				create {XM_XSLT_COMPILED_NUMBER} last_generated_expression.make (an_executable, select_expression,
																								  level, l_hash_code, count_pattern,
																								  from_pattern,
																								  value_expression, format,
																								  grouping_size,
																								  grouping_separator,
																								  letter_value, ordinal,
																								  language, formatter,
																								  numberer, has_variables_in_patterns, l_static_context.is_backwards_compatible_mode)
			end
			-- TODO: consider wrapping this in a value-of
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

	level: INTEGER
			-- Level

	has_variables_in_patterns: BOOLEAN
			-- Do any supplied patterns include variable references?

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Selected node

	value_expression: detachable XM_XPATH_EXPRESSION
			-- Supplied value

	count_pattern: detachable XM_XSLT_PATTERN
			-- Nodes which are to be counted

	from_pattern: detachable XM_XSLT_PATTERN
			-- Node from which counted is to be started

	format: detachable XM_XPATH_EXPRESSION
			-- Format for formatted number

	grouping_size, grouping_separator: detachable XM_XPATH_EXPRESSION
			-- Grouping parameters

	language: detachable XM_XPATH_EXPRESSION
			-- Language

	letter_value: detachable XM_XPATH_EXPRESSION
			-- Letter value

	ordinal: detachable XM_XPATH_EXPRESSION
			-- Ordinal marker

	formatter: detachable XM_XSLT_NUMBER_FORMATTER
			-- Formatter

	numberer: detachable ST_XSLT_NUMBERER
			-- Numberer

	prepare_attributes_2 (a_select_attribute, an_ordinal_attribute, a_value_attribute: detachable STRING;
										 a_count_attribute,a_lang_attribute, a_from_attribute: detachable STRING;
										 a_level_attribute, a_letter_value_attribute, a_grouping_size_attribute: detachable STRING;
										 a_grouping_separator_attribute, a_format_attribute: detachable STRING)
			-- Prepare attributes some more.
		local
			an_error: XM_XPATH_ERROR_VALUE
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
			if a_value_attribute /= Void then
				generate_expression (a_value_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_value_expression then
					value_expression := l_new_value_expression
					if attached l_new_value_expression.error_value as l_error_value then
						check is_error: l_new_value_expression.is_error end
						report_compile_error (l_error_value)
					end
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

	prepare_attributes_3 (an_ordinal_attribute, a_lang_attribute, a_letter_value_attribute: detachable STRING;
		a_grouping_size_attribute, a_grouping_separator_attribute, a_format_attribute: detachable STRING)
			-- Prepare attributes even more.
		do
			if a_format_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_format_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_format then
					format := l_new_format
					if l_new_format.is_string_value then
						create formatter.make (l_new_format.as_string_value.string_value)
					else
						-- We must allocate the formatter at run time
					end
				end
			else
				create formatter.make ("1") -- default
			end
			if a_grouping_size_attribute /= Void and then a_grouping_separator_attribute /= Void then

				-- the spec says that if only one is specified, it is ignored

				check attached static_context as l_static_context then
					generate_attribute_value_template (a_grouping_size_attribute, l_static_context)
					grouping_size :=  last_generated_expression
					generate_attribute_value_template (a_grouping_separator_attribute, l_static_context)
					grouping_separator :=  last_generated_expression
				end
			end
			if a_lang_attribute = Void then
				numberer := selected_numberer ("en")
			else
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_lang_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_language then
					language := l_new_language
					if l_new_language.is_string_value then
						numberer := selected_numberer (l_new_language.as_string_value.string_value)
						if numberer = Void then
							numberer := selected_numberer ("en")
						end
					else
						-- we allocate the numberer at run-time
					end
				end
			end
			if a_letter_value_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_letter_value_attribute, l_static_context)
				end
				letter_value := last_generated_expression
			end
			if an_ordinal_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (an_ordinal_attribute, l_static_context)
				end
				ordinal := last_generated_expression
			end
		end

invariant

	level: level > 0 implies level >= Single_level and then level <= Simple_numbering

end
