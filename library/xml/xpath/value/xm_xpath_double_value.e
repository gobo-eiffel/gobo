indexing

	description:

		"Objects that represent XPath double values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOUBLE_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			hash_code, is_double_value, as_double_value
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
			value_set: not is_nan implies value = a_value
		end

	make_from_string (a_value: STRING) is
		do
			make_atomic_value
			set_value_from_string (a_value)
		ensure
			value_set: not internal_is_nan and then not is_infinite and then a_value.is_double implies value = a_value.to_double
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

	is_double_value: BOOLEAN is
			-- Is `Current' a double value?
		do
			Result := True
		end

	as_double_value: XM_XPATH_DOUBLE_VALUE is
			-- `Current' seen as a double value
		do
			Result := Current
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := value.hash_code
		end

	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
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
			Result := type_factory.double_type
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
			elseif value.abs >= 1.0e-6 or value.abs < 1.0e6 then
				create a_decimal.make_from_string (value.out)
				Result := a_decimal.to_scientific_string
			else
				Result := value.out -- TODO - No good - but how to determine the result? use MA-DECIMAL rather than double
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "number (")
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
				a_required_type = type_factory.double_type then
					Result := True
			elseif a_required_type = type_factory.integer_type then
				Result := not (is_nan or is_infinite)
			elseif a_required_type = type_factory.decimal_type then
				Result := not is_nan
			elseif a_required_type = type_factory.float_type then
				Result := True -- TODO
			else
				Result := False
			end
		end

	is_whole_number: BOOLEAN is
			-- Is value integral?
		local
			l_decimal: MA_DECIMAL
		do
			create l_decimal.make_from_string (value.out)
			Result := l_decimal.is_integer
		end

	is_platform_integer: BOOLEAN is
			-- Can value be represented by an `INTEGER'?
		do
			Result := (value >= Platform.Minimum_integer and value <= Platform.Maximum_integer)
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
			else
				Result := DOUBLE_.is_nan (value)
				if not Result then
					if internal_is_nan or else not is_zero and then value = 2.0 * value then
						Result := True
					end
				end
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
			Result := DOUBLE_.is_plus_infinity (value) or else DOUBLE_.is_minus_infinity (value)
		end

feature -- Conversion

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE) is
			-- Convert `Current' to `a_required_type'
		local
			l_decimal: MA_DECIMAL
		do
			if a_required_type = type_factory.boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} converted_value.make (value /= 0.0)
			elseif a_required_type = type_factory.any_atomic_type  then
				converted_value := Current
			elseif a_required_type = any_item  then
				converted_value := Current
			elseif  a_required_type = type_factory.integer_type then
				-- TODO: need tests for INTEGER_64
				if value >= Platform.Minimum_integer and value <= Platform.Maximum_integer and then value = DOUBLE_.truncated_to_integer (value) then
					create {XM_XPATH_MACHINE_INTEGER_VALUE} converted_value.make (DOUBLE_.truncated_to_integer (value).to_integer_64)
				else
					create l_decimal.make_from_string (value.out)
					create {XM_XPATH_INTEGER_VALUE} converted_value.make (l_decimal)
				end
			elseif  a_required_type = type_factory.double_type then
				converted_value := Current
			elseif  a_required_type = type_factory.numeric_type then
				converted_value := Current
			elseif  a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} converted_value.make_from_string (value.out)
			elseif  a_required_type = type_factory.float_type then
				create {XM_XPATH_FLOAT_VALUE} converted_value.make (value)
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			end
		end

	rounded_value: like Current is
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		local
			l_decimal, l_decimal_2: MA_DECIMAL
		do
			if is_nan or else is_infinite then
				Result := Current
			elseif is_zero then
				Result := Current
			elseif value > -0.5 and then value < 0.0 then
				create Result.make (-0.0)
			else
				create l_decimal.make_from_string (value.out)
				if l_decimal.is_negative then
					l_decimal_2 := l_decimal.round_to_integer (shared_negative_round_context)
				else
					l_decimal_2 := l_decimal.round_to_integer (shared_round_context)
				end
				if l_decimal_2.is_special then
					create Result.make_nan
					Result.set_last_error_from_string ("Failure rounding to integer", Xpath_errors_uri, "FOAR0002", Dynamic_error)
				else
					create Result.make (l_decimal_2.to_double)
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

	arithmetic (a_operator: INTEGER; a_other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		local
			l_double, l_other_double, l_third_double: DOUBLE
			l_value: XM_XPATH_DOUBLE_VALUE
		do
			if is_nan then
				Result := Current
			elseif a_other.is_nan then
				Result := a_other
			else
				inspect
					a_operator
				when Plus_token then
					create {XM_XPATH_DOUBLE_VALUE} Result.make (value + a_other.as_double)
				when Minus_token then
					l_double := value - a_other.as_double
					create l_value.make (l_double)
					if is_zero and a_other.is_zero and (is_negative = a_other.is_negative)  then
						l_value.set_negative_zero
					end
					Result := l_value
				when Multiply_token then
					create {XM_XPATH_DOUBLE_VALUE} Result.make (value * a_other.as_double)
				when Division_token then
					if is_zero then
						if a_other.is_zero then
							create {XM_XPATH_DOUBLE_VALUE} Result.make_nan
						else
							create {XM_XPATH_DOUBLE_VALUE} Result.make (value / a_other.as_double)
						end
					elseif is_infinite and a_other.is_infinite then
						create {XM_XPATH_DOUBLE_VALUE} Result.make_nan
					elseif a_other.is_zero then
						if is_negative /= a_other.is_negative then
							create {XM_XPATH_DOUBLE_VALUE} Result.make_from_string ("-INF")
						else
							create {XM_XPATH_DOUBLE_VALUE} Result.make_from_string ("INF")
						end
					else
						create {XM_XPATH_DOUBLE_VALUE} Result.make (value / a_other.as_double)
					end
				when Integer_division_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (DOUBLE_.truncated_to_integer (value / a_other.as_double))
				when Modulus_token then
					l_double := a_other.as_double
					if is_nan or else a_other.is_nan or else a_other.is_zero or else is_infinite then
						create {XM_XPATH_DOUBLE_VALUE} Result.make_nan
					elseif a_other.is_infinite then
						Result := Current
					elseif is_zero then
						Result := Current
					else
						l_other_double := DOUBLE_.truncated_to_integer (value / l_double).to_double
						l_third_double := l_double * l_other_double
						create l_value.make (value - l_third_double)
						if l_third_double.abs = value.abs and value.sign = -1 then
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
			elseif a_value.is_double then
				value := a_value.to_double
				if value = 0 and a_value.item (1) = '-' then
					is_negative_zero := True
				end
			else
				set_last_error_from_string ("Invalid xs:double string value", Xpath_errors_uri, "XPTY0004", Type_error)
			end
		end

feature {NONE} -- Implementation

	internal_is_nan: BOOLEAN
			-- Fabricated NaN

	is_negative_zero: BOOLEAN
			--	 Is zero negative?

end
