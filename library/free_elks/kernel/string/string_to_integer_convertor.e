note
	description: "Convertor to do string to integer/natural conversion"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

frozen class
	STRING_TO_INTEGER_CONVERTOR

inherit
	STRING_TO_NUMERIC_CONVERTOR

create
	make

feature{NONE} -- Initialization

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

feature	-- State machine setting

	reset (type: INTEGER)
			-- Reset current convertor to parse integer of type `type'.
		do
			last_state := 0
			part1 := 0
			part2 := 0
			sign := 0
			conversion_type := type
			internal_overflowed := False
		ensure then
			internal_overflowed_set: internal_overflowed = False
			part1_set: part1 = 0
			part2_set: part2 = 0
		end

feature -- Status reporting

	separators_valid (separators: STRING): BOOLEAN
			-- Are separators contained in `separators' valid?
		local
			i, nb: INTEGER
			c: CHARACTER
			done: BOOLEAN
		do
			from
				i := 1
				nb := separators.count
				done := False
				Result := True
			until
				i > nb or done
			loop
				c := separators.item (i)
				if (c >='0' and c <= '9') or c ='+' or c = '-' then
					done := True
					Result := False
				end
				i := i + 1
			end
		end

	overflowed: BOOLEAN
			-- Is integer parsed so far overflowed?
		do
			Result := (internal_overflowed and then sign = 0)
		end

	underflowed: BOOLEAN
			-- Is integer parsed so fa underflowed?
		do
			Result := (internal_overflowed and then sign = 1)
		end

	parse_successful: BOOLEAN
			-- This only means we didn't enter an invalid state when parsing,
			-- it doesn't mean that we have got an valid integer.
			-- You need to check `is_integral_integer' or `is_part_of_integer'.
		do
			Result := (last_state /=4) and (last_state /=5)
		end


feature -- String parsing

	parse_string_with_type (s: READABLE_STRING_GENERAL; type: INTEGER)
			-- Parse string `s' as integer of type `type'.
		local
			i, nb: INTEGER
			l_area8: SPECIAL [CHARACTER_8]
			l_area32: SPECIAL [CHARACTER_32]
			l_c: CHARACTER_32
			l_code: NATURAL_32
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
					parse_character (l_area8.item (i))
					i := i + 1
				end
			elseif attached {READABLE_STRING_32} s as l_str32 then
				from
					l_area32 := l_str32.area
				until
					i = nb or last_state >= 4
				loop
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
			-- Parse next character `c'.
		local
			temp_p1: like max_natural_type
			temp_p2: like max_natural_type
			l_state: like last_state
		do
				-- Parse according to the following specification:
				-- Integer/natural specification:
				-- Integer_literal = [Space] [Sign] Integer [Space]
				-- Space 	= " " | " " Space
				-- Sign		= "+" | "-"
				-- Integer	= Digit | Digit Integer
				-- Digit	= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"

					-- last_state = 0 : waiting sign or first digit
					-- last_state = 1 : sign read, waiting first digit
					-- last_state = 2 : in the number
					-- last_state = 3 : trailing separators
					-- last_state = 4 : error state
					-- last_state = 5 : overflow state
			l_state := last_state
			if l_state <= 4 then
				inspect l_state
				when 0 then
						-- Let's find beginning of an integer, if any.
					if c.is_digit then
						l_state := 2
						part1 := 0
						part2 := (c.code - 48).to_natural_64
					elseif c = '-' or c = '+' then
						l_state := 1
						if c = '-' then
							sign := 1
						else
							sign := 0
						end
					elseif leading_separators_acceptable and then leading_separators.has (c) then
					else
						l_state := 4
					end
				when 1 then
						-- Let's find first digit after sign.
					if c.is_digit then
						part1 := 0
						part2 := (c.code - 48).to_natural_64
						l_state := 2
						if conversion_type /= type_no_limitation then
							if overflow_checker.will_overflow (part1, part2, conversion_type, sign) then
								internal_overflowed := True
								part1 := temp_p1
								part2 := temp_p2
								l_state := 5
							end
						end
					else
						l_state := 4
					end
				when 2 then
						-- Let's find another digit or end of integer.
					if c.is_digit then
						temp_p1 := part1
						temp_p2 := part2
						part1 := part1*10 + part2
						part2 := (c.code - 48).to_natural_64
						if conversion_type /= type_no_limitation then
							internal_overflowed := overflow_checker.will_overflow (part1, part2, conversion_type, sign)
							if overflowed then
								part1 := temp_p1
								part2 := temp_p2
								l_state := 5
							end
						end
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						l_state := 3
					else
						l_state := 4
					end
				when 3 then
						-- Consume remaining separators.
					if trailing_separators_acceptable and then trailing_separators.has (c) then
					else
						l_state := 4
					end
				end
			end
			last_state := l_state
		end

feature -- Status reporting

	conversion_type_valid (type: INTEGER): BOOLEAN
			-- If conversion `type' valid?
		do
			Result := integer_natural_type_valid (type)
		end

	is_part_of_integer: BOOLEAN
			-- Is character sequence that has been parsed so far a valid start part of an integer?
		do
			Result := ((last_state = 0) or (last_state = 1) or
					  (last_state = 2) or (last_state = 3)) and
					  (not internal_overflowed)
		end

	is_integral_integer: BOOLEAN
			-- Is character sequence that has been parsed so far a valid integral integer?
		do
			Result := ((last_state = 2) or (last_state = 3)) and
					  (not internal_overflowed)
		end

	parsed_integer_8: INTEGER_8
			-- INTEGER_8 representation of parsed string
		do
			if sign = 1 then
				Result := - (part1 * 10 + part2).as_integer_8
			else
				Result := (part1 * 10 + part2).as_integer_8
			end
		end

	parsed_integer_16: INTEGER_16
			-- INTEGER_16 representation of parsed string
		do
			if sign = 1 then
				Result := - (part1 * 10 + part2).as_integer_16
			else
				Result := (part1 * 10 + part2).as_integer_16
			end
		end

	parsed_integer_32, parsed_integer: INTEGER
			-- INTEGER representation of parsed string
		do
			if sign = 1 then
				Result := - (part1 * 10 + part2).as_integer_32
			else
				Result := (part1 * 10 + part2).as_integer_32
			end
		end

	parsed_integer_64: INTEGER_64
			-- INTEGER_64 representation of parsed string
		do
			if sign = 1 then
				Result := - (part1 * 10 + part2).as_integer_64
			else
				Result := (part1 * 10 + part2).as_integer_64
			end
		end

	parsed_natural_8: NATURAL_8
			-- NATURAL_8 representation of parsed string
		do
			Result := (part1 * 10 + part2).as_natural_8
		end

	parsed_natural_16: NATURAL_16
			-- NATURAL_16 representation of parsed string
		do
			Result := (part1 * 10 + part2).as_natural_16
		end

	parsed_natural_32, parsed_natural: NATURAL_32
			-- NATURAL_32 representation of parsed string
		do
			Result := (part1 * 10 + part2).as_natural_32
		end

	parsed_natural_64: NATURAL_64
			-- NATURAL_64 representation of parsed string
		do
			Result := part1 * 10 + part2
		end

feature{NONE} -- Implementation

	overflow_checker: INTEGER_OVERFLOW_CHECKER
			-- Overflow checker
		once
			create Result.make
		ensure
			overflow_checker_not_void: Result /= Void
		end

	part1, part2: like max_natural_type
			-- Naturals used for conversion	

	internal_overflowed: BOOLEAN;
			-- Internal overflow flag

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
