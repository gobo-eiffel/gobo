indexing

	description:

		"Objects that represent XPath xs:float values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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
			if is_infinite then
				if value = DOUBLE_.minus_infinity then
					Result := "-INF"
				else
					Result := "INF"
				end
			elseif is_nan then
				Result := "NaN"				
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
			if	a_required_type = any_item or
				a_required_type = type_factory.any_atomic_type or
				a_required_type = type_factory.boolean_type or
				a_required_type = type_factory.string_type or
				a_required_type = type_factory.string_type or
				a_required_type = type_factory.untyped_atomic_type or
				a_required_type = type_factory.numeric_type or
				a_required_type = type_factory.float_type or
				a_required_type = type_factory.double_type then
					Result := True
			elseif a_required_type = type_factory.integer_type then
				Result := not (is_nan or is_infinite)
			elseif a_required_type = type_factory.decimal_type then
				Result := not is_nan
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
			if is_infinite then
				Result := False
			elseif internal_is_nan or else not is_zero and then value = 2.0 * value then
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
			Result := is_negative_zero or value.sign = -1
		end

	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			Result := value = DOUBLE_.plus_infinity or else value = DOUBLE_.minus_infinity
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
				create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (DOUBLE_.truncated_to_integer (value).to_integer_64)
			elseif  a_required_type = type_factory.float_type then
				Result := Current
			elseif  a_required_type = type_factory.numeric_type then
				Result := Current
			elseif  a_required_type = type_factory.double_type then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value)
			elseif  a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make_from_string (value.out)
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
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

	arithmetic (l_operator: INTEGER; a_other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		local
			l_float, l_other_float, l_third_float: DOUBLE
			l_value: XM_XPATH_FLOAT_VALUE
		do
			if is_nan then
				Result := Current
			elseif a_other.is_nan then
				Result := a_other
			else
				inspect
					l_operator
				when Plus_token then
					create {XM_XPATH_FLOAT_VALUE} Result.make (value + a_other.as_double)
				when Minus_token then
					l_float := value - a_other.as_double
					create l_value.make (l_float)
					if is_zero and a_other.is_zero and (is_negative = a_other.is_negative)  then
						l_value.set_negative_zero
					end
					Result := l_value
				when Multiply_token then
					create {XM_XPATH_FLOAT_VALUE} Result.make (value * a_other.as_double)
				when Division_token then
					if is_zero then
						if a_other.is_zero then
							create {XM_XPATH_FLOAT_VALUE} Result.make_nan
						else
							create {XM_XPATH_FLOAT_VALUE} Result.make (value / a_other.as_double)
						end
					elseif is_infinite and a_other.is_infinite then
						create {XM_XPATH_FLOAT_VALUE} Result.make_nan
					elseif a_other.is_zero then
						if is_negative /= a_other.is_negative then
							create {XM_XPATH_FLOAT_VALUE} Result.make_from_string ("-INF")
						else
							create {XM_XPATH_FLOAT_VALUE} Result.make_from_string ("INF")
						end
					else
						create {XM_XPATH_FLOAT_VALUE} Result.make (value / a_other.as_double)
					end
				when Integer_division_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (DOUBLE_.truncated_to_integer (value / a_other.as_double))
				when Modulus_token then
					l_float := a_other.as_double
					if is_nan or else a_other.is_nan or else a_other.is_zero or else is_infinite then
						create {XM_XPATH_FLOAT_VALUE} Result.make_nan
					elseif a_other.is_infinite then
						Result := Current
					elseif is_zero then
						Result := Current
					else
						l_other_float := DOUBLE_.truncated_to_integer (value / l_float).to_double
						l_third_float := l_float * l_other_float
						create l_value.make (value - l_third_float)
						if l_third_float.abs = value.abs and value.sign = -1 then
							l_value.set_negative_zero
						end
						Result := l_value
					end
				end
			end
		end

feature -- Element change

	set_negative_zero is
			-- Set `is_negative_zero' to `True'.
		require
			zero_value: is_zero
		do
			is_negative_zero := True
		ensure
			negative_zero_set: is_negative_zero
		end

	set_value_from_string (a_value: STRING) is
			-- Set from `a_value'.
		require
			value_not_void: a_value /= Void
		do
			STRING_.left_adjust (a_value)
			STRING_.right_adjust (a_value)
			if STRING_.same_string ("INF", a_value) then
				value := DOUBLE_.plus_infinity
			elseif STRING_.same_string ("-INF", a_value) then
				value := DOUBLE_.minus_infinity
			elseif STRING_.same_string ("NaN", a_value) then
				internal_is_nan := True
				value := 0.0
			elseif a_value.is_real then
				value := a_value.to_real
				if value = 0 and a_value.item (1) = '-' then
					is_negative_zero := True
				end
			else
				set_last_error_from_string	("Invalid xs:float string value", Xpath_errors_uri, "XPTY0004", Type_error)
			end
		end

feature {NONE} -- Implementation

	internal_is_nan: BOOLEAN
			-- Fabricated NaN

	is_negative_zero: BOOLEAN
			--	 Is zero negative?

end
