﻿note

	description:

		"Objects that represent XPath decimal value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_DECIMAL_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			three_way_comparison, hash_code, is_decimal_value, as_decimal_value
		end

	MA_DECIMAL_HANDLER

	XM_XPATH_SHARED_DECIMAL_CONTEXTS
		export {NONE} all end

create

	make, make_from_string, make_from_integer, make_error, make_from_integer_64

feature {NONE} -- Initialization

	make (a_value: MA_DECIMAL)
		do
			make_atomic_value
			value := a_value
		ensure
			value_set: value = a_value
		end

	make_from_integer (a_value: INTEGER)
		do
			make_atomic_value
			create value.make_from_integer (a_value)
		end

	make_from_integer_64 (a_value: INTEGER_64)
		do
			make_atomic_value
			create value.make_from_string (a_value.out)
		end

	make_from_string (a_value: STRING)
		require
			is_decimal: a_value /= Void and then is_string_a_decimal (a_value)
		do
			make_atomic_value
			if a_value.index_of ('e', 1) = 0 and a_value.index_of ('E', 1) = 0 then
				create value.make_from_string (a_value)
			else
				create error_value.make_from_string ("Decimal literal may not contain e or E", Xpath_errors_uri, "FORG0001", Dynamic_error)
			end
		end

	make_error (a_string, a_namespace_uri, an_error_code: STRING; an_error_type: INTEGER)
			-- Create decimal in error.
		require
			valid_error_code: an_error_code /= Void
			namespace_uri_not_void: a_namespace_uri /= Void
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
		do
			set_last_error_from_string (a_string, a_namespace_uri, an_error_code, an_error_type)
		end

