note

	description:

		"Routines for determining class of Unicode characters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_UNICODE_CHARACTER_CLASS_INTERFACE

inherit

	UC_UNICODE_CONSTANTS
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

feature -- Access

	is_upper_case (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an upper-case letter?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := upper_case_property (a_code)
		end

	is_lower_case (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a lower-case letter?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := lower_case_property (a_code)
		end

	is_title_case (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a title-case letter?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Titlecase_letter_category
		end

	is_modifier_letter (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a modifier letter?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Modifier_letter_category
		end

	is_other_letter (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an other letter?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Other_letter_category
		end

	is_letter (a_code: INTEGER): BOOLEAN
			-- Does `a_code' belong to the letter category?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when
				Uppercase_letter_category, Lowercase_letter_category, Titlecase_letter_category,
				Modifier_letter_category, Other_letter_category
			then
				Result := True
			else
				Result := False
			end
		end

	is_alphabetic (a_code: INTEGER): BOOLEAN
			-- Does `a_code' posses the Alphabetic property?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := alphabetic_property (a_code)
		end

	is_nonspacing_mark (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a non-spacing mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Non_spacing_mark_category
		end

	is_combining_spacing_mark (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a combining-spacing mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Spacing_combining_mark_category
		end

	is_enclosing_mark (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an enclosing mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Enclosing_mark_category
		end

	is_mark (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when Non_spacing_mark_category, Spacing_combining_mark_category, Enclosing_mark_category then
				Result := True
			else
				Result := False
			end
		end

	is_decimal_digit (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a decimal digit?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Decimal_digit_number_category
		end

	is_letter_number (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a letter number?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Letter_number_category
		end

	is_other_number (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an other number?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Other_number_category
		end

	is_number (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a number?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when Decimal_digit_number_category, Letter_number_category, Other_number_category then
				Result := True
			else
				Result := False
			end
		end

	is_connector_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a connector?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Connector_punctuation_category
		end

	is_dash_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a dash?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Dash_punctuation_category
		end

	is_open_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an opening punctuation mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Open_punctuation_category
		end

	is_close_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a closing punctuation mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Close_punctuation_category
		end

	is_initial_quote_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an initial quote?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Initial_quote_punctuation_category
		end

	is_final_quote_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a final quote?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Final_quote_punctuation_category
		end

	is_other_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an other punctuation mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Other_punctuation_category
		end

	is_punctuation (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a punctuation mark?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when
				Connector_punctuation_category, Dash_punctuation_category,
				Open_punctuation_category, Close_punctuation_category,
				Initial_quote_punctuation_category, Final_quote_punctuation_category,
				Other_punctuation_category
			then
				Result := True
			else
				Result := False
			end
		end

	is_math_symbol (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a maths symbol?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := math_property (a_code)
		end

	is_currency_symbol (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a currency symbol?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Currency_symbol_category
		end

	is_modifier_symbol (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a modifier symbol?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Modifier_symbol_category
		end

	is_other_symbol (a_code: INTEGER): BOOLEAN
			-- Is `a_code' an other symbol?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Other_symbol_category
		end

	is_symbol (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a symbol?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when Currency_symbol_category, Modifier_symbol_category, Other_symbol_category then
				Result := True
			else
				Result := is_math_symbol (a_code)
			end
		end

	is_space_separator (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a space?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Space_separator_category
		end

	is_line_separator (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a line separator?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Line_separator_category
		end

	is_paragraph_separator (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a paragraph separator?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Paragraph_separator_category
		end

	is_separator (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a separator?
		require
			valid_code: unicode.valid_code (a_code)
		do
			inspect character_class (a_code)
			when Space_separator_category, Line_separator_category, Paragraph_separator_category then
				Result := True
			else
				Result := False
			end
		end

	is_control (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a control character?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Control_other_category
		end

	is_format (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a format character?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Format_other_category
		end

	is_surrogate (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a surrogate character?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Surrogate_other_category
		end

	is_private_use (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a private use character?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := character_class (a_code) = Private_other_category
		end

	is_non_character (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a non-character?
		require
			valid_code: unicode.valid_code (a_code)
		do
			Result := (64976 <= a_code and a_code <= 65007) or
				a_code = 65534 or a_code = 65535 or
				a_code = 131070 or a_code = 131071 or
				a_code = 196606 or a_code = 196607 or
				a_code = 262142 or a_code = 262143 or
				a_code = 327678 or a_code = 327679 or
				a_code = 393214 or a_code = 393215 or
				a_code = 458750 or a_code = 458751 or
				a_code = 524286 or a_code = 524287 or
				a_code = 589822 or a_code = 589823 or
				a_code = 655358 or a_code = 655359 or
				a_code = 720894 or a_code = 720895 or
				a_code = 786430 or a_code = 786431 or
				a_code = 851966 or a_code = 851967 or
				a_code = 917502 or a_code = 917503 or
				a_code = 983038 or a_code = 983039 or
				a_code = 1048574 or a_code = 1048575 or
				a_code = 1114110 or a_code = 1114111
		end

	decimal_digit_value (a_code: INTEGER): INTEGER_8
			-- Decimal digit value for `a_code'
		require
			valid_code: unicode.valid_code (a_code)
			decimal_digit: is_decimal_digit (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := decimal_values.item (i).item (j).item (k)
		ensure
			positive_value: Result >= 0
			decimal_value_small_enough: Result <= 9
		end

	character_class (a_code: INTEGER): INTEGER
			-- Character class for `a_code'
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := character_classes.item (i).item (j).item (k)
		ensure
			character_class_large_enough: Result >= Unassigned_other_category
			character_class_small_enough: Result <= Private_other_category
		end

feature {NONE} -- Implementation

	upper_case_property (a_code: INTEGER): BOOLEAN
			-- Does `a_code' have the upper case property?
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := upper_case_properties.item (i).item (j).item (k + 1)
		end

	lower_case_property (a_code: INTEGER): BOOLEAN
			-- Does `a_code' have the lower case property?
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := lower_case_properties.item (i).item (j).item (k + 1)
		end

	alphabetic_property (a_code: INTEGER): BOOLEAN
			-- Does `a_code' have the alphabetic property?
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := alphabetic_properties.item (i).item (j).item (k + 1)
		end

	math_property (a_code: INTEGER): BOOLEAN
			-- Does `a_code' have the math property?
		require
			valid_code: unicode.valid_code (a_code)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code // (65536)
			a_rem := a_code \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := math_properties.item (i).item (j).item (k + 1)
		end

	string_to_array8 (a_string: STRING): ARRAY [INTEGER_8]
			-- Zero-indexed byte array interpretation of `a_string'
		require
			string_not_void: a_string /= Void
			correct_length: a_string.count = 256
		local
			i: INTEGER
		do
			create Result.make (0, 255)
			from
				i := 0
			until
				i > 255
			loop
				Result.put (INTEGER_.to_integer_8 (a_string.item (i + 1).code), i)
				i := i + 1
			end
		ensure
			array_not_void: Result /= Void
			zero_indexed: Result.lower = 0
			correct_count: Result.upper = 255
		end

	character_classes: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]
			-- Character classes for each code point
		deferred
		ensure
			character_classes_not_void: Result /= Void
--			no_void_character_class: not Result.has (Void)
		end

	decimal_values: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]
			-- Decimal value for each code point
		deferred
		ensure
			decimal_values_not_void: Result /= Void
--			no_void_decimal_value: not Result.has (Void)
		end

	upper_case_properties: SPECIAL [SPECIAL [ARRAY [BOOLEAN]]]
			-- Upper case property for each code point
		deferred
		ensure
			upper_case_properties_not_void: Result /= Void
--			no_void_upper_case_property: not Result.has (Void)
		end

	lower_case_properties: SPECIAL [SPECIAL [ARRAY [BOOLEAN]]]
			-- Lower case property for each code point
		deferred
		ensure
			lower_case_properties_not_void: Result /= Void
--			no_void_lower_case_property: not Result.has (Void)
		end

	alphabetic_properties: SPECIAL [SPECIAL [ARRAY [BOOLEAN]]]
			-- Alphabetic property for each code point
		deferred
		ensure
			alphabetic_properties_not_void: Result /= Void
--			no_void_alphabetic_property: not Result.has (Void)
		end

	math_properties: SPECIAL [SPECIAL [ARRAY [BOOLEAN]]]
			-- Math property for each code point
		deferred
		ensure
			math_properties_not_void: Result /= Void
--			no_void_math_property: not Result.has (Void)
		end

end
