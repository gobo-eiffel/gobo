note

	description:

		"Pattern matchers implemented with DFA engines"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_DFA_PATTERN_MATCHER

inherit

	LX_PATTERN_MATCHER
		redefine
			matches,
			recognizes
		end

feature -- Status report

	is_compiled: BOOLEAN
			-- Has pattern been sucessfully compiled?
		do
			Result := yy_nxt /= Void and yy_accept /= Void
		ensure then
			yy_nxt_not_void: Result implies yy_nxt /= Void
			yy_accept_not_void: Result implies yy_accept /= Void
		end

	matches (a_string: like subject): BOOLEAN
			-- Does `a_string' include a token of the language
			-- described by current pattern?
		local
			i, nb: INTEGER
			e: INTEGER
		do
			nb := a_string.count
			set_subject (a_string)
			subject_start := 1
			subject_end := nb
			match_count := 0
			from
				i := 1
			until
				i > nb
			loop
				e := smallest_end_position (a_string, i)
				if e /= -1 then
					Result := True
					match_count := 1
					matched_start := i
					matched_end := e
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

	recognizes (a_string: like subject): BOOLEAN
			-- Is `a_string' a token of the language
			-- described by current pattern?
		local
			nb: INTEGER
		do
			nb := a_string.count
			set_subject (a_string)
			subject_start := 1
			subject_end := nb
			if longest_end_position (a_string, 1) = nb then
				Result := True
				match_count := 1
				matched_start := 1
				matched_end := nb
			else
				match_count := 0
			end
		end

feature -- Access

	captured_start_position (n: INTEGER): INTEGER
			-- Start position of the `n'-th captured substring;
			-- 'n = 0' represents the whole matched string.
			-- Return 0 if undefined captured substring.
		do
			Result := matched_start
		end

	captured_end_position (n: INTEGER): INTEGER
			-- End position of the `n'-th captured substring;
			-- 'n = 0' represents the whole matched string.
			-- Return -1 if undefined captured substring.
		do
			Result := matched_end
		end

feature -- Matching

	match_substring (a_subject: like subject; a_from, a_to: INTEGER)
			-- Try to match the substring of `a_subject' between
			-- positions `a_from' and `a_to' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.
		local
			i, e: INTEGER
		do
			match_count := 0
			set_subject (a_subject)
			subject_start := a_from
			subject_end := a_to
			from
				i := a_from
			until
				i > a_to
			loop
				e := longest_end_position (a_subject, i)
				if e /= -1 then
					match_count := 1
					matched_start := i
					matched_end := e
						-- Jump out of the loop.
					i := a_to + 1
				else
					i := i + 1
				end
			end
		end

	match_unbounded_substring (a_subject: like subject; a_from, a_to: INTEGER)
			-- Try to match the substring of `a_subject' between
			-- positions `a_from' and `a_to' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.
			--
			-- Note that if `a_from' is not 1, then ^ will not match at position `a_from'.
			-- And if `a_to' is not `a_subject.count' then $ will not match at position `a_to'.
		do
			match_substring (a_subject, a_from, a_to)
		end

feature -- Resetting

	reset
			-- Reset the pattern.
		do
			pattern := Void
			is_case_insensitive := False
			wipe_out
			yy_nxt := Void
			yy_accept := Void
			yy_ec := Void
			yyNb_rows := 0
			yyNull_equiv_class := 0
			yyMax_symbol_equiv_class := 0
		end

