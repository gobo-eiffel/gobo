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
			elseif is_zeros_plus_one (a_picture) then				
				Result := converted_number (a_number, decimal_digits_set (a_picture), a_picture.count, a_group_size, a_group_separator, an_ordinal)
			elseif a_picture.count = 1 then
				a_character_code := a_picture.item_code (1)
				inspect
					a_character_code
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
				when 65 then -- 'A' - Upper case ASCII letters
					if a_number.is_integer then
						Result := alphabetic_number (a_number.to_integer, latin_upper_case_letters)
					else
						Result := converted_number (a_number, latin_hindu_arabic_digits, a_picture.count, a_group_size, a_group_separator, an_ordinal)
					end
				when 97 then -- 'a' - Lower case ASCII letters
					if a_number.is_integer then
						Result := alphabetic_number (a_number.to_integer, latin_lower_case_letters)
					else
						Result := converted_number (a_number, latin_hindu_arabic_digits, a_picture.count, a_group_size, a_group_separator, an_ordinal)
					end
				when 87 then -- 'W' -- Upper case words
					if a_number.is_integer then
						if an_ordinal.count > 0 then
							Result := cased_ordinal_number (a_number.to_integer, True, True)
						else
							Result := cased_words_number (a_number.to_integer, True, True)
						end
					else
						Result := converted_number (a_number, latin_hindu_arabic_digits, 1, a_group_size, a_group_separator, an_ordinal)
					end
				when 119 then -- 'w' -- Lower case words
					if a_number.is_integer then
						if an_ordinal.count > 0 then
							Result := cased_ordinal_number (a_number.to_integer, False, False)
						else
							Result := cased_words_number (a_number.to_integer, False, False)
						end
					else
						Result := converted_number (a_number, latin_hindu_arabic_digits, 1, a_group_size, a_group_separator, an_ordinal)
					end	
				else

					-- Un-supported formatting token - use "1"

					Result := converted_number (a_number, latin_hindu_arabic_digits, 1, a_group_size, a_group_separator, an_ordinal)
				end
			else
				if STRING_.same_string (a_picture, "Ww") then
					if a_number.is_integer then
						if an_ordinal.count > 0 then
							Result := cased_ordinal_number (a_number.to_integer, True, False)
						else
							Result := cased_words_number (a_number.to_integer, True, False)
						end
					else
						Result := converted_number (a_number, latin_hindu_arabic_digits, 1, a_group_size, a_group_separator, an_ordinal)
					end
				else

					-- Un-supported formatting token - use "1"

					Result := converted_number (a_number, latin_hindu_arabic_digits, 1, a_group_size, a_group_separator, an_ordinal)
				end
			end
		end

	month_name (a_month, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Month name or abbreviation
		local
			a_max: INTEGER
		do
			Result := STRING_.cloned_string (english_months.item (a_month))
			a_max := a_maximum_width
			if a_max < 3 then a_max := 3 end
			if Result.count > a_max then
				Result := Result.substring (1, a_max)
			end
			from  until Result.count >= a_minimum_width loop
				Result := Result + " "
			end
		end

	day_name (a_day, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- Name of day of week
		local
			a_max: INTEGER
		do
			Result :=  STRING_.cloned_string (english_days.item (a_day))
			a_max := a_maximum_width
			if a_max < 2 then a_max := 2 end
			if Result.count > a_max then
				Result :=  STRING_.cloned_string (english_day_abbreviations.item (a_day))
			end
			if Result.count > a_max then
				Result := Result.substring (1, a_max)
			end
			from  until Result.count >= a_minimum_width loop
				Result := Result + " "
			end
		end
		

	half_day_name (a_minute, a_minimum_width, a_maximum_width: INTEGER): STRING is
			-- A.M./P.M indicator
		do
			if a_minute < 12 * 60 then
				inspect
					a_maximum_width
				when 1 then
					Result := "A"
				when 2, 3 then
					Result := "Am"
				else
					Result := "A.M."
				end
			else
				inspect
					a_maximum_width
				when 1 then
					Result := "P"
				when 2, 3 then
					Result := "Pm"
				else
					Result := "P.M."
				end				
			end
		end

feature {NONE} -- Implementation

	-- Alphabets

	latin_upper_case_letters: STRING is "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			-- Latin upper case alphabet

	latin_lower_case_letters: STRING is "abcdefghijklmnopqrstuvwxyz"
			-- Latin lower case alphabet

	latin_hindu_arabic_digits: STRING is "0123456789"
		-- "Arabic" numerals, for fallback to format "1"

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

	converted_number (a_number: MA_DECIMAL; digits: STRING; a_minimum_width, a_group_size: INTEGER; a_group_separator, an_ordinal: STRING): STRING is
			-- Conversion of `a_number' using `digits'
		require
			positive_number: a_number /= Void and then a_number.is_positive
			digits: digits /= Void and then digits.count = 10
			strictly_positive_width: a_minimum_width > 0
			group_size_positive: a_group_size >= 0
			group_separator_one_character: a_group_separator /= Void and then a_group_separator.count = 1 or else a_group_separator.count = 0
			ordinal_not_void: an_ordinal /= Void
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

			-- Now append leading zeros

			from
				create another_string.make (0)
				an_index := 1
			until
				an_index > a_minimum_width - a_string.count
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
			if an_ordinal.count > 0 then
				Result := STRING_.appended_string (Result, ordinal_suffix (a_number))
			end
		ensure
			converted_number_not_void: Result /= Void
		end

	converted_roman_numerals (a_number: MA_DECIMAL): STRING is
			-- Conversion of `a_number' to Roman numerals
		require
			positive_integer: a_number /= Void and then a_number.is_positive and then a_number.is_integer
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
			ascii_string: True
		end

	alphabetic_number (a_number: INTEGER; an_alphabet: STRING): STRING is
			-- Aplhabetic representation of `a_number'
		require
			number_is_positive: a_number >= 0
			non_empty_alphabet: an_alphabet /= Void and then not an_alphabet.is_empty
		local
			a_range, an_index: INTEGER
			a_last_character: STRING
		do
			if a_number = 0 then
				Result := "0"
			else
				a_range := an_alphabet.count
				an_index := a_number \\ a_range
				a_last_character := an_alphabet.substring (an_index, an_index)
				if a_number > a_range then
					Result := STRING_.appended_string (alphabetic_number (a_number // a_range, an_alphabet), a_last_character)
				else
					Result := a_last_character 
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	cased_words_number (a_number: INTEGER; is_title_case, is_upper_case: BOOLEAN): STRING is
			-- English words expressing `a_number'
		require
			positive_integer: a_number >= 0
		do
			if a_number = 0 then
				Result := "Zero"
			else
				Result := words_number (a_number)
			end
			if not is_title_case then
				if is_upper_case then
					Result := Result.as_upper
				else
					Result := Result.as_lower
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	words_number (a_number: INTEGER): STRING is
			-- English words expressing `a_number'
		require
			strictly_positive_integer: a_number > 0
		local
			a_remainder: INTEGER
		do
			if a_number >= 1000000000 then
				a_remainder := a_number \\ 1000000000
				Result := words_number (a_number // 1000000000) + " Billion" -- American and very modern English usage - TODO - descendant class for en-GB with traditional
				if a_remainder /= 0 then
					if a_remainder < 100 then
						Result := Result + " and "
					else
						Result := Result + " "
					end
					Result := Result + words_number (a_remainder)
				end
			elseif a_number >= 1000000 then
				a_remainder := a_number \\ 1000000
				Result := words_number (a_number // 1000000) + " Million"
				if a_remainder /= 0 then
					if a_remainder < 100 then
						Result := Result + " and "
					else
						Result := Result + " "
					end
					Result := Result + words_number (a_remainder)
				end
			elseif a_number >= 1000 then
				a_remainder := a_number \\ 1000
				Result := words_number (a_number // 1000) + " Thousand"
				if a_remainder /= 0 then
					if a_remainder < 100 then
						Result := Result + " and "
					else
						Result := Result + " "
					end
					Result := Result + words_number (a_remainder)
				end
			elseif a_number >= 100 then
				a_remainder := a_number \\ 100
				Result := words_number (a_number // 100) + " Hundred"
				if a_remainder /= 0 then
					if a_remainder /= 0 then
						Result := Result + " and "
					end
					Result := Result + words_number (a_remainder)
				end
			elseif a_number < 20 then
				Result := english_units.item (a_number)
			else
				a_remainder := a_number \\ 10
				Result := english_tens.item (a_number // 10)
				if a_remainder /= 0 then
					Result := Result + " " + english_units.item (a_remainder)
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	cased_ordinal_number (a_number: INTEGER; is_title_case, is_upper_case: BOOLEAN): STRING is
			-- English words expressing `a_number' as an ordinal
		require
			positive_integer: a_number >= 0
		do
			if a_number = 0 then
				Result := "Zeroth" -- ?? Physics usage, not colloquial English
			else
				Result := ordinal_number (a_number)
			end
			if not is_title_case then
				if is_upper_case then
					Result := Result.as_upper
				else
					Result := Result.as_lower
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	ordinal_number (a_number: INTEGER): STRING is
			-- English words expressing `a_number' as an ordinal
		require
			strictly_positive_integer: a_number > 0
		local
			a_remainder: INTEGER
		do
			if a_number >= 1000000000 then
				a_remainder := a_number \\ 1000000000
				Result := words_number (a_number // 1000000000) + " Billion" -- American and very modern English usage
				if a_remainder = 0 then
					Result := Result + "th"
				else
					if a_remainder < 100 then
						Result := Result + " "
					else
						Result := Result + " and "
					end
					Result := Result + ordinal_number (a_remainder)
				end
			elseif a_number >= 1000000 then
				a_remainder := a_number \\ 1000000
				Result := words_number (a_number // 1000000) + " Million"
				if a_remainder = 0 then
					Result := Result + "th"
				else
					if a_remainder < 100 then
						Result := Result + " "
					else
						Result := Result + " and "
					end
					Result := Result + ordinal_number (a_remainder)
				end
			elseif a_number >= 1000 then
				a_remainder := a_number \\ 1000
				Result := words_number (a_number // 1000) + " Thousand"
				if a_remainder = 0 then
					Result := Result + "th"
				else
					if a_remainder < 100 then
						Result := Result + " "
					else
						Result := Result + " and "
					end
					Result := Result + ordinal_number (a_remainder)
				end
			elseif a_number >= 100 then
				a_remainder := a_number \\ 100
				Result := words_number (a_number // 100) + " Hundred"
				if a_remainder = 0 then
					Result := Result + "th"
				else
					if a_remainder /= 0 then
						Result := Result + " and "
					end
					Result := Result + ordinal_number (a_remainder)
				end
			elseif a_number < 20 then
				Result := english_ordinal_units.item (a_number)
			else
				a_remainder := a_number \\ 10
				Result := english_ordinal_tens.item (a_number // 10)
				if a_remainder /= 0 then
					Result := Result + " " + english_ordinal_units.item (a_remainder)
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	english_tens: ARRAY [STRING] is
			-- English words for tens
		once
			create Result.make (0, 9)
			Result.put ("", 0)
			Result.put ("Ten", 1)
			Result.put ("Twenty", 2)
			Result.put ("Thirty", 3)
			Result.put ("Forty", 4)
			Result.put ("Fifty", 5)
			Result.put ("Sixty", 6)
			Result.put ("Seventy", 7)
			Result.put ("Eighty", 8)
			Result.put ("Ninety", 9)
		ensure
			ten_numbers: Result /= Void and then Result.count = 10
		end

	english_units: ARRAY [STRING] is
			-- English words for units and teens
		once
			create Result.make (1, 19)
			Result.put ("One", 1)
			Result.put ("Two", 2)
			Result.put ("Three", 3)
			Result.put ("Four", 4)
			Result.put ("Five", 5)
			Result.put ("Six", 6)
			Result.put ("Seven", 7)
			Result.put ("Eight", 8)
			Result.put ("Nine", 9)
			Result.put ("Ten", 10)
			Result.put ("Eleven", 11)
			Result.put ("Twelve", 12)
			Result.put ("Thirteen", 13)
			Result.put ("Fourteen", 14)
			Result.put ("Fifteen", 15)
			Result.put ("Sixteen", 16)
			Result.put ("Seventeen", 17)
			Result.put ("Eighteen", 18)
			Result.put ("Nineteen", 19)
		ensure
			ten_numbers: Result /= Void and then Result.count = 19
		end

	english_ordinal_tens: ARRAY [STRING] is
			-- English ordinal words for tens
		once
			create Result.make (0, 9)
			Result.put ("", 0)
			Result.put ("Tenth", 1)
			Result.put ("Twentieth", 2)
			Result.put ("Thirtieth", 3)
			Result.put ("Fortieth", 4)
			Result.put ("Fiftieth", 5)
			Result.put ("Sixtieth", 6)
			Result.put ("Seventieth", 7)
			Result.put ("Eightieth", 8)
			Result.put ("Ninetieth", 9)
		ensure
			ten_numbers: Result /= Void and then Result.count = 10
		end

	english_ordinal_units: ARRAY [STRING] is
			-- English ordinal words for units and teens
		once
			create Result.make (1, 19)
			Result.put ("First", 1)
			Result.put ("Second", 2)
			Result.put ("Third", 3)
			Result.put ("Fourth", 4)
			Result.put ("Fifth", 5)
			Result.put ("Sixth", 6)
			Result.put ("Seventh", 7)
			Result.put ("Eighth", 8)
			Result.put ("Ninth", 9)
			Result.put ("Tenth", 10)
			Result.put ("Eleventh", 11)
			Result.put ("Twelfth", 12)
			Result.put ("Thirteenth", 13)
			Result.put ("Fourteenth", 14)
			Result.put ("Fifteenth", 15)
			Result.put ("Sixteenth", 16)
			Result.put ("Seventeenth", 17)
			Result.put ("Eighteenth", 18)
			Result.put ("Nineteenth", 19)
		ensure
			ten_numbers: Result /= Void and then Result.count = 19
		end

	english_months: ARRAY [STRING] is
			-- English names for months
		once
			create Result.make (1, 12)
			Result.put ("January", 1)
			Result.put ("February", 2)
			Result.put ("March", 3)
			Result.put ("April", 4)
			Result.put ("May", 5)
			Result.put ("June", 6)
			Result.put ("July", 7)
			Result.put ("August", 8)
			Result.put ("September", 9)
			Result.put ("October", 10)
			Result.put ("November", 11)
			Result.put ("December", 12)
		ensure
			twelve_months: Result /= Void and then Result.count = 12
		end

	english_days: ARRAY [STRING] is
			-- English names for days
		once
			create Result.make (1, 7)
			Result.put ("Sunday", 7)
			Result.put ("Monday", 1)
			Result.put ("Tuesday", 2)
			Result.put ("Wednesday", 3)
			Result.put ("Thursday", 4)
			Result.put ("Friday", 5)
			Result.put ("Saturday", 6)
		ensure
			seven_days: Result /= Void and then Result.count = 7
		end

	english_day_abbreviations: ARRAY [STRING] is
			-- Abbreviated English names for days
		once
			create Result.make (1, 7)
			Result.put ("Sun", 7)
			Result.put ("Mon", 1)
			Result.put ("Tues", 2)
			Result.put ("Weds", 3)
			Result.put ("Thurs", 4)
			Result.put ("Fri", 5)
			Result.put ("Sat", 6)
		ensure
			seven_days: Result /= Void and then Result.count = 7
		end

	ordinal_suffix (a_number: MA_DECIMAL): STRING is
			-- Ordinal suffix
		require
			number_is_integral: a_number /= Void and then a_number.is_integer
		local
			a_penultimate, an_ultimate: INTEGER
		do
			a_penultimate := (a_number \\ Hundred).to_integer // 10
			an_ultimate := (a_number \\ Ten).to_integer
			if a_penultimate = 1 then
				Result := "th"
			else
				inspect
					an_ultimate
				when 1 then
					Result := "st"
				when 2 then
					Result := "nd"
				when 3 then
					Result := "rd"
				else
					Result := "th"
				end
			end
		ensure
			result_not_empty: Result /= Void and then not Result.is_empty
		end

	Hundred: MA_DECIMAL is
			-- One hundred
		once
			create Result.make_from_integer (100)
		ensure
			result_not_void: Result /= Void
		end

	Ten: MA_DECIMAL is
			-- Ten
		once
			create Result.make_from_integer (10)
		ensure
			result_not_void: Result /= Void
		end

end

