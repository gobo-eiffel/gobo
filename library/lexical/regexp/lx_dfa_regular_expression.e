indexing

	description:

		"Regular expressions implemented with DFA engines"

	remark:

		"Pattern syntax:                                                       %
		% x          match the character 'x'.                                  %
		% .          any character except new-line.                            %
		%            than '/', followed by '/').                               %
		% \X         if 'X' is an 'a', 'b', 'f', 'n', 'r', 't', or 'v', then   %
		%            the ANSI-C interpretation of \X. Otherwise, a literal 'X' %
		%            (used to escape operators such as '*').                   %
		% \0         a null character (ASCII code 0).                          %
		% \123       the character with octal value 123.                       %
		% \x2a       the character with hexadecimal value 2a.                  %
		% [xyz]      a character class; in this case, the pattern matches      %
		%            either an 'x', a 'y' or a 'z'.                            %
		% [abj-oZ]   a character class with a range in it; matches an 'a', a   %
		%            'b', any letter from 'j' through 'o', or a 'Z'.           %
		% [^A-Z]     a negated character class, i.e., any character but those  %
		%            in the class. In this case, any character except an       %
		%            uppercase letter.                                         %
		% [^A-Z\n]   any character except an uppercase letter or a newline.    %
		% r*         zero or more r's, where r is any regular expression.      %
		% r+         one or more r's.                                          %
		% r?         zero or one r's (that is, %"an optional r%").             %
		% r{2,5}     anywhere from two to five r's.                            %
		% r{2,}      two or more r's.                                          %
		% r{4}       exactly four r's.                                         %
		% %"[xyz]\%"foo%"     the literal string: '[xyz]%"foo'.                %
		% (r)        match an r; parentheses are used to override precedence.  %
		% rs         the regular expression r followed by the regular          %
		%            expression s; called concatenation.                       %
		% -------------------------------------------------------------------- %
		% r|s        either an r or an s.                                      %
		% -------------------------------------------------------------------- %
		% r/s        an r but only if it is followed by an s. The text matched %
		%            by s is included when determining whether this rule is    %
		%            the 'longest match', but is not taken into account by     %
		%            `matched_position'. So `matched_position' only sees the   %
		%            text matched by r. This type of pattern is called         %
		%            trailing context. (There are some combinations of r/s     %
		%            that the regexp cannot match correctly, such as in        %
		%            zx*/xy. See $GOBO/doc/gelex/limitations.html for details.)%
		% ^r         an r, but only at the beginning of the input string or of %
		%            a line (i.e., when just starting to scan, or right after  %
		%            a newline has been scanned).                              %
		% r$         an r, but only at the end of a line (i.e., just before a  %
		%            new-line) or at the end of the input string. Equivalent   %
		%            to r/\n. Note that regexp's notion of 'newline' is        %
		%            exactly whatever the Eiffel compiler used to compile the  %
		%            regexp interprets %%N as; in particular, on some DOS      %
		%            systems you must either filter out \r's in the input      %
		%            yourself, or explicitly use r/\r\n for r$.                %
		%                                                                      %
		% The regular expressions listed above are grouped according to        %
		% precedence, from highest precedence at the top to lowest at the      %
		% bottom. Those grouped together have equal precedence. For more       %
		% details, see $GOBO/doc/gelex/patterns.html.                          "

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class LX_DFA_REGULAR_EXPRESSION

inherit

	LX_REGULAR_EXPRESSION
		undefine
			matches, recognizes
		end

	LX_DFA_PATTERN_MATCHER
		redefine
			matches, match_substring
		end

create

	make, compile, compile_case_insensitive, compile_case_sensitive

feature -- Element change

	compile (a_regexp: STRING; i: BOOLEAN) is
			-- Compile `a_regexp'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		local
			a_parser: LX_REGEXP_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: UT_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
			a_string: STRING
			nb: INTEGER
		do
			wipe_out
			create an_error_handler.make_null
			create a_description.make
			a_description.set_equiv_classes_used (False)
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
				yyNb_rows := a_full_tables.yyNb_rows
			else
				yy_nxt := Void
				yy_accept := Void
			end
		end

feature -- Status report

	matches (a_string: STRING): BOOLEAN is
			-- Does `a_string' include a token of the language
			-- described by current regular expression?
		local
			i, nb: INTEGER
			e: INTEGER
		do
			nb := a_string.count
			subject := a_string
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
					from i := 1 until i > nb loop
						if longest_end_position (a_string, i) = nb then
							Result := True
							match_count := 1
							matched_start := i
							matched_end := nb
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				else
					from i := 1 until i > nb loop
						e := smallest_end_position (a_string, i)
						if e /= -1 then
							Result := True
							match_count := 1
							matched_start := i
							matched_end := e
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

feature -- Matching

	match_substring (a_subject: STRING; a_from, a_to: INTEGER) is
			-- Try to match the substring of `a_subject' between
			-- positions `a_from' and `a_to' with the current pattern.
			-- Make result available in `has_matched' and the various
			-- `*_captured_*' features.
		local
			i, e: INTEGER
		do
			match_count := 0
			subject := a_subject
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
					from i := a_from until i > a_to loop
						e := longest_end_position (a_subject, i)
						if e = a_to then
							match_count := 1
							matched_start := i
							matched_end := e
							i := a_to + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				else
					from i := a_from until i > a_to loop
						e := longest_end_position (a_subject, i)
						if e /= -1 then
							match_count := 1
							matched_start := i
							matched_end := e
							i := a_to + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
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
