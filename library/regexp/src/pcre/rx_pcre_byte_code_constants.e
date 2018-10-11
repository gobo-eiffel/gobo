note

	description:

		"PCRE byte code constants"

	remark: "[
		The maximizing and minimizing versions of opcodes (e.g. 'op_foo'
		and 'op_minfoo') must come in pair, with the minimizing in second
		position. Furthermore, sets 'op_*star', 'op_*plus', 'op_*query'
		'op_*upto', op_*exact' should be in that order.
	]"
	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2018, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_BYTE_CODE_CONSTANTS

feature -- End of pattern

	op_end: INTEGER = 0
			-- End of pattern;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

feature -- Backslashed metacharacters

	op_sod: INTEGER = 1
			-- Start of data: \A;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_not_word_boundary: INTEGER = 2
			-- \B;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_word_boundary: INTEGER = 3
			-- \b;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_not_digit: INTEGER = 4
			-- \D;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_digit: INTEGER = 5
			-- \d;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_not_whitespace: INTEGER = 6
			-- \S;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_whitespace: INTEGER = 7
			-- \s;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_not_wordchar: INTEGER = 8
			-- \W;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_wordchar: INTEGER = 9
			-- \w;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_eodn: INTEGER = 10
			-- End of data or \n at end of data: \Z;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_eod: INTEGER = 11
			-- End of data: \z;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

feature -- Metacharacters

	op_opt: INTEGER = 12
			-- Set runtime options;
			-- This opcode is followed by an integer (originally a byte,
			-- i.e. 8 bits) in which the options are encoded.

	op_circ: INTEGER = 13
			-- Start of line - varies with multiline switch;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_doll: INTEGER = 14
			-- End of line - varies with multiline switch;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_any: INTEGER = 15
			-- Match any character;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_chars: INTEGER = 16
			-- Match string of characters;
			-- This opcode is followed by an integer (originally an int8)
			-- corresponding to the number of characters (originally bytes)
			-- making up the string and which follows on the byte code.

	op_not: INTEGER = 17
			-- Match anything but the following character;
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

feature -- Maximizing and minimizing applied to single characters

	op_star: INTEGER = 18
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_minstar: INTEGER = 19
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_plus: INTEGER = 20
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_minplus: INTEGER = 21
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_query: INTEGER = 22
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_minquery: INTEGER = 23
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_upto: INTEGER = 24
			-- From 0 to n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

	op_minupto: INTEGER = 25
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

	op_exact: INTEGER = 26
			-- Exactly n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

feature -- Maximizing and minimizing applied to "not" single characters

	op_notstar: INTEGER = 27
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notminstar: INTEGER = 28
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notplus: INTEGER = 29
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notminplus: INTEGER = 30
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notquery: INTEGER = 31
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notminquery: INTEGER = 32
			-- This opcode is followed by a character code (originally a
			-- character) corresponding to the character this opcode is
			-- applied to.

	op_notupto: INTEGER = 33
			-- From 0 to n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

	op_notminupto: INTEGER = 34
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

	op_notexact: INTEGER = 35
			-- Exactly n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then a character
			-- code (originally a character) corresponding to the character
			-- this opcode is applied to.

feature -- Maximizing and minimizing applied to character types such as \d

	op_typestar: INTEGER = 36
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typeminstar: INTEGER = 37
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typeplus: INTEGER = 38
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typeminplus: INTEGER = 39
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typequery: INTEGER = 40
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typeminquery: INTEGER = 41
			-- This opcode is followed by an opcode (originally a character)
			-- corresponding to the character type (such as \d) this opcode
			-- is applied to.

	op_typeupto: INTEGER = 42
			-- From 0 to n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then an opcode
			-- (originally a character) corresponding to the character type
			-- (such as \d) this opcode is applied to.

	op_typeminupto: INTEGER = 43
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then an opcode
			-- (originally a character) corresponding to the character type
			-- (such as \d) this opcode is applied to.

	op_typeexact: INTEGER = 44
			-- Exactly n matches;
			-- This opcode is followed by an integer (originally an int16)
			-- corresponding to the number of matches, and then an opcode
			-- (originally a character) corresponding to the character type
			-- (such as \d) this opcode is applied to.

feature -- Maximizing and minimizing applied to character classes and back refs

	op_crstar: INTEGER = 45
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crminstar: INTEGER = 46
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crplus: INTEGER = 47
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crminplus: INTEGER = 48
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crquery: INTEGER = 49
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crminquery: INTEGER = 50
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_crrange: INTEGER = 51
			-- `op_crrange' and `op_crminrange' are different to the three sets above.
			-- This opcode is followed by two integers (originally two int16)
			-- corresponding to the lower and upper bounds of the range.

	op_crminrange: INTEGER = 52
			-- `op_crrange' and `op_crminrange' are different to the three sets above.
			-- This opcode is followed by two integers (originally two int16)
			-- corresponding to the lower and upper bounds of the range.

