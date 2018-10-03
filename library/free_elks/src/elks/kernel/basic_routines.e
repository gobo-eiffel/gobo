note
	description: "Some useful facilities on objects of basic types."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	BASIC_ROUTINES

feature -- Conversion

	charconv (i: INTEGER): CHARACTER
			-- Character associated with integer value `i'.
		do
			Result := (i & 0x000000FF).to_character_8
		ensure
			instance_free: class
		end

feature -- Basic operations

	abs (n: INTEGER): INTEGER
			-- Absolute value of `n`.
		obsolete "Use {INTEGER}.abs instead. [2018-06-01]"
		do
			if n < 0 then
				Result := -n
			else
				Result := n
			end
		ensure
			instance_free: class
			non_negative_result: Result >= 0
		end

	sign (n: INTEGER): INTEGER
			-- Sign of `n':
			-- -1 if `n' < 0
			--  0 if `n' = 0
			-- +1 if `n' > 0
		obsolete "Use {INTEGER}.sign instead. [2018-06-01]"
		do
			if n < 0 then
				Result := -1
			elseif n > 0 then
				Result := 1
			end
		ensure
			instance_free: class
			correct_negative: (n < 0) = (Result = -1)
			correct_zero: (n = 0) = (Result = 0)
			correct_positive: (n > 0) = (Result = 1)
		end

	rsign (r: REAL_32): INTEGER
			-- Sign of `r':
			-- -1 if `r' < 0
			--  0 if `r' = 0
			-- +1 if `r' > 0
		obsolete "Use {REAL_32}.sign instead. [2018-06-01]"
		do
			if r < 0 then
				Result := -1
			elseif r > 0 then
				Result := 1
			end
		ensure
			instance_free: class
			correct_negative: (r < 0) = (Result = -1)
			correct_zero: (r = 0) = (Result = 0)
			correct_positive: (r > 0) = (Result = 1)
		end

	bottom_int_div (n1, n2: INTEGER): INTEGER
			-- Greatest lower bound of the integer division of `n1' by `n2'.
		do
			Result := n1 // n2
			if
				(n1 >= 0 xor n2 > 0) and then
				n1 \\ n2 /= 0
			then
				Result := Result - 1
			end
		ensure
			instance_free: class
		end

	up_int_div (n1, n2: INTEGER): INTEGER
			-- Least upper bound of the integer division
			-- of `n1' by `n2'.
		do
			Result := n1 // n2
			if
				not (n1 >= 0 xor n2 > 0) and then
				n1 \\ n2 /= 0
			then
				Result := Result + 1
			end
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
