note
	description: "String - Integer/Natural conversion overflow checker"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	INTEGER_OVERFLOW_CHECKER

inherit
	NUMERIC_INFORMATION

create
	make

feature{NONE} -- Initialization

	make
			-- Initialize.
		do
			create integer_overflow_state1.make_empty (type_count * 2 + 1)
			integer_overflow_state1.extend (0)
			create integer_overflow_state2.make_empty (type_count * 2 + 1)
			integer_overflow_state2.extend (0)

			integer_overflow_state1.extend (({INTEGER_8}.max_value // 10).to_natural_64)
			integer_overflow_state2.extend (({INTEGER_8}.max_value \\ 10).to_natural_64)
			integer_overflow_state1.extend (({INTEGER_16}.max_value // 10).to_natural_64)
			integer_overflow_state2.extend (({INTEGER_16}.max_value \\ 10).to_natural_64)
			integer_overflow_state1.extend (({INTEGER}.max_value // 10).to_natural_64)
			integer_overflow_state2.extend (({INTEGER}.max_value \\ 10).to_natural_64)
			integer_overflow_state1.extend (({INTEGER_64}.max_value // 10).to_natural_64)
			integer_overflow_state2.extend (({INTEGER_64}.max_value \\ 10).to_natural_64)

			integer_overflow_state1.extend ((-({INTEGER_8}.min_value // 10)).to_natural_64)
			integer_overflow_state2.extend ((-({INTEGER_8}.min_value \\ 10)).to_natural_64)
			integer_overflow_state1.extend ((-({INTEGER_16}.min_value // 10)).to_natural_64)
			integer_overflow_state2.extend ((-({INTEGER_16}.min_value \\ 10)).to_natural_64)
			integer_overflow_state1.extend ((-({INTEGER}.min_value // 10)).to_natural_64)
			integer_overflow_state2.extend ((-({INTEGER}.min_value \\ 10)).to_natural_64)
			integer_overflow_state1.extend ((-({INTEGER_64}.min_value // 10)).to_natural_64)
			integer_overflow_state2.extend ((-({INTEGER_64}.min_value \\ 10)).to_natural_64)

			create natural_overflow_state1.make_empty (type_count + 1)
			natural_overflow_state1.extend (0)
			create natural_overflow_state2.make_empty (type_count + 1)
			natural_overflow_state2.extend (0)

			natural_overflow_state1.extend (({NATURAL_8}.max_value // 10).to_natural_64)
			natural_overflow_state2.extend (({NATURAL_8}.max_value \\ 10).to_natural_64)
			natural_overflow_state1.extend (({NATURAL_16}.max_value // 10).to_natural_64)
			natural_overflow_state2.extend (({NATURAL_16}.max_value \\ 10).to_natural_64)
			natural_overflow_state1.extend (({NATURAL_32}.max_value // 10).to_natural_64)
			natural_overflow_state2.extend (({NATURAL_32}.max_value \\ 10).to_natural_64)
			natural_overflow_state1.extend (({NATURAL_64}.max_value // 10).to_natural_64)
			natural_overflow_state2.extend (({NATURAL_64}.max_value \\ 10).to_natural_64)
		end

feature -- Overflow checking

	will_overflow (part1: like max_natural_type; part2: like max_natural_type; type: INTEGER; sign: INTEGER): BOOLEAN
			-- Will `part1' * 10 + `part2' with `sign' overflow
			-- if we convert it to an number of `type'?			
		require
			type_valid: integer_natural_type_valid (type)
		local
			l_index: INTEGER
		do
			if type /= type_no_limitation then
				if type = type_integer_8 or type = type_integer_16 or
				   type = type_integer_32 or type = type_integer_64
				then
					l_index := sign * 4 + type
					Result := part1 > integer_overflow_state1.item (l_index) or
							  (part1 = integer_overflow_state1.item (l_index) and
	  				          part2 > integer_overflow_state2.item (l_index))
				elseif sign = 1 then
					Result := part1 > 0 or part2 > 0
				else
					l_index := type - type_integer_natural_separator
					Result := part1 > natural_overflow_state1.item (l_index) or
							  (part1 = natural_overflow_state1.item (l_index) and
							  part2 > natural_overflow_state2.item (l_index))
				end
			end
		end

feature{NONE} -- Implementation

	integer_overflow_state1: SPECIAL [like max_natural_type]
	integer_overflow_state2: SPECIAL [like max_natural_type]
	natural_overflow_state1: SPECIAL [like max_natural_type]
	natural_overflow_state2: SPECIAL [like max_natural_type];
			-- Arrays to check conversion overflow.

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
