indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_CONSTANTS


feature {NONE}

	Total_eight_bit_characters: INTEGER is
			-- we're eight bit down to the core. Sorry.
		once
			Result := 256
		end


feature {RE_CODER}

	return_true:  INTEGER is 1
	return_none:  INTEGER is 0
	return_false: INTEGER is -1

	caseless_mask:	BIT 8 is 00000001B
	multiline_mask: BIT 8 is 00000010B
	dotall_mask:	BIT 8 is 00000100B
	greedy_mask:	BIT 8 is 00001000B
	extended_mask:	BIT 8 is 00010000B
	ims_mask:		BIT 8 is 00000111B
	undef_mask:		BIT 8 is 10000000B


feature {REGULAR_EXPRESSION}

	op_end:				INTEGER is 0	-- End of pattern

			-- Values corresponding to backslashed metacharacters
	op_sod:				INTEGER is 1 -- Start of data: \A
	op_not_word_boundary:INTEGER is 2 -- \B
	op_word_boundary: INTEGER is 3 -- \b
	op_not_digit:		INTEGER is 4 -- \D
	op_digit:			INTEGER is 5 -- \d
	op_not_whitespace:INTEGER is 6 -- \S
	op_whitespace:		INTEGER is 7 -- \s
	op_not_wordchar:	INTEGER is 8 -- \W
	op_wordchar:		INTEGER is 9 -- \w
	op_eodn:				INTEGER is 10 -- End of data or \n at end of data: \Z.
	op_eod:				INTEGER is 11 -- End of data: \z

	op_opt:				INTEGER is 12 -- Set runtime options
	op_circ:				INTEGER is 13 -- Start of line - varies with multiline switch
	op_doll:				INTEGER is 14 -- End of line - varies with multiline switch
	op_any:				INTEGER is 15 -- Match any character
	op_chars:			INTEGER is 16 -- Match string of characters
	op_not:				INTEGER is 17 -- Match anything but the following char

	op_star:				INTEGER is 18 -- The maximizing and minimizing versions of
	op_minstar:			INTEGER is 19 -- all these opcodes must come in pairs, is with
	op_plus:				INTEGER is 20 -- the minimizing one second.
	op_minplus:			INTEGER is 21 -- This first set applies to single characters
	op_query:			INTEGER is 22
	op_minquery:		INTEGER is 23
	op_upto:				INTEGER is 24 -- From 0 to n matches
	op_minupto:			INTEGER is 25
	op_exact:			INTEGER is 26 -- Exactly n matches

	op_notstar:			INTEGER is 27 -- The maximizing and minimizing versions of
	op_notminstar:		INTEGER is 28 -- all these opcodes must come in pairs, is with
	op_notplus:			INTEGER is 29 -- the minimizing one second.
	op_notminplus:		INTEGER is 30 -- This first set applies to "not" single characters
	op_notquery:		INTEGER is 31
	op_notminquery:	INTEGER is 32
	op_notupto:			INTEGER is 33 -- From 0 to n matches
	op_notminupto:		INTEGER is 34
	op_notexact:		INTEGER is 35 -- Exactly n matches

	op_typestar:		INTEGER is 36 -- The maximizing and minimizing versions of
	op_typeminstar:	INTEGER is 37 -- all these opcodes must come in pairs, with
	op_typeplus:		INTEGER is 38 -- the minimizing one second. These codes must
	op_typeminplus:	INTEGER is 39 -- be in exactly the same order as those above.
	op_typequery:		INTEGER is 40 -- This set applies to character types such as \d
	op_typeminquery:	INTEGER is 41
	op_typeupto:		INTEGER is 42 -- From 0 to n matches
	op_typeminupto:	INTEGER is 43
	op_typeexact:		INTEGER is 44 -- Exactly n matches

	op_crstar:			INTEGER is 45 -- The maximizing and minimizing versions of
	op_crminstar:		INTEGER is 46 -- all these opcodes must come in pairs, with
	op_crplus:			INTEGER is 47 -- the minimizing one second. These codes must
	op_crminplus:		INTEGER is 48 -- be in exactly the same order as those above.
	op_crquery:			INTEGER is 49 -- These are for character classes and back refs
	op_crminquery:		INTEGER is 50
	op_crrange:			INTEGER is 51 -- These are different to the three seta above.
	op_crminrange:		INTEGER is 52

	op_class:			INTEGER is 53 -- Match a character class
	op_ref:				INTEGER is 54 -- Match a back reference
	op_recurse:			INTEGER is 55 -- Match this pattern recursively

	op_alt:				INTEGER is 56 -- Start of alternation
	op_ket:				INTEGER is 57 -- End of group that doesn't have an unbounded repeat
	op_ketrmax:			INTEGER is 58 -- These two must remain together and in this
	op_ketrmin:			INTEGER is 59 -- order. They are for groups the repeat for ever.

			-- The assertions must come before ONCE and COND

	op_assert:			INTEGER is 60 -- Positive lookahead
	op_assert_not:		INTEGER is 61 -- Negative lookahead
	op_assertback:		INTEGER is 62 -- Positive lookbehind
	op_assertback_not:INTEGER is 63 -- Negative lookbehind
	op_reverse:			INTEGER is 64 -- Move pointer back - used in lookbehind assertions

			-- ONCE and COND must come after the assertions, with ONCE
			-- first, as there's a test for >= ONCE for a subpattern that
			-- isn't an assertion.

	op_once:				INTEGER is 65 -- Once matched, is don't back up into the subpattern
	op_cond:				INTEGER is 66 -- Conditional group
	op_cref:				INTEGER is 67 -- Used to hold an extraction string number

	op_brazero:			INTEGER is 68 -- These two must remain together and in this
	op_braminzero:		INTEGER is 69 -- order.

	op_bra:				INTEGER is 70 -- This and greater values are used for brackets that	extract substrings.
	op_bra1:				INTEGER is 71

	extract_max:		INTEGER is 99 -- The highest extraction number. This is limited by the number of opcodes
			-- left after OP_BRA, i.e. 255 - OP_BRA. We actually set it somewhat lower.


