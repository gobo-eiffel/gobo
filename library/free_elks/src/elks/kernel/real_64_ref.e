note
	description: "References to objects containing a double-precision real number"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class REAL_64_REF inherit

	NUMERIC
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

	item: REAL_64
			-- Numeric double value
		external
			"built_in"
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := truncated_to_integer.hash_code
		end

	sign: INTEGER
			-- Sign value (0, -1 or 1)
		do
			if item > 0.0 then
				Result := 1
			elseif item < 0.0 then
				Result := -1
			end
		ensure
			three_way: Result = three_way_comparison (zero)
		end

	one: like Current
			-- Neutral element for "*" and "/"
		do
			create Result
			Result.set_item (1.0)
		end

	zero: like Current
			-- Neutral element for "+" and "-"
		do
			create Result
			Result.set_item (0.0)
		end

	nan: REAL_64
			-- Representation of not a number (NaN)
		external
			"built_in static"
		ensure
			is_class: class
		end

	negative_infinity: REAL_64
			-- Representation of negative infinity
		external
			"built_in static"
		ensure
			is_class: class
		end

	positive_infinity: REAL_64
			-- Representation of positive infinity
		external
			"built_in static"
		ensure
			is_class: class
		end

	min_value: REAL_64 = -1.7976931348623157081452e+308
	max_value: REAL_64 = 1.7976931348623157081452e+308
			-- Minimum and Maximum value hold in `item'.

	machine_epsilon: REAL_64 = 2.2204460492503130808473e-016
			-- The difference between 1 and the least value greater than
			-- 1 that is representable in the given floating point type.

	epsilon: REAL_64 = 2.2250738585072013830903e-308
			-- Minimum normalized positive floating-point number.

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is `other' greater than current double?
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

	set_item (d: REAL_64)
			-- Make `d' the `item' value.
		external
			"built_in"
		end

feature -- Status report

	divisible (other: REAL_64_REF): BOOLEAN
			-- May current object be divided by `other'?
		do
			Result := other.item /= 0.0
		ensure then
			not_exact_zero: Result implies (other.item /= 0.0)
		end

	exponentiable (other: NUMERIC): BOOLEAN
			-- May current object be elevated to the power `other'?
		do
			if attached {INTEGER_32_REF} other as integer_value then
				Result := integer_value.item >= 0 or item /= 0.0
			elseif attached {REAL_32_REF} other as real_value then
				Result := real_value.item >= 0.0 or item /= 0.0
			elseif attached {REAL_64_REF} other as double_value then
				Result := double_value.item >= 0.0 or item /= 0.0
			end
		ensure then
			safe_values: ((other.conforms_to (0) and item /= 0.0) or
				(other.conforms_to (0.0) and item > 0.0)) implies Result
		end

	is_hashable: BOOLEAN
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item /= 0.0
		end

	is_nan: BOOLEAN
			-- Is current the representation of `nan'?
		do
			Result := item.is_nan
		end

	is_negative_infinity: BOOLEAN
			-- Is current the representation of `negative_infinity'?
		do
			Result := item.is_negative_infinity
		end

	is_positive_infinity: BOOLEAN
			-- Is current the representation of `positive_infinity'?
		do
			Result := item.is_positive_infinity
		end

feature {NONE} -- Conversion

	make_from_reference (v: REAL_64_REF)
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: REAL_64_REF
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	truncated_to_integer: INTEGER_32
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		do
			Result := item.truncated_to_integer
		end

	truncated_to_integer_64: INTEGER_64
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		do
			Result := item.truncated_to_integer_64
		end

	truncated_to_real: REAL_32
			-- Real part (Same sign, largest absolute
			-- value no greater than current object's)
		do
			Result := item.truncated_to_real
		end

	ceiling: INTEGER_32
			-- Smallest integral value no smaller than current object
		do
			Result := ceiling_real_64.truncated_to_integer
		ensure
			result_no_smaller: Result >= item
			close_enough: Result - item < item.one
		end

	floor: INTEGER_32
			-- Greatest integral value no greater than current object
		do
			Result := floor_real_64.truncated_to_integer
		ensure
			result_no_greater: Result <= item
			close_enough: item - Result < Result.one
		end

	rounded: INTEGER_32
			-- Rounded integral value
		do
			Result := sign * (abs + 0.5).floor
		ensure
			definition: Result = sign * (abs + 0.5).floor
		end

	ceiling_real_64: REAL_64
			-- Smallest integral value no smaller than current object
		do
			Result := item.ceiling_real_64
		ensure
			result_no_smaller: Result >= item
			close_enough: Result - item < item.one
		end

	floor_real_64: REAL_64
			-- Greatest integral value no greater than current object
		do
			Result := item.floor_real_64
		ensure
			result_no_greater: Result <= item
			close_enough: item - Result < Result.one
		end

	rounded_real_64: REAL_64
			-- Rounded integral value
		do
			Result := sign * (abs + 0.5).floor_real_64
		ensure
			definition: Result = sign * (abs + 0.5).floor_real_64
		end

feature -- Basic operations

	abs: REAL_64
			-- Absolute value
		do
			Result := abs_ref.item
		ensure
			non_negative: Result >= 0.0
			same_absolute_value: (Result = item) or (Result = -item)
		end

	plus alias "+" (other: like Current): like Current
			-- Sum with `other'
		do
			create Result
			Result.set_item (item + other.item)
		end

	minus alias "-" alias "−" (other: like Current): like Current
			-- Result of subtracting `other'
		do
			create Result
			Result.set_item (item - other.item)
		end

	product alias "*" alias "×" (other: like Current): like Current
			-- Product with `other'
		do
			create Result
			Result.set_item (item * other.item)
		end

	quotient alias "/" alias "÷" (other: like Current): like Current
			-- Division by `other'
		do
			create Result
			Result.set_item (item / other.item)
		end

	power alias "^" (other: REAL_64): REAL_64
			-- Current double to the power `other'
		do
			Result := item ^ other
		end

	identity alias "+": like Current
			-- Unary plus
		do
			create Result
			Result.set_item (+ item)
		end

	opposite alias "-" alias "−": like Current
			-- Unary minus
		do
			create Result
			Result.set_item (- item)
		end

feature -- Output

	out: STRING
			-- Printable representation of double value
		do
			Result := item.out
		end

feature {NONE} -- Implementation

	abs_ref: like Current
			-- Absolute value
		do
			if item = 0.0 then
					-- Special case when `item' is `-0'.
				Result := zero
			elseif item > 0.0 then
				Result := Current
			else
				Result := -Current
			end
		ensure
			result_exists: Result /= Void
			same_absolute_value: (Result ~ Current) or (Result ~ -Current)
		end

invariant
	sign_times_abs: not item.is_nan implies sign * abs = item

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
