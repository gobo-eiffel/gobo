indexing

	description:

		"An integer XPath value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INTEGER_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE

creation

	make, make_with_type

feature {NONE} -- Initialization

	make (a_value: INTEGER) is
		do
			make_atomic_value
			value := a_value
			this_type := Integer_type
		ensure
			value_set: value = a_value
			type_set: this_type = Integer_type
		end

	make_with_type (a_value: INTEGER; a_type: INTEGER) is
		require
			valid_type: is_sub_type (a_type, Integer_type)
		do
			make_value
			value := a_value
			this_type := a_type
		ensure
			value_set: value = a_value
			type_set: this_type = a_type
		end

feature -- Access

	value: INTEGER

	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This method determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			Result := this_type
		end

	effective_boolean_value (context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value of the expression;
			-- This returns `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it returns `True'.
		do
			Result := value /= 0
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value.out
		end
	
feature -- Conversions
	
	convert_to_type (required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
			-- TODO - need to virtualize the pre-condition so that
			-- only sub-types of Integer_type are valid
		local
		do
			inspect
				required_type

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

feature {NONE} -- Implementation

	this_type: INTEGER
			-- Actual type of this value

end
