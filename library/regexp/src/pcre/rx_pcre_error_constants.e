note

	description:

		"PCRE error constants"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_ERROR_CONSTANTS

feature -- Access

	err_msg_0: STRING = "compilation successfully"

	err_msg_1: STRING = "\ at end of pattern"

	err_msg_2: STRING = "\c at end of pattern"

	err_msg_3: STRING = "unrecognized character follows \"

	err_msg_4: STRING = "numbers out of order in {} quantifier"

	err_msg_5: STRING = "number too big in {} quantifier"

	err_msg_6: STRING = "missing terminating ] for character class"

	err_msg_7: STRING = "invalid escape sequence in character class"

	err_msg_8: STRING = "range out of order in character class"

	err_msg_9: STRING = "nothing to repeat"

	err_msg_10: STRING = "operand of unlimited repeat could match the empty string"

	err_msg_11: STRING = "internal error: unexpected repeat"

	err_msg_12: STRING = "unrecognized character after (?"

	err_msg_13: STRING = "too many capturing parenthesized sub-patterns"

	err_msg_14: STRING = "missing )"

	err_msg_15: STRING = "back reference to non-existent subpattern"

	err_msg_16: STRING = "erroffset passed as NULL"

	err_msg_17: STRING = "unknown option bit(s) set"

	err_msg_18: STRING = "missing ) after comment"

	err_msg_19: STRING = "too many sets of parentheses"

	err_msg_20: STRING = "regular expression too large"

	err_msg_21: STRING = "failed to get memory"

	err_msg_22: STRING = "unmatched parentheses"

	err_msg_23: STRING = "internal error: code overflow"

	err_msg_24: STRING = "unrecognized character after (?<"

	err_msg_25: STRING = "lookbehind assertion is not fixed length"

	err_msg_26: STRING = "malformed number after (?("

	err_msg_27: STRING = "conditional group contains more than two branches"

	err_msg_28: STRING = "assertion expected after (?("

	err_msg_29: STRING = "(?p must be followed by )"

	err_msg_30: STRING = "unknown POSIX class name"

	err_msg_31: STRING = "POSIX collating elements are not supported"

	err_msg_32: STRING = "this version of PCRE is not compiled with PCRE_UTF8 support"

	err_msg_33: STRING = "characters with values > 255 are not yet supported in classes"

	err_msg_34: STRING = "character value in \x{...} sequence is too large"

	err_msg_35: STRING = "invalid condition (?(0)"

	err_msg_51: STRING = "internal matcher error (invalid compiled code)"

	err_msg_99: STRING = "no pattern compiled"

end
