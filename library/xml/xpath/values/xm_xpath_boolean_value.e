indexing

	description:

		"A boolean XPath value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BOOLEAN_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

creation

	make

feature {NONE} -- Initialization

	make (a_value: BOOLEAN) is
		do
			make_atomic_value
			value := a_value
		ensure
			set: value = a_value
		end

feature -- Access

	value: BOOLEAN
			-- Value of expression

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Boolean_type
		end

	effective_boolean_value (context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value of the expression
		do
			Result := value
		end

	string_value: STRING is
			--Value of the item as a string
		do
			if value then
				Result := "true"
			else
				Result := "false"
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_boolean: XM_XPATH_BOOLEAN_VALUE
		do
			other_boolean ?= other
			if other_boolean /= Void then
				Result := value = other_boolean.value
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "boolean (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
	
feature -- Conversions
	
	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		local
			a_value: INTEGER
			an_integer: XM_XPATH_INTEGER_VALUE
		do
			if value then a_value := 1 end
			inspect
				a_required_type

			when Boolean_type  then
				Result := Current

			when Atomic_type  then
				Result := Current

			when Any_item  then
				Result := Current

			when Number_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make (a_value)

			when Integer_type then
				create {XM_XPATH_INTEGER_VALUE} Result.make (a_value)

			when Decimal_type..Double_type then
				create an_integer.make (a_value)
				Result := an_integer.convert_to_type (a_required_type)

			when String_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			end
		end
end
