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

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

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

	is_singleton_iterator: BOOLEAN is
			-- Is `Current' a singleton iterator?
		do
			Result := False
		end

	as_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [G] is
			-- `Current' seen as a singleton iterator
		require
			singleton_iterator: is_singleton_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_realizable_iterator: BOOLEAN is
			-- Is `Current' a realizable iterator?
		do
			Result := False
		end

	as_realizable_iterator: XM_XPATH_REALIZABLE_ITERATOR [G] is
			-- `Current' seen as a realizable iterator
		require
			realizable_iterator: is_realizable_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node sequence?
		do
			Result := False
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		require
			node_iterator: is_node_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_array_iterator: BOOLEAN is
			-- Is `Current' an iterator over an array?
		do
			Result := False
		end

	as_array_iterator: XM_XPATH_ARRAY_ITERATOR [G] is
			-- `Current' seen as an array iterator
		require
			array_iterator: is_array_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_axis_iterator: BOOLEAN is
			-- Is `Current' an axis iterator?
		do
			Result := False
		end

	as_axis_iterator: XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as an axis iterator
		require
			axis_iterator: is_axis_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_empty_iterator: BOOLEAN is
			-- Is `Current' an iterator over a guarenteed empty sequence?
		do
			Result := False
		end

	as_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as an empty iterator
		require
			empty_iterator: is_empty_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_reversible_iterator: BOOLEAN is
			-- Does `Current' yield a reversible_sequence?
		do
			Result := False
		end

	as_reversible_iterator: XM_XPATH_REVERSIBLE_ITERATOR [G] is
			-- `Current' seen as a reversible iterator
		require
			reversible_iterator: is_reversible_iterator
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_last_position_finder: BOOLEAN is
			-- Can `Current' find the last position?
		do
			Result := False
		end

	as_last_position_finder: XM_XPATH_LAST_POSITION_FINDER [G] is
			-- `Current' seen as a node iterator
		require
			last_position_finder: is_last_position_finder
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

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

	is_invulnerable: BOOLEAN is
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := False

			-- If `True', then `is_error' can only be as a result of
			--  calling `set_last_error'.
			-- This is exploited by callers of `{XM_XPATH_NODE}.new_axis_iterator',
			--  which can then avoid error-checking code.
			-- In addition, routines such as `{XM_XPATH_NODE}.previous_sibling'
			--  are able to maintain purity.

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
			error_free: is_invulnerable implies not is_error
		end
			
	forth is
			-- Move to next position
		require
			not_in_error: not is_error
			not_after: before or else not after
		deferred
		ensure
			one_more: index = old index + 1
			error_free: is_invulnerable implies not is_error
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		require
			not_in_error: not is_error
		deferred
		ensure
			result_not_in_error: Result /= Void and then not Result.is_error
			invulnerable: is_invulnerable implies Result.is_invulnerable
		end

invariant

	error_value_not_void_if_error: is_error implies error_value /= Void
	error_value_void_if_not_error: not is_error implies error_value = Void
	positive_index: index >= 0
	off_or_valid_item: not is_error and then not off implies item /= Void

end
	
