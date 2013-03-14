note
	description: "References to objects containing an integer value coded on 64 bits"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	INTEGER_64_REF

inherit
	NUMERIC
		rename
			quotient as integer_quotient alias "//"
		redefine
			out, is_equal
		end

	COMPARABLE
		redefine
			out, is_equal
		end

	HASHABLE
		redefine
			is_hashable, out, is_equal
		end

feature -- Access

	item: INTEGER_64
			-- Integer value
		external
			"built_in"
		end

	hash_code: INTEGER
			-- Hash code value
		do
				-- Get the positive value of `item' and then do
				-- a modulo on the maximum INTEGER_32 value.
			Result := (item & 0x000000007FFFFFFF).to_integer_32
		end

	sign: INTEGER
			-- Sign value (0, -1 or 1)
		do
			if item > 0 then
				Result := 1
			elseif item < 0 then
				Result := -1
			end
		ensure
			three_way: Result = three_way_comparison (zero)
		end

	one: like Current
			-- Neutral element for "*" and "/"
		do
			create Result
			Result.set_item (1)
		end

	zero: like Current
			-- Neutral element for "+" and "-"
		do
			create Result
			Result.set_item (0)
		end

	ascii_char: CHARACTER_8
			-- Returns corresponding ASCII character to `item' value.
		obsolete
			"Use to_character_8 instead"
		require
			valid_character_code: is_valid_character_8_code
		do
			Result := item.to_character_8
		end

	Min_value: INTEGER_64 = -9223372036854775808
	Max_value: INTEGER_64 = 9223372036854775807
			-- Minimum and Maximum value hold in `item'.

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current integer less than `other'?
		do
			Result := item < other.item
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Element change

	set_item (i: INTEGER_64)
			-- Make `i' the `item' value.
		external
			"built_in"
		ensure
			item_set: item = i
		end

feature -- Status report

	divisible (other: like Current): BOOLEAN
			-- May current object be divided by `other'?
		do
			Result := other.item /= 0
		ensure then
			value: Result = (other.item /= 0)
		end

	exponentiable (other: NUMERIC): BOOLEAN
			-- May current object be elevated to the power `other'?
		do
			if attached {INTEGER_32_REF} other as integer_value then
				Result := integer_value.item >= 0 or item /= 0
			elseif attached {REAL_32_REF} other as real_value then
				Result := real_value.item >= 0.0 or item /= 0
			elseif attached {REAL_64_REF} other as double_value then
				Result := double_value.item >= 0.0 or item /= 0
			end
		ensure then
			safe_values: ((other.conforms_to (0) and item /= 0) or
				(other.conforms_to (0.0) and item > 0)) implies Result
		end

	is_hashable: BOOLEAN
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item /= 0
		end

	is_valid_character_code: BOOLEAN
			-- Does current object represent a CHARACTER_8?
		obsolete
			"Use `is_valid_character_8_code' instead."
		do
			Result := is_valid_character_8_code
		end

	is_valid_character_8_code: BOOLEAN
			-- Does current object represent a CHARACTER_8?
		do
			Result := item >= {CHARACTER_8}.Min_value and item <= {CHARACTER_8}.Max_value
		ensure
			in_bounds: Result = (item >= {CHARACTER_8}.Min_value and item <= {CHARACTER_8}.Max_value)
		end

	is_valid_character_32_code: BOOLEAN
			-- Does current object represent a CHARACTER_32?
		do
			Result := item >= 0 and item.to_natural_64 <= {CHARACTER_32}.Max_value
		ensure
			in_bounds: Result = (item >= 0 and
				item.to_natural_64 >= {CHARACTER_32}.Min_value and
				item.to_natural_64 <= {CHARACTER_32}.Max_value)
		end

