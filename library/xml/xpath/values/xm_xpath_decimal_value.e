indexing

	description:

		"An XPath decimal value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DECIMAL_VALUE

inherit

	XM_XPATH_NUMERIC_VALUE

creation

	make, make_from_string

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
			is_double: a_value.is_double -- TODO
		do
			make_atomic_value
			value := a_value.to_double
		ensure
			value_set: value = a_value.to_double
		end
	
feature -- Access

	value: DOUBLE -- A poor compromise???

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Double_type -- ?? TODO
		end

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value
		do
			Result := value /= 0.0
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
			a_string := STRING_.appended_string (indent (a_level), "decimal (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
		
feature -- Conversion
	
	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
			-- TODO - need to virtualize the pre-condition so that
			-- only sub-types of Integer_type are valid
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
				create {XM_XPATH_DOUBLE_VALUE} Result.make (value)

			when Decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} Result.make (value)

			when String_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			end
		end

end
