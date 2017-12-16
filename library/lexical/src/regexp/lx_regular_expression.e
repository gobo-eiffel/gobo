note

	description:

		"Regular expressions"

	remark: "[
		Pattern syntax:
		x          match the character 'x'.
		.          any character except new-line.
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
		r*         zero or more r's, where r is any regular expression.
		r+         one or more r's.
		r?         zero or one r's (that is, "an optional r").
		r{2,5}     anywhere from two to five r's.
		r{2,}      two or more r's.
		r{4}       exactly four r's.
		"[xyz]\"foo"     the literal string: '[xyz]"foo'.
		(r)        match an r; parentheses are used to override precedence.
		rs         the regular expression r followed by the regular
		           expression s; called concatenation.
		--------------------------------------------------------------------
		r|s        either an r or an s.
		--------------------------------------------------------------------
		r/s        an r but only if it is followed by an s. The text matched
		           by s is included when determining whether this rule is
		           the 'longest match', but is not taken into account by
		           `matched_position'. So `matched_position' only sees the
		           text matched by r. This type of pattern is called
		           trailing context. (There are some combinations of r/s
		           that the regexp cannot match correctly, such as in
		           zx*/xy. See $GOBO/doc/gelex/limitations.html for details.)
		^r         an r, but only at the beginning of the input string or of
		           a line (i.e., when just starting to scan, or right after
		           a newline has been scanned).
		r$         an r, but only at the end of a line (i.e., just before a
		           new-line) or at the end of the input string. Equivalent
		           to r/\n. Note that regexp's notion of 'newline' is
		           exactly whatever the Eiffel compiler used to compile the
		           regexp interprets %%N as; in particular, on some DOS
		           systems you must either filter out \r's in the input
		           yourself, or explicitly use r/\r\n for r$.

		The regular expressions listed above are grouped according to
		precedence, from highest precedence at the top to lowest at the
		bottom. Those grouped together have equal precedence. For more
		details, see $GOBO/doc/gelex/patterns.html.
	]"
	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_REGULAR_EXPRESSION

inherit

	RX_REGULAR_EXPRESSION
		rename
			compile as compile_case_sensitive
		end

	LX_PATTERN_MATCHER

end
