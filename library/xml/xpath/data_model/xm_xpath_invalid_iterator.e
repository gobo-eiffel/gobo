indexing

	description:

		"Invalid iterators"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class XM_XPATH_INVALID_ITERATOR
	
inherit

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES

create

	make, make_from_string

feature {NONE} -- Initialization

	make (an_error: XM_XPATH_ERROR_VALUE) is
			-- Establish invariant.
		require
			error_not_void: an_error /= Void
		do
			set_last_error (an_error)
		ensure
			error_set: error_value = an_error
		end

	make_from_string (a_string, a_namespace_uri, an_error_code: STRING; an_error_type: INTEGER) is
			-- Create from `a_string'.
		require
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
			namespace_uri_not_void: a_namespace_uri /= Void
			error_code_not_void: an_error_code /= Void
		do
			create error_value.make_from_string (a_string, a_namespace_uri, an_error_code, an_error_type)
			is_error := True
		ensure
			description_set: STRING_.same_string (error_value.description, a_string)
			code_set: error_value.code = an_error_code
			type_set: error_value.type = an_error_type
		end

feature -- Access

	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			-- (pre-condition can't be met)
		end

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			-- (pre-condition can't be met)
		end

feature -- Cursor movement

		forth is
			-- Move to next position
		do
			-- (pre-condition can't be met)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			-- (pre-condition can't be met)
		end

invariant

	in_error: is_error

end
	
