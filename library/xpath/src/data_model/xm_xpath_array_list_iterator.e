note

	description:

		"Objects that iterate over a DS_ARRAYED_LIST"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ARRAY_LIST_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			start, is_invulnerable, is_realizable_iterator, realize,
			last_position, reverse_iterator, as_array_iterator,
			is_reversible_iterator, is_array_iterator, is_last_position_finder
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make, make_slice

feature {NONE} -- Initialization

	make (a_list: DS_ARRAYED_LIST [G])
			-- Initialize using `a_list'.
		require
			list_not_void: a_list /= Void
			list_not_empty: not a_list.is_empty
			no_void_item: not a_list.has_void
		do
			list := a_list
			cursor := list.new_cursor
			first_item := 1
			last_item := a_list.count
		ensure
			list_set: list = a_list
		end

	make_slice (a_list: DS_ARRAYED_LIST [G]; a_start, a_end: INTEGER)
			-- Initialize using slice of `a_list' from `a_start' to `a_end'.
		require
			list_not_void: a_list /= Void
			list_not_empty: not a_list.is_empty
			no_void_item: not a_list.has_void
			first_item: a_start >= 1 and a_start <= a_list.count
			last_item: a_end >= a_start
		do
			list := a_list
			cursor := list.new_cursor
			first_item := a_start
			if a_end > a_list.count then
				last_item := a_list.count
			else
				last_item := a_end
			end
		ensure
			list_set: list = a_list
			first_item_set: first_item = a_start
			last_item_set: last_item = a_list.count.min (a_end)
		end

feature -- Access

	first_item: INTEGER
			-- First item in slice

	last_item: INTEGER
			-- Last item in slice

	item: G
			-- Value or node at the current position
		do
			Result := cursor.item
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			Result := last_item - first_item + 1
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G]
		do
			create {XM_XPATH_REVERSE_ARRAY_LIST_ITERATOR [G]} Result.make_slice (list, last_item, first_item)
		end

feature -- Status report

	is_array_iterator: BOOLEAN
			-- Is `Current' an iterator over an array?
		do
			Result := True
		end

	is_reversible_iterator: BOOLEAN
			-- Does `Current' yield a reversible_sequence?
		do
			Result := True
		end

	is_realizable_iterator: BOOLEAN
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := True
		end

	is_invulnerable: BOOLEAN
			-- Is `Current' guaranteed free of implicit errors?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there no more items in the sequence?
		do
			Result := cursor.after or (index > last_item - first_item + 1)
		end

feature -- Cursor movement

	start
			-- Move to first position
		do
			index := 1
			from
				cursor.start
			until
				cursor.index = first_item
			loop
				cursor.forth
			end
		end

	forth
			-- Move to next position
		do
			index := index + 1
			cursor.forth
		end

feature -- Evaluation

	realize
			-- Realize the sequence as a value.
		local
			l_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			l_index: INTEGER
		do
			-- temporary is to get round expanded/reference generics problem
			create l_list.make (last_item - first_item + 1)
			from
				l_index := first_item
			until
				l_index > last_item
			loop
				l_list.put_last (list.item (l_index))
				l_index := l_index + 1
			end
			create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (l_list)
		end

feature -- Conversion

	as_array_iterator: XM_XPATH_ARRAY_LIST_ITERATOR [G]
			-- `Current' seen as a array iterator
		do
			Result := Current
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make_slice (list, first_item, last_item)
		end

	new_slice_iterator (a_min, a_max: INTEGER): XM_XPATH_ARRAY_LIST_ITERATOR [G]
			-- new iterator over the same items, with a different start point and end point
		require
			valid_minimum: a_min >= first_item and then a_min <= last_item
			valid_maximum: a_max >= a_min and then a_min <= last_item
		do
			create Result.make_slice (list, a_min, a_max)
		ensure
			new_slice_iterator_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	list: DS_ARRAYED_LIST [G]
			-- Underlying array list

	cursor: DS_ARRAYED_LIST_CURSOR [G]
			-- Cursor for `list'

invariant

	list_not_void: list /= Void
	list_not_empty: not list.is_empty
	no_void_item: not list.has_void
	first_item: first_item >= 1
	last_item: last_item <= list.count
	last_not_less_than_first: last_item >= first_item

end

