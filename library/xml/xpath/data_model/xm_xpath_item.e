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

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		require
			item_not_in_error: not is_item_in_error
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	item_type: INTEGER is
			-- Type;
			-- This will be a value such as Element_node or Integer_type
		require
			item_not_in_error: not is_item_in_error
		deferred
		ensure
			Result > 0 implies is_valid_type (Result)
		end
	
	typed_value: XM_XPATH_VALUE is
			-- Typed value
		require
			item_not_in_error: not is_item_in_error
		deferred
		ensure
			typed_value_not_void: Result /= Void
		end

feature -- Status report

	is_item_in_error: BOOLEAN
			-- Has item failed evaluation?

	evaluation_error_value: XM_XPATH_ERROR_VALUE
			-- Error value

feature -- Status setting

	set_evaluation_error (an_error_value: XM_XPATH_ERROR_VALUE) is
			-- Set `evaluation_error_value'.
		require
			item_not_in_error: not is_item_in_error
			error_value_not_void: an_error_value /= Void and then an_error_value.type /= Static_error
		do
			is_item_in_error := True
			evaluation_error_value := an_error_value
		ensure
			item_in_error: is_item_in_error
			value_set: evaluation_error_value = an_error_value
		end

	set_evaluation_error_from_string (a_message: STRING; a_code, an_error_type: INTEGER) is
			-- Set `evaluation_error_value'.
		require
			item_not_in_error: not is_item_in_error
			valid_error_type: an_error_type = Static_error or an_error_type = Type_error or an_error_type = Dynamic_error
			message_not_void: a_message /= Void and then a_message.count > 0
			valid_code: is_valid_error_code (a_code)
		do
			is_item_in_error := True
			create evaluation_error_value.make_from_string (a_message, a_code, an_error_type)
		ensure
			item_in_error: is_item_in_error
			valid_error: evaluation_error_value /= Void and then STRING_.same_string (evaluation_error_value.error_message, a_message)
				and then evaluation_error_value.code = a_code
		end

feature -- Conversion
	
	as_value: XM_XPATH_VALUE is
			-- Convert to a value
		require
			item_not_in_error: not is_item_in_error
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_node: XM_XPATH_NODE
		do
			an_atomic_value ?= Current
			if an_atomic_value /= Void then
				Result := an_atomic_value
			else
				a_node ?= Current
				if a_node /= Void then
					create {XM_XPATH_SINGLETON_NODE} Result.make (a_node)
				end
			end
		end

invariant

	no_error_value_without_error: not is_item_in_error implies evaluation_error_value = Void
	item_in_error: is_item_in_error implies evaluation_error_value /= Void
	no_static_errors: evaluation_error_value /= Void implies evaluation_error_value.type /= Static_error

end
	
