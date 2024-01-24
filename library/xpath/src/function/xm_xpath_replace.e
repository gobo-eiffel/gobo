note

	description:

		"Objects that implement the XPath replace() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2022, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_REPLACE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

	XM_XPATH_REGEXP_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "replace"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Replace_function_type_code
			minimum_argument_count := 3
			maximum_argument_count := 4
			create arguments.make (4)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			n: INTEGER
		do
			Precursor (a_replacement)
			if a_replacement.item = Current then
				if arguments.count = 4 then
					n := 4
				end
				try_to_compile (n, arguments)
				if attached regexp_error_value as l_regexp_error_value then
					a_replacement.put (Void)
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_regexp_error_value))
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_input_string, l_pattern_string: STRING
			l_flags_string: detachable STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item_1 then
				l_input_string := ""
				a_result.put (Void)
			elseif a_result_item_1.is_error then
				-- nothing to do
				l_input_string := ""
			else
				l_input_string := a_result_item_1.string_value
				l_input_string := utf8.to_utf8 (l_input_string)
				a_result.put (Void)
			end
			if a_result.item = Void then -- else it's an error
				if not attached regexp_cache_entry as l_regexp_cache_entry then
					arguments.item (2).evaluate_item (a_result, a_context)
					check
						pattern_not_empty: attached a_result.item as a_result_item_2
						--static typing
					then
						if a_result_item_2.is_error then
							-- nothing to do
						else
							check
								atomic_pattern: a_result_item_2.is_atomic_value
								-- Statically typed as a single string
							end
							l_pattern_string := a_result_item_2.as_atomic_value.string_value
							l_pattern_string := utf8.to_utf8 (l_pattern_string)
							a_result.put (Void)
							if arguments.count = 3 then
								l_flags_string := ""
							else
								arguments.item (4).evaluate_item (a_result, a_context)
								check
									flags_not_empty: attached a_result.item as a_result_item_3
									--static typing
								then
									if a_result_item_3.is_error then
										-- nothing to do
									else
										check
											atomic_pattern: a_result_item_3.is_atomic_value
											-- Statically typed as a single string
										end
										l_flags_string := normalized_flags_string (a_result_item_3.as_atomic_value.string_value)
									end
								end
							end
							if l_flags_string = Void then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error))
							else
								a_result.put (Void)
								fetch_regular_expression (a_result, l_pattern_string, l_flags_string)
								if a_result.item = Void then
									fetch_replacement_string (a_result, a_context)
								end
							end
						end
					end
				else
					regexp := l_regexp_cache_entry.regexp
					fetch_replacement_string (a_result, a_context)
				end
				if a_result.item = Void then
					evaluate_replacement (a_result, l_input_string)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	regexp: detachable RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression

	replacement_string: detachable STRING
			-- Replacement string

	any_captures: BOOLEAN
			-- Were any captured-substring replacement requests detected.

	check_replacement_string (a_result: DS_CELL [detachable XM_XPATH_ITEM])
			-- Check `replacement_string' conforms to required format.
			-- Captured-substring replacement syntax is modified for pcre -
			--  i.e. $n is replaced by \n\ .
		require
			replacement_string_not_void: replacement_string /= void
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
		local
			l_index: INTEGER
			l_character_code: NATURAL_32
		do
			check precondition_replacement_string_not_void: attached replacement_string as l_replacement_string then
				from
					l_index := 1
				until
					regexp_error_value /= Void or else l_index > l_replacement_string.count
				loop
					l_character_code := l_replacement_string.code (l_index)
					inspect
						l_character_code
					when 36 then -- $
						if l_index > 1 and then l_replacement_string.code (l_index - 1) =  92 then -- \
							-- escaped $
						else
							if l_index < l_replacement_string.count then
								l_character_code := l_replacement_string.code (l_index + 1)
								if l_character_code < 48 or else l_character_code > 57 then -- not 0-9
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid replacement string in fn:replace(): $ sign must be followed by digit 0-9",
										Xpath_errors_uri, "FORX0004", Dynamic_error))
								else
									any_captures := True
								end
							else
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid replacement string in fn:replace(): $ sign at end of string",
									Xpath_errors_uri, "FORX0004", Dynamic_error))
							end
						end
					when 92 then -- \
						if l_index > 1 and then l_replacement_string.code (l_index - 1) =  92 then -- \
							-- escaped \
						elseif l_index < l_replacement_string.count and then l_replacement_string.code (l_index + 1) = 36 then
							-- \$
						elseif l_index < l_replacement_string.count and then l_replacement_string.code (l_index + 1) = 92 then
							-- escaped \
						else
							if l_index < l_replacement_string.count then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid replacement string in fn:replace(): \ must be followed by \ or $",
									Xpath_errors_uri, "FORX0004", Dynamic_error))
							else
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid replacement string in fn:replace(): single \ sign at end of string",
									Xpath_errors_uri, "FORX0004", Dynamic_error))
							end
						end
					else
					end
					l_index := l_index + 1
				variant
					l_replacement_string.count + 1 - l_index
				end
				if a_result.item = Void and any_captures then
					perform_replacement_string_substitution
				end
			end
		end

	perform_replacement_string_substitution
			-- Replace Sn in `replacement_string' with \n\ throughout,
		require
			replacement_string_not_void: replacement_string /= Void
			captured_substring_requests_detected: any_captures
		local
			l_index: INTEGER
			l_character_code: NATURAL_32
			l_substitution: STRING
			l_substitution_just_performed: BOOLEAN
		do
			check precondition_replacement_string_not_void: attached replacement_string as l_replacement_string then
				from
					l_index := 1
				until
					l_index > l_replacement_string.count
				loop
					l_character_code := l_replacement_string.code (l_index)
					if l_character_code = 36 then -- $
						if l_index > 1 and then not l_substitution_just_performed and then l_replacement_string.code (l_index - 1) =  92 then -- \
							l_index := l_index + 2 -- escaped $
							l_substitution_just_performed := False
						else
							l_substitution := STRING_.concat ("\", l_replacement_string.substring (l_index + 1, l_index + 1))
							l_substitution := STRING_.appended_string (l_substitution, "\")
							replacement_string := STRING_.replaced_substring (l_replacement_string, l_substitution, l_index, l_index + 1)
							l_index := l_index + 3
							l_substitution_just_performed := True
						end
					else
						l_substitution_just_performed := True
						l_index := l_index + 1
					end
				variant
					l_replacement_string.count + 1 - l_index
				end
			end
		end

	evaluate_replacement (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_input_string: STRING)
			-- Ensure subject and replacement strings are same type, then evaluate.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			input_string_not_void: a_input_string /= Void
			replacement_string_not_void: replacement_string /= Void
		local
			l_replacement_is_ascii, l_subject_is_ascii: BOOLEAN
			l_subject_string, l_substitution_string: STRING
		do
			check precondition_replacement_string_not_void: attached replacement_string as l_replacement_string then
				l_subject_is_ascii := ANY_.same_types (a_input_string, "")
				l_replacement_is_ascii := ANY_.same_types (l_replacement_string, "")
				if l_subject_is_ascii = l_replacement_is_ascii then
					l_subject_string := a_input_string
					l_substitution_string := l_replacement_string
				elseif l_subject_is_ascii then
					l_subject_string := STRING_.new_empty_string (l_replacement_string, a_input_string.count)
					l_subject_string := STRING_.appended_string (l_subject_string, a_input_string)
					l_substitution_string := l_replacement_string
				else
					l_subject_string := a_input_string
					l_substitution_string := STRING_.new_empty_string (a_input_string, l_replacement_string.count)
					l_substitution_string := STRING_.appended_string (l_substitution_string, l_replacement_string)
				end
				l_subject_string := utf8.to_utf8 (l_subject_string)
				l_substitution_string := utf8.to_utf8 (l_substitution_string)
				check attached regexp as l_regexp then
					l_regexp.match (l_subject_string)
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (new_unicode_string_from_utf8 (l_regexp.replace_all (l_substitution_string))))
				end
			end
		ensure
			evaluated: a_result.item /= Void
		end


	fetch_regular_expression (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_pattern_string, a_flags_string: STRING)
			-- Fetch regular expression.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			pattern_string_not_void: a_pattern_string /= Void
			flags_string_not_void: a_flags_string /= Void
		local
			l_key: STRING
			l_regexp_cache_entry: like regexp_cache_entry
		do
			l_key := composed_key (a_pattern_string, a_flags_string)
			l_regexp_cache_entry := shared_regexp_cache.item (l_key)
			if l_regexp_cache_entry = Void then
				create l_regexp_cache_entry.make (a_pattern_string, a_flags_string)
				if not l_regexp_cache_entry.is_error then
					shared_regexp_cache.put (l_regexp_cache_entry, l_key)
				end
			end
			if not l_regexp_cache_entry.is_error then
				check invariant_of_XM_XPATH_REGEXP_CACHE_ENTRY: attached l_regexp_cache_entry.regexp as l_regexp then
					regexp := l_regexp
					if l_regexp.matches ("") then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Dynamic_error))
					end
				end
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error))
			end
		ensure
			regexp_set: a_result.item = Void implies regexp /= Void
		end

	fetch_replacement_string  (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Fetch replacement string.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
		do
			arguments.item (3).evaluate_item (a_result, a_context)
			check
				replacement_string_present: attached a_result.item as a_result_item
				-- static typing
			then
				if not a_result_item.is_error then
					replacement_string := a_result_item.string_value
					a_result.put (Void)
					check_replacement_string (a_result)
				end
			end
		ensure
			replacement_string_set: a_result.item = Void implies replacement_string /= Void
		end

end

