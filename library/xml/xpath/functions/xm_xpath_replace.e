indexing

	description:

		"Objects that implement the XPath replace() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REPLACE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

	XM_XPATH_REGEXP_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "replace"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := replace_function_type_code
			minimum_argument_count := 3
			maximum_argument_count := 4
			create arguments.make (4)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
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

	simplify is
			-- Perform context-independent static optimizations
		local
			n: INTEGER
		do
			Precursor
			if arguments.count = 4 then n := 4 end
			try_to_compile (n, arguments)
			if regexp_error_value /= Void then set_last_error (regexp_error_value) end
		end
		
feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_input_string, a_pattern_string, a_flags_string: STRING
			an_item: XM_XPATH_ITEM
		do
			last_evaluated_item := Void
			arguments.item (1).evaluate_item (a_context)
			an_item := arguments.item (1).last_evaluated_item
			if an_item = Void then
				an_input_string := ""
			elseif an_item.is_error then
				last_evaluated_item := an_item
			else
				an_input_string := an_item.string_value
			end
			if last_evaluated_item = Void then -- else it's an error
				if regexp_cache_entry = Void then
					arguments.item (2).evaluate_item (a_context)
					an_item := arguments.item (2).last_evaluated_item
					check
						pattern_not_empty: an_item /= Void
						--static typing
					end
					if an_item.is_error then
						last_evaluated_item := an_item
					else	
						check
							atomic_pattern: an_item.is_atomic_value
							-- Statically typed as a single string
						end
						a_pattern_string := an_item.as_atomic_value.string_value
						if arguments.count = 3 then
							a_flags_string := ""
						else
							arguments.item (4).evaluate_item (a_context)
							an_item := arguments.item (4).last_evaluated_item
							check
								flags_not_empty: an_item /= Void
								--static typing
							end
							if an_item.is_error then
								last_evaluated_item := an_item
							else
								check
									atomic_pattern: an_item.is_atomic_value
									-- Statically typed as a single string
								end
								a_flags_string := normalized_flags_string (an_item.as_atomic_value.string_value)
							end
							if a_flags_string = Void then
								set_last_error_from_string ("Unknown flags in regular expression", Xpath_errors_uri, "FORX0001", Static_error)
							else
								fetch_regular_expression (a_pattern_string, a_flags_string)
								if last_evaluated_item = Void then
									fetch_replacement_string (a_context)
								end
							end
						end
					end
				else
					regexp := regexp_cache_entry.regexp
					fetch_replacement_string (a_context)
				end
				if last_evaluated_item = Void then
					evaluate_replacement (an_input_string)
				end
			end
		end


feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regular expression

	replacement_string: STRING
			-- Replacement string

	any_captures: BOOLEAN
			-- Were any captured-substring replacement requests detected.

	check_replacement_string is
			-- Check `replacement_string' conforms to required format.
			-- Captured-substring replacement syntax is modified for pcre -
			--  i.e. $n is replaced by \n\ .
		require
			replacement_string_not_void: replacement_string /= void
			no_previous_error: last_evaluated_item = Void
		local
			an_index, a_character_code: INTEGER
		do
			from
				an_index := 1
			variant
				replacement_string.count + 1 - an_index
			until
				regexp_error_value /= Void or else an_index > replacement_string.count
			loop
				a_character_code := replacement_string.item_code (an_index)
				inspect
					a_character_code
				when 36 then -- $
					if an_index > 1 and then replacement_string.item_code (an_index - 1) =  92 then -- \
						-- escaped $
					else
						if an_index < replacement_string.count then
							a_character_code := replacement_string.item_code (an_index + 1)
							if a_character_code < 48 or else a_character_code > 57 then -- not 0-9
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid replacement string in fn:replace(): $ sign must be followed by digit 0-9",
																															Xpath_errors_uri, "FORX0004", Dynamic_error)
							else
								any_captures := True
							end
						else
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid replacement string in fn:replace(): $ sign at end of string",
																														Xpath_errors_uri, "FORX0004", Dynamic_error)
						end
					end
				when 92 then -- \
					if an_index > 1 and then  replacement_string.item_code (an_index - 1) =  92 then -- \
						-- escaped \
					elseif an_index < replacement_string.count and then replacement_string.item_code (an_index + 1) = 36 then
						-- \$
					elseif an_index < replacement_string.count and then replacement_string.item_code (an_index + 1) = 36 then
						-- escaped \
					else
						if an_index < replacement_string.count then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid replacement string in fn:replace(): $ sign must be followed by \ or $",
																														Xpath_errors_uri, "FORX0004", Dynamic_error)
						else
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid replacement string in fn:replace(): single \ sign at end of string",
																														Xpath_errors_uri, "FORX0004", Dynamic_error)
						end
					end
				else
				end
				an_index := an_index + 1
			end
			if last_evaluated_item = Void and then any_captures then
				perform_replacement_string_substitution
			end
		end

	perform_replacement_string_substitution is
			-- Replace Sn in `replacement_string' with \n\ throughout,
		require
			no_previous_error: last_evaluated_item = Void
			replacement_string_not_void: replacement_string /= Void
			captured_substring_requests_detected: any_captures
		local
			an_index, a_character_code: INTEGER
			a_substitution: STRING
			substitution_just_performed: BOOLEAN
		do
			from
				an_index := 1
			variant
				replacement_string.count + 1 - an_index
			until
				an_index > replacement_string.count
			loop
				a_character_code := replacement_string.item_code (an_index)
				if a_character_code = 36 then -- $
					if an_index > 1 and then not substitution_just_performed and then replacement_string.item_code (an_index - 1) =  92 then -- \
						an_index := an_index + 2 -- escaped $
						substitution_just_performed := False
					else
						a_substitution := STRING_.concat ("\", replacement_string.substring (an_index + 1, an_index + 1))
						a_substitution := STRING_.appended_string (a_substitution, "\")
						replacement_string := STRING_.replaced_substring (replacement_string, a_substitution, an_index, an_index + 1)
						an_index := an_index + 3
						substitution_just_performed := True
					end
				else
					substitution_just_performed := True
					an_index := an_index + 1
				end
			end
		end
			
	evaluate_replacement (an_input_string: STRING) is
			-- Ensure subject and replacement strings are same type, then evaluate.
		require
			input_string_not_void: an_input_string /= Void
			replacement_string_not_void: replacement_string /= Void
			no_previous_error: last_evaluated_item = Void
		local
			replacement_is_ascii, subject_is_ascii: BOOLEAN
			a_subject_string, a_substitution_string: STRING
		do
			subject_is_ascii := ANY_.same_types (an_input_string, "")
			replacement_is_ascii := ANY_.same_types (replacement_string, "")
			if subject_is_ascii = replacement_is_ascii then
				a_subject_string := an_input_string
				a_substitution_string := replacement_string
			elseif subject_is_ascii then
				a_subject_string := STRING_.new_empty_string (replacement_string, an_input_string.count)
				a_subject_string := STRING_.appended_string (a_subject_string, an_input_string)
				a_substitution_string := replacement_string
			else
				a_subject_string := an_input_string
				a_substitution_string := STRING_.new_empty_string (an_input_string, replacement_string.count)
				a_substitution_string := STRING_.appended_string (a_substitution_string, replacement_string)
			end
			regexp.match (a_subject_string)
			create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (regexp.replace_all (a_substitution_string))
		ensure
			evaluated: last_evaluated_item /= Void
		end


	fetch_regular_expression (a_pattern_string, a_flags_string: STRING) is
			-- Fetch regular expression.
		require
			no_previous_error: last_evaluated_item = Void
			pattern_string_not_void: a_pattern_string /= Void
			flags_string_not_void: a_flags_string /= Void
		local
			a_key: STRING
			a_regexp_cache_entry: like regexp_cache_entry
		do
			a_key := composed_key (a_pattern_string, a_flags_string)
			a_regexp_cache_entry := shared_regexp_cache.item (a_key)
			if a_regexp_cache_entry = Void then
				create a_regexp_cache_entry.make (a_pattern_string, a_flags_string)
				if not a_regexp_cache_entry.is_error then
					shared_regexp_cache.put (a_regexp_cache_entry, a_key)
				end
			end
			if not a_regexp_cache_entry.is_error then
				regexp := a_regexp_cache_entry.regexp
				if regexp.matches ("") then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Regular expression matches zero-length string", Xpath_errors_uri, "FORX0003", Dynamic_error)
				end
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Invalid regular expression", Xpath_errors_uri, "FORX0002", Dynamic_error)
			end
		ensure
			regexp_set: last_evaluated_item = Void implies regexp /= Void
		end

	fetch_replacement_string  (a_context: XM_XPATH_CONTEXT) is
			-- Fetch replacement string.
		require
			no_previous_error: last_evaluated_item = Void
		local
			an_item: XM_XPATH_ITEM
		do
			arguments.item (3).evaluate_item (a_context)
			an_item := arguments.item (3).last_evaluated_item
			check
				replacement_string_present: an_item /= Void
				-- static typing
			end
			if an_item.is_error then
				last_evaluated_item := an_item
			else
				replacement_string := an_item.string_value
				check_replacement_string
			end
		ensure
			replacement_string_set: last_evaluated_item = Void implies replacement_string /= Void
		end

end
	