feature -- Access

	value: detachable MA_DECIMAL


	is_decimal_value: BOOLEAN
			-- Is `Current' a decimal value?
		do
			Result := True
		end

	as_decimal_value: XM_XPATH_DECIMAL_VALUE
			-- `Current' seen as a decimal value
		do
			Result := Current
		end

	hash_code: INTEGER
			-- Hash code value
		do
			if is_double then
				Result := as_double.hash_code
			else
				check attached value as l_value then
					Result := l_value.to_scientific_string.hash_code
				end
			end
		end

	as_integer: INTEGER
		do
			check attached value as l_value then
				Result := l_value.to_integer
			end
		end

	as_double: DOUBLE
			-- Value converted to a double
		do
			check attached value as l_value then
				Result := l_value.to_double
			end
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.decimal_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING
			--Value of the item as a string
		local
			l_value: MA_DECIMAL
			l_coefficient, l_pad: STRING
			l_index, l_count: INTEGER
		do
			check attached value as l_value2 then
				if is_whole_number then
					Result := as_integer.out
				else
					l_value := l_value2
					create Result.make (0)
					if is_negative then
						Result.append_string ("-")
					end
					create l_coefficient.make (l_value.count)
					from
						l_index := l_value.count - 1
					until
						l_index < 0
					loop
						l_coefficient.append_character (INTEGER_.to_character (('0').code + l_value.coefficient.item (l_index)))
						l_index := l_index - 1
					end
					if l_value.exponent < 0 then
						l_count := l_value.exponent.abs
						if l_count > l_coefficient.count then
							create l_pad.make_filled ('0', l_count - l_coefficient.count)
							Result.append_string ("0.")
							Result.append_string (l_pad)
							Result.append_string (l_coefficient)
						elseif l_count = l_coefficient.count then
							Result.append_string ("0.")
							if l_coefficient.is_empty then
								l_coefficient := "0"
							else
								STRING_.prune_all_trailing (l_coefficient, '0')
							end
							Result.append_string (l_coefficient)
						else
							Result.append_string (l_coefficient.substring (1, l_coefficient.count - l_count))
							Result.append_string (".")
							l_coefficient := l_coefficient.substring (l_coefficient.count - l_count + 1, l_coefficient.count)
							if l_coefficient.is_empty then
								l_coefficient := "0"
							else
								STRING_.prune_all_trailing (l_coefficient, '0')
							end
							Result.append_string (l_coefficient)
						end
					else
						Result.append_string (l_coefficient)
					end
				end
			end
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: detachable XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `other'
		local
			a_value: detachable like value
		do
			check attached value as l_value then
				if other.is_integer_value then
					other.as_integer_value.convert_to_type (type_factory.decimal_type)
					check postcondition_of_convert_to_type: attached other.as_integer_value.converted_value as l_converted_value then
						a_value := l_converted_value.as_decimal_value.value
					end
				elseif other.is_decimal_value then
					a_value := other.as_decimal_value.value
				end
				if a_value /= Void then
					if l_value.is_equal (a_value) then
						Result := 0
					elseif l_value > a_value then
						Result := 1
					else
						Result := -1
					end
				else
					Result := Precursor (other, a_context)
				end
			end
		end


feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "decimal (")
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

	is_string_a_decimal (a_value: STRING): BOOLEAN
			-- Does `a_value' represent a decimal number?
		require
			string_not_void: a_value /= Void
		local
			a_parser: MA_DECIMAL_TEXT_PARSER
		do
			create a_parser.make
			a_parser.parse (a_value)
			Result := not a_parser.error
		end

	is_whole_number: BOOLEAN
			-- Is value integral?
		do
			Result := is_platform_integer
		end

	is_platform_integer: BOOLEAN
			-- Can value be represented by an `INTEGER'?
		do
			check attached value as l_value then
				Result := l_value.is_integer and then
					l_value <= decimal.maximum_integer and then
					l_value >= decimal.minimum_integer
			end
		end

	is_double: BOOLEAN
			-- Can value be converted to a `DOUBLE'?
		do
			check attached value as l_value then
				Result := l_value.is_double
			end
		end

	is_nan: BOOLEAN
			-- Is value Not-a-number?
		do
			check attached value as l_value then
				Result := False
				check
					not_nan: not l_value.is_nan
					-- because xs:decimal cannot become NaN
				end
			end
		end

	is_zero: BOOLEAN
			-- Is value zero?
		do
			check attached value as l_value then
				Result := l_value.is_zero
			end
		end

	is_negative: BOOLEAN
			-- Is value less than zero?
		do
			check attached value as l_value then
				Result := l_value.is_negative
			end
		end

	is_infinite: BOOLEAN
			-- Is value infinite?
		do
			check attached value as l_value then
				Result := False
				check
					not_infinite: not l_value.is_infinity
					-- because xs:decimal cannot become infinite
				end
			end
		end

