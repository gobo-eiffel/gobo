indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_STRING


inherit

	RX_COMPILER
		rename
			make as make_compiler,
			reset as reset_compiler
		end

	KL_IMPORTED_STRING_ROUTINES


creation

	make


feature {NONE} -- Initialization

	make is
		local
			cd: ARRAY [CHARACTER]
		do
			create offset_vector.make (0, -1)
			-- `cd' should get capacity 128
			create cd.make (0, -1)
			make_compiler (cd)
			create matcher.make (Current)
			reset
			set_default_options
		ensure
			all_reset: not is_compiled and not has_matched and not is_matcher_active
		end


feature

	reset is
			-- Reset is needed only if options must be changed. for an
			-- option change a recompilation is needed.
		do
			reset_compiler
			match_count := 0
			subject := Void
			subject_start := 1
			subject_next_start := subject_start
			subject_end := 0
		ensure
			all_reset: not is_compiled and not has_matched and not is_matcher_active
		end


feature -- Query matcher infos

	subject: STRING
			-- Actual subject to match.

	subject_start: INTEGER
	subject_end: INTEGER
			-- The portion of interest of the subject.

	is_matcher_active: BOOLEAN is
			-- Has `match' been called?
		do
			Result := subject /= Void
		end

	has_matched: BOOLEAN is
			-- Was `match' successful?
		do
			Result := match_count > 0
		ensure
			consistent: Result = (match_count > 0)
		end

	match_count: INTEGER
			-- Returns the count of matched patterns.
			-- Result > 1 implies there are matched (sub-) portions.

	matched_portion (a_n: INTEGER): STRING is
			-- Returns the n-th matched portion of the last matched subject.
			-- 0 represent the whole matched portion.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := STRING_.make (offset_vector.item (a_n * 2 + 1) - offset_vector.item (a_n * 2) + 2)
			matched_portion_in (Result, a_n)
		end

	matched_portion_in (a_result: STRING; a_n: INTEGER) is
			-- Appends the n-th matched portion of the last matched
			-- subject to a_result.
			-- 0 represent the whole matched portion.
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

	start_of_portion (a_n: INTEGER): INTEGER is
			-- Start position of the n-th subexpression.
			-- `a_n' = 0 represent the whole matched portion of the subject.
			-- If the `Result' = 0 implies undefined subexpression.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := offset_vector.item (a_n * 2)
		ensure
			Result /= 0 implies Result >= subject_start
			Result <= subject_end or else
				-- in the consequence of empty matches at the end of subject
				(Result = subject_end+1 implies end_of_portion(a_n) = subject_end)
		end

	end_of_portion (a_n: INTEGER): INTEGER is
			-- End position of the n-th subexpression.
			-- `a_n' = 0 represent the whole matched expression.
			-- If the `Result' = -1 implies undefined subexpression.
		require
			active_matcher: is_matcher_active
			valid_index: a_n >= 0 and then a_n < match_count
		do
			Result := offset_vector.item (a_n * 2 + 1) - 1
		ensure
			Result >= -1 and then Result <= subject_end
		end


feature -- Compiler commands

	compile (a_pattern: STRING) is
			-- There are two different sets of meta-characters: those  that
			-- are  recognized anywhere in the pattern except within square
			-- brackets, and those that are recognized in square	brackets.
			-- Outside square brackets, the meta-characters are as follows:
			--	\		general escape character with several uses
			--	^		assert start of subject (or line, in multiline mode)
			--	$		assert end of subject (or line, in multiline mode)
			--	.		match any character except newline (by default)
			--	[		start character class definition
			--	|		start of alternative branch
			--	(		start subpattern
			--	)		end subpattern
			--	?		extends the meaning of (
			--				also 0 or 1 quantifier
			--				also quantifier minimizer
			--	*		0 or more quantifier
			--	+		1 or more quantifier
			--	{		start min/max quantifier
			--
			-- Part of a pattern that is in square	brackets	is	called  a
			-- "character	class".	In	a	character	class	the only meta-
			-- characters are:
			--	\		general escape character
			--	^		negate the class, but only if the first character
			--	-		indicates character range
			--	]		terminates the character class
		do
			subject := Void
			compile_pattern (a_pattern)
			offset_vector.resize (offset_vector.lower, subexpression_count * 2 + 2)
		end


feature -- Matcher commands

	match (a_subject: STRING) is
			-- Sets the value of match_count and the infos of the first
			-- matched portion (if any).
		require
			compiled: is_compiled
			valid_subject: a_subject /= Void
		do
			subject_start := 1
			match_it (a_subject, 1, a_subject.count)
		ensure
			holding_ref: subject = a_subject
			subject_start_set: subject_start = 1
			subject_end_set: subject_end = a_subject.count
			match_active: is_matcher_active
		end

	match_substring (a_subject: STRING; a_from, a_to: INTEGER) is
			-- Sets the value of `match_count' and the infos of the first
			-- matched portion (if any).
		require
			compiled: is_compiled
			valid_subject: a_subject /= Void
		do
			subject_start := a_from
			match_it (a_subject, a_from, a_to)
		ensure
			holding_ref: subject = a_subject
			subject_start_set: subject_start = a_from
			subject_end_set: subject_end = a_to
			match_active: is_matcher_active
		end

	first_match is
			-- Rewind the matcher to the first match (if any).
		require
			active_matcher: is_matcher_active
		do
			match_it (subject, subject_start, subject_end)
		end

	next_match is
			-- Match the next portion (if any).
		require
			active_matcher: is_matcher_active
		do
			match_it (subject, subject_next_start, subject_end)
		end


