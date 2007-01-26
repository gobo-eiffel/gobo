indexing

	description:

		"PCRE error constants"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_ERROR_CONSTANTS

feature -- Access

	err_msg_0: STRING is "compilation successfully"

	err_msg_1: STRING is "\ at end of pattern"

	err_msg_2: STRING is "\c at end of pattern"

	err_msg_3: STRING is "unrecognized character follows \"

	err_msg_4: STRING is "numbers out of order in {} quantifier"

	err_msg_5: STRING is "number too big in {} quantifier"

	err_msg_6: STRING is "missing terminating ] for character class"

	err_msg_7: STRING is "invalid escape sequence in character class"

	err_msg_8: STRING is "range out of order in character class"

	err_msg_9: STRING is "nothing to repeat"

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

end
