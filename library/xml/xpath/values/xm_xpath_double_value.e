indexing

	description:

		"An XPath double value"

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
		end

feature -- Access

	value: DOUBLE -- TODO - insufficient??

	
	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
		do
			Result := value.truncated_to_integer
		end

	as_double: DOUBLE is
			-- Value converted to a double
		do
			Result := value
		end

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Double_type
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
			a_string := STRING_.appended_string (indent (a_level), "number (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
	
	is_convertible (a_required_type: INTEGER): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			inspect
				a_required_type
			when Any_item, Atomic_type, Boolean_type, String_type,
				Number_type, Integer_type, Decimal_type, Float_type, Double_type then
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

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			todo ("is-nan", False)
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
	
	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
		do
			inspect
				a_required_type

			when Boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (value /= 0.0)

			when Atomic_type  then
				Result := Current

			when Any_item  then
				Result := Current

			when Integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make (value.truncated_to_integer)

			when Double_type then
				Result := Current

			when Decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make (value)

			when String_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
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
					create {XM_XPATH_INTEGER_VALUE} Result.make (an_integer \\ another_integer)
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
