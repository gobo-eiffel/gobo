indexing

	description:

		"Unicode data for one code point"

	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEUC_UNICODE_DATA

inherit

	GEUC_CONSTANTS

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_code_point: INTEGER; a_name: STRING; some_fields: DS_LIST [STRING]) is
			-- Establish invariant.
		require
			code_point_in_range: a_code_point >= 0 and then a_code_point <= maximum_unicode_character_code
			name_exists: a_name /= Void
			fifteen_fields: some_fields /= Void and then some_fields.count = Field_count
		local
			a_decimal: INTEGER
		do
			code_point := a_code_point
			name := a_name
			general_category := category (some_fields.item (3))
			is_valid := general_category /= Other_unassigned_category
			if general_category = Decimal_digit_number_category then
				if not some_fields.item (7).is_integer then
					is_valid := False
				else
					internal_decimal_digit_value := Bad_decimal_value
					a_decimal := some_fields.item (7).to_integer
					if a_decimal >= 0 and then a_decimal < 10 then
						internal_decimal_digit_value := INTEGER_.to_integer_8 (a_decimal)
						is_valid := True
					else
						is_valid := False
					end
				end
			end
				
			-- TODO: extract other fields of interest

		ensure
			code_point_set: code_point = a_code_point
			name_set: name = a_name
		end

feature -- Access

	code_point: INTEGER
			-- Code point number

	name: STRING
			-- Name of character

	general_category: INTEGER_8
			-- Coded general category

	decimal_digit_value: INTEGER_8 is
			-- Value of `Current' as a decimal digit
		require
			decimal_digit: general_category = Decimal_digit_number_category
		do
			Result := internal_decimal_digit_value
		ensure
			value_in_range: Result >= 0 and Result < 10
		end

	category (a_category: STRING): INTEGER_8 is
			-- Coded version of `a_category', or `Other_unassigned_category' if unrecognized
		require
			category_exists: a_category /= Void
		do
			if a_category.is_equal ("Lu") then
				Result := Uppercase_letter_category
			elseif a_category.is_equal ("Ll") then
				Result := Lowercase_letter_category
			elseif a_category.is_equal ("Lt") then
				Result := Titlecase_letter_category
			elseif a_category.is_equal ("Lm") then
				Result := Modifier_letter_category
			elseif a_category.is_equal ("Lo") then
				Result := Other_letter_category				
			elseif a_category.is_equal ("Mn") then
				Result := Non_spacing_mark_category
			elseif a_category.is_equal ("Mc") then
				Result := Spacing_combining_mark_category
			elseif a_category.is_equal ("Me") then
				Result := Enclosing_mark_category
			elseif a_category.is_equal ("Nd") then
				Result := Decimal_digit_number_category
			elseif a_category.is_equal ("Nl") then
				Result := Letter_number_category
			elseif a_category.is_equal ("No") then
				Result := Other_number_category
			elseif a_category.is_equal ("Pc") then
				Result := Connector_punctuation_category
			elseif a_category.is_equal ("Pd") then
				Result := Dash_punctuation_category
			elseif a_category.is_equal ("Ps") then
				Result := Open_punctuation_category
			elseif a_category.is_equal ("Pe") then
				Result := Close_punctuation_category
			elseif a_category.is_equal ("Pi") then
				Result := Initial_quote_punctuation_category
			elseif a_category.is_equal ("Pf") then
				Result := Final_quote_punctuation_category
			elseif a_category.is_equal ("Po") then
				Result := Other_punctuation_category
			elseif a_category.is_equal ("Sm") then
				Result := Math_symbol_category
			elseif a_category.is_equal ("Sc") then
				Result := Currency_symbol_category
			elseif a_category.is_equal ("Sk") then
				Result := Modifier_symbol_category
			elseif a_category.is_equal ("So") then
				Result := Other_symbol_category
			elseif a_category.is_equal ("Zs") then
				Result := Space_separator_category
			elseif a_category.is_equal ("Zl") then
				Result := Line_separator_category
			elseif a_category.is_equal ("Zp") then
				Result := Paragraph_separator_category
			elseif a_category.is_equal ("Cc") then
				Result := Control_other_category				
			elseif a_category.is_equal ("Cf") then
				Result := Format_other_category		
			elseif a_category.is_equal ("Cs") then
				Result := Surrogate_other_category				
			elseif a_category.is_equal ("Co") then
				Result := Private_other_category			
			else
				Result := Other_unassigned_category
			end
		end

feature -- Status report

	is_valid: BOOLEAN
			-- Does `Current' represent a validly parsed line "UnicodeData.txt"?

	internal_decimal_digit_value: INTEGER_8
			-- Decimal digit value

invariant

	code_point_in_range: code_point >= 0 and then code_point <= maximum_unicode_character_code
	name_exists: name /= Void

end

	
