indexing

	description: "Objects that support number formatting for language en."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NUMBERER_EN

inherit

	XM_XSLT_NUMBERER

	XM_XSLT_STRING_ROUTINES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	MA_DECIMAL_CONSTANTS
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature -- Access

	formatted_string (a_number: MA_DECIMAL; a_picture: STRING; a_group_size: INTEGER;
		a_group_separator, a_letter, an_ordinal: STRING): STRING is
			-- Formated number string
		local
			a_character_code: INTEGER
		do
			if a_number < zero then
				Result := a_number.to_scientific_string 
			elseif a_picture.count = 0 then
				Result := a_number.to_scientific_string 
			else
				a_character_code := a_picture.item_code (1)
				inspect
					a_character_code
				when 48, 49 then -- '0' or '1' -- TODO - generalize to any unicode 0,1 decimal digit
					Result := converted_number (a_number, latin_hindu_arabic_digits, a_picture, a_group_size, a_group_separator)
				when 105 then -- 'i' - lower case Roman numerals
					if a_number.is_zero then
						Result := "0"
					else
						Result := converted_roman_numerals (a_number)
					end
				when 73 then -- 'I' - upper case Roman numerals
					if a_number.is_zero then
						Result := "0"
					else
						Result := converted_roman_numerals (a_number)
						Result.to_upper
					end
				else
					todo ("formatted_string (not all format tokens supported yet)", True)				
				end				
			end
		end

	month_name (a_month, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Month name or abbreviation
		do
			todo ("month_name", False)
		end

	day_name (a_day, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Name of day of week
		do
			todo ("day_name", False)
		end
		

	half_day_name (a_minute, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- A.M./P.M indicator
		do
			todo ("half_day_name", False)
		end

feature {NONE} -- Implementation

	-- Digit sets

	latin_hindu_arabic_digits: STRING is "0123456789"
			-- "Arabic" numerals

	roman_thousands: ARRAY [STRING] is
			-- Thousands in Roman numerals
		once
			create Result.make (0, 3)
			Result.put ("", 0)
			Result.put ("m", 1)
			Result.put ("mm", 2)
			Result.put ("mmmm", 3)
		ensure
			roman_thousands_not_void: Result /= Void
		end

	roman_hundreds: ARRAY [STRING] is
			-- Hundreds in Roman numerals
		once
			create Result.make (0, 9)
			Result.put ("", 0)
			Result.put ("c", 1)
			Result.put ("cc", 2)
			Result.put ("ccc", 3)
			Result.put ("cd", 4)
			Result.put ("d", 5)
			Result.put ("dc", 6)
			Result.put ("dcc", 7)
			Result.put ("dccc", 8)
			Result.put ("cm", 9)
		ensure
			roman_hundreds_not_void: Result /= Void
		end

	roman_tens: ARRAY [STRING] is
			-- Tens in Roman numerals
		once
			create Result.make (0, 9)
			Result.put ("", 0)
			Result.put ("x", 1)
			Result.put ("xx", 2)
			Result.put ("xxx", 3)
			Result.put ("xl", 4)
			Result.put ("l", 5)
			Result.put ("lx", 6)
			Result.put ("lxx", 7)
			Result.put ("lxxxx", 8)
			Result.put ("xc", 9)
		ensure
			roman_tens_not_void: Result /= Void
		end

	roman_units: ARRAY [STRING] is
			-- Units in Roman numerals
		once
			create Result.make (0, 9)
			Result.put ("", 0)
			Result.put ("i", 1)
			Result.put ("ii", 2)
			Result.put ("iii", 3)
			Result.put ("iv", 4)
			Result.put ("v", 5)
			Result.put ("vi", 6)
			Result.put ("vii", 7)
			Result.put ("viii", 8)
			Result.put ("ix", 9)
		ensure
			roman_tens_not_void: Result /= Void
		end
			
	
	converted_number (a_number: MA_DECIMAL; digits, a_picture: STRING; a_group_size: INTEGER; a_group_separator: STRING): STRING is
			-- Conversion of `a_number' using `digits'
		require
			positive_number: a_number /= Void and then a_number.is_positive
			digits: digits /= Void and then digits.count = 10
			picture_not_void: a_picture /= Void
			group_size_positive: a_group_size >= 0
			group_separator_one_character: a_group_separator /= Void and then a_group_separator.count = 1 or else a_group_separator.count = 0
		local
			a_string, another_string: STRING
			a_reduced_number: MA_DECIMAL
			a_base: MA_DECIMAL
			an_index: INTEGER
		do
			create Result.make (0)
			create a_string.make (0)

			-- First convert `a_number' to a decimal string using `digits'
			
			from
				create a_reduced_number.make_copy (a_number)
				create a_base.make_from_integer (10)
			until
				a_reduced_number.is_zero
			loop
				an_index := a_reduced_number.remainder (a_base, shared_decimal_context).to_integer + 1
				another_string := digits.substring (an_index, an_index)
				a_string := STRING_.appended_string (another_string, a_string)
				a_reduced_number := a_reduced_number.divide_integer (a_base, shared_decimal_context)
			end

			-- Now append leading zeros if specified by `a_picture'-- TODO - generalize to any unicode 0,1 decimal digit

			from
				create another_string.make (0)
				an_index := 1
			until
				an_index > a_picture.count - a_string.count
			loop
				another_string := STRING_.appended_string (another_string, digits.substring (1, 1))
				an_index := an_index + 1
			end
			another_string := STRING_.appended_string (another_string, a_string)

			-- Now insert grouping separators

			if a_group_size > 0 then
				from
					an_index := 1
				until
					an_index > another_string.count
				loop
					if an_index > 0 and then (another_string.count  + 1 - an_index) \\ a_group_size = 0 then
						Result := STRING_.appended_string (Result, a_group_separator)
					end
					Result := STRING_.appended_string (Result, another_string.substring (an_index, an_index))
				end
			else
				Result := another_string
			end
		ensure
			converted_number_not_void: Result /= Void
		end

	converted_roman_numerals (a_number: MA_DECIMAL): STRING is
			-- Conversion of `a_number' to Roman numerals
		require
			positive_number: a_number /= Void and then a_number.is_positive and then a_number.is_integer
		local
			four_thousand: MA_DECIMAL
		do

			-- Roman numbers beyond 4000 use overlining and other conventions which we won't
			--  attempt to reproduce. We'll go high enough to handle present-day Gregorian years.

			create four_thousand.make_from_integer (4000)
			if a_number.compare (four_thousand, shared_decimal_context).is_positive then
				Result := a_number.to_scientific_string
			else
				create Result.make_from_string (roman_thousands.item (a_number.to_integer // 1000))
				Result := STRING_.appended_string (Result, roman_hundreds.item ((a_number.to_integer // 100) \\ 10))
				Result := STRING_.appended_string (Result, roman_tens.item ((a_number.to_integer // 10) \\ 10))
				Result := STRING_.appended_string (Result, roman_units.item (a_number.to_integer \\ 10))
				
			end
		ensure
			converted_number_not_void: Result /= Void
		end

end

