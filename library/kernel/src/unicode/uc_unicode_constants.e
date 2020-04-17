note

	description:

		"Unicode constants"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UNICODE_CONSTANTS

inherit

	KL_SHARED_PLATFORM

feature -- Access

	bom_character: CHARACTER_32
			-- Byte order mark (BOM) U+FEFF
			-- See http://en.wikipedia.org/wiki/Byte_order_mark
		once
			Result := (0xFEFF).to_character_32
		ensure
			instance_free: class
		end

	minimum_unicode_character_code: INTEGER = 0
			-- Smallest code for unicode characters
--		ensure
--			definition: Result = 0
--		end

	minimum_unicode_character_natural_32_code: NATURAL_32 = 0
			-- Smallest code for unicode characters
--		ensure
--			definition: Result = 0
--		end

	maximum_unicode_character_code: INTEGER = 1114111
			-- Largest code for unicode characters (10FFFF);
			-- Includes final two non-characters.
--		ensure
--			definition: Result = 1114111
--		end

	maximum_unicode_character_natural_32_code: NATURAL_32 = 0x10FFFF
			-- Largest code for unicode characters (10FFFF);
			-- Includes final two non-characters.
--		ensure
--			definition: Result = 1114111
--		end

	minimum_unicode_surrogate_code: INTEGER = 55296
			-- Lowest unicode surrogate code-point (0xD800)
--		ensure
--			definition: Result = 55296
--		end

	minimum_unicode_surrogate_natural_32_code: NATURAL_32 = 0xD800
			-- Lowest unicode surrogate code-point (0xD800)
--		ensure
--			definition: Result = 55296
--		end

	maximum_unicode_surrogate_code: INTEGER = 57343
			-- Highest unicode surrogate code-point (0xDFFF)
--		ensure
--			definition: Result = 57343
--		end

	maximum_unicode_surrogate_natural_32_code: NATURAL_32 = 0xDFFF
			-- Highest unicode surrogate code-point (0xDFFF)
--		ensure
--			definition: Result = 57343
--		end

	unicode_surrogate_count: INTEGER = 2048
			-- Number of unicode surrogate code-points
--		ensure
--			definition: Result = maximum_unicode_surrogate_code - minimum_unicode_surrogate_code + 1
--		end

	maximum_bmp_character_code: INTEGER = 65535
			-- Largest code for unicode characters in Basic Multi-lingual Plane (FFFF);
--		ensure
--			definition: Result = 65535
--		end

	minimum_ascii_character_code: INTEGER = 0
			-- Smallest code for ASCII characters
--		ensure
--			definition: Result = 0
--		end

	maximum_ascii_character_code: INTEGER = 127
			-- Largest code for ASCII characters
			-- (2^7 - 1)
--		ensure
--			definition: Result = 127
--			small_enough: Result <= Platform.Maximum_byte_code
--		end

	maximum_ascii_character_natural_32_code: NATURAL_32 = 127
			-- Largest code for ASCII characters
			-- (2^7 - 1)
--		ensure
--			definition: Result = 127
--			small_enough: Result <= Platform.Maximum_byte_code
--		end

	minimum_ascii_character: CHARACTER_8 = '%/0/'
			-- Smallest ASCII character
--		ensure
--			definition: Result.code = minimum_ascii_code
--		end

	maximum_ascii_character: CHARACTER_8 = '%/127/'
			-- Largest ASCII character
--		ensure
--			definition: Result.code = maximum_ascii_code
--		end

	Unassigned_other_category: INTEGER = 0
			-- Unassigned chacaracter

	Uppercase_letter_category: INTEGER = 1
			-- Upper case letter

	Lowercase_letter_category: INTEGER = 2
			-- Lower case letter

	Titlecase_letter_category: INTEGER = 3
			-- Title case letter

	Modifier_letter_category: INTEGER = 4
			-- Modifier letter

	Other_letter_category: INTEGER = 5
			-- Other letter

	Non_spacing_mark_category: INTEGER = 6
			-- Non-spacing mark

	Spacing_combining_mark_category: INTEGER = 7
			-- Spacing combining mark

	Enclosing_mark_category: INTEGER = 8
			-- Enclosing mark

	Decimal_digit_number_category: INTEGER = 9
			-- Decimal digit number

	Letter_number_category: INTEGER = 10
			-- Letter number

	Other_number_category: INTEGER = 11
			-- Other number

	Connector_punctuation_category: INTEGER = 12
			-- Connector punctuation

	Dash_punctuation_category: INTEGER = 13
			-- Dash punctuation

	Open_punctuation_category: INTEGER = 14
			-- Open punctuation

	Close_punctuation_category: INTEGER = 15
			-- Close punctuation

	Initial_quote_punctuation_category: INTEGER = 16
			-- Initial punctuation

	Final_quote_punctuation_category: INTEGER = 17
			-- Final_quote punctuation

	Other_punctuation_category: INTEGER = 18
			-- Other punctuation

	Math_symbol_category: INTEGER = 19
			-- Mathematics symbol

	Currency_symbol_category: INTEGER = 20
			-- Currency symbol

	Modifier_symbol_category: INTEGER = 21
			-- Modifier symbol

	Other_symbol_category: INTEGER = 22
			-- Other symbol

	Space_separator_category: INTEGER = 23
			-- Space separator

	Line_separator_category: INTEGER = 24
			-- Line separator

	Paragraph_separator_category: INTEGER = 25
			-- Paragraph separator

	Control_other_category: INTEGER = 26
			-- Control character

	Format_other_category: INTEGER = 27
			-- Format character

	Surrogate_other_category: INTEGER = 28
			-- Surrogate character

	Private_other_category: INTEGER = 29
			-- Private-use character

	Canonical_decomposition_mapping: INTEGER = 0
			-- Decomposition mapping is canonical

	Font_decomposition_mapping: INTEGER = 1
			-- Decomposition mapping for font variant

	No_break_decomposition_mapping: INTEGER = 2
			-- Decomposition mapping for no-break variant

	Initial_decomposition_mapping: INTEGER = 3
			-- Decomposition mapping for Arabic initial presentation form

	Medial_decomposition_mapping: INTEGER = 4
			-- Decomposition mapping for Arabic medial presentation form

	Final_decomposition_mapping: INTEGER = 5
			-- Decomposition mapping for Arabic final presentation form

	Isolated_decomposition_mapping: INTEGER = 6
			-- Decomposition mapping for Arabic isolated presentation form

	Encircled_decomposition_mapping: INTEGER = 7
			-- Decomposition mapping for encircled form

	Superscript_decomposition_mapping: INTEGER = 8
			-- Decomposition mapping for superscript form

	Subscript_decomposition_mapping: INTEGER = 9
			-- Decomposition mapping for subscript form

	Vertical_decomposition_mapping: INTEGER = 10
			-- Decomposition mapping for vertical layout presentation form

	Wide_decomposition_mapping: INTEGER = 11
			-- Decomposition mapping for wide (zenkaku) compatibility character

	Narrow_decomposition_mapping: INTEGER = 12
			-- Decomposition mapping for narrow (hankaku) compatibility character

	Small_decomposition_mapping: INTEGER = 13
			-- Decomposition mapping for small variant form (CNS compatibility)

	Square_decomposition_mapping: INTEGER = 14
			-- Decomposition mapping for CJK squared font variant

	Fraction_decomposition_mapping: INTEGER = 15
			-- Decomposition mapping for vulgar fraction form

	Compatibility_decomposition_mapping: INTEGER = 16
			-- Decomposition mapping for unspecified compatibility character

end
