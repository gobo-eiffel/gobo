indexing

	description:

		"A numeric XPath value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NUMERIC_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

	XM_XPATH_TOKENS

feature -- Access

	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
		deferred
		end

	as_double: DOUBLE is
			-- Value converted to a double
		deferred
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			a_numeric_value ?= other
			if a_numeric_value = Void then
				Result := False
			else
				Result := as_double.is_equal (a_numeric_value.as_double)
				-- TODO is this comparison good enough - i.e. is 1.5 / 2 = 4.5 / 6 ?
				-- TODO check to see if both are integers or bothe decimals
				--todo ("same-expression", True)
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_double_value, another_double_value: DOUBLE
		do
			a_numeric_value ?= other
				check
					a_numeric_value_not_void: a_numeric_value /= Void
					-- From pre-condition `arte_comparable'
				end

			-- This is the default implementation.
			-- Descendant classes can avoid the conversion to a double,
			--  when comparing to another number of the same type.

			a_double_value := as_double
			another_double_value := a_numeric_value.as_double
			if a_double_value = another_double_value then -- Floating poinmt equality test! Hm. Exact comparison?
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
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			a_numeric_value ?= other
			Result := a_numeric_value /= Void
		end

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		deferred
		end

	is_zero: BOOLEAN is
			-- Is value zero?
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

feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		require
			other_value_not_void: other /= Void
			valid_operator: is_valid_arithmetic_operator (an_operator)
		deferred
		end

end