feature -- replace commands

	replacement (a_replacement: STRING): STRING is
			-- Returns the replacement with evaluated references.
			-- Makes only sense, if you use reference to the matched
			-- subject portions \n\ where n is an number from a
			-- subexpression of the compiled pattern if no references
			-- used, this feature returns a copy of `a_replacement'.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			Result := STRING_.make (a_replacement.count)
			replacement_in (Result, a_replacement)
		end

	replacement_in (a_result, a_replacement: STRING) is
			-- Appends the replacement with evaluated references to `a_result'.
			-- Makes only sense, if you use reference to the matched
			-- subject portions \n\ where n is an number from a
			-- subexpression of the compiled pattern if no references
			-- used, this feature puts a copy of a_replacement in
			-- `a_result'.
		require
			active_matcher: is_matcher_active
			valid_result: a_result /= Void
			valid_replacement: a_replacement /= Void
		local
			i, j, ref: INTEGER
			c: CHARACTER
			is_in_range: BOOLEAN
		do
			from i := 1 until i > a_replacement.count loop
				c := a_replacement.item (i)
				if c = '\' then
					from
						i := i + 1
						j := i
						ref := 0
						is_in_range := True
					until
						i > a_replacement.count or else
						not is_in_range
					loop
						c := a_replacement.item (i)
						is_in_range := c >= '0' and c <= '9'
						if is_in_range then
							ref := ref * 10 + c.code - ('0').code
							i := i + 1
						end
					end
					if i <= a_replacement.count then
						c := a_replacement.item (i)
						if c = '\' then
							if i > j then
								-- minimal one digit readed
								if ref < match_count then
									matched_portion_in (a_result, ref)
								end
							else
								a_result.append_character (c)
							end
							i := i + 1
						else
							-- backslash followed by optional digits without
							-- the final backslash put the backslash in and
							-- process the following characters by the normal
							-- way
							a_result.append_character ('\')
							i := j
						end
					else
						-- backslash followed by options digit fill the rest
						-- of line, we put the backslash in an processes the
						-- may following characters on the normal way
						a_result.append_character ('\')
						i := j
					end
				else
					-- simply put the character in
					a_result.append_character (c)
					i := i + 1
				end
			end
		end

	replace (a_replacement: STRING): STRING is
			-- Returns a new string with the result of the replace
			-- action. only the actual matched portion would be replaced
			-- by `a_replacement'.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			Result := STRING_.make (subject_end - subject_start + a_replacement.count)
			replace_in (Result, a_replacement)
		end

	replace_in (a_result, a_replacement: STRING) is
			-- Append in `a_result' the result of the replace action. only
			-- the actual matched portion would be replace by
			-- `a_replacement' (if any) else a copy of the subject is
			-- appended to `a_result'.
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
			-- Returns a new string with the result of the replace
			-- action. replacement takes place over the whole subject
			-- string.
		require
			active_matcher: is_matcher_active
			valid_replacement: a_replacement /= Void
		do
			create Result.make_empty
			replace_all_in (Result, a_replacement)
		ensure
			not has_matched
		end

	replace_all_in (a_result, a_replacement: STRING) is
			-- Append in `a_result' the result of the replace
			-- action. replacement takes place over the whole subject
			-- string.
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
			not has_matched
		end


