note

	description:

		"Simple implementation of coefficients using a native array of characters"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004-2020, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MA_DECIMAL_COEFFICIENT_IMP

inherit

	MA_DECIMAL_COEFFICIENT
		rename
			three_way_comparison as three_way_comparison alias "⋚"
		redefine
			out,
			three_way_comparison
		end

	KL_IMPORTED_INTEGER_ROUTINES
		export
			{NONE} all
		undefine
			out,
			copy,
			is_equal
		end

create

	make,
	make_copy

feature {NONE} -- Initialization

	make (a_capacity: INTEGER)
			-- Make with `a_capacity'.
		do
			digits := SPECIAL_DIGITS_.make_filled (0, a_capacity)
			capacity := a_capacity
			set_count (0)
		end

	make_copy (other: like Current)
			-- Make a copy of `other'.
		do
			make (other.capacity)
			copy (other)
		end

feature -- Access

	item (index: INTEGER): INTEGER
			-- Item at `index'
		do
			Result := digits.item (index)
		end

	msd_index: INTEGER
			-- Index of most significant (non-zero) digit
		local
			l_digits: like digits
		do
			Result := count
			from
				l_digits := digits
			until
				Result = 0 or else l_digits.item (Result - 1) /= 0
			loop
				Result := Result - 1
			end
			if Result > 0 then
				Result := Result - 1
			end
		end

	subcoefficient (index_start, index_end: INTEGER): MA_DECIMAL_COEFFICIENT
			-- Subcoefficient made of digits in range [index_start..index_end]
		local
			index: INTEGER
		do
			create {MA_DECIMAL_COEFFICIENT_IMP} Result.make (index_end - index_start + 1)
			from
				index := index_start
			until
				index > index_end
			loop
				Result.put (item (index), Result.count)
				index := index + 1
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of decimal digits

	lower: INTEGER
			-- Lower index
		do
--			Result := digits.lower
			Result := 0
		end

	upper: INTEGER
			-- Upper index
		do
			Result := capacity - 1
		end

	capacity: INTEGER
			-- Capacity

feature -- Element change

	set_from_substring (s: STRING; coefficient_begin, coefficient_end: INTEGER)
			-- Set from `s', skip the decimal point if it is present.
		local
			i, k: INTEGER
			c: CHARACTER
			l_digits: like digits
		do
			if s.count > capacity then
				grow (s.count)
			end
			l_digits := digits
			from
				i := coefficient_end
				k := 0
			until
				i < coefficient_begin
			loop
				c := s.item (i)
				inspect c
				when '0' .. '9' then
					put (INTEGER_.to_integer_8 (c.code - ('0').code), k)
					k := k + 1
				else
						-- Do nothing.
				end
				i := i - 1
			variant
				i
			end
			set_count (k)
		end

	grow (a_capacity: INTEGER)
			-- Grow coefficient so that it can contain up to `a_capacity' digits.
		local
			index, new_upper: INTEGER
			l_digits: like digits
		do
			new_upper := a_capacity - 1
			if a_capacity > capacity then
				digits := SPECIAL_DIGITS_.aliased_resized_area_with_default (digits, 0, new_upper + 1)
				capacity := new_upper + 1
			end
				-- Zero msd.
			from
				index := count
				l_digits := digits
			until
				index > new_upper
			loop
				put (0, index)
				index := index + 1
			end
			set_count (a_capacity)
		end

	put (v, index: INTEGER)
			-- Put `v' at `index'-th item.
		do
			digits.put (INTEGER_.to_integer_8 (v), index)
			if index > count - 1 then
				set_count (index + 1)
			end
		end

