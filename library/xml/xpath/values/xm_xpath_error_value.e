indexing

	description:

		"XPath error values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ERROR_VALUE

inherit

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES

creation

	make, make_empty, make_from_string

feature {NONE} -- Initialization

	make (an_item: XM_XPATH_ITEM; an_error_code, an_error_type: INTEGER) is
			-- Create a non-empty error value.
		require
			item_not_void: an_item /= Void
			valid_error_code: is_valid_error_code (an_error_code)
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
		do
			item := an_item
			code := an_error_code
			type := an_error_type
		ensure
			item_set: item = an_item
			code_set: code = an_error_code
			type_set: type = an_error_type
			no_empty_sequence: empty_sequence = Void
		end

	make_empty (an_error_code, an_error_type: INTEGER) is
			-- Create an empty-sequence error value
		require
			valid_error_code: is_valid_error_code (an_error_code)
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
		do
			create empty_sequence.make
			code := an_error_code
			type := an_error_type
		ensure
			no_item: item = Void
			code_set: code = an_error_code
			type_set: type = an_error_type
			empty_sequence: empty_sequence /= Void
		end

	make_from_string (a_string: STRING; an_error_code, an_error_type: INTEGER) is
			-- Create from `a_string'.
		require
			valid_error_code: is_valid_error_code (an_error_code)
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
		do
			create {XM_XPATH_STRING_VALUE} item.make (a_string)
			code := an_error_code
			type := an_error_type
		ensure
			item_set: item /= Void and then STRING_.same_string (item.string_value, a_string)
			code_set: code = an_error_code
			type_set: type = an_error_type
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Error value

	code: INTEGER
			-- Error code, as defined in XPath 2.0 Appendix F

	type: INTEGER
			-- Type of error

	empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			-- Empty error value

	error_message: STRING is
			-- Textual error message
		do
			if empty_sequence /= Void then
				Result := "()"
			else
				Result := item.string_value
			end
		ensure
			error_message_not_void: Result /= Void
		end


feature -- Comparison

	same_error (other: XM_XPATH_ERROR_VALUE): BOOLEAN is
			-- Are `Current' and `other' the same error?
		require
			other_not_void: other /= Void
		do
			Result := code = other.code and then type=other.type
				and then STRING_.same_string (error_message, other.error_message)
		end

invariant

	item_or_empty_sequence: item = Void xor empty_sequence = Void
	valid_error_code: is_valid_error_code (code)
	error_type: type = Static_error or type = Type_error or type = Dynamic_error

end
	
