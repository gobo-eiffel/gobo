indexing

	description:

		"Objects that are XPath values which are in error"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$ $"

class XM_XPATH_INVALID_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_invalid_value, as_invalid_value
		end

create

	make, make_from_string
	
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

	make_from_string (a_string, a_namespace_uri, an_error_code: STRING; an_error_type: INTEGER) is
			-- Create from `a_string'.
		require
			valid_error_code: an_error_code /= Void
			namespace_uri_not_void: a_namespace_uri /= Void
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
		do
			make_value
			set_last_error_from_string (a_string, a_namespace_uri, an_error_code, an_error_type)
		ensure
			description_set: error_value /= Void and then error_value.description /= Void and then STRING_.same_string (error_value.description, a_string)
			code_set: error_value.code = an_error_code
			type_set: error_value.type = an_error_type
		end

feature -- Access

	is_invalid_value: BOOLEAN is
			-- Is `Current' an invalid value?
		do
			Result := True
		end

	as_invalid_value: XM_XPATH_INVALID_VALUE is
			-- `Current' seen as an invalid value
		do
			Result := Current
		end

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
		do
			if other.is_invalid_value then
				Result := error_value.same_error (other.as_invalid_value.error_value)
			end
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
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

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string ("Value in error: ", error_value.error_message)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversion
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE) is
			-- Convert `Current' to `required_type'
		do
			converted_value := Void
		end

end
