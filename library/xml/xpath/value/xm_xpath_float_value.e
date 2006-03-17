indexing

	description:

		"Objects that represent XPath xs:float values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FLOAT_VALUE

	-- TODO: change DOUBLE to REAL_32 when all compilers support it

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			hash_code, is_float_value, as_float_value
		end

	XM_XPATH_SHARED_DECIMAL_CONTEXTS
		export {NONE} all end

	KL_IMPORTED_DOUBLE_ROUTINES
		export {NONE} all end

create

	make, make_from_string, make_nan

feature {NONE} -- Initialization

	make (a_value: DOUBLE) is
		do
			make_atomic_value
			value := a_value
		ensure
			value_set: value = a_value
		end

	make_from_string (a_value: STRING) is
		do
			make_atomic_value
			set_value_from_string (a_value)
		ensure
			value_set: not internal_is_nan and then not is_infinite and then a_value.is_real implies value = a_value.to_real
		end

	make_nan is
			-- create NaN.
		do
			make_atomic_value
			internal_is_nan := True
			value := 0.0
		ensure
			not_a_number: is_nan
		end

feature -- Access

	value: DOUBLE

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := value.hash_code
		end

	as_integer: INTEGER is
		do
			Result := DOUBLE_.truncated_to_integer (value)
		end

	as_double: DOUBLE is
			-- Value converted to a double
		do
			Result := value
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.float_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_decimal: MA_DECIMAL
		do
			if is_nan then
				Result := "NaN"
			elseif is_infinite then
				if value = minus_infinity then
					Result := "-INF"
				else
					Result := "INF"
				end
			elseif value.abs >= 1.0e-6 or else value.abs < 1.0e6 then -- TODO: that was for double - check for float
				create a_decimal.make_from_string (value.out)
				Result := a_decimal.to_scientific_string
			else
				Result := value.out -- TODO - No good - but how to determine the result? use MA-DECIMAL rather than real.
			end
		end

feature -- Status report

	is_float_value: BOOLEAN is
			-- Is `Current' a 32-bit real value?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "float (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item
				or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.boolean_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.numeric_type
				or else a_required_type = type_factory.integer_type
				or else a_required_type = type_factory.decimal_type
				or else a_required_type = type_factory.float_type
				or else a_required_type = type_factory.double_type then
				Result := True
			else
				Result := False
			end
		end

	is_whole_number: BOOLEAN is
			-- Is value integral?
		do
			Result := value = DOUBLE_.truncated_to_integer (value)
		end

	is_platform_integer: BOOLEAN is
			-- Can value be represented by an `INTEGER'?
		do
			Result := is_whole_number
		end

	is_double: BOOLEAN is
			-- Can value be converted to a `DOUBLE'?
		do
			Result := True
		end

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			if internal_is_nan or else not is_zero and then value = 2.0 * value then
				Result := True
			end
		end

	is_zero: BOOLEAN is
			-- Is value zero?
		do
			Result := value = 0.0 or else value = -0.0
		end

	is_negative: BOOLEAN is
			-- Is value less than zero?
		do
			Result := value.sign = -1
		end

	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			Result := value = plus_infinity or else value = minus_infinity
		end

feature -- Conversion

	as_float_value: XM_XPATH_FLOAT_VALUE is
			-- `Current' seen as a float value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
			-- TODO - need to virtualize the pre-condition so that
			-- only sub-types of Integer_type are valid
		do
			if a_required_type = type_factory.boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (value /= 0.0)
			elseif a_required_type = type_factory.any_atomic_type  then
				Result := Current
			elseif a_required_type = any_item  then
				Result := Current
			elseif  a_required_type = type_factory.integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (DOUBLE_.truncated_to_integer (value))
			elseif  a_required_type = type_factory.float_type then
				Result := Current
			elseif  a_required_type = type_factory.double_type then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value)
			elseif  a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make_from_string (value.out)
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			end
		end

	rounded_value: like Current is
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		local
			a_decimal: MA_DECIMAL
		do
			if is_nan or else is_infinite then
				Result := Current
			elseif is_zero then
				Result := Current
			elseif value > -0.5 and then value < 0.0 then
				create Result.make (-0.0)
			else
				create a_decimal.make_from_string (value.out)
				if a_decimal.is_negative then
					create Result.make (a_decimal.round_to_integer (shared_negative_round_context).to_double)
				else
					create Result.make (a_decimal.round_to_integer (shared_round_context).to_double)
				end
			end
		end

	rounded_half_even (a_scale: INTEGER): like Current is
			-- `a_numeric_value' rounded towards the nearest even number;
		local
			a_decimal: MA_DECIMAL
		do
			if is_nan or else is_infinite then
				Result := Current
			elseif is_zero then
				Result := Current
			else
				create a_decimal.make_from_string (value.out)
				create Result.make (a_decimal.rescale (0 - a_scale, shared_half_even_context).to_double)
			end
		end

	floor: like Current is
			-- Value rounded towards minus infinity
		local
			a_decimal: MA_DECIMAL
		do
			if is_infinite or else is_nan then
				Result := Current
			elseif is_zero then
				Result := Current
			else
				create a_decimal.make_from_string (value.out)
				create Result.make (a_decimal.round_to_integer (shared_floor_context).to_double)
			end
		end

	ceiling: like Current is
			-- Value rounded towards plus infinity;
		local
			a_decimal: MA_DECIMAL
		do
			if is_infinite or else is_nan then
				Result := Current
			elseif is_zero then
				Result := Current
			else
				create a_decimal.make_from_string (value.out)
				create Result.make (a_decimal.round_to_integer (shared_ceiling_context).to_double)
			end


		end

	negated_value: like Current is
			-- Same abaolute value but opposite sign
		do
			create Result.make (-value)
		end

feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		local
			a_float, another_float: DOUBLE
			an_integer, another_integer: INTEGER
		do
			inspect
				an_operator
			when Plus_token then
				create {XM_XPATH_FLOAT_VALUE} Result.make (value + other.as_double)
			when Minus_token then
				create {XM_XPATH_FLOAT_VALUE} Result.make (value - other.as_double)
			when Multiply_token then
				create {XM_XPATH_FLOAT_VALUE} Result.make (value * other.as_double)
			when Division_token then
				create {XM_XPATH_FLOAT_VALUE} Result.make (value / other.as_double)
			when Integer_division_token then
				create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (DOUBLE_.truncated_to_integer (value / other.as_double))
			when Modulus_token then
				a_float := other.as_double
				if is_whole_number and then other.is_whole_number then
					an_integer := as_integer
					another_integer := other.as_integer
					create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (an_integer \\ another_integer)
				else
					if is_nan or else other.is_nan or else other.is_zero or else is_infinite then
						create {XM_XPATH_FLOAT_VALUE} Result.make_nan
					elseif other.is_infinite then
						Result := Current
					elseif is_zero then
						Result := Current
					else
						another_float := (value / a_float).floor
						create {XM_XPATH_FLOAT_VALUE} Result.make (value - another_float)
					end
				end
			end
		end

feature -- Element change

	set_value_from_string (a_value: STRING) is
			-- Set from `a_value'.
		require
			value_not_void: a_value /= Void
		do
			STRING_.left_adjust (a_value)
			STRING_.right_adjust (a_value)
			if STRING_.same_string ("INF", a_value) then
				value := plus_infinity
			elseif STRING_.same_string ("-INF", a_value) then
				value := minus_infinity
			elseif STRING_.same_string ("NaN", a_value) then
				internal_is_nan := True
				value := 0.0
			elseif a_value.is_real then
				value := a_value.to_real
			else
				set_last_error_from_string	("Invalid xs:float string value", Xpath_errors_uri, "XPTY0004", Type_error)
			end
		end

