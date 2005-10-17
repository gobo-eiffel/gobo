indexing

	description:

		"xsl:analyze-string element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	may_contain_fallback: BOOLEAN is
			-- Is `Current' allowed to contain an xsl:fallback?
		do
			Result := True
		end

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_regex_attribute, a_flags_attribute: STRING
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
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			else
				report_absence ("regex")
			end
			if a_regex_attribute /= Void then
				generate_attribute_value_template (a_regex_attribute, static_context)
				regex_expression := last_generated_expression
			else
				report_absence ("regex")
			end
			if a_flags_attribute = Void then
				a_flags_attribute := ""
			end
			generate_attribute_value_template (a_flags_attribute, static_context)
			flags_expression := last_generated_expression
			if not any_compile_errors and then regex_expression.is_string_value
				and then flags_expression.is_string_value then
				check_regex_and_flags
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
			an_error: XM_XPATH_ERROR_VALUE
			finished: BOOLEAN
		do
			check_within_template
			from
				a_child_iterator := new_axis_iterator (Child_axis); a_child_iterator.start
			until finished or else a_child_iterator.after loop
				a_style_element ?= a_child_iterator.item
				if a_style_element /= Void then
					if not a_style_element.is_fallback then
						if a_style_element.is_matching_substring then
							if matching_substring /= Void then
								create an_error.make_from_string ("xsl:matching-substring element may only appear once", Xpath_errors_uri, "XTSE0010", Static_error) 
								report_compile_error (an_error); finished := True
							elseif non_matching_substring /= Void then
								create an_error.make_from_string ("xsl:matching-substring element must appear before xsl:non-matching-substring", Xpath_errors_uri, "XTSE0010", Static_error) 
								report_compile_error (an_error); finished := True
							else
								matching_substring := a_style_element.as_matching_substring
							end
						elseif a_style_element.is_non_matching_substring then
							if non_matching_substring /= Void then
								create an_error.make_from_string ("xsl:non-matching-substring element may only appear once", Xpath_errors_uri, "XTSE0010", Static_error) 
								report_compile_error (an_error); finished := True
							else
								non_matching_substring := a_style_element.as_non_matching_substring
							end
						else
							create an_error.make_from_string ("Only xsl:matching-substring, xsl:non-matching-substring and xsl:fallback are allowed here", Xpath_errors_uri, "XTSE0010", Static_error) 
							report_compile_error (an_error); finished := True
						end
					end
				elseif a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
							-- do nothing, as xml:space="preserve" makes this legitimate
				else
					create an_error.make_from_string ("Only xsl:matching-substring, xsl:non-matching-substring and xsl:fallback are allowed here", Xpath_errors_uri, "XTSE0010", Static_error) 
					report_compile_error (an_error); finished := True
				end
				a_child_iterator.forth
			end
			if not any_compile_errors then validate_stage_2 end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_matching_block, a_non_matching_block: XM_XPATH_EXPRESSION
		do
			if matching_substring /= Void then
				matching_substring.compile_sequence_constructor (an_executable, matching_substring.new_axis_iterator (Child_axis), False)
				if matching_substring.last_generated_expression /= Void then
					a_matching_block := matching_substring.last_generated_expression
				end
			end
			if non_matching_substring /= Void then
				non_matching_substring.compile_sequence_constructor (an_executable, non_matching_substring.new_axis_iterator (Child_axis), False)
				if non_matching_substring.last_generated_expression /= Void then
					a_non_matching_block := non_matching_substring.last_generated_expression
				end
			end
			create {XM_XSLT_COMPILED_ANALYZE_STRING} last_generated_expression.make (an_executable,
																											 select_expression,
																											 regex_expression,
																											 flags_expression,
																											 regexp_cache_entry,
																											 a_matching_block,
																											 a_non_matching_block)
			last_generated_expression.simplify
			if last_generated_expression.was_expression_replaced then
				last_generated_expression := last_generated_expression.replacement_expression
			end
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	regex_expression: XM_XPATH_EXPRESSION
			-- Regex expression

	flags_expression: XM_XPATH_EXPRESSION
			-- Flags expression

	regexp_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY
			-- Cached regular expression

	matching_substring: XM_XSLT_MATCHING_SUBSTRING
			-- Matching substring child
	
	non_matching_substring: XM_XSLT_NON_MATCHING_SUBSTRING
			-- Non-matching substring child
	
	check_regex_and_flags is
			-- Check constraints upon `regex_expression' and `flags_expression'.
		require
			regex_expression_is_string: regex_expression /= Void and then regex_expression.is_string_value
			flags_expression_is_string: flags_expression /= Void and then flags_expression.is_string_value
		local
			some_flags, a_key: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			some_flags := normalized_flags_string (flags_expression.as_string_value.string_value)
			if not are_normalized_flags (some_flags) then
				create an_error.make_from_string (STRING_.concat ("Invalid value for flags attribute: ", some_flags), Xpath_errors_uri, "XTDE1145", Static_error)
			else
				a_key := composed_key (regex_expression.as_string_value.string_value, some_flags)
				regexp_cache_entry :=  shared_regexp_cache.item (a_key)
				if regexp_cache_entry = Void then
					create regexp_cache_entry.make (regex_expression.as_string_value.string_value, some_flags)
					if regexp_cache_entry.is_error then
						regexp_cache_entry := Void
					else
						shared_regexp_cache.put (regexp_cache_entry, a_key)
					end
				end
				if regexp_cache_entry /= Void then
					if regexp_cache_entry.regexp.matches ("") then
						create an_error.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "XTDE1150", Static_error)
					end
				end
			end
			if an_error /= Void then
				if is_forwards_compatible_processing_enabled then

					-- Defer error until evaluation time
	
					regexp_cache_entry := Void
				else
					report_compile_error (an_error)
				end
			end
		end

	validate_stage_2 is
			-- Continue validation.
		require
			nor_errors_yet: not any_compile_errors
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_single_string: XM_XPATH_SEQUENCE_TYPE
		do
			type_check_expression ("select", select_expression)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			if not any_compile_errors then
				create a_single_string.make_single_string
				create a_type_checker
				create a_role.make (Instruction_role, "xsl:analyze-string/select", 1, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (static_context, select_expression, a_single_string, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
				else
					select_expression := a_type_checker.checked_expression
				end
			end
			if not any_compile_errors then
				type_check_expression ("regex", regex_expression)
				if regex_expression.was_expression_replaced then
					regex_expression := regex_expression.replacement_expression
				end
			end
			if not any_compile_errors then
				create a_type_checker
				create a_role.make (Instruction_role, "xsl:analyze-string/regex", 1, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (static_context, regex_expression, a_single_string, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
				else
					regex_expression := a_type_checker.checked_expression
				end
			end
			if not any_compile_errors then
				type_check_expression ("flags", flags_expression)
				if flags_expression.was_expression_replaced then
					flags_expression := flags_expression.replacement_expression
				end
			end
			if not any_compile_errors then
				create a_type_checker
				create a_role.make (Instruction_role, "xsl:analyze-string/flags", 1, Xpath_errors_uri, "XPTY0004")
				a_type_checker.static_type_check (static_context, flags_expression, a_single_string, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
				else
					flags_expression := a_type_checker.checked_expression
				end
			end
		end

invariant

	select_expression_not_void: attributes_prepared and then not any_compile_errors implies select_expression /= Void
	regex_expression_not_void: attributes_prepared and then not any_compile_errors implies regex_expression /= Void
	flags_expression_not_void: attributes_prepared and then not any_compile_errors implies flags_expression /= Void

end