feature -- Miscellaneous

	op_class: INTEGER = 53
			-- Match a character class;
			-- This opcode is followed by an integer corresponding to an
			-- offset in the array of character sets. Furthermore, this
			-- opcode can optionally be followed by on the the following:
			-- `op_crstar', `op_crminstar', `op_crplus', `op_crminplus',
			-- `op_crquery', `op_crminquery', `op_crrange', `op_crminrange'.

	op_ref: INTEGER = 54
			-- Match a back reference;
			-- This opcode is followed by an integer (originally an int8)
			-- corresponding to the id of the back reference. Furthermore,
			-- this opcode can optionally be followed by on the the following:
			-- `op_crstar', `op_crminstar', `op_crplus', `op_crminplus',
			-- `op_crquery', `op_crminquery', `op_crrange', `op_crminrange'.

	op_recurse: INTEGER = 55
			-- Match this pattern recursively;
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_alt: INTEGER = 56
			-- Start of alternation;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.

	op_ket: INTEGER = 57
			-- End of group that doesn't have an unbounded repeat;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the whole bracket branch in the byte code.

	op_ketrmax: INTEGER = 58
			-- `op_ketrmax' and `op_ketrmin' must remain together and
			-- in this order. They are for groups that repeat forever.
			-- This opcode is followed by an integer (originally an int16).

	op_ketrmin: INTEGER = 59
			-- `op_ketrmax' and `op_ketrmin' must remain together and
			-- in this order. They are for groups that repeat forever.
			-- This opcode is followed by an integer (originally an int16).

	op_assert: INTEGER = 60
			-- Positive lookahead assertion;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (Assertions must come before `op_once' and `op_cond'.)

	op_assert_not: INTEGER = 61
			-- Negative lookahead assertion;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (Assertions must come before `op_once' and `op_cond'.)

	op_assertback: INTEGER = 62
			-- Positive lookbehind assertion;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (Assertions must come before `op_once' and `op_cond'.)

	op_assertback_not: INTEGER = 63
			-- Negative lookbehind assertion;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (Assertions must come before `op_once' and `op_cond'.)

	op_reverse: INTEGER = 64
			-- Move pointer back - used in lookbehind assertions;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the fixed-length of the string that underlying branch matches.

	op_once: INTEGER = 65
			-- Once matched, don't back up into the subpattern;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (`op_once' and `op_cond' must come after the assertions, with `op_once' first,
			-- as there is a test for >= `op_once' for a subpattern that isn't an assertion.)

	op_cond: INTEGER = 66
			-- Conditional group;
			-- This opcode is followed by an integer (originally an int16) corresponding
			-- to the length of the underlying branch in the byte code.
			-- (`op_once' and `op_cond' must come after the assertions, with `op_once' first,
			-- as there is a test for >= `op_once' for a subpattern that isn't an assertion.)

	op_cref: INTEGER = 67
			-- At the start of a reference-based conditional group;
			-- This opcode is followed by an integer (originally an int8)
			-- corresponding to the reference number.

	op_brazero: INTEGER = 68
			-- `op_brazero' and `op_braminzero' must remain together and in this order.
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_braminzero: INTEGER = 69
			-- `op_brazero' and `op_braminzero' must remain together and in this order.
			-- This opcode is standalone (i.e. does not need to be followed
			-- by something else in the byte code).

	op_bra: INTEGER = 70
			-- This and greater values are used for brackets that extract substrings.
			-- Opcodes greater than or equal to `op_bra' are followed by an integer
			-- (originally an int16) corresponding to the length of the underlying
			-- branch in the byte code.

	op_bra1: INTEGER = 71

feature -- Constants

	extract_max: INTEGER = 99
			-- Highest extraction number. This is limited by the number of opcodes left
			-- after `op_bra', i.e. 255 - `op_bra'. It is actually set somewhat lower.

feature -- Access

	op_name (an_op: INTEGER): STRING
			-- Name associated with opcode `an_op'
		do
			inspect an_op
			when op_end then
				Result := "End"
			when op_sod then
				Result := "\A"
			when op_not_word_boundary then
				Result := "\B"
			when op_word_boundary then
				Result := "\b"
			when op_not_digit then
				Result := "\D"
			when op_digit then
				Result := "\d"
			when op_not_whitespace then
				Result := "\S"
			when op_whitespace then
				Result := "\s"
			when op_not_wordchar then
				Result := "\W"
			when op_wordchar then
				Result := "\w"
			when op_eodn then
				Result := "\Z"
			when op_eod then
				Result := "\z"
			when op_opt then
				Result := "Opt"
			when op_circ then
				Result := "^"
			when op_doll then
				Result := "$"
			when op_any then
				Result := "Any"
			when op_chars then
				Result := "chars"
			when op_not then
				Result := "not"
			when op_star, op_notstar, op_typestar, op_crstar then
				Result := "*"
			when op_minstar, op_notminstar, op_typeminstar, op_crminstar then
				Result := "*?"
			when op_plus, op_notplus, op_typeplus, op_crplus then
				Result := "+"
			when op_minplus, op_notminplus, op_typeminplus, op_crminplus then
				Result := "+?"
			when op_query, op_notquery, op_typequery, op_crquery then
				Result := "?"
			when op_minquery, op_notminquery, op_typeminquery, op_crminquery then
				Result := "??"
			when op_upto, op_minupto, op_exact, op_notupto, op_notminupto, op_notexact, op_typeupto, op_typeminupto, op_typeexact, op_crrange, op_crminrange then
				Result := "{"
			when op_class then
				Result := "class"
			when op_ref then
				Result := "Ref"
			when op_recurse then
				Result := "Recurse"
			when op_alt then
				Result := "Alt"
			when op_ket then
				Result := "Ket"
			when op_ketrmax then
				Result := "KetRmax"
			when op_ketrmin then
				Result := "KetRmin"
			when op_assert then
				Result := "Assert"
			when op_assert_not then
				Result := "Assert not"
			when op_assertback then
				Result := "AssertB"
			when op_assertback_not then
				Result := "AssertB not"
			when op_reverse then
				Result := "Reverse"
			when op_once then
				Result := "Once"
			when op_cond then
				Result := "Cond"
			when op_cref then
				Result := "Cref"
			when op_brazero then
				Result := "Brazero"
			when op_braminzero then
				Result := "Braminzero"
			when op_bra then
				Result := "Bra"
			else
				if an_op > op_bra then
					Result := "Bra" + (an_op - op_bra).out
				else
					Result := "unknown opcode"
				end
			end
		ensure
			instance_free: class
			op_name_not_void: Result /= Void
		end

end
