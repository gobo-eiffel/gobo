indexing

	description:

		"PCRE regular expressions"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_REGULAR_EXPRESSION

inherit

	RX_PCRE_MATCHER
		rename
			make as make_matcher
		export
			{NONE}
				make_matcher,
				match_it
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create new regular expression.
		do
			make_matcher
			reset
			set_default_options
		ensure
			all_reset: not is_compiled and not has_matched and not is_matcher_active
		end

feature -- Query matching results

	is_portion_defined (a_n: INTEGER): BOOLEAN is
			-- Some portions of subexpressions may be undefined (i.e. subexpressions
			-- in not matched alternatives). This can be queried with this feature.
			-- 'a_n = 0' represents the whole matched portion of the subject.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := start_of_portion (a_n) > 0
		ensure
			portion_empty: not Result implies is_portion_empty (a_n)
		end

	is_portion_empty (a_n: INTEGER): BOOLEAN is
			-- Is the portion of interest empty?
			-- 'a_n = 0' represents the whole matched portion of the subject.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := start_of_portion (a_n) > end_of_portion (a_n)
		end

	start_of_portion (a_n: INTEGER): INTEGER is
			-- Start position of the n-th subexpression;
			-- 'a_n = 0' represents the whole matched portion of the subject.
			-- If the result = 0 implies undefined subexpression.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := offset_vector.item (a_n * 2)
		ensure
			Result /= 0 implies Result >= subject_start
			Result <= subject_end or else
				-- in the consequence of empty matches at the end of a subject
				(Result = subject_end + 1 implies end_of_portion (a_n) = subject_end)
		end

	end_of_portion (a_n: INTEGER): INTEGER is
			-- End position of the n-th subexpression;
			-- 'a_n = 0' represents the whole matched expression.
			-- If the result = -1 implies undefined subexpression.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := offset_vector.item (a_n * 2 + 1) - 1
		ensure
			Result >= -1 and then Result <= subject_end
		end

	matched_portion (a_n: INTEGER): STRING is
			-- `a_n'-th matched portion of the last matched subject;
			-- 'a_n = 0' represents the whole matched portion.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := STRING_.make (offset_vector.item (a_n * 2 + 1) - offset_vector.item (a_n * 2) + 2)
			matched_portion_in (Result, a_n)
		end

	matched_portion_in (a_result: STRING; a_n: INTEGER) is
			-- Append the `a_n'-th matched portion of last matched subject to `a_result';
			-- 'a_n = 0' represents the whole matched portion.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		local
			i, n: INTEGER
		do
			from
				i := offset_vector.item (a_n * 2)
				n := offset_vector.item (a_n * 2 + 1)
			until
				i >= n
			loop
				a_result.append_character (subject.item (i))
				i := i + 1
			end
		end

feature -- Matcher commands

	match (a_subject: STRING) is
			-- Set the value of `match_count' and the infos of the first
			-- matched portion (if any).
		require
			compiled: is_compiled
			valid_subject: a_subject /= Void
		do
			subject_start := 1
			match_it (a_subject, 1, a_subject.count)
		ensure
			subject_set: subject = a_subject
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_subject.count
			is_matcher_active: is_matcher_active
		end

	match_substring (a_subject: STRING; a_from, a_to: INTEGER) is
			-- Set the value of `match_count' and the infos of the first
			-- matched portion (if any).
		require
			compiled: is_compiled
			valid_subject: a_subject /= Void
		do
			subject_start := a_from
			match_it (a_subject, a_from, a_to)
		ensure
			subject_set: subject = a_subject
			subject_start_set: subject_start = a_from
			subject_end_set: subject_end = a_to
			is_matcher_active: is_matcher_active
		end

	first_match is
			-- Rewind the matcher to the first match (if any),
		require
			active_matcher: is_matcher_active
		do
			match_it (subject, subject_start, subject_end)
		end

	next_match is
			-- Match next portion (if any),
		require
			active_matcher: is_matcher_active
		do
			if offset_vector.item (0) >= offset_vector.item (1) and is_empty_allowed then
					-- The last match was empty or doesnt exists. To avoid an infinite loop
					-- we need to lead the matcher one step further.
				match_it (subject, subject_next_start + 1, subject_end)
			else
				match_it (subject, subject_next_start, subject_end)
			end
		end