feature -- Comparison

	three_way_comparison alias "⋚" (other: like Current): INTEGER
			-- Compare `other'; Result is [-1,0,+1] if [Current < other, Current = other, Current > other] respectively
		local
			index, count_a, count_b, local_difference: INTEGER
			l_digits, l_other_digits: like digits
		do
				-- Skip leading zeroes.
			count_a := msd_index + 1
			count_b := other.msd_index + 1
			if count_a > count_b then
				Result := 1
			elseif count_a < count_b then
				Result := -1
			else
				from
					index := count_a - 1
					l_digits := digits
					l_other_digits := other.digits
				until
					index < 0 or else local_difference /= 0
				loop
					local_difference := l_digits.item (index) - l_other_digits.item (index)
					index := index - 1
				end
				Result := local_difference.sign
			end
		end

feature -- Conversion

	out: STRING
			-- Terse printable representation
		local
			index: INTEGER
		do
			create Result.make (count)
			from
				index := count - 1
			until
				index < 0
			loop
				Result.append_string (item (index).out)
				index := index - 1
			end
		end

feature -- Duplication

	copy (other: like Current)
			-- copy `other' into `Current' without aliasing.
		local
			index, l_upper: INTEGER
			l_digits, l_other_digits: like digits
		do
			if Current /= other then
				l_upper := other.count - 1
				if digits = Void then
					make (l_upper + 1)
				elseif capacity < other.capacity then
					grow (other.capacity)
				end
				from
					index := 0
					l_digits := digits
					l_other_digits := other.digits
				until
					index > l_upper
				loop
					l_digits.put (l_other_digits.item (index), index)
					index := index + 1
				end
				set_count (index)
			end
		end

	to_twin: like Current
			-- Cloned version of `Current'
		do
			create Result.make_copy (Current)
		end

feature -- Basic operations

	keep_head (a_count: INTEGER)
			-- Keep head of 'a_count' digits.
		local
			index: INTEGER
			l_digits: like digits
		do
				-- Initialize "tail" [a_count..upper] to zero.
				-- Must do it before adapting `count' since `put' can modify `count'.
			from
				index := a_count
				l_digits := digits
			until
				index > upper
			loop
				l_digits.put (INTEGER_.to_integer_8 (0), index)
				index := index + 1
			end
				-- Keep values [0..a_count-1].
			set_count (a_count)
		end

	is_equal (other: like Current): BOOLEAN
			-- Are `Current' and `other' considered equal?
		local
			index: INTEGER
			l_digits, l_other_digits: like digits
		do
			if other.count = count then
				from
					index := count - 1
					l_digits := digits
					l_other_digits := other.digits
				until
					index < lower or else l_digits.item (index) /= l_other_digits.item (index)
				loop
					index := index - 1
				variant
					index + 1
				end
					-- found no equal item
				Result := (index < lower)
			end
		end

	shift_left (a_count: INTEGER)
			-- Shift items left.
		local
			index: INTEGER
			l_digits: like digits
		do
			grow (count + a_count)
				-- Copy digits `a_count' positions left.
			from
				index := count - 1
				l_digits := digits
			until
				index < a_count
			loop
				l_digits.put (l_digits.item (index - a_count), index)
				index := index - 1
			end
				-- Set zeroes as lsb.
			from
			until
				index < 0
			loop
				l_digits.put (INTEGER_.to_integer_8 (0), index)
				index := index - 1
			end
		end

	shift_right (a_count: INTEGER)
			-- Shift items right.
		local
			index: INTEGER
			l_digits: like digits
		do
				-- Copy digits `a_count' positions right
				-- i.e copy suffix [a_count..count] right.
			from
				index := a_count
				l_digits := digits
			until
				index >= count
			loop
				l_digits.put (l_digits.item (index), index - a_count)
				index := index + 1
			end
				-- Set zeroes as msb.
			from
				index := count - a_count
			until
				index >= count
			loop
				l_digits.put (INTEGER_.to_integer_8 (0), index)
				index := index + 1
			end
		end

	integer_add (other: like Current)
			-- Integer add of `other' to `Current'.
		local
			carry: INTEGER
			index: INTEGER
			digit: INTEGER
			l_digits, l_other_digits: like digits
		do
			from
				carry := 0
				index := 0
				l_digits := digits
				l_other_digits := other.digits
			until
				index = count
			loop
				carry := carry + l_digits.item (index) + l_other_digits.item (index)
				digit := carry \\ 10
				l_digits.put (INTEGER_.to_integer_8 (digit), index)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				grow (count + 1)
				l_digits.put (INTEGER_.to_integer_8 (carry), index)
			end
		end

	integer_multiply (a, b: like Current)
			-- Multiply `a', `b' into `Current'.
		local
			i, j, carry, digit: INTEGER
			local_a, local_b: like Current
			l_digits: like digits
			l_b_count, l_a_count: INTEGER
			l_b_digits, l_a_digits: like digits
			i_plus_j: INTEGER
		do
				-- Initialization.
