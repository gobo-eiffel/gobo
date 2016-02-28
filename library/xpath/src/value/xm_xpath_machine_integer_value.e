note

	description:

		"XPath for machine-sized integer values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class XM_XPATH_MACHINE_INTEGER_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			three_way_comparison, hash_code, is_machine_integer_value, as_machine_integer_value
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

	XM_XPATH_SHARED_DECIMAL_CONTEXTS
		export {NONE} all end

create

	make


feature {NONE} -- Initialization

	make (a_value: like value)
		do
			make_atomic_value
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Access

	value: INTEGER_64
			-- Raw value

	is_machine_integer_value: BOOLEAN
			-- Is `Current' a machine integer value?
		do
			Result := True
		end

	as_machine_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			-- `Current' seen as a machine integer value
		do
			Result := Current
		end

	as_integer: INTEGER
			-- Value converted to an `INTEGER'
		do
			Result := value.to_integer_32
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := value.hash_code
		end

	as_double: DOUBLE
			-- Value converted to a double
		do
			Result := value.to_double
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING
			--Value of the item as a string
		do
			Result := value.out
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: detachable XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `other'
		local
			l_decimal: MA_DECIMAL
		do
			if other.is_integer_value then
				create l_decimal.make_from_string (value.out)
				Result := l_decimal.compare (other.as_integer_value.value, shared_integer_context).to_integer
			elseif other.is_machine_integer_value then
				if value = other.as_machine_integer_value.value then
					Result := 0
				elseif value > other.as_machine_integer_value.value then
					Result := 1
				else
					Result := -1
				end
			else
				Result := Precursor (other, a_context)
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "integer (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or
				a_required_type = type_factory.any_atomic_type or
				a_required_type = type_factory.boolean_type or
				a_required_type = type_factory.string_type or
				a_required_type = type_factory.untyped_atomic_type or
				a_required_type = type_factory.numeric_type or
				a_required_type = type_factory.integer_type or
				a_required_type = type_factory.decimal_type or
				a_required_type = type_factory.float_type or
				a_required_type = type_factory.double_type then
				Result := True
			else
				Result := False
			end
		end

	is_whole_number: BOOLEAN
			-- Is value integral?
		do
			Result := True
		end

	is_platform_integer: BOOLEAN
			-- Can value be represented by an `INTEGER'?
		do
			Result := True
		end

	is_double: BOOLEAN
			-- Can value be converted to a `DOUBLE'?
		do
			Result := True
		end

	is_nan: BOOLEAN
			-- Is value Not-a-number?
		do
			Result := False
		end

	is_zero: BOOLEAN
			-- Is value zero?
		do
			Result := value = 0
		end

	is_negative: BOOLEAN
			-- Is value less than zero?
		do
			Result := value < 0
		end

	is_infinite: BOOLEAN
			-- Is value infinite?
		do
			Result := False
		end

	is_strictly_positive: BOOLEAN
			-- Is `Current' strictly greater than zero?
		do
			Result := not is_negative and not is_zero
		ensure
			definition: Result = not is_negative and not is_zero
		end

feature -- Conversion

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		do
			if a_required_type = type_factory.boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} converted_value.make (not is_zero)
			elseif a_required_type = type_factory.any_atomic_type  then
				converted_value := Current
			elseif a_required_type = any_item  then
				converted_value := Current
			elseif  a_required_type = type_factory.integer_type then
				converted_value := Current
			elseif  a_required_type = type_factory.numeric_type then
				converted_value := Current
			elseif  a_required_type = type_factory.double_type then
				create {XM_XPATH_DOUBLE_VALUE} converted_value.make (as_double)
			elseif  a_required_type = type_factory.float_type then
				create {XM_XPATH_FLOAT_VALUE} converted_value.make (as_double)
			elseif  a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} converted_value.make_from_integer_64 (value)
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			end
		end

	rounded_value: like Current
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		do
			Result := Current
		end

	rounded_half_even (a_scale: INTEGER): XM_XPATH_NUMERIC_VALUE
			-- `a_numeric_value' rounded towards the nearest even number;
		local
			l_decimal: XM_XPATH_DECIMAL_VALUE
			i: INTEGER
			l_factor, l_absolute, l_modulus, l_rounded, l_doubled_modulus: INTEGER_64
		do
			if a_scale >= 0 then
				Result := Current
			elseif a_scale < -15 then
				create l_decimal.make_from_integer_64 (value)
				Result := l_decimal.rounded_half_even (a_scale)
			else
				from
					i := 1
					l_factor := 1
				until
					i > - a_scale
				loop
					l_factor := l_factor * 10
					i := i + 1
				end
				l_absolute := value.abs
				l_modulus := l_absolute \\ l_factor
				l_rounded := l_absolute - l_modulus
				l_doubled_modulus := 2 * l_modulus
				if (l_doubled_modulus > l_factor)
					or ((l_doubled_modulus = l_factor)
						and ((l_rounded \\ (2 * l_factor)) /= 0)) then
					l_rounded := l_rounded + l_factor
				end
				if value < 0 then
					l_rounded := - l_rounded
				end
				create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (l_rounded)
			end
		end

	floor: like Current
			-- Value rounded towards minus infinity
		do
			Result := Current
		end

	ceiling: like Current
			-- Value rounded towards plus infinity
		do
			Result := Current
		end

	negated_value: like Current
			-- Same abaolute value but opposite sign
		do
			create Result.make (-value)
		end

feature -- Basic operations

	arithmetic (a_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE
			-- Arithmetic calculation
		local
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_integer_value: XM_XPATH_INTEGER_VALUE
			l_decimal_value: XM_XPATH_DECIMAL_VALUE
			l_value: INTEGER_64
		do
			if other.is_machine_integer_value then
				l_value := other.as_machine_integer_value.value
				if l_value > Platform.Maximum_integer or l_value < Platform.Minimum_integer
					or value > Platform.Maximum_integer or value < Platform.Minimum_integer then
					-- to avoid overflow, use decimal_arithmetic
					-- this is over-cautious - can we do better?
						create l_decimal_value.make_from_integer_64 (value)
						Result := l_decimal_value.arithmetic (a_operator, other)
				else
					inspect
						a_operator
					when Plus_token then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value + l_value)
					when Minus_token then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value - l_value)
					when Multiply_token then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value * l_value)
					when Integer_division_token then
						if l_value = 0 then
							create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (0)
							Result.set_last_error_from_string ("Division by zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
						else
							create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value // l_value)
						end
					when Division_token then
						-- The result of dividing two integers is a decimal
						if l_value = 0 then
							create {XM_XPATH_DECIMAL_VALUE} Result.make_error ("Division by Zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
						elseif value \\ l_value = 0 then
							-- but in this case we can be more economical
							create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value // l_value)
						else
							create l_decimal_value.make_from_integer_64 (value)
							Result := l_decimal_value.arithmetic (a_operator, create {XM_XPATH_DECIMAL_VALUE}.make_from_integer_64 (l_value))
						end
					when Modulus_token then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (value \\ l_value)
					end
				end
			elseif other.is_integer_value then
				create l_integer_value.make_from_string (value.out)
				Result := l_integer_value.arithmetic (a_operator, other)
			else
				convert_to_type (other.item_type)
				check postcondition_of_convert_to_type: attached converted_value as l_converted_value then
					l_numeric_value := l_converted_value.as_numeric_value
					Result := l_numeric_value.arithmetic (a_operator, other)
				end
			end
		end

end
