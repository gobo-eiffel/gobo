indexing

	description:

		"XPath string values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_value: STRING) is
			-- Establish invariant
		require
			value_not_void: a_value /= Void
		do
			make_atomic_value
			value := clone (a_value)
		ensure
			value_set: STRING_.same_string (value, a_value)
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value
		end

	type: INTEGER is
			-- Type
		do
			Result := String_type
		end
	
	item_type: INTEGER is
			--Determine the data type, if possible;
		do
			Result := String_type
		end

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value
		do
			Result := value.count > 0
		end
			
feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_string: XM_XPATH_STRING_VALUE
		do
			other_string ?= other
			if other_string /= Void then
				Result := STRING_.same_string (string_value, other_string.string_value)
			end
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "string (%"")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversion

	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
			-- TODO
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

invariant
	value_not_void: value /= Void

end
