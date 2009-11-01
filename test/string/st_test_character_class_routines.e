indexing

	description:

		"Test features of ST_UNICODE_CHARACTER_CLASS_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_TEST_CHARACTER_CLASS_ROUTINES

inherit

	TS_TEST_CASE
	ST_UNICODE_CHARACTER_CLASS_ROUTINES

create

	make_default

feature -- Test

	test_categories is
			-- Test `is_upper_case', etc.
		do
			assert ("A is upper case", is_upper_case (65))
			assert ("@ is not upper case", not is_upper_case (64))
			assert ("a is not upper case", not is_upper_case (97))
			assert ("Roman numeral I is upper case", is_upper_case (8544))
			assert ("Roman numeral I is not Lu category", character_class (8544) /= Uppercase_letter_category)
			assert ("a is lower case", is_lower_case (97))
			assert ("Roman small numeral i is lower case", is_lower_case (8560))
			assert ("Roman small numeral i is not Ll category",  character_class (8560) /= Lowercase_letter_category)
			assert ("Dz-caron is title case", is_title_case (453))
			assert ("Small modifier h is modifier letter", is_modifier_letter (688))
			assert ("Aleph is other letter", is_other_letter (1488))
			assert ("Aleph is a letter", is_letter (1488))
			assert ("Aleph is alphabetic", is_alphabetic (1488))
			assert ("Unassigned code-point is not alphabetic", not is_alphabetic (196608))
			assert ("MAI HAN_AKAT is alphabetic", is_alphabetic (3633))
			assert ("MAI HAN_AKAT is not in letter categories", not is_letter (3633))
			assert ("Variation selector-253 is a non-spacing mark", is_nonspacing_mark (917996))
			-- this next character changed class between 5.0.0 and 5.0.1
			assert ("SYLOTI NAGRI SIGN DVISVARA is non-spacing mark", is_nonspacing_mark (43010))
			assert ("DEVANAGRI SIGN VISARGA is combining-spacing mark", is_combining_spacing_mark (2307))
			assert ("COMBINING ENCLOSING UPWARD POINTING TRIANGLE is an enclosing mark", is_enclosing_mark (8420))
			assert ("SYLOTI NAGRI SIGN DVISVARA is a mark", is_mark (43010))
			assert ("FULLWIDTH DIGIT ZERO is a decimal digit", is_decimal_digit (65296))
			assert ("GREEK ACROPHONIC ATTIC ONE QUARTER is a letter number", is_letter_number (65856))
			assert ("AEGEAN NUMBER THREE HUNDRED is an other number", is_other_number (65819))
			assert ("FULLWIDTH DIGIT ZERO is a number", is_number (65296))
			assert ("UNDERTIE is a connector", is_connector_punctuation (8255))
			assert ("DOUBLE OBLIQUE HYPHEN is a dash", is_dash_punctuation (11799))
			assert ("LEFT ANGLE BRACKET is an opening punctuation mark", is_open_punctuation (12296))
			assert ("RIGHT ANGLE BRACKET is a closing punctuation mark", is_close_punctuation (12297))
			assert ("LEFT LOW PARAPHRASE BRACKET is an initial quote", is_initial_quote_punctuation (11804))
			assert ("RIGHT LOW PARAPHRASE BRACKET is an final quote", is_final_quote_punctuation (11805))
			assert ("KATAKANA MIDDLE DOT is other punctuation", is_other_punctuation (12539))
			assert ("KATAKANA MIDDLE DOT is punctuation", is_punctuation (12539))
			assert ("GREEK PHI SYMBOL is maths symbol", is_math_symbol (981))
			assert ("HEBREW LETTER ALTERNATIVE PLUS SIGN is maths symbol", is_math_symbol (64297))
			assert ("RIAL SIGN is currency symbol", is_currency_symbol (65020))
			assert ("FULLWIDTH CIRCUMFLEX ACCENT is modifier symbol", is_modifier_symbol (65342))
			assert ("FULLWIDTH BROKEN BAR is other symbol", is_other_symbol (65508))
			assert ("HEBREW LETTER ALTERNATIVE PLUS SIGN is maths symbol", is_symbol (64297))
			assert ("IDEOGRAPHIC SPACE is space separator", is_space_separator (12288))
			assert ("LINE SEPARATOR is line separator", is_line_separator (8232))
			assert ("PARAGRAPH SEPARATOR is paragraph separator", is_paragraph_separator (8233))
			assert ("IDEOGRAPHIC SPACE is separator", is_separator (12288))
			assert ("BELL is control character", is_control (7))
			assert ("LEFT-TO-RIGHT EMBEDDING is format character", is_format (8234))
			assert ("Surrogate character", is_surrogate (55297))
			assert ("Private use character", is_private_use (57344))
		end

	test_decimal_digit_values is
			-- Test `decimal_digit_value'.
		do
			assert ("A is not decimal", not is_decimal_digit (65))
			assert ("FULLWIDTH DIGIT ZERO is a decimal digit", is_decimal_digit (65296))
			assert ("FULLWIDTH DIGIT ZERO has value zero", decimal_digit_value (65296) = 0)
			assert ("FULLWIDTH DIGIT FIVE is a decimal digit", is_decimal_digit (65301))
			assert ("FULLWIDTH DIGIT FIVE has value five", decimal_digit_value (65301) = 5)
		end

end