feature {NONE} -- Implementation

	internal_is_nan: BOOLEAN
			-- Fabricated NaN

	Large_number: DOUBLE is 2.0e300 -- 2.0e35
	Large_negative_number: DOUBLE is -2.0e300 -- -2.0e35

	plus_infinity: DOUBLE is
			-- Overflow on purpose.
		local
			d1: DOUBLE
			i: INTEGER
		once
				-- Bug in SE 1.2r6: make sure that this once-function is
				-- not precomputed otherwise MSVC 7.1 complains about a
				-- division by zero at compilation time.
				-- Also, work around another problem with SE 1.2r6 where
				-- 2.0e300 is generated in the C code as 2000...000.0
				-- yielding a buffer overflow in the C compiler.
			-- Result := Large_number * Large_number
			from
				i := 1
				d1 := 2.0
			until
				i > 300
			loop
				d1 := d1 * 10.0
				i := i + 1
			end
			Result := d1 * d1
		ensure
			positive: Result > 0
			infinity_reached: Result / Large_number = Result
		end

	minus_infinity: DOUBLE is
			-- Overflow on purpose.
		local
			d1, d2: DOUBLE
			i: INTEGER
		once
				-- Bug in SE 1.2r6: make sure that this once-function is
				-- not precomputed otherwise MSVC 7.1 complains about a
				-- division by zero at compilation time.
				-- Also, work around another problem with SE 1.2r6 where
				-- 2.0e300 is generated in the C code as 2000...000.0
				-- yielding a buffer overflow in the C compiler.
			-- Result := Large_number * Large_negative_number
			from
				i := 1
				d1 := 2.0
			until
				i > 300
			loop
				d1 := d1 * 10.0
				i := i + 1
			end
			from
				i := 1
				d2 := -2.0
			until
				i > 300
			loop
				d2 := d2 * 10.0
				i := i + 1
			end
			Result := d1 * d2
		ensure
			negative: Result < 0
			infinity_reached: Result / Large_number = Result
		end

end
