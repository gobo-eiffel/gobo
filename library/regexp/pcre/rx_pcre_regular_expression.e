indexing

	description:

		"PCRE regular expressions"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_REGULAR_EXPRESSION

inherit

	RX_REGULAR_EXPRESSION
		undefine
			wipe_out
		end

	RX_PCRE_MATCHER

create

	make

feature -- Status report

	is_portion_defined (n: INTEGER): BOOLEAN is
			-- Is the `n'-th captured substring defined?
			-- 'n = 0' represents the whole matched string.
		obsolete
			"[020707] Use `is_captured_substring_defined' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
		do
			Result := is_captured_substring_defined (n)
		ensure
			captured_substring_empty: not Result implies is_captured_substring_empty (n)
		end

	is_portion_empty (n: INTEGER): BOOLEAN is
			-- Is the `n'-th captured substring empty?
			-- 'n = 0' represents the whole matched string.
		obsolete
			"[020707] Use `is_captured_substring_empty' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
		do
			Result := is_captured_substring_empty (n)
		end

feature -- Access

	start_of_portion (n: INTEGER): INTEGER is
			-- Start position of the `n'-th captured substring;
			-- 'n = 0' represents the whole matched string.
			-- Return 0 if undefined captured substring.
		obsolete
			"[020707] Use `captured_start_position' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
		do
			Result := captured_start_position (n)
		ensure
			position_large_enough: Result /= 0 implies Result >= subject_start
			position_small_enough: Result <= subject_end or else
					-- Consequence of empty matches at the end of a subject:
				(Result = subject_end + 1 implies captured_end_position (n) = subject_end)
		end

	end_of_portion (n: INTEGER): INTEGER is
			-- End position of the `n'-th captured substring;
			-- 'n = 0' represents the whole matched string.
			-- Return -1 if undefined captured substring.
		obsolete
			"[020707] Use `captured_end_position' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
		do
			Result := captured_end_position (n)
		ensure
			position_large_enough: Result >= -1
			position_small_enough: Result <= subject_end
		end

	matched_portion (n: INTEGER): STRING is
			-- `n'-th captured substring;
			-- 'n = 0' represents the whole matched string.
		obsolete
			"[020707] Use `captured_substring' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
		do
			Result := captured_substring (n)
		ensure
			captured_substring_not_void: Result /= Void
			same_type: ANY_.same_types (Result, subject)
		end

	matched_portion_in (a_string: STRING; n: INTEGER) is
			-- Append `n'-th captured substring to `a_string';
			-- 'n = 0' represents the whole matched string.
		obsolete
			"[020711] Use `append_captured_substring_to_string' instead."
		require
			has_matched: has_matched
			n_large_enough: n >= 0
			n_small_enough: n < match_count
			a_string_not_void: a_string /= Void
			same_type: ANY_.same_types (a_string, subject)
		do
			append_captured_substring_to_string (a_string, n)
		end

feature -- Replacement

	replacement_in (a_string, a_replacement: STRING) is
			-- Append to `a_string' a copy of `a_replacement' where all occurrences
			-- of \n\ have been replaced by the corresponding n-th captured substrings
			-- if any.
		obsolete
			"[020711] Use `append_replacement_to_string' instead."
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_same_type: ANY_.same_types (a_replacement, subject)
			a_string_same_type: ANY_.same_types (a_string, a_replacement)
		do
			append_replacement_to_string (a_string, a_replacement)
		end

	replace_in (a_string, a_replacement: STRING) is
			-- Append to `a_string' a substring of `subject' between `subject_start'
			-- and `subject_end' where the whole matched string has been replaced by
			-- `a_replacement'. All occurrences of \n\ in `a_replacement' will have
			-- been replaced by the corresponding n-th captured substrings if any.
		obsolete
			"[020711] Use `append_replace_to_string' instead."
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_same_type: ANY_.same_types (a_replacement, subject)
			a_string_same_type: ANY_.same_types (a_string, a_replacement)
		do
			append_replace_to_string (a_string, a_replacement)
		end

	replace_all_in (a_string, a_replacement: STRING) is
			-- Append to `a_string' a substring of `subject' between `subject_start'
			-- and `subject_end' where the whole matched string has been repeatedly
			-- replaced by `a_replacement'. All occurrences of \n\ in `a_replacement'
			-- will have been replaced by the corresponding n-th captured substrings
			-- if any.
		obsolete
			"[020711] Use `append_replace_all_to_string' instead."
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_same_type: ANY_.same_types (a_replacement, subject)
			a_string_same_type: ANY_.same_types (a_string, a_replacement)
		do
			append_replace_all_to_string (a_string, a_replacement)
		ensure
			all_matched: not has_matched
		end

feature -- Splitting

	split_in (an_array: ARRAY [STRING]) is
			-- Append to `an_array' the parts of `subject' between `subject_start'
			-- and `subject_end' which do not match the pattern.
		obsolete
			"[0207211] Use `append_split_to_array' instead."
		require
			is_matching: is_matching
			an_array_not_void: an_array /= Void
		do
			append_split_to_array (an_array)
		ensure
			all_matched: not has_matched
		end

end
