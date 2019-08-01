note

	description:
	"[
		Wildcards used in filename pattern matching.
		See note clause in class LX_PATTERN_MATCHER
		about Unicode vs. byte (8-bit character) modes.
	]"

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
		\x{2a3f}   the character with hexadecimal value 2a3f.
		\u03B2     the character with Unicode (hexadecimal) code U+03B2.
		\u{03B2}   the character with Unicode (hexadecimal) code U+03B2.
		[xyz]      a character class; in this case, the pattern matches
		           either an 'x', a 'y' or a 'z'.
		[abj-oZ]   a character class with a range in it; matches an 'a', a
		           'b', any letter from 'j' through 'o', or a 'Z'.
		[^A-Z]     a negated character class, i.e., any character but those
		           in the class. In this case, any character except an
		           uppercase letter.
		[^A-Z\n]   any character except an uppercase letter or a newline.
		[ab]{+}[bc]      the union of character classes ([abc])
		[a-z]{-}[aeiouy] the subtraction of character classes (consonants)
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
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_WILDCARD

inherit

	LX_PATTERN_MATCHER

end