feature {RX_STRING} -- Error constants

	err_msg_0:	STRING is "compilation successfully"

	err_msg_1:	STRING is "\ at end of pattern"
	err_msg_2:	STRING is "\c at end of pattern"
	err_msg_3:	STRING is "unrecognized character follows \"
	err_msg_4:	STRING is "numbers out of order in {} quantifier"
	err_msg_5:	STRING is "number too big in {} quantifier"
	err_msg_6:	STRING is "missing terminating ] for character class"
	err_msg_7:	STRING is "invalid escape sequence in character class"
	err_msg_8:	STRING is "range out of order in character class"
	err_msg_9:	STRING is "nothing to repeat"
	err_msg_10: STRING is "operand of unlimited repeat could match the empty string"
	err_msg_11: STRING is "internal error: unexpected repeat"
	err_msg_12: STRING is "unrecognized character after (?"
	err_msg_13: STRING is "too many capturing parenthesized sub-patterns"
	err_msg_14: STRING is "missing )"
	err_msg_15: STRING is "back reference to non-existent subpattern"
	err_msg_16: STRING is "erroffset passed as NULL"
	err_msg_17: STRING is "unknown option bit(s) set"
	err_msg_18: STRING is "missing ) after comment"
	err_msg_19: STRING is "too many sets of parentheses"
	err_msg_20: STRING is "regular expression too large"
	err_msg_21: STRING is "failed to get memory"
	err_msg_22: STRING is "unmatched parentheses"
	err_msg_23: STRING is "internal error: code overflow"
	err_msg_24: STRING is "unrecognized character after (?<"
	err_msg_25: STRING is "lookbehind assertion is not fixed length"
	err_msg_26: STRING is "malformed number after (?("
	err_msg_27: STRING is "conditional group contains more than two branches"
	err_msg_28: STRING is "assertion expected after (?("
	err_msg_29: STRING is "(?p must be followed by )"
	err_msg_30: STRING is "unknown POSIX class name"
	err_msg_31: STRING is "POSIX collating elements are not supported"
	err_msg_32: STRING is "this version of PCRE is not compiled with PCRE_UTF8 support"
	err_msg_33: STRING is "characters with values > 255 are not yet supported in classes"
	err_msg_34: STRING is "character value in \x{...} sequence is too large"
	err_msg_35: STRING is "invalid condition (?(0)"

	err_msg_51: STRING is "internal matcher error (invalid compiled code)"

	err_msg_99: STRING is "no pattern compiled"


end -- class RX_CONSTANTS
