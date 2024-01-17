note

	description:

		"Decimal coefficients. They hold the significant digits. %
		%Can be seen as arrays of decimal values. %
		%Zero-based index. %
		%- Index '0' is the least significant digit, %
		%- index 'count-'1 is the most significant digit."

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"

deferred class MA_DECIMAL_COEFFICIENT

inherit

	KL_COMPARABLE
		undefine
			is_equal,
			copy
		redefine
			is_greater
		end

feature {NONE} -- Initialization

	make (a_capacity: INTEGER)
			-- Make with `a_capacity'.
		require
			a_capacity_positive: a_capacity > 0
		deferred
		ensure
			capacity_set: capacity >= a_capacity
			count_zero: count = 0
			lower_set: lower = 0
			upper_set: upper = capacity - 1
		end

	make_copy (other: like Current)
			-- Make a copy of `other'.
		require
			other_not_void: other /= Void
		deferred
		ensure
			capacity_set: capacity >= other.capacity
			equal_other: is_equal (other)
		end

feature -- Access

	item (index: INTEGER): INTEGER
			-- Item at `index'
		require
			valid_index: valid_index (index)
		deferred
		end

	msd_index: INTEGER
			-- Index of most significant (non-zero) digit
		deferred
		ensure
			msd_index_small_enough: Result < count
			msd_index_large_enough: Result >= 0
			index_of_msd_or_zero: Result > 0 implies item (Result) /= 0
		end

feature -- Measurement

	count: INTEGER
			-- Number of decimal digits
		deferred
		end

	lower: INTEGER
			-- Lower index
		deferred
		ensure
			definition: Result = 0
		end

	upper: INTEGER
			-- Upper index
		deferred
		ensure
			definition: Result <= capacity - 1
		end

	capacity: INTEGER
			-- Capacity
		deferred
		ensure
			definition: capacity >= count
		end

	subcoefficient (index_start, index_end: INTEGER): MA_DECIMAL_COEFFICIENT
			-- Subcoefficient made of digits in range [index_start..index_end]
		require
			index_start_big_enough: index_start >= 0
			index_end_big_enough: index_end >= index_start
			index_end_small_enough: index_end <= count - 1
		deferred
		ensure
			subcoefficient_not_void: Result /= Void
		end

feature -- Status report

	valid_index (index: INTEGER): BOOLEAN
			-- Is `index' valid ?
		do
			Result := (index >= 0 and then index < count)
		ensure
			definition: Result = (index >= 0 and then index < count)
		end

	is_zero: BOOLEAN
			-- Is this coefficient only composed of zeros?
		local
			i: INTEGER
		do
			Result := True
			from
				i := count - 1
			until
				i < 0
			loop
				if item (i) /= 0 then
					Result := False
					i := -1
				else
					i := i - 1
				end
			end
		end

	is_one: BOOLEAN
			-- Is `Current' one?
		do
			Result := (msd_index = 0 and then item (0) = 1)
		ensure
			definition: Result = (msd_index = 0 and then item (0) = 1)
		end

	is_significant: BOOLEAN
			-- Has `Current' any non-zero digit?
		do
			Result := not is_zero
		ensure
			definition: Result = not is_zero
		end

feature {MA_DECIMAL} -- Status setting

	set_from_substring (s: STRING; coefficient_begin, coefficient_end: INTEGER)
			-- Set from `s', skip the decimal point if it is present.
		require
			s_not_void: s /= Void
			coefficient_begin: coefficient_begin >= 1
			coefficient_end: coefficient_end <= s.count
			coefficient_end_ge_begin: coefficient_end >= coefficient_begin
		deferred
		ensure
--			definition: All digits in s are in Current at the right position.
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is `Current' less than `other'?
		do
			Result := (three_way_comparison (other) = -1)
		end

	is_greater alias ">" (other: like Current): BOOLEAN
			-- Is `Current' greater than `other'?
		do
			Result := (three_way_comparison (other) = 1)
		end

