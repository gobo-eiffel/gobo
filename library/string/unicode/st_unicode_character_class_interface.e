indexing

	description:

		"Routines for determining class of Unicode characters"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	is_upper_case (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an upper-case letter?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := upper_case_property (a_code_point)
		end

	is_lower_case (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a lower-case letter?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := lower_case_property (a_code_point)
		end

	is_title_case (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a title-case letter?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Titlecase_letter_category
		end

	is_modifier_letter (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a modifier letter?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Modifier_letter_category
		end

	is_other_letter (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an other letter?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Other_letter_category
		end

	is_letter (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' belong to the letter category?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
			when
				Uppercase_letter_category, Lowercase_letter_category, Titlecase_letter_category,
				Modifier_letter_category, Other_letter_category
			then
				Result := True
			else
				Result := False
			end
		end

	is_alphabetic (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' posses the Alphabetic property?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := alphabetic_property (a_code_point)
		end

	is_nonspacing_mark (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a non-spacing mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Non_spacing_mark_category
		end

	is_combining_spacing_mark (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a combining-spacing mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Spacing_combining_mark_category
		end

	is_enclosing_mark (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an enclosing mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Enclosing_mark_category
		end

	is_mark (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
			when Non_spacing_mark_category, Spacing_combining_mark_category, Enclosing_mark_category then
				Result := True
			else
				Result := False
			end
		end

	is_decimal_digit (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a decimal digit?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Decimal_digit_number_category
		end

	is_letter_number (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a letter number?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Letter_number_category
		end

	is_other_number (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an other number?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Other_number_category
		end

	is_number (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a number?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
			when Decimal_digit_number_category, Letter_number_category, Other_number_category then
				Result := True
			else
				Result := False
			end
		end

	is_connector_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a connector?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Connector_punctuation_category
		end

	is_dash_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a dash?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Dash_punctuation_category
		end

	is_open_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an opening punctuation mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Open_punctuation_category
		end

	is_close_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a closing punctuation mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Close_punctuation_category
		end

	is_initial_quote_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an initial quote?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Initial_quote_punctuation_category
		end

	is_final_quote_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a final quote?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Final_quote_punctuation_category
		end

	is_other_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an other punctuation mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Other_punctuation_category
		end

	is_punctuation (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a punctuation mark?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
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

	is_math_symbol (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a maths symbol?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := math_property (a_code_point)
		end

	is_currency_symbol (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a currency symbolk?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Currency_symbol_category
		end

	is_modifier_symbol (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a modifier symbol?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Modifier_symbol_category
		end

	is_other_symbol (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' an other symbol?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Other_symbol_category
		end

	is_symbol (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a symbol?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
			when Currency_symbol_category, Modifier_symbol_category, Other_symbol_category then
				Result := True
			else
				Result := is_math_symbol (a_code_point)
			end
		end

	is_space_separator (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a space?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Space_separator_category
		end

	is_line_separator (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a line separator?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Line_separator_category
		end

	is_paragraph_separator (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a paragraph separator?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Paragraph_separator_category
		end

	is_separator (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a separator?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			inspect
				character_class (a_code_point)
			when Space_separator_category, Line_separator_category, Paragraph_separator_category then
				Result := True
			else
				Result := False
			end
		end

	is_control (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a control character?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Control_other_category
		end

	is_format (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a format character?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Format_other_category
		end

	is_surrogate (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a surrogate character?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Surrogate_other_category
		end

	is_private_use (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a private use character?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := character_class (a_code_point) = Private_other_category
		end

	is_non_character (a_code_point: INTEGER): BOOLEAN is
			-- Is `a_code_point' a non-character?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		do
			Result := (64976 <= a_code_point and a_code_point <= 65007) or
				a_code_point = 65534 or a_code_point = 65535 or
				a_code_point = 131070 or a_code_point = 131071 or
				a_code_point = 196606 or a_code_point = 196607 or
				a_code_point = 262142 or a_code_point = 262143 or
				a_code_point = 327678 or a_code_point = 327679 or
				a_code_point = 393214 or a_code_point = 393215 or
				a_code_point = 458750 or a_code_point = 458751 or
				a_code_point = 524286 or a_code_point = 524287 or
				a_code_point = 589822 or a_code_point = 589823 or
				a_code_point = 655358 or a_code_point = 655359 or
				a_code_point = 720894 or a_code_point = 720895 or
				a_code_point = 786430 or a_code_point = 786431 or
				a_code_point = 851966 or a_code_point = 851967 or
				a_code_point = 917502 or a_code_point = 917503 or
				a_code_point = 983038 or a_code_point = 983039 or
				a_code_point = 1048574 or a_code_point = 1048575 or
				a_code_point = 1114110 or a_code_point = 1114111
		end

	decimal_digit_value (a_code_point: INTEGER): INTEGER_8 is
			-- Decimal digit value for `a_code_point'
		require
			valid_code_point: unicode.valid_code (a_code_point)
			decimal_digit: is_decimal_digit (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := decimal_values.item (i).item (j).item (k)
		ensure
			positive_value: Result >= 0
			decimal_value_small_enough: Result <= 9
		end

	character_class (a_code_point: INTEGER): INTEGER is
			-- Character class for `a_code_point'
		require
			valid_code_point: unicode.valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := character_classes.item (i).item (j).item (k)
		ensure
			character_class_large_enough: Result >= Unassigned_other_category
			character_class_small_enough: Result <= Private_other_category
		end

feature {NONE} -- Implementation

	upper_case_property (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' have the upper case property?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := upper_case_properties.item (i).item (j).item (k + 1)
		end

	lower_case_property (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' have the lower case property?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := lower_case_properties.item (i).item (j).item (k + 1)
		end

	alphabetic_property (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' have the alphabetic property?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := alphabetic_properties.item (i).item (j).item (k + 1)
		end

	math_property (a_code_point: INTEGER): BOOLEAN is
			-- Does `a_code_point' have the math property?
		require
			valid_code_point: unicode.valid_code (a_code_point)
		local
			i, j, k, a_rem: INTEGER
		do
			i := a_code_point // (65536)
			a_rem  := a_code_point \\ (65536)
			j := a_rem // 256
			k := a_rem \\ 256
			Result := math_properties.item (i).item (j).item (k + 1)
		end

	string_to_array8 (a_string: STRING): ARRAY [INTEGER_8] is
			-- Zero-indexed byte array interpretation of `a_string'
		require
			string_not_void: a_string /= Void
			correct_length: a_string.count = 256
		local
			i: INTEGER
		do
			create Result.make (0, 255)
			from i := 0 until i > 255 loop
				Result.put (INTEGER_.to_integer_8 (a_string.item (i + 1).code), i)
				i := i + 1
			end
		ensure
			array_not_void: Result /= Void
			zero_indexed: Result.lower = 0
			correct_count: Result.upper = 255
		end

	character_classes: ARRAY [ARRAY [ARRAY [INTEGER_8]]] is
			-- Character classes for each code point
		deferred
		ensure
			character_classes_not_void: Result /= Void
			-- no_void_character_class: not Result.has (Void)
		end

	decimal_values: ARRAY [ARRAY [ARRAY [INTEGER_8]]] is
			-- Decimal value for each code point
		deferred
		ensure
			decimal_values_not_void: Result /= Void
			-- no_void_decimal_value: not Result.has (Void)
		end

	upper_case_properties: ARRAY [ARRAY [ARRAY [BOOLEAN]]] is
			-- Upper case property for each code point
		deferred
		ensure
			upper_case_properties_not_void: Result /= Void
			-- no_void_upper_case_property: not Result.has (Void)
		end

	lower_case_properties: ARRAY [ARRAY [ARRAY [BOOLEAN]]] is
			-- Lower case property for each code point
		deferred
		ensure
			lower_case_properties_not_void: Result /= Void
			-- no_void_lower_case_property: not Result.has (Void)
		end

	alphabetic_properties: ARRAY [ARRAY [ARRAY [BOOLEAN]]] is
			-- Alphabetic property for each code point
		deferred
		ensure
			alphabetic_properties_not_void: Result /= Void
			-- no_void_alphabetic_property: not Result.has (Void)
		end

	math_properties: ARRAY [ARRAY [ARRAY [BOOLEAN]]] is
			-- Math property for each code point
		deferred
		ensure
			math_properties_not_void: Result /= Void
			-- no_void_math_property: not Result.has (Void)
		end

end
