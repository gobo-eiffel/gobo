indexing

	description:

		"Objects that represent XPath double values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DOUBLE_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			effective_boolean_value
		end

creation

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
		require
			is_double: a_value.is_double
		do
			make_atomic_value
			value := a_value.to_double
		ensure
			value_set: value = a_value.to_double
		end

	make_nan is
			-- create NaN.
		do
			todo ("make-NaN", False)
		ensure
			not_a_number: is_nan
		end

feature -- Access

	value: DOUBLE

	
	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
		do
			Result := value.truncated_to_integer
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

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (value /= 0.0)
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value.out
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "number (")
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

	is_whole_number: BOOLEAN is
			-- Is value integral?
		do
			Result := value = value.truncated_to_integer
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
			if not is_zero and then value = 2.0 * value then
				Result := True
			end
		end

	is_zero: BOOLEAN is
			-- Is value zero?
		do
			Result := value = 0.0 or else value = -0.0
		end


	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			todo ("is-infinite", False)
		end	

feature -- Conversion
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
			-- TODO - need to virtualize the pre-condition so that
			-- only sub-types of Integer_type are valid
		local
		do
			if a_required_type = type_factory.boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (value /= 0.0)
			elseif a_required_type = type_factory.any_atomic_type  then
				Result := Current
			elseif a_required_type = any_item  then
				Result := Current
			elseif  a_required_type = type_factory.integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (value.truncated_to_integer)
			elseif  a_required_type = type_factory.double_type then
				Result := Current
			elseif  a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make_from_string (value.out)
			elseif  a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			end
		end

	rounded_value: like Current is
			-- `a_numeric_value' rounded towards the nearest whole number (0.5 rounded up)
		do
			if is_nan then
				Result := Current
			elseif is_infinite then
				Result := Current
			elseif is_zero then
				Result := Current
			elseif value > -0.5 and then value < 0.0 then
				create Result.make (-0.0)
			else
				todo ("rounded_value", True)
			end
		end

feature -- Basic operations

	arithmetic (an_operator: INTEGER; other: XM_XPATH_NUMERIC_VALUE): XM_XPATH_NUMERIC_VALUE is
			-- Arithmetic calculation
		local
			a_double, another_double: DOUBLE
			an_integer, another_integer: INTEGER
		do
			inspect
				an_operator
			when Plus_token then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value + other.as_double)
			when Minus_token then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value - other.as_double)
			when Multiply_token then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value * other.as_double)
			when Division_token then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value / other.as_double)
			when Modulus_token then
				a_double := other.as_double
				if is_whole_number and then other.is_whole_number then
					an_integer := as_integer
					another_integer := other.as_integer
					create {XM_XPATH_INTEGER_VALUE} Result.make_from_integer (an_integer \\ another_integer)
				else
					if is_nan or else other.is_nan or else other.is_zero or else is_infinite then
						create {XM_XPATH_DOUBLE_VALUE} Result.make_nan
					elseif other.is_infinite then
						Result := Current
					elseif is_zero then
						Result := Current
					else
						another_double := (value / a_double).floor
						create {XM_XPATH_DOUBLE_VALUE} Result.make (value - another_double)
					end
				end
			end
		end

end
