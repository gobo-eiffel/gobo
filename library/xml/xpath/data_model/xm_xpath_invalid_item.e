indexing

	description:

		"XPath items in error"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INVALID_ITEM

inherit

	XM_XPATH_ITEM

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
			namespace_uri_not_void: a_namespace_uri /= Void
			code_not_void: an_error_code /= Void
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
		do
			create error_value.make_from_string (a_string, a_namespace_uri, an_error_code, an_error_type)
			is_error := True
		ensure
			description_set: error_value /= Void and then error_value.description /= Void and then STRING_.same_string (error_value.description, a_string)
			code_set: error_value.code = an_error_code
			type_set: error_value.type = an_error_type
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			-- pre-condition cannot be met
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			-- pre-condition cannot be met
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE] is
			-- Typed value
		do
			-- pre-condition cannot be met
		end

	type_name: STRING is
			-- Type name for diagnostic purposes
		do
			Result := "Item in error"
		end

	as_item_value: XM_XPATH_VALUE is
			-- `Current' seen as a value
		do
			check
				not_called: False
				-- precondition is never met
			end
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has item failed evaluation?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value

feature -- Status setting

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `error_value'.
		do
			is_error := True
			error_value := an_error_value
		end

	set_last_error_from_string (a_message, a_namespace_uri, a_code: STRING; an_error_type: INTEGER) is
			-- Set `error_value'.
		do
			is_error := True
			create error_value.make_from_string (a_message, a_namespace_uri, a_code, an_error_type)
		end

invariant

	item_in_error: is_error

end

