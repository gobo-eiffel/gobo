indexing
	description: "References to objects containing a real value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class REAL_32_REF inherit

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

	item: REAL_32 is
			-- Numeric real value
		external
			"built_in"
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := truncated_to_integer.hash_code
		end

	sign: INTEGER is
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

	one: like Current is
			-- Neutral element for "*" and "/"
		do
			create Result
			Result.set_item (1.0)
		end

	zero: like Current is
			-- Neutral element for "+" and "-"
		do
			create Result
			Result.set_item (0.0)
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current real?
		do
			Result := item < other.item
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Element change

	set_item (r: REAL_32) is
			-- Make `r' the value of `item'.
		external
			"built_in"
		end

feature -- Status report

	divisible (other: REAL_32_REF): BOOLEAN is
			-- May current object be divided by `other'?
		do
			Result := other.item /= 0.0
		ensure then
			ref_not_exact_zero: Result implies (other.item /= 0.0)
		end

	exponentiable (other: NUMERIC): BOOLEAN is
			-- May current object be elevated to the power `other'?
		do
			if {integer_value: INTEGER_32_REF} other then
				Result := integer_value.item >= 0 or item /= 0.0
			elseif {real_value: REAL_32_REF} other then
				Result := real_value.item >= 0.0 or item /= 0.0
			elseif {double_value: REAL_64_REF} other then
				Result := double_value.item >= 0.0 or item /= 0.0
			end
		ensure then
			safe_values: ((other.conforms_to (0) and item /= 0.0) or
				(other.conforms_to (0.0) and item > 0.0)) implies Result
		end

	is_hashable: BOOLEAN is
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item /= 0.0
		end

feature {NONE} -- Initialization

	make_from_reference (v: REAL_32_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: REAL_32_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	truncated_to_integer: INTEGER_32 is
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		do
			Result := item.truncated_to_integer
		end

	truncated_to_integer_64: INTEGER_64 is
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		do
			Result := item.truncated_to_integer_64
		end

	to_double: REAL_64 is
			-- Current seen as a double
		do
			Result := item.to_double
		end

	ceiling: INTEGER_32 is
			-- Smallest integral value no smaller than current object
		do
			Result := ceiling_real_32.truncated_to_integer
		ensure
			result_no_smaller: Result >= item
			close_enough: Result - item < item.one
		end

	floor: INTEGER_32 is
			-- Greatest integral value no greater than current object
		do
			Result := floor_real_32.truncated_to_integer
		ensure
			result_no_greater: Result <= item
			close_enough: item - Result < Result.one
		end

	rounded: INTEGER_32 is
			-- Rounded integral value
		do
			Result := sign * ((abs + 0.5).floor)
		ensure
			definition: Result = sign * ((abs + 0.5).floor)
		end

	ceiling_real_32: REAL_32 is
			-- Smallest integral value no smaller than current object
		do
			Result := item.ceiling_real_32
		ensure
			result_no_smaller: Result >= item
			close_enough: Result - item < item.one
		end

	floor_real_32: REAL_32 is
			-- Greatest integral value no greater than current object
		do
			Result := item.floor_real_32
		ensure
			result_no_greater: Result <= item
			close_enough: item - Result < Result.one
		end

	rounded_real_32: REAL_32 is
			-- Rounded integral value
		do
			Result := sign * ((abs + 0.5).floor_real_32)
		ensure
			definition: Result = sign * ((abs + 0.5).floor_real_32)
		end

feature -- Basic operations

	abs: REAL_32 is
			-- Absolute value
		do
			Result := abs_ref.item
		ensure
			non_negative: Result >= 0.0
			same_absolute_value: (Result = item) or (Result = -item)
		end

	infix "+" (other: like Current): like Current is
			-- Sum with `other'
		do
			create Result
			Result.set_item (item + other.item)
		end

	infix "-" (other: like Current): like Current is
			-- Result of subtracting `other'
		do
			create Result
			Result.set_item (item - other.item)
		end

	infix "*" (other: like Current): like Current is
			-- Product by `other'
		do
			create Result
			Result.set_item (item * other.item)
		end

	infix "/" (other: like Current): like Current is
			-- Division by `other'
		do
			create Result
			Result.set_item (item / other.item)
		end

	infix "^" (other: REAL_64): REAL_64 is
			-- Current real to the power `other'
		do
			Result := item ^ other
		end

	prefix "+": like Current is
			-- Unary plus
		do
			create Result
			Result.set_item (+ item)
		end

	prefix "-": like Current is
			-- Unary minus
		do
			create Result
			Result.set_item (- item)
		end

feature -- Output

	out: STRING is
			-- Printable representation of real value
		do
			Result := item.out
		end

feature {NONE} -- Implementation

	abs_ref: like Current is
			-- Absolute value
		do
			if item >= 0.0 then
				Result := Current
			else
				Result := -Current
			end
		ensure
			result_exists: Result /= Void
			same_absolute_value: equal (Result, Current) or equal (Result, - Current)
		end

invariant
	sign_times_abs: sign * abs = item

end
