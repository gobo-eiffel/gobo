indexing

	description:

		"XPath string values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature -- Initialization

	make (val: STRING) is
			-- Establish invariant
		require
			value_not_void: val /= Void
		do
			make_atomic_value
			value := clone (val)
		ensure
			value_set: STRING_.same_string (value, val)
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			Result := value
		end

	type: INTEGER is
			-- Type;
			-- The data model requires zero or one xs:QNames.
			-- To convert, call type_name (Result) if Result > 0
		do
			Result := String_type
		end
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This method determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			Result := String_type
		end

	effective_boolean_value (context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Effective boolean value of the expression;
			-- This returns `False' if the value is the empty sequence,
			-- a zero-length string, a number equal to zero, or the boolean
			-- `False'. Otherwise it returns `True'.
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

feature -- Conversions

	convert_to_type (required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
		do
			-- TODO
		end

feature {NONE} -- Implementation

	value: STRING
			-- The actual string-value

invariant
	value_not_void: value /= Void

end
