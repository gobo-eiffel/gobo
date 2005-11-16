indexing

	description:

		"Unicode constants"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_CONSTANTS

inherit

	KL_SHARED_PLATFORM

feature -- Access

	minimum_unicode_character_code: INTEGER is 0
			-- Smallest code for unicode characters
--		ensure
--			definition: Result = 0
--		end

	maximum_unicode_character_code: INTEGER is 1114111
			-- Largest code for unicode characters (10FFFF);
			-- Includes final two non-characters.
--		ensure
--			definition: Result = 1114111
--		end

	minimum_unicode_surrogate_code: INTEGER is 55296
			-- Lowest unicode surrogate code-point (0xD800)
--		ensure
--			definition: Result = 55296
--		end

	maximum_unicode_surrogate_code: INTEGER is 57343
			-- Highest unicode surrogate code-point (0xDFFF)
--		ensure
--			definition: Result = 57343
--		end

	maximum_bmp_character_code: INTEGER is 65535
			-- Largest code for unicode characters in Basic Multi-lingual Plane (FFFF);
--		ensure
--			definition: Result = 65535
--		end

	minimum_ascii_character_code: INTEGER is 0
			-- Smallest code for ASCII characters
--		ensure
--			definition: Result = 0
--		end

	maximum_ascii_character_code: INTEGER is 127
			-- Largest code for ASCII characters
			-- (2^7 - 1)
--		ensure
--			definition: Result = 127
--			small_enough: Result <= Platform.Maximum_byte_code
--		end

	minimum_ascii_character: CHARACTER is '%/0/'
			-- Smallest ASCII character
--		ensure
--			definition: Result.code = minimum_ascii_code
--		end

	maximum_ascii_character: CHARACTER is '%/127/'
			-- Largest ASCII character
--		ensure
--			definition: Result.code = maximum_ascii_code
--		end

	Unassigned_other_category: INTEGER is 0
			-- Unassigned chacaracter

	Uppercase_letter_category: INTEGER is 1
			-- Upper case letter

	Lowercase_letter_category: INTEGER is 2
			-- Lower case letter

	Titlecase_letter_category: INTEGER is 3
			-- Title case letter

	Modifier_letter_category: INTEGER is 4
			-- Modifier letter

	Other_letter_category: INTEGER is 5
			-- Other letter

	Non_spacing_mark_category: INTEGER is 6
			-- Non-spacing mark

	Spacing_combining_mark_category: INTEGER is 7
			-- Spacing combining mark
	
	Enclosing_mark_category: INTEGER is 8
			-- Enclosing mark

	Decimal_digit_number_category: INTEGER is 9
			-- Decimal digit number

	Letter_number_category: INTEGER is 10
			-- Letter number

	Other_number_category: INTEGER is 11
			-- Other number

	Connector_punctuation_category: INTEGER is 12
			-- Connector punctuation

	Dash_punctuation_category: INTEGER is 13
			-- Dash punctuation

	Open_punctuation_category: INTEGER is 14
			-- Open punctuation

	Close_punctuation_category: INTEGER is 15
			-- Close punctuation

	Initial_quote_punctuation_category: INTEGER is 16
			-- Initial punctuation

	Final_quote_punctuation_category: INTEGER is 17
			-- Final_quote punctuation

	Other_punctuation_category: INTEGER is 18
			-- Other punctuation

	Math_symbol_category: INTEGER is 19
			-- Mathematics symbol

	Currency_symbol_category: INTEGER is 20
			-- Currency symbol

	Modifier_symbol_category: INTEGER is 21
			-- Modifier symbol

	Other_symbol_category: INTEGER is 22
			-- Other symbol

	Space_separator_category: INTEGER is 23
			-- Space separator

	Line_separator_category: INTEGER is 24
			-- Line separator

	Paragraph_separator_category: INTEGER is 25
			-- Paragraph separator

	Control_other_category: INTEGER is 26
			-- Control character

	Format_other_category: INTEGER is 27
			-- Format character

	Surrogate_other_category: INTEGER is 28
			-- Surrogate character

	Private_other_category: INTEGER is 29
			-- Private-use character

	Canonical_decomposition_mapping: INTEGER is 0
			-- Decomposition mapping is canonical

	Font_decomposition_mapping: INTEGER is 1
			-- Decomposition mapping for font variant

	No_break_decomposition_mapping: INTEGER is 2
			-- Decomposition mapping for no-break variant

	Initial_decomposition_mapping: INTEGER is 3
			-- Decomposition mapping for Arabic initial presentation form

	Medial_decomposition_mapping: INTEGER is 4
			-- Decomposition mapping for Arabic medial presentation form

	Final_decomposition_mapping: INTEGER is 5
			-- Decomposition mapping for Arabic final presentation form

	Isolated_decomposition_mapping: INTEGER is 6
			-- Decomposition mapping for Arabic isolated presentation form

	Encircled_decomposition_mapping: INTEGER is 7
			-- Decomposition mapping for encircled form

	Superscript_decomposition_mapping: INTEGER is 8
			-- Decomposition mapping for superscript form

	Subscript_decomposition_mapping: INTEGER is 9
			-- Decomposition mapping for subscript form

	Vertical_decomposition_mapping: INTEGER is 10
			-- Decomposition mapping for vertical layout presentation form

	Wide_decomposition_mapping: INTEGER is 11
			-- Decomposition mapping for wide (zenkaku) compatibility character

	Narrow_decomposition_mapping: INTEGER is 12
			-- Decomposition mapping for narrow (hankaku) compatibility character

	Small_decomposition_mapping: INTEGER is 13
			-- Decomposition mapping for small variant form (CNS compatibility)

	Square_decomposition_mapping: INTEGER is 14
			-- Decomposition mapping for CJK squared font variant

	Fraction_decomposition_mapping: INTEGER is 15
			-- Decomposition mapping for vulgar fraction form

	Compatibility_decomposition_mapping: INTEGER is 16
			-- Decomposition mapping for unspecified compatibility character

end
