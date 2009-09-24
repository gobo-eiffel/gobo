indexing

	description:

		"Wildcards implemented with DFA engines"

	remark: "[
		Pattern syntax:
		x          match the character 'x'.
		?          any character except '/'.
		*          zero or more occurrences of any character except '/'.
		**/        zero or more occurrences of (one or more characters other
		           than '/', followed by '/').
		\X         if 'X' is an 'a', 'b', 'f', 'n', 'r', 't', or 'v', then
		           the ANSI-C interpretation of \X. Otherwise, a literal 'X'
		           (used to escape operators such as '*').
		\0         a null character (ASCII code 0).
		\123       the character with octal value 123.
		\x2a       the character with hexadecimal value 2a.
		[xyz]      a character class; in this case, the pattern matches
		           either an 'x', a 'y' or a 'z'.
		[abj-oZ]   a character class with a range in it; matches an 'a', a
		           'b', any letter from 'j' through 'o', or a 'Z'.
		[^A-Z]     a negated character class, i.e., any character but those
		           in the class. In this case, any character except an
		           uppercase letter.
		[^A-Z\n]   any character except an uppercase letter or a newline.
		wv         the wildcard w followed by the wildcard v; called
		           concatenation.
		"[xyz]\"foo"     the literal string: '[xyz]"foo'.
		?(pattern-list)  zero or one occurrence of the given patterns.
		*(pattern-list)  zero or more occurrences of the given patterns.
		+(pattern-list)  one or more occurrences of the given patterns.
		@(pattern-list)  exactly one of the given patterns.
		                 where pattern-list is a list of one or more
		                 patterns separated by a '|'.
	]"
	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision:   "$Revision$"

class LX_DFA_WILDCARD

inherit

	LX_WILDCARD
		undefine
			matches,
			recognizes
		end

	LX_DFA_PATTERN_MATCHER

create

	make,
	compile,
	compile_case_insensitive,
	compile_case_sensitive

feature -- Element change

	compile (a_pattern: STRING; i: BOOLEAN) is
			-- Compile `a_pattern'. Make the matching engine
			-- case-insensitive if `i' is set. Set `compiled'
			-- to True after successful compilation.
		local
			a_parser: LX_WILDCARD_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: UT_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
		do
			wipe_out
			pattern := a_pattern
			is_case_insensitive := i
			create an_error_handler.make_null
			create a_description.make
			a_description.set_equiv_classes_used (False)
			a_description.set_meta_equiv_classes_used (False)
			a_description.set_full_table (True)
			a_description.set_case_insensitive (i)
			create a_parser.make_from_description (a_description, an_error_handler)
			a_parser.parse_string (a_pattern)
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

end
