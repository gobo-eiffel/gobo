note
	description: "Convertor to do hexadecimal string to integer/natural conversion"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen class
	HEXADECIMAL_STRING_TO_INTEGER_CONVERTER

inherit
	STRING_TO_NUMERIC_CONVERTOR

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize.
		do
			reset (type_no_limitation)
			create leading_separators.make_from_string (" ")
			create trailing_separators.make_from_string (" ")
		ensure
			leading_separators_set: leading_separators ~ " "
			trailing_separators_set: trailing_separators ~ " "
			leading_separators_not_acceptable: not leading_separators_acceptable
			trailing_separatorsnot_acceptable: not trailing_separators_acceptable
		end

feature -- Status Reporting

	separators_valid (separators: STRING): BOOLEAN
			-- Are `separators' valid?
		local
			c: CHARACTER
			done: BOOLEAN
			i: INTEGER
			l_c: INTEGER
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
				if (c >='0' and c <= '9') or c = '+' or c = '-' or c = 'X' or c = '&' or c = '#' then
					done := True
					Result := False
				end
				i := i + 1
			end
		end

	overflowed: BOOLEAN
			-- Is integer parsed so far overflowed?
		do
			Result := internal_overflowed and then sign = 0
		end

	underflowed: BOOLEAN
			-- Is integer parsed so far underflowed?
		do
			Result := internal_overflowed and then sign = 1
		end

	parse_successful: BOOLEAN
			-- This only means we didn't enter an invalid state when parsing,
			-- it doesn't mean that we have got an valid integer.
			-- You need to check `is_integral_integer' or `is_part_of_integer'.
		do
			Result := last_state /= 5 and last_state /= 6
		end

feature -- Reset

	reset (type: INTEGER)
			-- Reset this convertor to start a new parse session
			-- and get ready for parsing integer of `type'.
			-- Always call this feature before every new parse session.
			-- See `NUMERIC_INFORMATION' for more information about `type'.
		do
			last_state := 0
			sign := 0
			conversion_type := type
			internal_overflowed := False
		end

