indexing

	description:

		"XPath item - a member of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ITEM

inherit

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		require
			item_not_in_error: not is_error
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	typed_value: XM_XPATH_VALUE is
			-- Typed value
		require
			item_not_in_error: not is_error
		deferred
		ensure
			typed_value_not_void: Result /= Void
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		deferred
		ensure
			item_type_not_void: Result /= Void
		end
		
feature -- Status report

	is_error: BOOLEAN is
			-- Has item failed evaluation?
		deferred
		end
	
	error_value: XM_XPATH_ERROR_VALUE is
			-- Error value
		deferred
		end

feature -- Status setting

	set_last_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			error_value_not_void: an_error_value /= Void and then an_error_value.type /= Static_error
		deferred
		ensure
			item_in_error: is_error
			value_set: error_value = an_error_value
		end

	set_last_error_from_string (a_message: STRING; a_code, an_error_type: INTEGER) is
			-- Set `error_value'.
		require
			item_not_in_error: not is_error
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			valid_code: is_valid_error_code (a_code)
		deferred
		ensure
			item_in_error: is_error
			valid_error: error_value /= Void and then STRING_.same_string (error_value.error_message, a_message)
				and then error_value.code = a_code
		end

feature -- Conversion
	
	as_value: XM_XPATH_VALUE is
			-- Convert to a value
		require
			item_not_in_error: not is_error
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_node: XM_XPATH_NODE
		do

			-- This default version is re-defined by NODE and ATOMIC_VALUE

			create {XM_XPATH_EMPTY_SEQUENCE} Result.make
		ensure
			value_not_void: Result /= Void
		end

invariant

	no_error_value_without_error: not is_error implies error_value = Void
	item_in_error: is_error implies error_value /= Void

end
	