feature {NONE} -- Matching

	matched_start: INTEGER
			-- Start position of the last match

	matched_end: INTEGER
			-- End position of the last match

	smallest_end_position (a_string: like subject; start_pos: INTEGER): INTEGER
			-- Position of the last character of the smallest
			-- token in `a_string' starting at position `start_pos'
			-- and matched by current pattern;
			-- -1 if no such token exists
		require
			compiled: is_compiled
			a_string_not_void: a_string /= Void
			valid_start_pos: start_pos >= 1 and start_pos <= a_string.count + 1
		local
			i, nb: INTEGER
			l_state: INTEGER
			l_code: NATURAL_32
			l_symbol: INTEGER
			l_yy_nxt: like yy_nxt
			l_yy_accept: like yy_accept
			l_yy_ec: like yy_ec
		do
			l_yy_nxt := yy_nxt
			l_yy_accept := yy_accept
			if l_yy_nxt = Void or l_yy_accept = Void then
				check is_compiled: False end
				Result := -1
			else
				l_yy_ec := yy_ec
				from
					i := start_pos
					nb := a_string.count
					l_state := 1
					if l_yy_accept.item (l_state) /= 0 then
						Result := i - 1
					else
						Result := -1
					end
				until
					Result /= -1 or i > nb
				loop
					l_code := a_string.code (i)
					if l_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code then
						l_symbol := l_code.to_integer_32
					elseif l_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
							-- Surrogate.
						l_symbol := -1
					elseif l_code > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
							-- Invalid Unicode character.
						l_symbol := -1
					else
						l_symbol := l_code.to_integer_32
						l_symbol := l_symbol - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
					end
					if l_symbol >= 0 then
						if l_symbol = 0 then
							l_symbol := yyNull_equiv_class
						else
							if l_symbol > yyMax_symbol_equiv_class then
								l_symbol := yyMax_symbol_equiv_class
							end
							if l_yy_ec /= Void then
								l_symbol := l_yy_ec.item (l_symbol)
							end
						end
						l_state := l_yy_nxt.item (l_state * yyNb_rows + l_symbol)
						if l_state > 0 then
							if l_yy_accept.item (l_state) /= 0 then
								Result := i
							else
								i := i + 1
							end
						else
							i := nb + 1
						end
					else
						i := nb + 1
					end
				end
			end
		ensure
			valid_position: Result /= -1 implies (start_pos <= Result + 1 and Result <= a_string.count)
		end

	longest_end_position (a_string: like subject; start_pos: INTEGER): INTEGER
			-- Position of the last character of the longest
			-- token in `a_string' starting at position `start_pos'
			-- and matched by current pattern;
			-- -1 if no such token exists
		require
			compiled: is_compiled
			a_string_not_void: a_string /= Void
			valid_start_pos: start_pos >= 1 and start_pos <= a_string.count + 1
		local
			i, nb: INTEGER
			l_state: INTEGER
			l_code: NATURAL_32
			l_symbol: INTEGER
			l_yy_nxt: like yy_nxt
			l_yy_accept: like yy_accept
			l_yy_ec: like yy_ec
		do
			l_yy_nxt := yy_nxt
			l_yy_accept := yy_accept
			if l_yy_nxt = Void or l_yy_accept = Void then
				check is_compiled: False end
				Result := -1
			else
				l_yy_ec := yy_ec
				from
					i := start_pos
					nb := a_string.count
					l_state := 1
					if l_yy_accept.item (l_state) /= 0 then
						Result := i - 1
					else
						Result := -1
					end
				until
					i > nb
				loop
					l_code := a_string.code (i)
					if l_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code then
						l_symbol := l_code.to_integer_32
					elseif l_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
							-- Surrogate.
						l_symbol := -1
					elseif l_code > {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
							-- Invalid Unicode character.
						l_symbol := -1
					else
						l_symbol := l_code.to_integer_32
						l_symbol := l_symbol - {UC_UNICODE_CONSTANTS}.unicode_surrogate_count
					end
					if l_symbol >= 0 then
						if l_symbol = 0 then
							l_symbol := yyNull_equiv_class
						else
							if l_symbol > yyMax_symbol_equiv_class then
								l_symbol := yyMax_symbol_equiv_class
							end
							if l_yy_ec /= Void then
								l_symbol := l_yy_ec.item (l_symbol)
							end
						end
						l_state := l_yy_nxt.item (l_state * yyNb_rows + l_symbol)
						if l_state > 0 then
							if l_yy_accept.item (l_state) /= 0 then
								Result := i
							end
							i := i + 1
						else
							i := nb + 1
						end
					else
						i := nb + 1
					end
				end
			end
		ensure
			valid_position: Result /= -1 implies (start_pos <= Result + 1 and Result <= a_string.count)
		end

feature {NONE} -- Engine Data

	yy_nxt: detachable ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_accept: detachable ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

	yy_ec: detachable ARRAY [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yyNb_rows: INTEGER
			-- Number of rows in `yy_nxt'

	yyNull_equiv_class: INTEGER
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

end
