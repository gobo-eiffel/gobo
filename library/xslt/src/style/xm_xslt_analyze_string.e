note

	description:

		"xsl:analyze-string element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_ANALYZE_STRING

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_fallback, returned_item_type
		end

	XM_XPATH_ROLE

	XM_XPATH_SHARED_REGEXP_CACHE
		export {NONE} all end

	XM_XPATH_REGEXP_CACHE_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	may_contain_fallback: BOOLEAN
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := True
		end

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_regex_attribute, a_flags_attribute: detachable STRING
		do
			check precondition_static_context_not_void: attached static_context as l_static_context then
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
							STRING_.left_adjust (a_select_attribute)
							STRING_.right_adjust (a_select_attribute)
						elseif STRING_.same_string (an_expanded_name, Regex_attribute) then
							a_regex_attribute := attribute_value_by_index (a_cursor.index)
							STRING_.left_adjust (a_regex_attribute)
							STRING_.right_adjust (a_regex_attribute)
						elseif STRING_.same_string (an_expanded_name, Flags_attribute) then
							a_flags_attribute := attribute_value_by_index (a_cursor.index)
							STRING_.left_adjust (a_flags_attribute)
							STRING_.right_adjust (a_flags_attribute)
						else
							check_unknown_attribute (a_name_code)
						end
						a_cursor.forth
					variant
						l_attribute_collection.number_of_attributes + 1 - a_cursor.index
					end
				end
				if a_select_attribute /= Void then
					generate_expression (a_select_attribute)
					select_expression := last_generated_expression
				else
					report_absence ("regex")
				end
				if a_regex_attribute /= Void then
					generate_attribute_value_template (a_regex_attribute, l_static_context)
					regex_expression := last_generated_expression
				else
					report_absence ("regex")
				end
				if a_flags_attribute = Void then
					a_flags_attribute := ""
				end
				generate_attribute_value_template (a_flags_attribute, l_static_context)
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_flags_expression then
					flags_expression := l_new_flags_expression
					check attached regex_expression as l_regex_expression then
						if not any_compile_errors and then l_regex_expression.is_string_value
							and then l_new_flags_expression.is_string_value then
							check_regex_and_flags
						end
					end
				end
				attributes_prepared := True
			end
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_error: XM_XPATH_ERROR_VALUE
			l_finished: BOOLEAN
		do
			check_within_template
			from
				l_child_iterator := new_axis_iterator (Child_axis)
				l_child_iterator.start
			until l_finished or l_child_iterator.after loop
				if attached {XM_XSLT_STYLE_ELEMENT} l_child_iterator.item as l_style_element then
					if not l_style_element.is_fallback then
						if l_style_element.is_matching_substring then
							if matching_substring /= Void then
								create l_error.make_from_string ("xsl:matching-substring element may only appear once", Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (l_error); l_finished := True
							elseif non_matching_substring /= Void then
								create l_error.make_from_string ("xsl:matching-substring element must appear before xsl:non-matching-substring", Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (l_error); l_finished := True
							else
								matching_substring := l_style_element.as_matching_substring
							end
						elseif l_style_element.is_non_matching_substring then
							if non_matching_substring /= Void then
								create l_error.make_from_string ("xsl:non-matching-substring element may only appear once", Xpath_errors_uri, "XTSE0010", Static_error)
								report_compile_error (l_error); l_finished := True
							else
								non_matching_substring := l_style_element.as_non_matching_substring
							end
						else
							create l_error.make_from_string ("Only xsl:matching-substring, xsl:non-matching-substring and xsl:fallback are allowed here", Xpath_errors_uri, "XTSE0010", Static_error)
							report_compile_error (l_error); l_finished := True
						end
					end
				elseif l_child_iterator.item.node_type = Text_node and then is_all_whitespace (l_child_iterator.item.string_value) then
							-- do nothing, as xml:space="preserve" makes this legitimate
				else
					create l_error.make_from_string ("Only xsl:matching-substring, xsl:non-matching-substring and xsl:fallback are allowed here", Xpath_errors_uri, "XTSE0010", Static_error)
					report_compile_error (l_error); l_finished := True
				end
				l_child_iterator.forth
			end
			if non_matching_substring = Void and matching_substring = Void then
				report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("At least one xsl:matching-substring or xsl:non-matching-substring element must be present",
					Xpath_errors_uri, "XTSE1130", Static_error))
			end
			if not any_compile_errors then
				validate_stage_2
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_matching_block, l_non_matching_block: detachable XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_last_generated_expression_2: like last_generated_expression
		do
			if attached matching_substring as l_matching_substring then
				l_matching_substring.compile_sequence_constructor (an_executable, l_matching_substring.new_axis_iterator (Child_axis), False)
				if attached l_matching_substring.last_generated_expression as l_last_generated_expression then
					l_matching_block := l_last_generated_expression
				else
					-- better is to ensure non-void results - check consequences first
					create {XM_XPATH_EMPTY_SEQUENCE} l_matching_block.make
				end
			end
			if attached non_matching_substring as l_non_matching_substring then
				l_non_matching_substring.compile_sequence_constructor (an_executable, l_non_matching_substring.new_axis_iterator (Child_axis), False)
				if attached l_non_matching_substring.last_generated_expression as l_last_generated_expression then
					l_non_matching_block := l_last_generated_expression
				else
					-- see above
					create {XM_XPATH_EMPTY_SEQUENCE} l_non_matching_block.make
				end
			end
			check
				attached select_expression as l_select_expression
				attached regex_expression as l_regex_expression
				attached flags_expression as l_flags_expression
			then
				create {XM_XSLT_COMPILED_ANALYZE_STRING} l_last_generated_expression_2.make (an_executable,
					l_select_expression,
					l_regex_expression,
					l_flags_expression,
					regexp_cache_entry,
					l_matching_block,
					l_non_matching_block)
			end
			create l_replacement.make (Void)
			l_last_generated_expression_2.simplify (l_replacement)
			last_generated_expression := l_replacement.item
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Select expression

	regex_expression: detachable XM_XPATH_EXPRESSION
			-- Regex expression

	flags_expression: detachable XM_XPATH_EXPRESSION
			-- Flags expression

	regexp_cache_entry: detachable XM_XPATH_REGEXP_CACHE_ENTRY
			-- Cached regular expression

	matching_substring: detachable XM_XSLT_MATCHING_SUBSTRING
			-- Matching substring child

	non_matching_substring: detachable XM_XSLT_NON_MATCHING_SUBSTRING
			-- Non-matching substring child

	check_regex_and_flags
			-- Check constraints upon `regex_expression' and `flags_expression'.
		require
			regex_expression_is_string: attached regex_expression as l_regex_expression and then l_regex_expression.is_string_value
			flags_expression_is_string: attached flags_expression as l_flags_expression and then l_flags_expression.is_string_value
		local
			l_flags: detachable STRING
			l_flags_string, l_key: STRING
			l_error: detachable XM_XPATH_ERROR_VALUE
			l_regexp_cache_entry: like regexp_cache_entry
		do
			check
				precondition_regex_expression_not_void: attached regex_expression as l_regex_expression
				precondition_flags_expression_not_void: attached flags_expression as l_flags_expression
			then
				l_flags_string := l_flags_expression.as_string_value.string_value
				l_flags := normalized_flags_string (l_flags_string)
				if l_flags = Void then
					create l_error.make_from_string (STRING_.concat ("Invalid value for flags attribute: ", l_flags_string), Xpath_errors_uri, "XTDE1145", Static_error)
				else
					if not are_normalized_flags (l_flags) then
						create l_error.make_from_string (STRING_.concat ("Invalid value for flags attribute: ", l_flags_string), Xpath_errors_uri, "XTDE1145", Static_error)
					else
						l_key := composed_key (utf8.to_utf8 (l_regex_expression.as_string_value.string_value), l_flags)
						regexp_cache_entry :=  shared_regexp_cache.item (l_key)
						regexp_cache_entry := l_regexp_cache_entry
						if l_regexp_cache_entry = Void then
							create l_regexp_cache_entry.make (utf8.to_utf8 (l_regex_expression.as_string_value.string_value), l_flags)
							if l_regexp_cache_entry.is_error then
								regexp_cache_entry := Void
							else
								shared_regexp_cache.put (l_regexp_cache_entry, l_key)
								regexp_cache_entry := l_regexp_cache_entry
							end
						end
						if l_regexp_cache_entry /= Void then
							if l_regexp_cache_entry.regexp.matches ("") then
								create l_error.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "XTDE1150", Static_error)
							end
						end
					end
				end
				if l_error /= Void then
					if is_forwards_compatible_processing_enabled then

						-- Defer error until evaluation time

						regexp_cache_entry := Void
					else
						report_compile_error (l_error)
					end
				end
			end
		end

	validate_stage_2
			-- Continue validation.
		require
			nor_errors_yet: not any_compile_errors
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_single_string: detachable XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			check attached select_expression as l_select_expression then
				type_check_expression (l_replacement, "select", l_select_expression)
			end
			select_expression := l_replacement.item
			if not any_compile_errors then
				create l_single_string.make_single_string
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:analyze-string/select", 1, Xpath_errors_uri, "XPTY0004")
				check
					attached select_expression as l_select_expression
				then
					l_type_checker.static_type_check (static_context, l_select_expression, l_single_string, False, l_role)
				end
				if l_type_checker.is_static_type_check_error	then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					select_expression := l_type_checker.checked_expression
				end
			end
			if not any_compile_errors then
				l_replacement.put (Void)
				check attached regex_expression as l_regex_expression then
					type_check_expression (l_replacement, "regex", l_regex_expression)
				end
				regex_expression := l_replacement.item
			end
			if not any_compile_errors then
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:analyze-string/regex", 1, Xpath_errors_uri, "XPTY0004")
				check
					attached regex_expression as l_regex_expression
					l_single_string /= Void
				then
					l_type_checker.static_type_check (static_context, l_regex_expression, l_single_string, False, l_role)
				end
				if l_type_checker.is_static_type_check_error	then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					regex_expression := l_type_checker.checked_expression
				end
			end
			if not any_compile_errors then
				l_replacement.put (Void)
				check attached flags_expression as l_flags_expression then
					type_check_expression (l_replacement, "flags", l_flags_expression)
				end
				flags_expression := l_replacement.item
			end
			if not any_compile_errors then
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:analyze-string/flags", 1, Xpath_errors_uri, "XPTY0004")
				check
					attached flags_expression as l_flags_expression
					l_single_string /= Void
				then
					l_type_checker.static_type_check (static_context, l_flags_expression, l_single_string, False, l_role)
				end
				if l_type_checker.is_static_type_check_error	then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					flags_expression := l_type_checker.checked_expression
				end
			end
		end

invariant

	select_expression_not_void: attributes_prepared and then not any_compile_errors implies select_expression /= Void
	regex_expression_not_void: attributes_prepared and then not any_compile_errors implies regex_expression /= Void
	flags_expression_not_void: attributes_prepared and then not any_compile_errors implies flags_expression /= Void

end
