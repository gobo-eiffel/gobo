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
			three_way_comparison, effective_boolean_value
		end

	MA_SHARED_DECIMAL_CONTEXT

	MA_DECIMAL_CONSTANTS

creation

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
			create value.make_from_string (a_value)
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
			Result := value.to_scientific_string -- TODO - check the standard
		end

feature -- Comparison
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			is_a_decimal: BOOLEAN
		do
			an_integer_value ?= other
			if an_integer_value /= Void then
				a_decimal_value ?= an_integer_value.convert_to_type (type_factory.decimal_type)
					check
						decimal_conversion: a_decimal_value /= Void
					end
				is_a_decimal := True
			else
				a_decimal_value ?= other
				if a_decimal_value /= Void then
					is_a_decimal := True
				end
			end
			if is_a_decimal then
				if value = a_decimal_value.value then
					Result := 0
				elseif value > a_decimal_value.value then
					Result := 1
				else
					Result := -1
				end
			else
				Result := Precursor (other)
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
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
			end
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

	is_string_a_decimal (a_value: STRING): BOOLEAN is
			-- Does `a_value' represent a decimal number?
		require
			string_not_void: a_value /= Void
		local
			a_parser: MA_DECIMAL_TEXT_PARSER
		do
			create a_parser
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
			value <= Maximum_integer_as_decimal and then
			value >= Minimum_integer_as_decimal
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

	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			Result := False
			check
				not_infinite: not value.is_infinity
				-- because xs:decimal cannot become infinite
			end
		end
	
feature -- Evaluation

		effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (not value.is_zero)
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
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value.to_double)
			elseif  a_required_type = type_factory.decimal_type then
				Result := Current
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			end
		end

	rounded_value: like Current is
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		local
			a_decimal: MA_DECIMAL
		do
			create a_decimal.make_copy (value)
			a_decimal := a_decimal.round_to_integer (shared_round_context)
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

feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		local
			another_decimal: XM_XPATH_DECIMAL_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_decimal: MA_DECIMAL
		do
			another_decimal ?= other
			if another_decimal /= Void then
				inspect
					an_operator
				when Plus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value + another_decimal.value)
				when Minus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value - another_decimal.value)
				when Multiply_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value * another_decimal.value)
				when Division_token then
					if another_decimal.is_zero then
						create {XM_XPATH_DECIMAL_VALUE} Result.make_error ("Division by Zero", Xpath_errors_uri, "FOAR0001", Dynamic_error)
					else
						a_decimal := value / another_decimal.value
						create {XM_XPATH_DECIMAL_VALUE} Result.make (a_decimal)
					end
				when Modulus_token then
					create {XM_XPATH_DECIMAL_VALUE} Result.make (value \\ another_decimal.value)
				else
					an_integer_value ?= other
					if an_integer_value /= Void then
						another_decimal ?= other.convert_to_type (type_factory.decimal_type)
						check
							converted_to_decimal: another_decimal /= Void
							-- as integers will always convert to decimals
						end
						Result := arithmetic (an_operator, another_decimal)
					else
						a_numeric_value ?= convert_to_type (other.item_type)
						if an_integer_value /= Void then
							Result := a_numeric_value.arithmetic (an_operator, other)
						else
							create {XM_XPATH_DECIMAL_VALUE} Result.make (value.nan)
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	shared_round_context: MA_DECIMAL_CONTEXT is
			-- Decimal context for use by round
		once
			create Result.make (shared_decimal_context.digits, Round_ceiling)
		end

	shared_floor_context: MA_DECIMAL_CONTEXT is
			-- Decimal context for use by floor
		once
			create Result.make (shared_decimal_context.digits, Round_floor)
		end

end