feature -- Conversion

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		do
			check attached value as l_value then
				if a_required_type = type_factory.boolean_type  then
					create {XM_XPATH_BOOLEAN_VALUE} converted_value.make (not l_value.is_zero)
				elseif a_required_type = type_factory.any_atomic_type  then
					converted_value := Current
				elseif a_required_type = any_item  then
					converted_value := Current
				elseif  a_required_type = type_factory.integer_type then
					if is_platform_integer then
						create {XM_XPATH_MACHINE_INTEGER_VALUE} converted_value.make (l_value.to_integer.to_integer_64)
					else
						create {XM_XPATH_INTEGER_VALUE} converted_value.make (l_value)
					end
				elseif  a_required_type = type_factory.double_type then
					if is_nan then
						create {XM_XPATH_DOUBLE_VALUE} converted_value.make_nan
					else
						create {XM_XPATH_DOUBLE_VALUE} converted_value.make (l_value.to_double)
					end
				elseif  a_required_type = type_factory.float_type then
					if is_nan then
						create {XM_XPATH_FLOAT_VALUE} converted_value.make_nan
					else
						create {XM_XPATH_FLOAT_VALUE} converted_value.make (l_value.to_double)
					end
				elseif  a_required_type = type_factory.decimal_type then
					converted_value := Current
				elseif  a_required_type = type_factory.numeric_type then
					converted_value := Current
				elseif  a_required_type = type_factory.string_type then
					create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
				elseif a_required_type = type_factory.untyped_atomic_type then
					create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
				end
			end
		end

	rounded_value: like Current
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		local
			a_decimal: MA_DECIMAL
		do
			check attached value as l_value then
				create a_decimal.make_copy (l_value)
				if a_decimal.is_negative then
					a_decimal := a_decimal.round_to_integer (shared_negative_round_context)
				else
					a_decimal := a_decimal.round_to_integer (shared_round_context)
				end
				create Result.make (a_decimal)
			end
		end

	rounded_half_even (a_scale: INTEGER): like Current
			-- `a_numeric_value' rounded towards the nearest even number;
		local
			a_decimal: MA_DECIMAL
		do
			check attached value as l_value then
				a_decimal := l_value.rescale (0 - a_scale, shared_half_even_context)
				create Result.make (a_decimal)
			end
		end

	floor: like Current
			-- Value rounded towards minus infinity
		local
			a_decimal: MA_DECIMAL
		do
			check attached value as l_value then
				create a_decimal.make_copy (l_value)
				a_decimal := a_decimal.round_to_integer (shared_floor_context)
				create Result.make (a_decimal)
			end
		end

	ceiling: like Current
			-- Value rounded towards plus infinity;
		local
			a_decimal: MA_DECIMAL
		do
			check attached value as l_value then
				create a_decimal.make_copy (l_value)
				a_decimal := a_decimal.round_to_integer (shared_ceiling_context)
				create Result.make (a_decimal)
			end
		end

	negated_value: like Current
			-- Same abaolute value but opposite sign
		do
			check attached value as l_value then
				create Result.make (-l_value)
			end
		end

feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE
			-- Arithmetic calculation
		local
			l_other_decimal: XM_XPATH_DECIMAL_VALUE
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_decimal: MA_DECIMAL
		do
			check attached value as l_value then
				if other.is_decimal_value then
					check attached other.as_decimal_value.value as l_other_value then
						inspect
							an_operator
						when Plus_token then
							create {XM_XPATH_DECIMAL_VALUE} Result.make (l_value + l_other_value)
						when Minus_token then
							create {XM_XPATH_DECIMAL_VALUE} Result.make (l_value - l_other_value)
						when Multiply_token then
							create {XM_XPATH_DECIMAL_VALUE} Result.make (l_value * l_other_value)
						when Division_token then
							if l_other_value.is_zero then
								create {XM_XPATH_DECIMAL_VALUE} Result.make_error ("Division by Zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
							else
								l_decimal := l_value / l_other_value
								create {XM_XPATH_DECIMAL_VALUE} Result.make (l_decimal)
							end
						when Integer_division_token then
							if l_other_value.is_zero then
								create {XM_XPATH_DECIMAL_VALUE} Result.make_error ("Division by Zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
							else
								l_decimal := l_value // l_other_value
								if l_decimal.is_integer then
									create {XM_XPATH_MACHINE_INTEGER_VALUE} Result.make (l_decimal.to_integer)
								else
									create {XM_XPATH_INTEGER_VALUE} Result.make (l_decimal)
								end
							end
						when Modulus_token then
							create {XM_XPATH_DECIMAL_VALUE} Result.make (l_value \\ l_other_value)
						end
					end
				elseif other.is_integer_value or other.is_machine_integer_value then
					other.convert_to_type (type_factory.decimal_type)
					check postcondition_of_convert_to_type: attached other.converted_value as l_converted_value then
						l_other_decimal := l_converted_value.as_decimal_value
						Result := arithmetic (an_operator, l_other_decimal)
					end
				else
					convert_to_type (other.item_type)
					check postcondition_of_convert_to_type: attached converted_value as l_converted_value then
						l_atomic_value := l_converted_value
						if l_atomic_value.is_numeric_value then
							Result := l_atomic_value.as_numeric_value.arithmetic (an_operator, other)
						else
							create {XM_XPATH_DECIMAL_VALUE} Result.make (l_value.nan)
						end
					end
				end
			end
		end

invariant

	value_not_void_or_error: error_value = Void implies value /= Void

end