feature -- Replace commands

	replacement (a_replacement: STRING): STRING is
			-- Replacement with evaluated references;
			-- Make only sense, if you use reference to the matched subject portions
			-- \n\ where n is an number from a subexpression of the compiled pattern.
			-- If no references used, return a copy of `a_replacement'.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			Result := STRING_.make (a_replacement.count)
			replacement_in (Result, a_replacement)
		ensure
			replacement_not_void: Result /= Void
		end

	replacement_in (a_result, a_replacement: STRING) is
			-- Append the replacement with evaluated references to `a_result'.
			-- Make only sense, if you use reference to the matched subject portions
			-- \n\ where n is an number from a subexpression of the compiled pattern.
			-- If no references used, append a copy of `a_replacement' in `a_result'.
		require
			active_matcher: is_matcher_active
			valid_result: a_result /= Void
			valid_replacement: a_replacement /= Void
		local
			i, j, ref: INTEGER
			c: CHARACTER
		do
			from i := 1 until i > a_replacement.count loop
				c := a_replacement.item (i)
				if c = '\' then
					from
						i := i + 1
						j := i
						ref := 0
					until
						i > a_replacement.count or else
						(a_replacement.item_code (i) < Zero_code or a_replacement.item_code (i) > Nine_code)
					loop
						c := a_replacement.item (i)
						ref := ref * 10 + c.code - Zero_code
						i := i + 1
					end
					if i <= a_replacement.count then
						c := a_replacement.item (i)
						if c = '\' then
							if i > j then
									-- Minimal one digit readed,
								if ref < match_count then
									matched_portion_in (a_result, ref)
								end
							else
									-- Double backslash means one \\ => \.
								a_result.append_character (c)
							end
							i := i + 1
						else
								-- Backslash followed by optional digits without the final backslash
								-- put the backslash in and process the following characters by the
								-- normal way.
							a_result.append_character ('\')
							i := j
						end
					else
							-- Backslash followed by options digit fill the rest of line, we put the
							-- backslash in an processes the may following characters on the normal way.
						a_result.append_character ('\')
						i := j
					end
				else
						-- Simply put the character in.
					a_result.append_character (c)
					i := i + 1
				end
			end
		end

	replace (a_replacement: STRING): STRING is
			-- New string with the result of the replace action. Only the
			-- actual matched portion would be replaced by `a_replacement'.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			Result := STRING_.make (subject_end - subject_start + a_replacement.count) -- realy make it so big???
			replace_in (Result, a_replacement)
		ensure
			replace_not_void: Result /= Void
		end

	replace_in (a_result, a_replacement: STRING) is
			-- Append to `a_result' the result of the replace action. Only the actual
			-- matched portion would be replace by `a_replacement' (if any) else a copy
			-- of the subject is appended to `a_result'.
		require
			active_matcher: is_matcher_active
			valid_result: a_result /= Void
			valid_replacement: a_replacement /= Void
		local
			i, j: INTEGER
		do
			i := subject_start
			if match_count > 0 then
				from
					j := offset_vector.item (0)
				until
					i >= j
				loop
					a_result.append_character (subject.item (i))
					i := i + 1
				end
				replacement_in (a_result, a_replacement)
				i := offset_vector.item (1)
			end
			from until i > subject_end loop
				a_result.append_character (subject.item (i))
				i := i + 1
			end
		end

	replace_all (a_replacement: STRING): STRING is
			-- New string with the result of the replace action. Replacement
			-- takes place over the whole subject string.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			Result := STRING_.make (0)
			replace_all_in (Result, a_replacement)
		ensure
			all_matched: not has_matched
			replace_all_not_void: Result /= Void
		end

	replace_all_in (a_result, a_replacement: STRING) is
			-- Append to `a_result' the result of the replace action. Replacement
			-- takes place over the whole subject string.
		require
			active_matcher: is_matcher_active
			valid_result: a_result /= Void
			valid_replacement: a_replacement /= Void
		local
			i, j: INTEGER
		do
			i := subject_start
			from until match_count <= 0 loop
				from
					j := offset_vector.item (0)
				until
					i >= j
				loop
					a_result.append_character (subject.item (i))
					i := i + 1
				end
				replacement_in (a_result, a_replacement)
				i := offset_vector.item (1)
				match_it (subject, i, subject_end)
			end
			from until i > subject_end loop
				a_result.append_character (subject.item (i))
				i := i + 1
			end
		ensure
			all_matched: not has_matched
		end

feature -- Split commands

	split: ARRAY[STRING] is
			-- Split the string subject in not matched portions of the
			-- compiled pattern and return a new array with all pieces in.
		require
			active_matcher: is_matcher_active
		do
			!! Result.make (1, 0)
			split_in (Result)
		ensure
			all_matched: not has_matched
			split_not_void: Result /= Void
		end

	split_in (a_collection: ARRAY[STRING]) is
			-- Split the string subject in not matched portions of the
			-- compiled pattern and append all pieces in `a_collection'.
		require
			active_matcher: is_matcher_active
			valid_collection: a_collection /= Void
		local
			low: INTEGER
		do
			low := subject_start
			from until match_count <= 0 loop
				a_collection.force (subject.substring (low, offset_vector.item (0) - 1), a_collection.upper + 1)
				low := offset_vector.item (1)
				match_it (subject, low, subject_end)
			end
			if low <= subject_end then
				a_collection.force (subject.substring (low, subject_end), a_collection.upper + 1)
			end
		ensure
			all_matched: not has_matched
			only_appended: a_collection.count >= old a_collection.count
		end

end
