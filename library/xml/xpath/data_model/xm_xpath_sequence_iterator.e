indexing

	description:

		"Objects that iterate over an XPath sequence (of values or nodes)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SEQUENCE_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	ANY -- required by SE 2.1b1
	
	XM_XPATH_DEBUGGING_ROUTINES

feature -- Access

	item: G is
			-- Value or node at the current position
		require
			not_in_error: not is_error
			not_off: not off
		deferred
		end

	index: INTEGER
			-- The position of the current item;
			-- This will be zero after creation of the iterator

feature -- Status report

	before: BOOLEAN is
			-- Has `start' been called yet on this sequence?
		require
			not_in_error: not is_error
		do
			Result := index = 0
		ensure
			before_first_position: Result = True implies index = 0
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		require
			not_in_error: not is_error
			not_before: not before
		deferred
		end

	off: BOOLEAN is
			-- Is there an `item' to be retrieved?
		require
			not_in_error: not is_error
		do
			Result := before or else after
		end

	is_error: BOOLEAN
			-- Is `Current' in error?

	error_value: XM_XPATH_ERROR_VALUE
			-- Last error

feature -- Status_setting

	set_last_error (an_error: XM_XPATH_ERROR_VALUE) is
			-- Set last error value.
		require
			error_value_not_void: an_error /= void
		do
			is_error := True
			error_value := an_error
		ensure
			in_error: is_error
			error_set: error_value = an_error
		end

feature -- Cursor movement

	start is
			-- Move to first position
		require
			not_in_error: not is_error
			before: before
		do
			forth
		ensure
			not_before: not is_error implies not before
		end
			
	forth is
			-- Move to next position
		require
			not_in_error: not is_error
			not_after: before or else not after
		deferred
		ensure
			one_more: index = old index + 1
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		require
			not_in_error: not is_error
		deferred
		end

invariant

	error_value_not_void_if_error: is_error implies error_value /= Void
	error_value_void_if_not_error: not is_error implies error_value = Void
	positive_index: index >= 0
	off_or_valid_item: not is_error and then not off implies item /= Void

end
	
