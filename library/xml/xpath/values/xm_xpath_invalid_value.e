indexing

	description:

		"Objects that are XPath values which are in error"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$ $"

class XM_XPATH_INVALID_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

creation

	make
	
feature {NONE} -- Initialization

	make (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set in error.
		do
			make_value
			error_value := an_error_value
		ensure
			in_error: is_error = True
			error_set: error_value = an_error_value
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := any_item -- Can't meet pre-condition anyway
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := error_value.error_message -- Can't meet pre-condition anyway
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			an_error_value: XM_XPATH_INVALID_VALUE
		do
			an_error_value ?= other
			if an_error_value /= void then
				Result := error_value.same_error (an_error_value.error_value)
			end
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		do
			Result := 1  -- Can't meet pre-condition anyway
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := False
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			Result := False
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string ("Value in error: ", error_value.error_message)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversion
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
		do
			Result := Void
		end

end
