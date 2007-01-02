indexing

	description:

		"Objects that represent XPath decimal value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DECIMAL_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			three_way_comparison, hash_code, is_decimal_value, as_decimal_value
		end

	XM_XPATH_SHARED_DECIMAL_CONTEXTS
		export {NONE} all end

create

	make, make_from_string, make_from_integer, make_error

feature {NONE} -- Initialization

	make (a_value: MA_DECIMAL) is
		do
			make_atomic_value
			value := a_value
		ensure
			value_set: value = a_value
		end

	make_from_integer (a_value: INTEGER) is
		do
			make_atomic_value
			create value.make_from_integer (a_value)
		end

	make_from_string (a_value: STRING) is
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

	make_error (a_string, a_namespace_uri, an_error_code: STRING; an_error_type: INTEGER) is
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

	value: MA_DECIMAL

	
	is_decimal_value: BOOLEAN is
			-- Is `Current' a decimal value?
		do
			Result := True
		end

	as_decimal_value: XM_XPATH_DECIMAL_VALUE is
			-- `Current' seen as a decimal value
		do
			Result := Current
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			if is_double then
				Result := as_double.hash_code
			else
				Result := value.to_scientific_string.hash_code
			end
		end

	as_integer: INTEGER is
		do
			Result := value.to_integer
		end

	as_double: DOUBLE is
			-- Value converted to a double
		do
			Result := value.to_double
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.decimal_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value.normalize.to_scientific_string
			-- should be OK, providing this NEVER goes into exponential form.
			-- but this doesn't look to be guarenteed to me.
			-- TODO: it isn't. Add to Berend's string formatter as suggested on gobo-devel list.
		end

feature -- Comparison
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Compare `Current' to `other'
		local
			is_a_decimal: BOOLEAN
			a_value: like value
		do
			if other.is_integer_value then
				a_value := other.as_integer_value.convert_to_type (type_factory.decimal_type).as_decimal_value.value
				is_a_decimal := True
			elseif other.is_decimal_value then
				a_value := other.as_decimal_value.value
				is_a_decimal := True
			end
			if is_a_decimal then
				if value = a_value then
					Result := 0
				elseif value > a_value then
					Result := 1
				else
					Result := -1
				end
			else
				Result := Precursor (other, a_context)
			end
		end


feature -- Status report

	display (a_level: INTEGER) is
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
		
	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
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

	is_string_a_decimal (a_value: STRING): BOOLEAN is
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

	is_whole_number: BOOLEAN is
			-- Is value integral?
		do
			Result := value.is_integer
		end

	is_platform_integer: BOOLEAN is
			-- Can value be represented by an `INTEGER'?
		do
			Result := value.is_integer and then
			value <= decimal.maximum_integer and then
			value >= decimal.minimum_integer
		end

	is_double: BOOLEAN is
			-- Can value be converted to a `DOUBLE'?
		do
			Result := value.is_double
		end

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			Result := False
			check
				not_nan: not value.is_nan
				-- because xs:decimal cannot become NaN
			end
		end

	is_zero: BOOLEAN is
			-- Is value zero?
		do
			Result := value.is_zero
		end

	is_negative: BOOLEAN is
			-- Is value less than zero?
		do
			Result := value.is_negative
		end

	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			Result := False
			check
				not_infinite: not value.is_infinity
				-- because xs:decimal cannot become infinite
			end
		end
	
feature -- Conversion
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
			-- TODO - need to virtualize the pre-condition so that
			-- only sub-types of Integer_type are valid
		local
		do
			if a_required_type = type_factory.boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (not value.is_zero)
			elseif a_required_type = type_factory.any_atomic_type  then
				Result := Current
			elseif a_required_type = any_item  then
				Result := Current
			elseif  a_required_type = type_factory.integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make (value)
			elseif  a_required_type = type_factory.double_type then
				if is_nan then
					create {XM_XPATH_DOUBLE_VALUE} Result.make_nan
				else
					create {XM_XPATH_DOUBLE_VALUE} Result.make (value.to_double)
				end
			elseif  a_required_type = type_factory.float_type then
				if is_nan then
					create {XM_XPATH_FLOAT_VALUE} Result.make_nan
				else
					create {XM_XPATH_FLOAT_VALUE} Result.make (value.to_double)
				end
			elseif  a_required_type = type_factory.decimal_type then
				Result := Current
			elseif  a_required_type = type_factory.numeric_type then
				Result := Current
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
			create a_decimal.make_copy (value)
			if a_decimal.is_negative then
				a_decimal := a_decimal.round_to_integer (shared_negative_round_context)
			else
				a_decimal := a_decimal.round_to_integer (shared_round_context)
			end
			create Result.make (a_decimal)
		end

	rounded_half_even (a_scale: INTEGER): like Current is
			-- `a_numeric_value' rounded towards the nearest even number;
		local
			a_decimal: MA_DECIMAL
		do
			a_decimal := value.rescale (0 - a_scale, shared_half_even_context)
			create Result.make (a_decimal)
		end

	floor: like Current is
			-- Value rounded towards minus infinity
		local
			a_decimal: MA_DECIMAL
		do
			create a_decimal.make_copy (value)
			a_decimal := a_decimal.round_to_integer (shared_floor_context)
			create Result.make (a_decimal)
		end

	ceiling: like Current is
			-- Value rounded towards plus infinity;
		local
			a_decimal: MA_DECIMAL
		do
			create a_decimal.make_copy (value)
			a_decimal := a_decimal.round_to_integer (shared_ceiling_context)
			create Result.make (a_decimal)
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
			another_decimal: XM_XPATH_DECIMAL_VALUE
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_decimal: MA_DECIMAL
		do
			if other.is_decimal_value then
				inspect
					an_operator
				when Plus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value + other.as_decimal_value.value)
				when Minus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value - other.as_decimal_value.value)
				when Multiply_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value * other.as_decimal_value.value)
				when Division_token then
					another_decimal := other.as_decimal_value
					if another_decimal.value.is_zero then
						create {XM_XPATH_DECIMAL_VALUE} Result.make_error ("Division by Zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
					else
						a_decimal := value / another_decimal.value
						create {XM_XPATH_DECIMAL_VALUE} Result.make (a_decimal)
					end
				when Modulus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value \\ other.as_decimal_value.value)
				end
			elseif other.is_numeric_value and then other.as_numeric_value.is_whole_number then
				another_decimal := other.convert_to_type (type_factory.decimal_type).as_decimal_value
				Result := arithmetic (an_operator, another_decimal)
			else
				an_atomic_value := convert_to_type (other.item_type)
				if an_atomic_value.is_numeric_value then
					Result := an_atomic_value.as_numeric_value.arithmetic (an_operator, other)
				else
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value.nan)
				end
			end
		end

invariant

	value_not_void_or_error: error_value = Void implies value /= Void

end
