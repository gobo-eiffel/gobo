indexing

	description:

		"XPath integer values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTEGER_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE
		redefine
			three_way_comparison, effective_boolean_value
		end

creation

	make, make_from_string

		-- TODO: This whole class needs a different basis - at least INTEGER_64, but
		--  prefereably a type representing unbounded integers.

feature {NONE} -- Initialization

	make (a_value: INTEGER) is
		do
			make_atomic_value
			value := a_value
		ensure
			value_set: value = a_value
		end

	make_from_string (a_value: STRING) is
		require
			is_integer: a_value.is_integer -- TODO
		do
			make_atomic_value
			value := a_value.to_integer -- TODO
		ensure
			value_set: value = a_value.to_double
		end

feature -- Access

	value: INTEGER --  TODO should be INTEGER_64, or EDA_INTEGER or something
	
	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
		do
			Result := value
		end

	as_double: DOUBLE is
			-- Value converted to a double
		do
			Result := value
		end

	item_type: INTEGER is
			--Determine the data type, if possible;
		do
			Result := Integer_type
		end

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (value /= 0)
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value.out
		end

feature -- Comparison
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		local
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			an_integer_value ?= other

			if an_integer_value = Void then
				Result := Precursor (other)
			else
				if value = an_integer_value.value then
					Result := 0
				elseif value > an_integer_value.value then
					Result := 1
				else
					Result := -1
				end
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
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
			Result := True
		end

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			do_nothing
		end

	is_zero: BOOLEAN is
			-- Is value zero?
		do
			Result := value = 0
		end

	
	is_infinite: BOOLEAN is
			-- Is value infinite?
		do
			do_nothing
		end
	
feature -- Conversions
	
	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
		do
			inspect
				a_required_type

			when Boolean_type  then
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (value /= 0)

			when Atomic_type  then
				Result := Current

			when Any_item  then
				Result := Current

			when Integer_type then
				Result := Current

			when Double_type then
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value)

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
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_quotient: INTEGER
			a_decimal_value, another_decimal_value: XM_XPATH_DECIMAL_VALUE
		do

			-- TODO handle overflow

			todo ("arithmetic - overflow not handled", True)

			an_integer_value ?= other
			if other /= void then
				inspect
					an_operator
				when Plus_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make (value + an_integer_value.value)
				when Minus_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make (value - an_integer_value.value)
				when Multiply_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make (value * an_integer_value.value)
				when Integer_division_token then

					-- TODO: handle division by zero

					create {XM_XPATH_INTEGER_VALUE} Result.make (value // an_integer_value.value)
				when Division_token then

					-- The result of dividing two integers is a decimal; but if
					-- one divides exactly by the other, we implement it as an integer

					a_quotient := an_integer_value.value
					if a_quotient /= 0 and then value \\ a_quotient = 0 then
						create {XM_XPATH_INTEGER_VALUE} Result.make (value // a_quotient)
					else
						create a_decimal_value.make (value)
						create another_decimal_value.make (an_integer_value.value)
						Result := a_decimal_value.arithmetic ( Division_token, another_decimal_value)
					end
				when Modulus_token then
					create {XM_XPATH_INTEGER_VALUE} Result.make (value \\ an_integer_value.value)
				end
			else
				a_numeric_value ?= convert_to_type (other.item_type)
				Result := a_numeric_value.arithmetic (an_operator, other)
			end
		end
	
end
