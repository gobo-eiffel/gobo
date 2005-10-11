indexing

	description:

		"Unicode constants"

	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEUC_CONSTANTS

feature -- Access

	Field_count: INTEGER is 15
			-- Number of fields in UnicodeData.txt

	Maximum_unicode_code_point: INTEGER is 1114109
			-- Highest allocated Unicode code point

	Other_unassigned_category: INTEGER_8 is 0
			-- Other chacaracter (unassigned)

	Uppercase_letter_category: INTEGER_8 is 1
			-- Upper case letter

	Lowercase_letter_category: INTEGER_8 is 2
			-- Lower case letter

	Titlecase_letter_category: INTEGER_8 is 3
			-- Title case letter

	Modifier_letter_category: INTEGER_8 is 4
			-- Modifier letter

	Other_letter_category: INTEGER_8 is 5
			-- Other letter

	Non_spacing_mark_category: INTEGER_8 is 6
			-- Non-spacing mark

	Spacing_combining_mark_category: INTEGER_8 is 7
			-- Spacing combining mark
	
	Enclosing_mark_category: INTEGER_8 is 8
			-- Enclosing mark

	Decimal_digit_number_category: INTEGER_8 is 9
			-- Decimal digit number

	Letter_number_category: INTEGER_8 is 10
			-- Letter number

	Other_number_category: INTEGER_8 is 11
			-- Other number

	Connector_punctuation_category: INTEGER_8 is 12
			-- Connector punctuation

	Dash_punctuation_category: INTEGER_8 is 13
			-- Dash punctuation

	Open_punctuation_category: INTEGER_8 is 14
			-- Open punctuation

	Close_punctuation_category: INTEGER_8 is 15
			-- Close punctuation

	Initial_quote_punctuation_category: INTEGER_8 is 16
			-- Initial punctuation

	Final_quote_punctuation_category: INTEGER_8 is 17
			-- Final_quote punctuation

	Other_punctuation_category: INTEGER_8 is 18
			-- Other punctuation

	Math_symbol_category: INTEGER_8 is 19
			-- Mathematics symbol

	Currency_symbol_category: INTEGER_8 is 20
			-- Currency symbol

	Modifier_symbol_category: INTEGER_8 is 21
			-- Modifier symbol

	Other_symbol_category: INTEGER_8 is 22
			-- Other symbol

	Space_separator_category: INTEGER_8 is 23
			-- Space separator

	Line_separator_category: INTEGER_8 is 24
			-- Line separator

	Paragraph_separator_category: INTEGER_8 is 25
			-- Paragraph separator

	Control_other_category: INTEGER_8 is 26
			-- Control character

	Format_other_category: INTEGER_8 is 27
			-- Format character

	Surrogate_other_category: INTEGER_8 is 28
			-- Surrogate character

	Private_other_category: INTEGER_8 is 29
			-- Private-use character

end

	
