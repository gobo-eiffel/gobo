indexing

	description:

		"Numeric XPath values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NUMERIC_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			calculate_effective_boolean_value, is_numeric_value, as_numeric_value
		end

	XM_XPATH_TOKENS
		export {NONE} all end

feature -- Access

	as_integer: INTEGER is
		-- Value converted to an `INTEGER'
		require
			convertible_to_integer: is_platform_integer
		deferred
		end

	as_double: DOUBLE is
			-- Value converted to a `DOUBLE'
		require
			convertible_to_double: is_double
		deferred
		end
	
	is_numeric_value: BOOLEAN is
			-- Is `Current' a numeric value?
		do
			Result := True
		end

	as_numeric_value: XM_XPATH_NUMERIC_VALUE is
			-- `Current' seen as a numeric value
		do
			Result := Current
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if not other.is_numeric_value then
				Result := False
			else
				if is_integer_value and then other.is_integer_value then
					Result := as_integer_value.value.is_equal (other.as_integer_value.value)
				elseif is_decimal_value and then other.is_decimal_value then
						Result := as_decimal_value.value.is_equal (other.as_decimal_value.value)
				else
					Result := as_double.is_equal (other.as_numeric_value.as_double)
				end
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Compare `Current' to `other'
		local
			a_double_value, another_double_value: DOUBLE
		do

			-- This is the default implementation.
			-- Descendant classes can avoid the conversion to a double,
			--  when comparing to another number of the same type.

			a_double_value := as_double
			another_double_value := other.as_numeric_value.as_double
			if a_double_value = another_double_value then -- Floating point equality test! Hm. Exact comparison?
				Result := 0
			elseif a_double_value > another_double_value then
				Result := 1
			else
				Result := -1
			end
		end

feature -- Status_report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_numeric_value
		end

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		deferred
		end

	is_zero: BOOLEAN is
			-- Is value zero?
		deferred
		end

	is_negative: BOOLEAN is
			-- Is value less than zero?
		deferred
		end

	is_infinite: BOOLEAN is
			-- Is value infinite?
		deferred
		end

	is_whole_number: BOOLEAN is
			-- Is value integral?
		deferred
		end

	is_platform_integer: BOOLEAN is
			-- Can value be represented by an `INTEGER'?
		deferred
		end

	is_double: BOOLEAN is
			-- Can value be converted to a `DOUBLE'?
		deferred
		end

	is_valid_arithmetic_operator (an_operator: INTEGER): BOOLEAN is
			-- Is `an_operator' valid for arithmetic?
		do
			inspect
				an_operator
			when Plus_token, Minus_token, Multiply_token, Division_token, Integer_division_token, Modulus_token then
				Result := True
			else
				Result := false
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			create last_boolean_value.make (not (is_nan or else is_zero))
		end
	
feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		require
			other_value_not_void: other /= Void
			valid_operator: is_valid_arithmetic_operator (an_operator)
		deferred
		end

feature -- Conversions

	rounded_value: like Current is
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up);
			-- Implements XPath round().
		deferred
		end

	rounded_half_even (a_scale: INTEGER): like Current is
			-- `a_numeric_value' rounded towards the nearest even number;
			-- Implements XPath round-to-half-even().
		deferred
		end

	floor: like Current is
			-- Value rounded towards minus infinity;
			-- Implements XPath floor().
		deferred
		ensure
			same_infinity: old is_infinite implies Result.is_infinite -- and then same sign
			same_nan: old is_nan implies Result.is_nan
		end

	ceiling: like Current is
			-- Value rounded towards plus infinity;
			-- Implements XPath ceiling().
		deferred
		ensure
			same_infinity: old is_infinite implies Result.is_infinite -- and then same sign
			same_nan: old is_nan implies Result.is_nan
		end

	negated_value: like Current is
			-- Same abaolute value but opposite sign
		deferred
		ensure
			negated_value_not_void: Result /= Void
		end

end
