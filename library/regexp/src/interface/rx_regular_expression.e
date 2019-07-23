note

	description:

		"Regular expressions"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class RX_REGULAR_EXPRESSION

inherit

	RX_PATTERN_MATCHER

	UT_CHARACTER_32_CODES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

feature -- Replacement

	replacement (a_replacement: STRING): STRING
			-- Copy of `a_replacement' where all occurrences of \n\ have
			-- been replaced by the corresponding n-th captured substrings
			-- if any
			--
			-- This is the case where `a_replacement' is a STRING
			-- and you want the result to be STRING as well.
			-- Use `unicode_replacement' otherwise.
		require
			is_matching: is_matching
			a_replacement_not_void: a_replacement /= Void
			valid_codes: across subject_start |..| subject_end as i all a_replacement.valid_code (subject.code (i.item)) end
		do
			Result := STRING_.new_empty_string (a_replacement, a_replacement.count)
			append_replacement_to_string (Result, a_replacement)
		ensure
			replacement_not_void: Result /= Void
			same_type: ANY_.same_types (Result, a_replacement)
		end

	unicode_replacement (a_replacement: READABLE_STRING_GENERAL): STRING_32
			-- Copy of `a_replacement' where all occurrences of \n\ have
			-- been replaced by the corresponding n-th captured substrings
			-- if any
		require
			is_matching: is_matching
			a_replacement_not_void: a_replacement /= Void
		do
			create Result.make (a_replacement.count)
			append_replacement_to_string (Result, a_replacement)
		ensure
			unicode_replacement_not_void: Result /= Void
		end

	append_replacement_to_string (a_string: STRING_GENERAL; a_replacement: READABLE_STRING_GENERAL)
			-- Append to `a_string' a copy of `a_replacement' where all occurrences
			-- of \n\ have been replaced by the corresponding n-th captured substrings
			-- if any.
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_valid_codes: across 1 |..| a_replacement.count as i all a_string.valid_code (a_replacement.code (i.item)) end
			subject_valid_codes: across subject_start |..| subject_end as i all a_string.valid_code (subject.code (i.item)) end
		local
			k, j, nb, ref: INTEGER
			c: NATURAL_32
		do
			nb := a_replacement.count
			from
				k := 1
			until
				k > nb
			loop
				c := a_replacement.code (k)
				if c = Backslash_code then
					from
						k := k + 1
						j := k
						ref := 0
					until
						k > nb or else (a_replacement.code (k) < Zero_code or a_replacement.code (k) > Nine_code)
					loop
						c := a_replacement.code (k)
						ref := ref * 10 + (c - Zero_code).to_integer_32
						k := k + 1
					end
					if k <= nb then
						c := a_replacement.code (k)
						if c = Backslash_code then
							if k > j then
									-- Minimal one digit read,
								if ref < match_count then
									append_captured_substring_to_string (a_string, ref)
								end
							else
									-- Double backslash means one \\ => \.
								a_string.append_code (c)
							end
							k := k + 1
						else
								-- Backslash followed by optional digits without the final backslash
								-- put the backslash in and process the following characters by the
								-- normal way.
							a_string.append_code (backslash_code)
							k := j
						end
					else
							-- Backslash followed by options digit fill the rest of line, we put the
							-- backslash in an processes the may following characters on the normal way.
						a_string.append_code (backslash_code)
						k := j
					end
				else
						-- Simply put the character in.
					a_string.append_code (c)
					k := k + 1
				end
			end
		end

	replace (a_replacement: READABLE_STRING_GENERAL): STRING
			-- Substring of `subject' between `subject_start' and `subject_end'
			-- where the whole matched string has been replaced by `a_replacement';
			-- All occurrences of \n\ in `a_replacement' will have been replaced
			-- by the corresponding n-th captured substrings if any
			--
			-- This is the case where `subject' is a STRING
			-- and you want the result to be STRING as well.
			-- Use `unicode_replace' otherwise.
		require
			is_matching: is_matching
			subject_is_string: attached {STRING} subject
			a_replacement_not_void: a_replacement /= Void
			valid_codes: across 1 |..| a_replacement.count as i all subject.valid_code (a_replacement.code (i.item)) end
		do
			check precodition: attached {STRING} subject as l_subject_string then
				Result := STRING_.new_empty_string (l_subject_string, subject_end - subject_start + 1)
				append_replace_to_string (Result, a_replacement)
			end
		ensure
			replace_not_void: Result /= Void
			same_type: ANY_.same_types (Result, subject)
		end

	unicode_replace (a_replacement: READABLE_STRING_GENERAL): STRING_32
			-- Substring of `subject' between `subject_start' and `subject_end'
			-- where the whole matched string has been replaced by `a_replacement';
			-- All occurrences of \n\ in `a_replacement' will have been replaced
			-- by the corresponding n-th captured substrings if any
		require
			is_matching: is_matching
			a_replacement_not_void: a_replacement /= Void
		do
			create Result.make (subject_end - subject_start + 1)
			append_replace_to_string (Result, a_replacement)
		ensure
			unicode_replace_not_void: Result /= Void
		end

	append_replace_to_string (a_string: STRING_GENERAL; a_replacement: READABLE_STRING_GENERAL)
			-- Append to `a_string' a substring of `subject' between `subject_start'
			-- and `subject_end' where the whole matched string has been replaced by
			-- `a_replacement'. All occurrences of \n\ in `a_replacement' will have
			-- been replaced by the corresponding n-th captured substrings if any.
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_valid_codse: across 1 |..| a_replacement.count as i all a_string.valid_code (a_replacement.code (i.item)) end
			subject_valid_codes: across subject_start |..| subject_end as i all a_string.valid_code (subject.code (i.item)) end
		do
			if match_count > 0 then
				STRING_.append_substring_to_string (a_string, subject, subject_start, captured_start_position (0) - 1)
				append_replacement_to_string (a_string, a_replacement)
				STRING_.append_substring_to_string (a_string, subject, captured_end_position (0) + 1, subject_end)
			else
				STRING_.append_substring_to_string (a_string, subject, subject_start, subject_end)
			end
		end

	replace_all (a_replacement: READABLE_STRING_GENERAL): STRING
			-- Substring of `subject' between `subject_start' and `subject_end'
			-- where the whole matched string has been repeatedly replaced by
			-- `a_replacement'; All occurrences of \n\ in `a_replacement' will
			-- have been replaced by the corresponding n-th captured substrings
			-- if any
			--
			-- This is the case where `subject' is a STRING
			-- and you want the result to be STRING as well.
			-- Use `unicode_replace_all' otherwise.
		require
			is_matching: is_matching
			subject_is_string: attached {STRING} subject
			a_replacement_not_void: a_replacement /= Void
			valid_codes: across 1 |..| a_replacement.count as i all subject.valid_code (a_replacement.code (i.item)) end
		do
			check precodition: attached {STRING} subject as l_subject_string then
				Result := STRING_.new_empty_string (l_subject_string, subject_end - subject_start + 1)
				append_replace_all_to_string (Result, a_replacement)
			end
		ensure
			all_matched: not has_matched
			replace_not_void: Result /= Void
			same_type: ANY_.same_types (Result, subject)
		end

	unicode_replace_all (a_replacement: READABLE_STRING_GENERAL): STRING_32
			-- Substring of `subject' between `subject_start' and `subject_end'
			-- where the whole matched string has been repeatedly replaced by
			-- `a_replacement'; All occurrences of \n\ in `a_replacement' will
			-- have been replaced by the corresponding n-th captured substrings
			-- if any
		require
			is_matching: is_matching
			a_replacement_not_void: a_replacement /= Void
		do
			create Result.make (subject_end - subject_start + 1)
			append_replace_all_to_string (Result, a_replacement)
		ensure
			all_matched: not has_matched
			unicode_replace_not_void: Result /= Void
		end

	append_replace_all_to_string (a_string: STRING_GENERAL; a_replacement: READABLE_STRING_GENERAL)
			-- Append to `a_string' a substring of `subject' between `subject_start'
			-- and `subject_end' where the whole matched string has been repeatedly
			-- replaced by `a_replacement'. All occurrences of \n\ in `a_replacement'
			-- will have been replaced by the corresponding n-th captured substrings
			-- if any.
		require
			is_matching: is_matching
			a_string_not_void: a_string /= Void
			a_replacement_not_void: a_replacement /= Void
			a_replacement_valid_codes: across 1 |..| a_replacement.count as i all a_string.valid_code (a_replacement.code (i.item)) end
			subject_svalid_codes: across subject_start |..| subject_end as i all a_string.valid_code (subject.code (i.item)) end
		local
			old_subject_start: INTEGER
			l_captured_start_position: INTEGER
			l_captured_end_position: INTEGER
			l_next_start: INTEGER
		do
			old_subject_start := subject_start
			from
			until
				not has_matched
			loop
				l_captured_start_position := captured_start_position (0)
				l_captured_end_position := captured_end_position (0)
				STRING_.append_substring_to_string (a_string, subject, subject_start, l_captured_start_position - 1)
				append_replacement_to_string (a_string, a_replacement)
				if l_captured_start_position > l_captured_end_position then
						-- Make sure that we move to the next character, even
						-- when an empty string was matched.
					if l_captured_start_position <= subject_end then
						a_string.append_code (subject.code (l_captured_start_position))
						l_next_start := l_captured_start_position + 1
						match_unbounded_substring (subject, l_next_start, subject_end)
					else
							-- We already went past the end of the subject.
							-- There is nothing to be matched anymore.
						match_count := 0
						subject_start := subject_end + 1
					end
				else
					l_next_start := l_captured_end_position + 1
					match_unbounded_substring (subject, l_next_start, subject_end)
				end
			end
			STRING_.append_substring_to_string (a_string, subject, subject_start, subject_end)
			subject_start := old_subject_start
		ensure
			all_matched: not has_matched
		end

