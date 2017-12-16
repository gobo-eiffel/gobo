note

	description:

		"Objects that iterate over an XPath sequence (of values or nodes)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"
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

	item: G
			-- Value or node at the current position
		require
			not_in_error: not is_error
			not_off: not off
		deferred
		end

	index: INTEGER
			-- The position of the current item;
			-- This will be zero after creation of the iterator

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Last error

	last_realized_value: detachable XM_XPATH_VALUE
			-- Result from calling `realize'

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		require
			last_position_finder: is_last_position_finder
		do
		ensure
			positive_result: Result >= 0
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G]
			-- Iterator over same sequence as `Current', but in reverse order
		require
			reversible_iterator: is_reversible_iterator
		do
			check is_reversible_iterator: False then end
		ensure
			reverse_iterator_not_void: Result /= Void
		end

feature -- Status report

	before: BOOLEAN
			-- Has `start' been called yet on this sequence?
		require
			not_in_error: not is_error
		do
			Result := index = 0
		ensure
			before_first_position: Result = True implies index = 0
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		require
			not_in_error: not is_error
			not_before: not before
		deferred
		end

	off: BOOLEAN
			-- Is there an `item' to be retrieved?
		require
			not_in_error: not is_error
		do
			Result := before or else after
		end

	is_invulnerable: BOOLEAN
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

	is_singleton_iterator: BOOLEAN
			-- Is `Current' a singleton iterator?
		do
			Result := False
		end

	is_realizable_iterator: BOOLEAN
			-- Is `Current' a realizable iterator?
		do
			Result := False
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node sequence?
		do
			Result := False
		end

	is_array_iterator: BOOLEAN
			-- Is `Current' an iterator over an array?
		do
			Result := False
		end

	is_axis_iterator: BOOLEAN
			-- Is `Current' an axis iterator?
		do
			Result := False
		end

	is_empty_iterator: BOOLEAN
			-- Is `Current' an iterator over a guarenteed empty sequence?
		do
			Result := False
		end

	is_reversible_iterator: BOOLEAN
			-- Does `Current' yield a reversible_sequence?
		do
			Result := False
		end

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := False
		end

feature -- Status_setting

	set_last_error (an_error: XM_XPATH_ERROR_VALUE)
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

	start
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

	forth
			-- Move to next position
		require
			not_in_error: not is_error
			not_after: before or else not after
		deferred
		ensure
			one_more: index = old index + 1
			error_free: is_invulnerable implies not is_error
		end

feature -- Conversion

	as_singleton_iterator: XM_XPATH_SINGLETON_ITERATOR [G]
			-- `Current' seen as a singleton iterator
		require
			singleton_iterator: is_singleton_iterator
		do
			check is_singleton_iterator: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		require
			node_iterator: is_node_iterator
		do
			check is_node_iterator: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_array_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [G]
			-- `Current' seen as an array iterator
		require
			array_iterator: is_array_iterator
		do
			check is_array_iterator: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_axis_iterator: XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as an axis iterator
		require
			axis_iterator: is_axis_iterator
		do
			check is_axis_iterator: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_empty_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as an empty iterator
		require
			empty_iterator: is_empty_iterator
		do
			check is_empty_iterator: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		require
			not_in_error: not is_error
		deferred
		ensure
			another_not_void: Result /= Void
			another_not_in_error: not Result.is_error
			another_before: Result.before
			invulnerable: is_invulnerable implies Result.is_invulnerable
		end

feature -- Evaluation

	realize
			-- Realize the sequence as a value.
		require
			realizable_iterator: is_realizable_iterator
		do
		ensure
			realized_value_not_void: attached last_realized_value as l_last_realized_value
			not_a_closure: not l_last_realized_value.is_closure
		end

invariant

	error_value_not_void_if_error: is_error implies error_value /= Void
	error_value_void_if_not_error: not is_error implies error_value = Void
	positive_index: index >= 0
	off_or_valid_item: not is_error and then not off implies item /= Void

end

