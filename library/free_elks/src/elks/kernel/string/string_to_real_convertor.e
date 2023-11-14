note
	description: "String to real/double convertor"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2023-03-13 09:36:33 +0000 (Mon, 13 Mar 2023) $"
	revision: "$Revision: 106668 $"

frozen class
	STRING_TO_REAL_CONVERTOR

inherit
	STRING_TO_NUMERIC_CONVERTOR

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize.
		do
			create leading_separators.make_from_string (" ")
			create trailing_separators.make_from_string (" ")
		ensure
			leading_separators_set: leading_separators ~ " "
			trailing_separators_set: trailing_separators ~ " "
			leading_separators_not_acceptable:
				not leading_separators_acceptable
			trailing_separatorsnot_acceptable:
				not trailing_separators_acceptable
		end

feature -- Status reporting

	conversion_type_valid (type: INTEGER): BOOLEAN
			-- Is conversion type `type' valid?
		do
			Result := real_double_type_valid (type)
		end

	overflowed: BOOLEAN
			-- Is real number parsed so far overflowed?
		do
			Result := False
		end

	underflowed: BOOLEAN
			-- Is real number parsed so far underflowed?
		do
			Result := False
		end

	parse_successful: BOOLEAN
			-- This only means we didn't enter an invalid state when parsing,
			-- it doesn't mean that we have got an valid double/real number.
			-- You need to check `is_double' or `is_real'.
		do
			Result := last_state /= 9
		end

	separators_valid (separators: STRING): BOOLEAN
			-- Are separators contained in `separators' valid?
		local
			i: INTEGER
			c: CHARACTER
			l_c: INTEGER
			done: BOOLEAN
		do
			from
				i := 1
				l_c := separators.count
				done := False
				Result := True
			until
				i > l_c or done
			loop
				c := separators.item (i)
				if (c >='0' and c <= '9') or c ='+' or c = '-' or c = 'E' or c = 'e' then
					done := True
					Result := False
				end
				i := i + 1
			end
		end

	is_integral_double: BOOLEAN
			-- Is character sequence that has been parsed represents a valid double?
		do
			Result := (last_state > 1 and last_state < 9) and (not needs_digit)
		end

	is_integral_real: BOOLEAN
			-- Is character sequence that has been parsed represents a valid real?
		do
			Result := is_integral_double
		end

	is_part_of_double: BOOLEAN
			-- Is character sequence that has been parsed so far a valid start part of double?
		do
			Result := last_state /= 9
		end

	is_part_of_real: BOOLEAN
			-- Is character sequence that has been parsed so far a valid start part of real?
		do
			Result := is_part_of_double
		end

	parsed_double: REAL_64
			-- Parsed double value
		do
			if has_negative_exponent then
				exponent := -exponent
			end
			if has_fractional_part then
				natural_part := natural_part + fractional_part / fractional_divider
			end
			if is_negative then
				Result := -natural_part * (10.0 ^ exponent)
			else
				Result := natural_part * (10.0 ^ exponent)
			end
		end

	parsed_real: REAL_32
			-- Parsed real value
		do
			Result := parsed_double.truncated_to_real
		end

feature -- Status setting

	reset (type: INTEGER)
			-- Reset current convertor to parse real number string of type `type'.
		do
			conversion_type := type
			sign := 0
			last_state := 0

			natural_part := 0
			fractional_part := 0
			fractional_divider := 0
			exponent := 0
			is_negative := False
			has_negative_exponent := False
			has_fractional_part := False
			needs_digit := False
		ensure then
			natural_part_set: natural_part = 0
			fractional_part_set: fractional_part = 0
			fractional_divider_set: fractional_divider = 0
			exponent_set: exponent = 0
			is_negative_set: not is_negative
			has_negative_exponent_set: not has_negative_exponent
			has_fractional_part_set: not has_fractional_part
			needs_digit_set: not needs_digit
		end