feature -- Basic operations

	abs: INTEGER_64
			-- Absolute value
		do
			Result := abs_ref.item
		ensure
			non_negative: Result >= 0
			same_absolute_value: (Result = item) or (Result = -item)
		end

	plus alias "+" (other: like Current): like Current
			-- Sum with `other'
		do
			create Result
			Result.set_item (item + other.item)
		end

	minus alias "-" (other: like Current): like Current
			-- Result of subtracting `other'
		do
			create Result
			Result.set_item (item - other.item)
		end

	product alias "*" (other: like Current): like Current
			-- Product by `other'
		do
			create Result
			Result.set_item (item * other.item)
		end

	quotient alias "/" (other: like Current): REAL_64
			-- Division by `other'
		require
			other_exists: other /= Void
			good_divisor: divisible (other)
		do
			Result := item / other.item
		end

	identity alias "+": like Current
			-- Unary plus
		do
			create Result
			Result.set_item (+ item)
		end

	opposite alias "-": like Current
			-- Unary minus
		do
			create Result
			Result.set_item (- item)
		end

	integer_quotient alias "//" (other: like Current): like Current
			-- Integer division of Current by `other'
		do
			create Result
			Result.set_item (item // other.item)
		end

	integer_remainder alias "\\" (other: like Current): like Current
			-- Remainder of the integer division of Current by `other'
		require
			other_exists: other /= Void
			good_divisor: divisible (other)
		do
			create Result
			Result.set_item (item \\ other.item)
		ensure
			result_exists: Result /= Void
		end

	power alias "^" (other: REAL_64): REAL_64
			-- Integer power of Current by `other'
		do
			Result := item ^ other
		end

feature {NONE} -- Initialization

	make_from_reference (v: INTEGER_64_REF)
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: INTEGER_64_REF
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	frozen to_boolean: BOOLEAN
			-- True if not `zero'.
		do
			Result := item /= 0
		end

	as_natural_8: NATURAL_8
			-- Convert `item' into an NATURAL_8 value.
		do
			Result := item.as_natural_8
		end

	as_natural_16: NATURAL_16
			-- Convert `item' into an NATURAL_16 value.
		do
			Result := item.as_natural_16
		end

	as_natural_32: NATURAL_32
			-- Convert `item' into an NATURAL_32 value.
		do
			Result := item.as_natural_32
		end

	as_natural_64: NATURAL_64
			-- Convert `item' into an NATURAL_64 value.
		do
			Result := item.as_natural_64
		end

	as_integer_8: INTEGER_8
			-- Convert `item' into an INTEGER_8 value.
		do
			Result := item.as_integer_8
		end

	as_integer_16: INTEGER_16
			-- Convert `item' into an INTEGER_16 value.
		do
			Result := item.as_integer_16
		end

	as_integer_32: INTEGER_32
			-- Convert `item' into an INTEGER_32 value.
		do
			Result := item.as_integer_32
		end

	as_integer_64: INTEGER_64
			-- Convert `item' into an INTEGER_64 value.
		do
			Result := item.as_integer_64
		end

	frozen to_natural_8: NATURAL_8
			-- Convert `item' into an NATURAL_8 value.
		require
			item_non_negative: item >= 0
			not_too_big: item <= {NATURAL_8}.Max_value
		do
			Result := as_natural_8
		end

	frozen to_natural_16: NATURAL_16
			-- Convert `item' into an NATURAL_16 value.
		require
			item_non_negative: item >= 0
			not_too_big: item <= {NATURAL_16}.Max_value
		do
			Result := as_natural_16
		end

	frozen to_natural_32: NATURAL_32
			-- Convert `item' into an NATURAL_32 value.
		require
			item_non_negative: item >= 0
			not_too_big: item <= {NATURAL_32}.Max_value
		do
			Result := as_natural_32
		end

	frozen to_natural_64: NATURAL_64
			-- Convert `item' into an NATURAL_64 value.
		require
			item_non_negative: item >= 0
		do
			Result := as_natural_64
		end

	frozen to_integer_8: INTEGER_8
			-- Convert `item' into an INTEGER_8 value.
		require
			not_too_small: item >= {INTEGER_8}.Min_value
			not_too_big: item <= {INTEGER_8}.Max_value
		do
			Result := as_integer_8
		end

	frozen to_integer_16: INTEGER_16
			-- Convert `item' into an INTEGER_16 value.
		require
			not_too_small: item >= {INTEGER_16}.Min_value
			not_too_big: item <= {INTEGER_16}.Max_value
		do
			Result := as_integer_16
		end

	frozen to_integer, frozen to_integer_32: INTEGER_32
			-- Convert `item' into an INTEGER_32 value.
		require
			not_too_small: item >= {INTEGER_32}.Min_value
			not_too_big: item <= {INTEGER_32}.Max_value
		do
			Result := as_integer_32
		end

	frozen to_integer_64: INTEGER_64
			-- Return `item'.
		do
			Result := item
		end

	to_real: REAL_32
			-- Convert `item' into a REAL_32
		do
			Result := item.to_real
		end

	to_double: REAL_64
			-- Convert `item' into a REAL_64
		do
			Result := item.to_double
		end

	to_hex_string: STRING
			-- Convert `item' into an hexadecimal string.
		local
			i: INTEGER
			val: INTEGER_64
			a_digit: INTEGER
		do
			from
				i := (create {PLATFORM}).Integer_64_bits // 4
				create Result.make (i)
				Result.fill_blank
				val := item
			until
				i = 0
			loop
				a_digit := (val & 0x0F).to_integer
				Result.put (a_digit.to_hex_character, i)
				val := val |>> 4
				i := i - 1
			end
		ensure
			Result_not_void: Result /= Void
			Result_valid_count: Result.count = (create {PLATFORM}).Integer_64_bits // 4
		end

	to_hex_character: CHARACTER
			-- Convert `item' into an hexadecimal character.
		require
			in_bounds: 0 <= item and item <= 15
		local
			tmp: INTEGER
		do
			tmp := item.to_integer
			if tmp <= 9 then
				Result := (tmp + ('0').code).to_character_8
			else
				Result := (('A').code + (tmp - 10)).to_character_8
			end
		ensure
			valid_character: ("0123456789ABCDEF").has (Result)
		end

	to_character: CHARACTER
			-- Returns corresponding ASCII character to `item' value.
		obsolete
			"Use `to_character_8' instead."
		require
			valid_character: is_valid_character_8_code
		do
			Result := item.to_character_8
		end

	to_character_8: CHARACTER_8
			-- Associated character in 8 bit version.
		require
			valid_character: is_valid_character_8_code
		do
			Result := item.to_character_8
		end

	to_character_32: CHARACTER_32
			-- Associated character in 32 bit version.
		require
			valid_character: is_valid_character_32_code
		do
			Result := item.to_character_32
		end

