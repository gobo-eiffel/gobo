indexing
	description: "Some useful facilities on objects of basic types"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	BASIC_ROUTINES

feature -- Conversion

	charconv (i: INTEGER): CHARACTER is
			-- Character associated with integer value `i'
		do
			Result := (i & 0x000000FF).to_character_8
		end

feature -- Basic operations

	abs (n: INTEGER): INTEGER is
			-- Absolute value of `n'
		do
			if n < 0 then
				Result := -n
			else
				Result := n
			end
		ensure
			non_negative_result: Result >= 0
		end

	sign (n: INTEGER): INTEGER is
			-- Sign of `n':
			-- -1 if `n' < 0
			--  0 if `n' = 0
			-- +1 if `n' > 0
		do
			if n < 0 then
				Result := -1
			elseif n > 0 then
				Result := +1
			end
		ensure
			correct_negative: (n < 0) = (Result = -1)
			correct_zero: (n = 0) = (Result = 0)
			correct_positive: (n > 0) = (Result = +1)
		end

	rsign (r: REAL): INTEGER is
			-- Sign of `r':
			-- -1 if `r' < 0
			--  0 if `r' = 0
			-- +1 if `r' > 0
		do
			if r < 0 then
				Result := -1
			elseif r > 0 then
				Result := +1
			end
		ensure
			correct_negative: (r < 0) = (Result = -1)
			correct_zero: (r = 0) = (Result = 0)
			correct_positive: (r > 0) = (Result = +1)
		end

	bottom_int_div (n1, n2: INTEGER): INTEGER is
			-- Greatest lower bound of the integer division of `n1' by `n2'
		do
			Result := n1 // n2
			if n1 >= 0 xor n2 > 0 then
				if (n1 \\ n2) /= 0 then
					Result := Result - 1
				end
			end
		end

	up_int_div (n1, n2: INTEGER): INTEGER is
			-- Least upper bound of the integer division
			-- of `n1' by `n2'
		do
			Result := n1 // n2
			if not (n1 >= 0 xor n2 > 0) then
				if (n1 \\ n2) /= 0 then
					Result := Result + 1
				end
			end
		end

end