feature -- Parse

	parse_string_with_type (s: READABLE_STRING_GENERAL; type: INTEGER)
			-- Parse string `s' as real number of type `type'.
		local
			i, nb: INTEGER
			l_area8: SPECIAL [CHARACTER_8]
			l_area32: SPECIAL [CHARACTER_32]
			l_c: CHARACTER_32
			l_code: NATURAL_32
		do
			reset (type)
			if attached {READABLE_STRING_8} s as l_str8 then
				from
					l_area8 := l_str8.area
					i := l_str8.area_lower
					nb := i + l_str8.count
				until
					i = nb or last_state = 9
				loop
					parse_character (l_area8.item (i))
					i := i + 1
				end
			elseif attached {READABLE_STRING_32} s as l_str32 then
				from
					l_area32 := l_str32.area
					i := l_str32.area_lower
					nb := i + l_str32.count
				until
					i = nb or last_state = 9
				loop
					l_c := l_area32.item (i)
					if l_c.is_character_8 then
						parse_character (l_c.to_character_8)
					else
							-- Not a valid character.
						last_state := 9
					end
					i := i + 1
				end
			else
				from
					i := 1
					nb := s.count
				until
					i > nb or last_state = 9
				loop
					l_code := s.code (i)
					if l_code.is_valid_character_8_code then
						parse_character (l_code.to_character_8)
					else
							-- Not a valid character.
						last_state := 9
					end
					i := i + 1
				end
			end
		end

	parse_character (c: CHARACTER)
			-- Parse character `c'.
		do
				-- Parse according to the following specification:
				-- Real/double number specification:
				-- Real_literal	= Mantissa [Exponent_part]
				-- Exponent_part = "E" Exponent
				--				 | "e" Exponent
				-- Exponent		= Integer_literal
				-- Mantissa		= Decimal_literal
				-- Decimal_literal = Integer_literal ["." [Integer]] | [Sign] "." Integer
				-- Integer_literal = [Sign] Integer
				-- Sign			= "+" | "-"
				-- Integer		= Digit | Digit Integer
				-- Digit		= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9".

					-- last_state = 0 : waiting sign or double value.
					-- last_state = 1 : sign read, waiting double value.
					-- last_state = 2 : in the number.
					-- last_state = 3 : decimal point read
					-- last_state = 4 : in fractional part
					-- last_state = 5 : read 'E' or 'e' for scientific notation
					-- last_state = 6 : sign of exponent read, waiting for digit.
					-- last_state = 7 : in exponent
					-- last_state = 8 : after the number.
					-- last_state = 9 : error state.
				inspect
					last_state
				when 0 then
						-- Let's find beginning of double.
					if c.is_digit then
						last_state := 2
						natural_part := c.code - 48
					elseif c = '+' then
						last_state := 1
					elseif c = '-' then
						last_state := 1
						is_negative := True
					elseif leading_separators_acceptable and then leading_separators.has (c) then
							-- Do nothing.
					elseif c = '.' then
						last_state := 3
						needs_digit := True
					else
						last_state := 9
					end
				when 1 then
						-- Let's find first digit after sign.
					if c.is_digit then
						last_state := 2
						natural_part := c.code - 48
					elseif c = '.' then
						last_state := 3
						needs_digit := True
					else
						last_state := 9
					end
				when 2 then
						-- Let's find more digit for mantissa.
					if c.is_digit then
						natural_part := natural_part * 10.0 + c.code - 48
					elseif c = '.' then
						last_state := 3
						needs_digit := False
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						last_state := 8
					elseif c.as_lower = 'e' then
							-- Not conform to ECMA standard, just for backward compatibility.
						last_state := 5
					else
						last_state := 9
					end
				when 3 then
						-- We are done with mantissa, now reads decimal part
					if c.is_digit then
						last_state := 4
						has_fractional_part := True
						fractional_part := c.code - 48
						fractional_divider := 10.0
						needs_digit := False
					elseif c.as_lower = 'e' and not needs_digit then
						needs_digit := True
						last_state := 5
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						last_state := 8
					else
						last_state := 9
					end
				when 4 then
						-- Continue reading decimal part
					if c.is_digit then
						fractional_part := fractional_part * 10.0 + (c.code - 48)
						fractional_divider := fractional_divider * 10.0
					elseif c.as_lower = 'e' then
						needs_digit := True
						last_state := 5
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						last_state := 8
					else
						last_state := 9
					end
				when 5 then
						-- Found `e' or `E'. Read signs of exponent if any.
					if c = '-' then
						has_negative_exponent := True
						last_state := 6
					elseif c = '+' then
						last_state := 6
					elseif c.is_digit then
						needs_digit := False
						last_state := 7
						exponent := c.code - 48
					else
							-- We get here if after reading the sign we do not
							-- find a digit, or if there is no sign there was no
							-- digit.
						last_state := 9
					end
				when 6 then
						-- Sign of exponent read, waiting for digit
					if c.is_digit then
						last_state := 7
						exponent := c.code - 48
						needs_digit := False
					else
						last_state := 9
					end
				when 7 then
						-- Continue reading exponent
					if c.is_digit then
							exponent := exponent * 10 + c.code - 48
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						last_state := 8
					else
						last_state := 9
					end
				when 8 then
					if not trailing_separators.has (c) then
						last_state := 9
					end
				else
				end
		end

feature{NONE} -- Implementation

	natural_part: REAL_64
	fractional_part: REAL_64
	fractional_divider: REAL_64
	exponent: INTEGER
	is_negative: BOOLEAN
	has_negative_exponent: BOOLEAN
	has_fractional_part: BOOLEAN
	needs_digit: BOOLEAN;
			-- Used to calculate real/double value

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