feature -- Split commands

	split: ARRAY [STRING] is
			-- Splits the string subject in not matched portions of the
			-- compiled pattern and returns a new array with all pieces in.
		require
			active_matcher: is_matcher_active
		do
			-- create Result.with_capacity (8, 1)
			create Result.make (0, -1)
			split_in (Result)
		ensure
			not has_matched
		end

	split_in (a_collection: ARRAY [STRING]) is
			-- Splits the string subject in not matched portions of the
			-- compiled pattern and append all pieces in `a_collection'.
		require
			active_matcher: is_matcher_active
			valid_collection: a_collection /= Void
		local
			low: INTEGER
		do
			low := subject_start
			from until match_count <= 0 loop
				a_collection.force (subject.substring (low, offset_vector.item (0)-1), a_collection.upper + 1)
				low := offset_vector.item (1)
				match_it (subject, low, subject_end)
			end
			if low <= subject_end then
				a_collection.force (subject.substring (low, subject_end), a_collection.upper + 1)
			end
		ensure
			not has_matched
			a_collection.count >= old a_collection.count
		end


feature {RX_MATCHER} -- Implementation

	matcher: RX_MATCHER

	subject_next_start: INTEGER
			-- points after the last matched character


feature {RX_MATCHER}

	offset_vector: ARRAY [INTEGER]


feature {RX_MATCHER}

	set_next_start (a_index: INTEGER) is
		do
			subject_next_start := a_index
		ensure
			subject_next_start = a_index
		end

	set_match_count (a_count: INTEGER) is
		do
			match_count := a_count
		ensure
			match_count = a_count
		end


feature {NONE} -- Implementation

	match_it (a_subject: STRING; a_start, a_end: INTEGER) is
			-- This function applies a compiled re to a subject string
			-- and picks out portions of the string if it matches. Two
			-- elements in the vector are set for each substring: the
			-- offsets to the start and end of the substring.
		require
			compiled: is_compiled
			valid_subject: a_subject /= Void
		local
			start_match: INTEGER
			start_bits: RX_CHARACTER_SET
			first_char: INTEGER
			req_char: INTEGER
			req_char2: INTEGER
			req_char_ptr: INTEGER
			p: INTEGER
			stop: BOOLEAN
		do
			subject := a_subject
			subject_next_start := a_start
			subject_end := a_end
			match_count := 0

			start_match := a_start

			first_char := -1
			req_char := -1
			req_char2 := -1
			req_char_ptr := start_match - 1

			-- Set up the first character to match, if available. The
			-- first_char value is never set for an anchored regular
			-- expression, but the anchoring may be forced at run time,
			-- so we have to test for anchoring. The first char may be
			-- unset for an unanchored pattern, of course. If there's no
			-- first char and the pattern was studied, there may be a
			-- bitmap of possible first characters.
			if (not is_anchored) then
				if first_character >= 0 then
					if is_caseless then
						first_char := char_casing.to_lower (to_character (first_character)).code
					else
						first_char := first_character
					end
				else
					--				if not startline and then extra_index /= 0 and then extra_options.item (PCRE_STUDY_MAPPED_bit) then
					--					start_bits := extra->start_bits
					--				end
				end
			end

			-- For anchored or unanchored matches, there may be a "last
			-- known required character" set. If the PCRE_CASELESS is
			-- set, implying that the match starts caselessly, or if
			-- there are any changes of this flag within the regex, set
			-- up both cases of the character. Otherwise set the two
			-- values the same, which will avoid duplicate testing (which
			-- takes significant time). This covers the vast majority of
			-- cases. It will be suboptimal when the case flag changes in
			-- a regex and the required character in fact is caseful.
			if required_character >= 0 then
				req_char := required_character
				if is_caseless or else is_ichanged then
					req_char2 := char_casing.flip_case (to_character (req_char)).code
				else
					req_char2 := req_char
				end
			end

			-- Loop for handling unanchored repeated matching attempts;
			-- for anchored regexs the loop runs just once.
			from
			until
				stop
			loop
				match_count := 0

				from
					p := offset_vector.upper
				until
					p < 0
				loop
					offset_vector.put (0, p)
					p := p - 1
				end

				if (first_char >= 0) then
					-- Advance to a unique first char if possible
					if is_caseless then
						from
						until
							start_match > a_end or else
							char_casing.to_lower (subject.item (start_match)) = to_character (first_char)
						loop
							start_match := start_match + 1
						end
					else
						from
						until
							start_match > a_end or else
							subject.item (start_match) = to_character (first_char)
						loop
							start_match := start_match + 1
						end
					end
				elseif is_startline then
					-- Or to just after \n for a multiline match if possible
					if start_match > a_start then
						from
						until
							start_match > a_end or else subject.item (start_match-1) = '%N'
						loop
							start_match := start_match + 1
						end
					end
				elseif start_bits /= Void then
					-- Or to a non-unique first char after study
					from
					until
						start_match > a_end or else start_bits.is_in (subject.item (start_match))
					loop
						start_match := start_match + 1
					end
				end

				if req_char >= 0 then
					-- If req_char is set, we know that that character must
					-- appear in the subject for the match to succeed. If
					-- the first character is set, req_char must be later
					-- in the subject; otherwise the test starts at the
					-- match point. This ptimization can save a huge amount
					-- of backtracking in patterns with nested unlimited
					-- repeats that aren't going to match. We don't know
					-- what the state of case matching may be when this
					-- character is hit, so test for it in both its cases
					-- if necessary. However, the different cased versions
					-- will not be set up unless PCRE_CASELESS was given or
					-- the casing state changes within the regex.
					-- Writing separate code makes it go faster, as does
					-- using an autoincrement and backing off on a match.
					if first_char >= 0 then
						p := start_match + 1
					else
						p := start_match
					end

					-- We don't need to repeat the search if we haven't yet
					-- reached the we found it at last time.
					if p > req_char_ptr then
						if req_char = req_char2 then
							-- Do a single test if no case difference is set up
							from
							until
								p > a_end or else subject.item (p) = to_character (req_char)
							loop
								p := p + 1
							end
						else
							-- Otherwise test for either case
							from
							until
								p > a_end or else subject.item (p) = to_character (req_char)
									or else subject.item (p) = to_character (req_char2)
							loop
								p := p + 1
							end
						end

						if p > a_end then
							-- If we can't find the required character, break
							-- the matching loop
							stop := True
						else
							-- If we have found the required character, save
							-- the point where we found it, so that we don't
							-- search again next time round the loop if the
							-- start hasn't passed this character yet.
							req_char_ptr := p
						end
					end
				end

				if not stop then
					if matcher.match_start (start_match) then
						offset_vector.put (start_match, 0)
						offset_vector.put (subject_next_start, 1)
						match_count := match_count // 2
						stop := True
					else
						match_count := 0
						start_match := start_match + 1
						stop := is_anchored or else start_match > a_end
					end
				end
			end
		ensure
			matcher_active: is_matcher_active
			holding_ref: subject = a_subject
		end


invariant

	is_matcher_active implies is_compiled


end -- class RX_STRING