feature {MA_DECIMAL, MA_DECIMAL_PARSER, MA_DECIMAL_COEFFICIENT} -- Element change

	put (v, index: INTEGER)
			-- Put `v' at `index'-th item.
		require
			valid_index: index >= 0 and index < capacity
			valid_v: v >= 0 and v <= 9
		deferred
		ensure
			item_set: item (index) = v
			adapted_count: (index + 1 > old count) implies count = index + 1
		end

	grow (a_capacity: INTEGER)
			-- Grow coefficient so that it can contain up to `a_capacity' digits.
		require
			a_capacity_large_enough: a_capacity >= count
		deferred
		ensure
			new_capacity: capacity >= a_capacity
			adapted_count: count = a_capacity
		end

feature -- Duplication

	to_twin: like Current
			-- Cloned version of `Current'
		deferred
		ensure
			twin_not_void: Result /= Void
			twin_not_current: Result /= Current
			tiwn_equal_current: Result.is_equal (Current)
		end

feature {MA_DECIMAL, MA_DECIMAL_COEFFICIENT} -- Basic operations

	integer_add (other: like Current)
			-- Integer add of `other' to `Current'.
		require
			other_not_void: other /= Void
			same_count: count <= other.count
		deferred
		ensure
			new_count: count >= old count
		end

	integer_multiply (a, b: like Current)
			-- Multiply `a', `b' into `Current'.
		require
			a_not_void: a /= Void
			b_not_void: b /= Void
			capacity_sufficient: capacity > a.count + b.count
		deferred
		end

	integer_quick_add_msd (other, digits_count: INTEGER)
			-- Integer add of `other' (between 0 and 9) to `Current',
			-- restricted to `digits_count' most significant digits.
		require
			other_limits: other >= 0 and other <= 9
			digits_count: digits_count >= 0 and digits_count <= count
		deferred
		ensure
			new_count: count <= digits_count + 1
--			stripped_zeroes: count > 1 implies item (count - 1) /= 0
		end

	integer_subtract (other: like Current)
			-- Integer subtract of `other' to `Current',
			-- provided that result will not be negative.
		require
			other_not_void: other /= Void
			other_smaller: other <= Current
		deferred
		end

	integer_quick_subtract_msd (other, digits_count: INTEGER)
			-- Integer subtract of `other' (between 0 and 9) to `Current'
			-- restricted to `digits_count' most significant digits.
		require
			other_limits: other >= 0 and other <= 9
			digits_count: digits_count >= 0 and digits_count <= count
		deferred
		ensure
			new_count: count <= digits_count + 1
--			stripped_zeroes: count > 1 implies item (count - 1) /= 0
		end

	keep_head (a_count: INTEGER)
			-- Keep head of 'a_count' digits.
		require
			a_count_valid: a_count > 0 and a_count <= count
		deferred
		ensure
			adapted_count: count = a_count
			unchanged_capacity: capacity = old capacity
		end

--	set_canonical is
--			-- Remove any leading zero, except last one.
--		local
--			index: INTEGER
--		do
--			index := msd_index
--			if index < count - 1 then
--				keep_head (index + 1)
--			end
--		ensure
--			adapted_count: count <= old count
--			non_zero_item: item (count - 1) /= 0
--		end

	strip_leading_zeroes
			-- Strip leading zeroes.
		local
			index: INTEGER
		do
			index := msd_index
			set_count (index + 1)
		ensure
			no_leading_zero: count > 1 implies item (count - 1) /= 0
		end

	shift_left (a_count: INTEGER)
			-- Shift items left.
		require
			a_count_greater_zero: a_count > 0
		deferred
		ensure
			adapted_count: count = old count + a_count
--			zero_shifted: item (0) = 0 and then item (1) = old item (0)
			zero_shifted: item (0) = 0
		end

	shift_right (a_count: INTEGER)
			-- Shift items right.
		require
			a_count_greater_zero: a_count > 0
			a_count_less_count: a_count <= count
		deferred
		ensure
			adapted_count: count = old count
			zero_shifted: item (count - 1) = 0
		end

feature {MA_DECIMAL} -- Implementation

	set_count (a_count: INTEGER)
			-- Set `count' to `a_count'.
		require
			a_count_small_enough: a_count <= capacity
			a_count_large_enough: a_count >= 0
		deferred
		ensure
			count_set: count = a_count
		end

invariant

	count_less_or_equal_capacity: count <= capacity
	count_not_negative: count >= 0
	lower_upper_consistent: lower <= upper

end