feature -- Bit operations

	bit_and alias "&" (i: like Current): like Current
			-- Bitwise and between Current' and `i'.
		require
			i_not_void: i /= Void
		do
			create Result
			Result.set_item (item.bit_and (i.item))
		ensure
			bitwise_and_not_void: Result /= Void
		end

	bit_or alias "|" (i: like Current): like Current
			-- Bitwise or between Current' and `i'.
		require
			i_not_void: i /= Void
		do
			create Result
			Result.set_item (item.bit_or (i.item))
		ensure
			bitwise_or_not_void: Result /= Void
		end

	bit_xor (i: like Current): like Current
			-- Bitwise xor between Current' and `i'.
		require
			i_not_void: i /= Void
		do
			create Result
			Result.set_item (item.bit_xor (i.item))
		ensure
			bitwise_xor_not_void: Result /= Void
		end

	bit_not: like Current
			-- One's complement of Current.
		do
			create Result
			Result.set_item (item.bit_not)
		ensure
			bit_not_not_void: Result /= Void
		end

	frozen bit_shift (n: INTEGER): INTEGER_64
			-- Shift Current from `n' position to right if `n' positive,
			-- to left otherwise.
		require
			n_less_or_equal_to_64: n <= 64
			n_greater_or_equal_to_minus_64: n >= -64
		do
			if n > 0 then
				Result := bit_shift_right (n)
			else
				Result := bit_shift_left (- n)
			end
		end

	bit_shift_left alias "|<<" (n: INTEGER): like Current
			-- Shift Current from `n' position to left.
		require
			n_nonnegative: n >= 0
			n_less_or_equal_to_64: n <= 64
		do
			create Result
			Result.set_item (item.bit_shift_left (n))
		ensure
			bit_shift_left_not_void: Result /= Void
		end

	bit_shift_right alias "|>>" (n: INTEGER): like Current
			-- Shift Current from `n' position to right.
		require
			n_nonnegative: n >= 0
			n_less_or_equal_to_64: n <= 64
		do
			create Result
			Result.set_item (item.bit_shift_right (n))
		ensure
			bit_shift_right_not_void: Result /= Void
		end

	frozen bit_test (n: INTEGER): BOOLEAN
			-- Test `n'-th position of Current.
		require
			n_nonnegative: n >= 0
			n_less_than_64: n < 64
		do
			Result := item & ((1).to_integer_64 |<< n) /= 0
		end

	frozen set_bit (b: BOOLEAN; n: INTEGER): INTEGER_64
			-- Copy of current with `n'-th position
			-- set to 1 if `b', 0 otherwise.
		require
			n_nonnegative: n >= 0
			n_less_than_64: n < 64
		do
			if b then
				Result := item | ((1).to_integer_64 |<< n)
			else
				Result := item & ((1).to_integer_64 |<< n).bit_not
			end
		end

	frozen set_bit_with_mask (b: BOOLEAN; m: INTEGER_64): INTEGER_64
			-- Copy of current with all 1 bits of m set to 1
			-- if `b', 0 otherwise.
		do
			if b then
				Result := item | m
			else
				Result := item & m.bit_not
			end
		end

feature -- Output

	out: STRING
			-- Printable representation of integer value
		do
			create Result.make (20)
			Result.append_integer_64 (item)
		end

feature {NONE} -- Implementation

	abs_ref: like Current
			-- Absolute value
		do
			if item >= 0 then
				Result := Current
			else
				Result := -Current
			end
		ensure
			result_exists: Result /= Void
			same_absolute_value: (Result ~ Current) or (Result ~ -Current)
		end

invariant

	sign_times_abs: sign * abs = item

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
