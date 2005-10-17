indexing

	description:

		"Test features of class UC_UNICODE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class UC_TEST_UNICODE_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UNICODE_ROUTINES
	UC_CHARACTER_CLASS_ROUTINES

feature

	test_valid_code is
			-- Test code range routines.
		do
			assert ("ascii_negative", not unicode.valid_ascii_code (-1))
			assert ("ascii_positive", not unicode.valid_ascii_code (128))
			assert ("unicode_negative", not unicode.valid_code (-1))
		end

	test_ascii_string is
			-- Test `is_ascii_string'.
		do
			assert ("ascii", unicode.is_ascii_string ("a"))
			assert ("not_ascii", not unicode.is_ascii_string ("%/130/"))
		end

	test_code_to_string is
			-- Test `code_to_string'.
		do
			assert ("code_to_string_ascii", unicode.code_to_string (97).item (1) = 'a')
			assert ("code_to_string_unicode", unicode.code_to_string (1000).item_code (1) = 1000)
		end

	test_categories is
			-- Test `is_upper_case etc.'.
		do
			assert ("A is upper case", is_upper_case (65))
			assert ("a is not upper case", not is_upper_case (97))
			assert ("a is lower case", is_lower_case (97))
			assert ("Dz-caron is title case", is_title_case (453))
			assert ("Small modifier h is modifier letter", is_modifier_letter (688))
			assert ("Aleph is other letter", is_other_letter (1488))
			assert ("Aleph is a letter", is_letter (1488))
			assert ("Variation selector-253 is a non-spacing mark", is_nonspacing_mark (917996))
			assert ("SYLOTI NAGRI SIGN DVISVARA is a combining mark", is_combining_spacing_mark (43010))
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