feature -- Parse

	parse_string_with_type (s: READABLE_STRING_GENERAL; type: INTEGER)
			-- `Reset' convertor to start a new parse session and
			-- parse `s' to see if it is a number of `type'.
			-- Make result available in `overflowed', `underflowed' and `parse_successful'.
			-- See `NUMERIC_INFORMATION' for more information about `type'.
			-- (Case insensitive) Hexadecimal prefixes can be '0x' or '&#x'.
		local
			i: INTEGER
			l_area8: SPECIAL [CHARACTER_8]
			l_area32: SPECIAL [CHARACTER_32]
			nb: INTEGER
			l_code: NATURAL_32
			l_c: CHARACTER_32
		do
			reset (type)
			i := 0
			nb := s.count
			if attached {READABLE_STRING_8} s as l_str8 then
				from
					l_area8 := l_str8.area
				until
					i = nb or last_state >= 4
				loop
					if i + 1 < nb then
						internal_lookahead := l_area8.item (i + 1)
					else
						internal_lookahead := ' ';
					end
					parse_character (l_area8.item (i))
					i := i + 1
				end
			elseif attached {READABLE_STRING_32} s as l_str32 then
				from
					l_area32 := l_str32.area
				until
					i = nb or last_state >= 4
				loop
					if i + 1 < nb then
						internal_lookahead := l_area32.item (i + 1).to_character_8
					else
						internal_lookahead := ' ';
					end
					l_c := l_area32.item (i)
					if l_c.is_character_8 then
						parse_character (l_c.to_character_8)
					else
							-- Not a valid character.						
						last_state := 4
					end
					i := i + 1
				end
			else
				from
					i := 1
					nb := s.count
				until
					i > nb or last_state >= 4
				loop
					if i + 1 < nb then
						internal_lookahead := s.code (i + 1).to_character_8
					else
						internal_lookahead := ' ';
					end
					l_code := s.code (i)
					if l_code.is_valid_character_8_code then
						parse_character (l_code.to_character_8)
					else
							-- Not a valid character.						
						last_state := 4
					end
					i := i + 1
				end
			end
		end

	parse_character (c: CHARACTER)
			-- Parse `c' in current parse session.
			-- Make result available in `overflowed', `underflowed' and `parse_successful'.			
		local
			temp_p1: like max_natural_type
			temp_p2: like max_natural_type
			l_state: like last_state
		do
				-- Parse according to the following specification:
				-- Integer/natural specification:
				-- Integer_literal = [Space] [Sign] [HexPrefix] [HexDigits] [Space]
				-- Space 	= " " | " " Space
				-- Sign		= "+" | "-"
				-- HexPrefix= "0x" | "0X" | "&#x" | "&#X"
				-- HexDigits= HexDigit | HexDigit Integer
				-- HexDigit	= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"|"A"|"B"|"C"|"D"|"E"|"F"|
				--				"a"|"b"|"c"|"d"|"e"|"f"
				--
				-- last_state = 0 : waiting sign or first prefix or first digit
				-- last_state = 1 : sign read, waiting first prefix or first digit
				-- last_state = 2 : prefix read, waiting first digit
				-- last_state = 3 : in the number
				-- last_state = 4 : trailing separators
				-- last_state = 5 : error state
				-- last_state = 6 : overflow state
			l_state := last_state
			if l_state <= 5 then
				inspect l_state
				when 0 then
						-- Let's find beginning of an integer, if any.
					if (c = '0' and (internal_lookahead = 'x' or internal_lookahead = 'X')) or c = '&' then
						l_state := 1
					elseif c = '-' or c = '+' then
						l_state := 1
						if c = '-' then
							sign := 1
						else
							sign := 0
						end
					elseif c.is_hexa_digit then
						l_state := 3
						part1 := 0
						part2 := c.to_hexa_digit
					elseif leading_separators_acceptable and then leading_separators.has (c) then
					else
						l_state := 4
					end
				when 1 then
						-- Let's find first prefix or digit after sign.
					if c.is_hexa_digit then
						part1 := 0
						part2 := c.to_hexa_digit
						l_state := 3
						if
							conversion_type /= type_no_limitation and then
							overflow_checker.will_overflow (part1, part2, conversion_type, sign)
						then
							internal_overflowed := True
							part2 := 0
							l_state := 6
						end
					elseif c = '#' then
						l_state := 1
					elseif c = 'x' or c = 'X' then
						l_state := 2
					end
				when 2 then
					if c.is_hexa_digit then
						part1 := 0
						part2 := c.to_hexa_digit
						l_state := 3
						if
							conversion_type /= type_no_limitation and then
							overflow_checker.will_overflow (part1, part2, conversion_type, sign)
						then
							internal_overflowed := True
							part2 := 0
							l_state := 6
						end
					end
				when 3 then
						-- Let's find another digit or end of integer.
					if c.is_hexa_digit then
						temp_p1 := part1
						temp_p2 := part2
						part1 := part1 * 16 + part2
						part2 := c.to_hexa_digit
						if conversion_type /= type_no_limitation then
							internal_overflowed := overflow_checker.will_overflow (part1, part2,
								conversion_type, sign)
							if overflowed then
								part1 := temp_p1
								part2 := temp_p2
								l_state := 6
							end
						end
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						l_state := 4
					else
						l_state := 5
					end
				when 4 then
						-- Consume remaining separators.
					if
						not trailing_separators_acceptable or else
						not trailing_separators.has (c)
					then
						l_state := 5
					end
				end
			end
			last_state := l_state
		end

feature -- Status Report

	conversion_type_valid (type: INTEGER): BOOLEAN
			-- If conversion `type' valid?
		do
			Result := integer_natural_type_valid (type)
		end

	is_part_of_integer: BOOLEAN
			-- Is character sequence that has been parsed so far a valid start part of an integer?
		do
			Result := (last_state = 0 or last_state = 1 or last_state = 2 or last_state = 3) and
					  not internal_overflowed
		end

	is_integral_integer: BOOLEAN
			-- Is character sequence that has been parsed so far a valid integral integer?
		do
			Result := (last_state = 2 or last_state = 3) and
					  not internal_overflowed
		end

	parsed_integer_8: INTEGER_8
			-- INTEGER_8 representation of parsed string.
		do
			if sign = 1 then
				Result := - (part1 * 16 + part2).as_integer_8
			else
				Result := (part1 * 16 + part2).as_integer_8
			end
		end

	parsed_integer_16: INTEGER_16
			-- INTEGER_16 representation of parsed string.
		do
			if sign = 1 then
				Result := - (part1 * 16 + part2).as_integer_16
			else
				Result := (part1 * 16 + part2).as_integer_16
			end
		end

	parsed_integer_32, parsed_integer: INTEGER
			-- INTEGER representation of parsed string.
		do
			if sign = 1 then
				Result := - (part1 * 16 + part2).as_integer_32
			else
				Result := (part1 * 16 + part2).as_integer_32
			end
		end

	parsed_integer_64: INTEGER_64
			-- INTEGER_64 representation of parsed string.
		do
			if sign = 1 then
				Result := - (part1 * 16 + part2).as_integer_64
			else
				Result := (part1 * 16 + part2).as_integer_64
			end
		end

	parsed_natural_8: NATURAL_8
			-- NATURAL_8 representation of parsed string.
		do
			Result := (part1 * 16 + part2).as_natural_8
		end

	parsed_natural_16: NATURAL_16
			-- NATURAL_16 representation of parsed string.
		do
			Result := (part1 * 16 + part2).as_natural_16
		end

	parsed_natural_32, parsed_natural: NATURAL_32
			-- NATURAL_32 representation of parsed string.
		do
			Result := (part1 * 16 + part2).as_natural_32
		end

	parsed_natural_64: NATURAL_64
			-- NATURAL_64 representation of parsed string.
		do
			Result := part1 * 16 + part2
		end

feature {NONE} -- Attributes

	internal_lookahead: CHARACTER
			-- Lookahead to decide to which state to jump on certain charaters.

	internal_overflowed: BOOLEAN
			-- Internal overflow bit.

	overflow_checker: INTEGER_OVERFLOW_CHECKER
			-- Overflow checker.
		once
			create Result.make
		ensure
			overflow_checker_not_void: Result /= Void
		end

	part1, part2: like max_natural_type
			-- Naturals used for conversion.

;note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