--			grow (a.count + b.count + 2)
			from
				i := 0
				l_digits := digits
			until
				i >= count
			loop
				l_digits.put (INTEGER_.to_integer_8 (0), i)
				i := i + 1
			end
				-- Multiplication.
			from
				if a.count > b.count then
					local_a := a
					local_b := b
				else
					local_a := b
					local_b := a
				end
				l_a_digits := local_a.digits
				l_b_digits := local_b.digits
				l_a_count := local_a.count
				l_b_count := local_b.count
				i := 0
			until
				i >= l_b_count
			loop
				digit := l_b_digits.item (i)
				carry := 0
				from
					j := 0
					i_plus_j := i + j
				until
					j >= l_a_count
				loop
					carry := carry + digit * l_a_digits.item (j) + l_digits.item (i_plus_j)
					l_digits.put (INTEGER_.to_integer_8 (carry \\ 10), i_plus_j)
					carry := carry // 10
					j := j + 1
					i_plus_j := i_plus_j + 1
				end
				if carry > 0 then
					l_digits.put (INTEGER_.to_integer_8 (carry), i_plus_j)
				end
				i := i + 1
			end
			set_count (i + j)
			strip_leading_zeroes
		end

	integer_quick_add_msd (other, digits_count: INTEGER)
			-- Integer add of `other' (between 0 and 9) to `Current',
			-- restricted to `digits_count' most significant digits.
		local
			carry: INTEGER
			index: INTEGER
			digit: INTEGER
			l_digits: like digits
			start: INTEGER
			l_count: INTEGER
		do
			from
				l_digits := digits
				l_count := count
				carry := other
				start := count - digits_count
				index := start
			until
				index >= l_count
			loop
				carry := carry + l_digits.item (index)
				digit := carry \\ 10
				l_digits.put (INTEGER_.to_integer_8 (digit), index - start)
				carry := carry // 10
				index := index + 1
			end
			if carry /= 0 then
				l_digits.put (INTEGER_.to_integer_8 (carry), index - start)
				set_count (digits_count + 1)
			else
				set_count (digits_count)
			end
		end

	integer_subtract (other: like Current)
			-- Integer subtract of `other' to `Current',
			-- provided that result will not be negative.
		local
			borrow: INTEGER
			index: INTEGER
			l_count: INTEGER
			l_digits, l_other_digits: like digits
		do
			l_digits := digits
			l_other_digits := other.digits
			from
				borrow := 0
				index := 0
				l_count := other.msd_index + 1
			until
				index = l_count
			loop
				borrow := borrow + l_digits.item (index) - l_other_digits.item (index)
				if borrow < 0 then
					l_digits.put (INTEGER_.to_integer_8 (10 + borrow), index)
					borrow := -1
				else
					l_digits.put (INTEGER_.to_integer_8 (borrow), index)
					borrow := 0
				end
				index := index + 1
			end
			from
			until
				index = count
			loop
				borrow := borrow + l_digits.item (index)
				if borrow < 0 then
					l_digits.put (INTEGER_.to_integer_8 (10 + borrow), index)
					borrow := -1
				else
					l_digits.put (INTEGER_.to_integer_8 (borrow), index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end

	integer_quick_subtract_msd (other, digits_count: INTEGER)
			-- Integer subtract of `other' (between 0 and 9) to `Current'
			-- restricted to `digits_count' most significant digits.
		local
			borrow: INTEGER
			index, l_count, start: INTEGER
			l_digits: like digits
		do
			from
				borrow := -other
				l_count := count
				l_digits := digits
				start := count - digits_count
				index := start
			until
				index = l_count
			loop
				borrow := borrow + l_digits.item (index)
				if borrow < 0 then
--					l_digits.put (INTEGER_.to_integer_8 (10 + borrow), index - start) -- count + digits_count)
					l_digits.put (INTEGER_.to_integer_8 (10 + borrow), index - start)
					borrow := -1
				else
					l_digits.put (INTEGER_.to_integer_8 (borrow), index)
					borrow := 0
				end
				index := index + 1
			end
			strip_leading_zeroes
		end

feature {MA_DECIMAL_COEFFICIENT_IMP} -- Implementation

	digits: SPECIAL [INTEGER_8]
			-- Array of digits (with the least significant first)

	SPECIAL_DIGITS_: KL_SPECIAL_ROUTINES [INTEGER_8]
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			native_digits_array_routines_not_void: Result /= Void
		end

feature {MA_DECIMAL} -- Implementation

	set_count (a_count: INTEGER)
			-- Set `count' to `a_count'.
		do
			count := a_count
		end

invariant

	digits_not_void: digits /= Void

end
