indexing
	description: "Convertor to do string to integer/natural conversion"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_TO_INTEGER_CONVERTOR

inherit
	STRING_TO_NUMERIC_CONVERTOR

create
	make

feature{NONE} -- Initialization

	make is
			-- Initialize.
		do
			reset (type_no_limitation)
			set_leading_separators (" ")
			set_trailing_separators (" ")
		ensure
			leading_separators_set: leading_separators.is_equal (" ")
			trailing_separators_set: trailing_separators.is_equal (" ")
			leading_separators_not_acceptable:
				not leading_separators_acceptable
			trailing_separatorsnot_acceptable:
				not trailing_separators_acceptable
		end

feature	-- State machine setting

	reset (type: INTEGER) is
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

	separators_valid (separators: STRING): BOOLEAN is
			-- Are separators contained in `separators' valid?
		local
			i: INTEGER
			l_c: INTEGER
			c: CHARACTER
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
				if (c >='0' and c <= '9') or c ='+' or c = '-' then
					done := True
					Result := False
				end
				i := i + 1
			end
		end

	overflowed: BOOLEAN is
			-- Is integer parsed so fa overflowed?
		do
			Result := (internal_overflowed and then sign = 0)
		end

	underflowed: BOOLEAN is
			-- Is integer parsed so fa underflowed?
		do
			Result := (internal_overflowed and then sign = 1)
		end

	parse_successful: BOOLEAN is
			-- This only means we didn't enter an invalid state when parsing,
			-- it doesn't mean that we have got an valid integer.
			-- You need to check `is_integral_integer' or `is_part_of_integer'.
		do
			Result := (last_state /=4) and (last_state /=5)
		end


feature -- String parsing

	parse_string_with_type (s: STRING_GENERAL; type: INTEGER) is
			-- Parse string `s' as integer of type `type'.
		local
			i: INTEGER
			l_c: INTEGER
		do
			reset (type)
			from
				i := 1
				l_c := s.count
			until
				i > l_c or last_state = 4 or last_state = 5
			loop
				parse_character (s.code (i).to_character_8)
				i := i + 1
			end
		end

	parse_character (c: CHARACTER) is
			-- Parse next character `c'.
		local
			temp_p1: like max_natural_type
			temp_p2: like max_natural_type
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
			if last_state /= 4 and last_state /= 5 then
				temp_p1 := (0).to_natural_64
				temp_p2 := (0).to_natural_64
				inspect last_state
				when 0 then
						-- Let's find beginning of an integer, if any.
					if c.is_digit then
						last_state := 2
						part1 := 0
						part2 := (c.code - 48).to_natural_64
					elseif c = '-' or c = '+' then
						last_state := 1
						if c = '-' then
							sign := 1
						else
							sign := 0
						end
					elseif leading_separators_acceptable and then leading_separators.has (c) then
					else
						last_state := 4
					end
				when 1 then
						-- Let's find first digit after sign.
					if c.is_digit then
						part1 := 0
						part2 := (c.code - 48).to_natural_64
						if conversion_type /= type_no_limitation then
							internal_overflowed := overflow_checker.will_overflow (part1, part2, conversion_type, sign)
							if internal_overflowed then
								part1 := temp_p1
								part2 := temp_p2
								last_state := 5
							end
						end
						last_state := 2
					else
						last_state := 4
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
								last_state := 5
								part1 := temp_p1
								part2 := temp_p2
							end
						end
					elseif trailing_separators_acceptable and then trailing_separators.has (c) then
						last_state := 3
					else
						last_state := 4
					end
				when 3 then
						-- Consume remaining separators.
					if trailing_separators_acceptable and then trailing_separators.has (c) then
					else
						last_state := 4
					end
				end
			end
		end

feature -- Status reporting

	conversion_type_valid (type: INTEGER): BOOLEAN is
			-- If conversion `type' valid?
		do
			Result := integer_natural_type_valid (type)
		end

	is_part_of_integer: BOOLEAN is
			-- Is character sequence that has been parsed so far a valid start part of an integer?
		do
			Result := ((last_state = 0) or (last_state = 1) or
					  (last_state = 2) or (last_state = 3)) and
					  (not internal_overflowed)
		end

	is_integral_integer: BOOLEAN is
			-- Is character sequence that has been parsed so far a valid integral integer?
		do
			Result := ((last_state = 2) or (last_state = 3)) and
					  (not internal_overflowed)
		end

	parsed_integer_8: INTEGER_8 is
			-- INTEGER_8 representation of parsed string
		local
			l1: INTEGER_8
		do

			l1 := part1.as_integer_8
			l1 := l1 * 10
			if sign = 1 then
				Result := - l1 - part2.as_integer_8
			else
				Result := l1 + part2.as_integer_8
			end
		end

	parsed_integer_16: INTEGER_16 is
			-- INTEGER_16 representation of parsed string
		local
			l1: INTEGER_16
		do
			l1 := part1.as_integer_16
			l1 := l1 * 10
			if sign = 1 then
				Result := - l1 - part2.as_integer_16
			else
				Result := l1 + part2.as_integer_16
			end
		end

	parsed_integer_32, parsed_integer: INTEGER is
			-- INTEGER representation of parsed string
		local
			l1: INTEGER
		do
			l1 := part1.as_integer_32
			l1 := l1 * 10
			if sign = 1 then
				Result := - l1 - part2.as_integer_32
			else
				Result := l1 + part2.as_integer_32
			end
		end

	parsed_integer_64: INTEGER_64 is
			-- INTEGER_64 representation of parsed string
		local
			l1: INTEGER_64
		do
			l1 := part1.as_integer_64
			l1 := l1 * 10
			if sign = 1 then
				Result := - l1 - part2.as_integer_64
			else
				Result := l1 + part2.as_integer_64
			end
		end

	parsed_natural_8: NATURAL_8 is
			-- NATURAL_8 representation of parsed string
		local
			l1: NATURAL_8
		do
			l1 := part1.as_natural_8
			l1 := l1 * 10
			Result := l1 + part2.as_natural_8
		end

	parsed_natural_16: NATURAL_16 is
			-- NATURAL_16 representation of parsed string
		local
			l1: NATURAL_16
		do
			l1 := part1.as_natural_16
			l1 := l1 * 10
			Result := l1 + part2.as_natural_16
		end

	parsed_natural_32, parsed_natural: NATURAL_32 is
			-- NATURAL_32 representation of parsed string
		local
			l1: NATURAL_32
		do
			l1 := part1.as_natural_32
			l1 := l1 * 10
			Result := l1 + part2.as_natural_32
		end

	parsed_natural_64: NATURAL_64 is
			-- NATURAL_64 representation of parsed string
		local
			l1: NATURAL_64
		do
			l1 := part1.as_natural_64
			l1 := l1 * 10
			Result := l1 + part2.as_natural_64
		end

feature{NONE} -- Implementation

	overflow_checker: INTEGER_OVERFLOW_CHECKER is
			-- Overflow checker
		once
			create Result.make
		end

	part1, part2: like max_natural_type
			-- Naturals used for conversion	

	internal_overflowed: BOOLEAN
			-- Internal overflow flag

end
