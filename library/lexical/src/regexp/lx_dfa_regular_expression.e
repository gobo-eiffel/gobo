note

	description:
	"[
		Regular expressions implemented with DFA engines.
		See note clause in class LX_REGULAR_EXPRESSION
		about pattern syntax.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_DFA_REGULAR_EXPRESSION

inherit

	LX_REGULAR_EXPRESSION
		undefine
			recognizes
		redefine
			matches
		end

	LX_DFA_PATTERN_MATCHER
		redefine
			matches,
			match_substring,
			match_unbounded_substring
		end

create

	make,
	compile,
	compile_case_insensitive,
	compile_case_sensitive

feature -- Element change

	compile (a_regexp: READABLE_STRING_GENERAL; i: BOOLEAN)
			-- Compile `a_regexp'.
			-- Make the matching engine case-insensitive if `i' is set.
			-- Set `compiled' to True after successful compilation.
		local
			a_parser: LX_REGEXP_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: UT_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
			a_string: READABLE_STRING_GENERAL
			j, nb: INTEGER
		do
			wipe_out
			pattern := a_regexp
			is_case_insensitive := i
			create an_error_handler.make_null
			create a_description.make
			a_description.set_equiv_classes_used (True)
			a_description.set_meta_equiv_classes_used (False)
			a_description.set_full_table (True)
			a_description.set_case_insensitive (i)
			create a_parser.make_from_description (a_description, an_error_handler)
			nb := a_regexp.count
			if nb > 0 and then a_regexp.item (1) = '^' then
				has_caret := True
			else
				has_caret := False
			end
			if nb > 0 and then a_regexp.item (nb) = '$' then
				has_dollar := True
					-- Check whether the dollar sign has been escaped.
					-- If it's preceded by an odd number of backslashes,
					-- then the dollar sign is escaped and therefore stands
					-- for the dollar character and not as a meta-character.
				from
					j := nb - 1
				until
					j < 1 or else a_regexp.item (j) /= '\'
				loop
					has_dollar := not has_dollar
					j := j - 1
				end
			else
				has_dollar := False
			end
			if has_caret and has_dollar then
				if nb > 2 then
					a_string := a_regexp.substring (2, nb - 1)
				else
					a_string := ""
				end
			elseif has_caret then
				if nb > 1 then
					a_string := a_regexp.substring (2, nb)
				else
					a_string := ""
				end
			elseif has_dollar then
				if nb > 1 then
					a_string := a_regexp.substring (1, nb - 1)
				else
					a_string := ""
				end
			else
				a_string := a_regexp
			end
			a_parser.parse_string (a_string)
			if a_parser.successful then
				create a_dfa.make (a_description)
				a_full_tables := a_dfa
				yy_nxt := a_full_tables.yy_nxt
				yy_accept := a_full_tables.yy_accept
				yy_ec := a_full_tables.yy_ec
				yyNb_rows := a_full_tables.yyNb_rows
				yyNull_equiv_class := a_full_tables.yyNull_equiv_class
				yyMax_symbol_equiv_class := a_full_tables.yyMax_symbol_equiv_class
			else
				yy_nxt := Void
				yy_accept := Void
				yy_ec := Void
				yyNb_rows := 0
				yyNull_equiv_class := 0
				yyMax_symbol_equiv_class := 0
			end
		end

feature -- Status report

	matches (a_string: like subject): BOOLEAN
			-- Does `a_string' include a token of the language
			-- described by current regular expression?
		local
			i, nb: INTEGER
			e: INTEGER
		do
			nb := a_string.count
			set_subject (a_string)
			subject_start := 1
			subject_end := nb
			match_count := 0
			if has_caret then
				if has_dollar then
					if longest_end_position (a_string, 1) = nb then
						Result := True
						match_count := 1
						matched_start := 1
						matched_end := nb
					end
				else
					e := smallest_end_position (a_string, 1)
					if e /= -1 then
						Result := True
						match_count := 1
						matched_start := 1
						matched_end := e
					end
				end
			else
				if has_dollar then
					from
						i := 1
					until
						i > nb
					loop
						if longest_end_position (a_string, i) = nb then
							Result := True
							match_count := 1
							matched_start := i
							matched_end := nb
								-- Jump out of the loop.
							i := nb + 1
						else
							i := i + 1
						end
					end
				else
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
			end
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
			if has_caret then
				e := longest_end_position (a_subject, a_from)
				if has_dollar then
					if e = a_to then
						match_count := 1
						matched_start := 1
						matched_end := e
					end
				else
					if e /= -1 then
						match_count := 1
						matched_start := 1
						matched_end := e
					end
				end
			else
				if has_dollar then
					from
						i := a_from
					until
						i > a_to + 1
					loop
						e := longest_end_position (a_subject, i)
						if e = a_to then
							match_count := 1
							matched_start := i
							matched_end := e
								-- Jump out of the loop.
							i := a_to + 2
						else
							i := i + 1
						end
					end
				else
					from
						i := a_from
					until
						i > a_to + 1
					loop
						e := longest_end_position (a_subject, i)
						if e /= -1 then
							match_count := 1
							matched_start := i
							matched_end := e
								-- Jump out of the loop.
							i := a_to + 2
						else
							i := i + 1
						end
					end
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
			if (has_caret and a_from /= 1) or (has_dollar and a_to /= a_subject.count) then
				match_count := 0
				set_subject (a_subject)
				subject_start := a_from
				subject_end := a_to
			else
				match_substring (a_subject, a_from, a_to)
			end
		end

feature {NONE} -- Implementation

	has_caret: BOOLEAN
			-- Does current regular expression start with '^'?
			-- ('^' matches at start of string as a whole.)

	has_dollar: BOOLEAN
			-- Does current regular expression end with '$'?
			-- ('$' matches at end of string as a whole.)

end