feature -- Splitting

	split: ARRAY [STRING]
			-- Parts of `subject' between `subject_start' and `subject_end'
			-- which do not match the pattern.
			--
			-- This is the case where `subject' is a STRING
			-- and you want the results to be STRING as well.
			-- Use `unicode_split' otherwise.
		require
			is_matching: is_matching
			subject_is_string: attached {STRING} subject
		do
			Result := string_array_routines.make_empty_with_lower (1)
			append_split_to_array (Result)
		ensure
			all_matched: not has_matched
			split_not_void: Result /= Void
		end

	unicode_split: ARRAY [STRING_32]
			-- Parts of `subject' between `subject_start' and `subject_end'
			-- which do not match the pattern.
		require
			is_matching: is_matching
		do
			create Result.make_empty
			unicode_append_split_to_array (Result)
		ensure
			all_matched: not has_matched
			unicode_split_not_void: Result /= Void
		end

	append_split_to_array (an_array: ARRAY [STRING])
			-- Append to `an_array' the parts of `subject' between `subject_start'
			-- and `subject_end' which do not match the pattern.
			--
			-- This is the case where `a_replacement' is a STRING
			-- and you want the result to be STRING as well.
			-- Use `unicode_replacement' otherwise.
		require
			is_matching: is_matching
			subject_is_string: attached {STRING} subject
			an_array_not_void: an_array /= Void
			valid_array_type: {REFLECTOR}.type_of_type ({REFLECTOR}.attached_type (subject.generating_type.type_id)).conforms_to (an_array.generating_type.generic_parameter_type (1))
		local
			i, j, k, nb: INTEGER
			l_last_char_matched: INTEGER
			old_subject_start: INTEGER
		do
			check precodition: attached {STRING} subject as l_subject_string then
				i := subject_start
				l_last_char_matched := i - 1
				old_subject_start := i
				nb := an_array.upper
				from
				until
					not has_matched
				loop
					j := captured_start_position (0)
					k := captured_end_position (0)
					if j > k then
							-- We matched an empty string, so we have to
							-- move to the next character, otherwise we
							-- will enter an infinite loop.
						if i <= j and j <= subject_end then
							nb := nb + 1
							an_array.force (l_subject_string.substring (i, j), nb)
						end
						i := k + 2
						if i <= subject_end then
							match_unbounded_substring (l_subject_string, i, subject_end)
						else
								-- We reached the end of the subject.
								-- Stop searching for matching substring,
								-- otherwise it would always match since
								-- the current regexp can match the empty
								-- string, resulting in an infinite loop.
							i := subject_end + 2
							match_count := 0
							check
								not_has_matched: not has_matched
							end
						end
					else
						if i < j then
							nb := nb + 1
							an_array.force (l_subject_string.substring (i, j - 1), nb)
						elseif i = j and (l_last_char_matched = i - 1) then
								-- If the string between two consecutive matches is
								-- empty, then the previous character (at position
								-- i-1) should be the last character matched in the
								-- previous iteration). If it's not, then it means
								-- that at the previous iteration we matched the
								-- empty string. Therefore we cannot add to `an_array'
								-- a string (i.e. the empty string) which itself can
								-- be matched by the current regexp.
							nb := nb + 1
							an_array.force (l_subject_string.substring (1, 0), nb)
						end
						l_last_char_matched := k
						i := k + 1
						match_unbounded_substring (l_subject_string, i, subject_end)
					end
				end
				if i <= subject_end + 1 then
					nb := nb + 1
					an_array.force (l_subject_string.substring (i, subject_end), nb)
				end
				subject_start := old_subject_start
			end
		ensure
			all_matched: not has_matched
		end

	unicode_append_split_to_array (an_array: ARRAY [like subject])
			-- Append to `an_array' the parts of `subject' between `subject_start'
			-- and `subject_end' which do not match the pattern.
		require
			is_matching: is_matching
			an_array_not_void: an_array /= Void
			valid_array_type: {REFLECTOR}.type_of_type ({REFLECTOR}.attached_type (subject.generating_type.type_id)).conforms_to (an_array.generating_type.generic_parameter_type (1))
		local
			i, j, k, nb: INTEGER
			l_last_char_matched: INTEGER
			old_subject_start: INTEGER
		do
			i := subject_start
			l_last_char_matched := i - 1
			old_subject_start := i
			nb := an_array.upper
			from
			until
				not has_matched
			loop
				j := captured_start_position (0)
				k := captured_end_position (0)
				if j > k then
						-- We matched an empty string, so we have to
						-- move to the next character, otherwise we
						-- will enter an infinite loop.
					if i <= j and j <= subject_end then
						nb := nb + 1
						an_array.force (subject.substring (i, j), nb)
					end
					i := k + 2
					if i <= subject_end then
						match_unbounded_substring (subject, i, subject_end)
					else
							-- We reached the end of the subject.
							-- Stop searching for matching substring,
							-- otherwise it would always match since
							-- the current regexp can match the empty
							-- string, resulting in an infinite loop.
						i := subject_end + 2
						match_count := 0
						check
							not_has_matched: not has_matched
						end
					end
				else
					if i < j then
						nb := nb + 1
						an_array.force (subject.substring (i, j - 1), nb)
					elseif i = j and (l_last_char_matched = i - 1) then
							-- If the string between two consecutive matches is
							-- empty, then the previous character (at position
							-- i-1) should be the last character matched in the
							-- previous iteration). If it's not, then it means
							-- that at the previous iteration we matched the
							-- empty string. Therefore we cannot add to `an_array'
							-- a string (i.e. the empty string) which itself can
							-- be matched by the current regexp.
						nb := nb + 1
						an_array.force (subject.substring (1, 0), nb)
					end
					l_last_char_matched := k
					i := k + 1
					match_unbounded_substring (subject, i, subject_end)
				end
			end
			if i <= subject_end + 1 then
				nb := nb + 1
				an_array.force (subject.substring (i, subject_end), nb)
			end
			subject_start := old_subject_start
		ensure
			all_matched: not has_matched
		end

end
