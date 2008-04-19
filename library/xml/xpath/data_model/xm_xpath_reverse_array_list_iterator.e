indexing

	description:

		"Objects that iterate over a DS_ARRAYED_LIST in reverse order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REVERSE_ARRAY_LIST_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			start, is_invulnerable, is_realizable_iterator, realize,
			last_position, reverse_iterator,
			is_reversible_iterator, is_last_position_finder
		end

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make, make_slice

feature {NONE} -- Initialization

	make (a_list: DS_ARRAYED_LIST [G]) is
		require
			list_not_void: a_list /= Void
			list_not_empty: not a_list.is_empty
			no_void_item: not a_list.has_void
		do
			list := a_list
			cursor := list.new_cursor
			first_item := a_list.count
			last_item := 1
		ensure
			list_set: list = a_list
		end

	make_slice (a_list: DS_ARRAYED_LIST [G]; a_start, a_end: INTEGER) is
		require
			list_not_void: a_list /= Void
			list_not_empty: not a_list.is_empty			
			no_void_item: not a_list.has_void
			first_item: a_start >= 1
			last_item: a_end <= a_start
		do
			list := a_list
			cursor := list.new_cursor
			if a_start > a_list.count then
				first_item := a_list.count
			else
				first_item := a_start
			end
			last_item := a_end
		ensure
			list_set: list = a_list
			first_item_set: first_item = a_start.min (a_list.count)
			last_item_set: last_item = a_end
		end

feature -- Access

	first_item: INTEGER
			-- First item in slice

	last_item: INTEGER
			-- Last item in slice

	item: G is
			-- Value or node at the current position
		do
			Result := cursor.item
		end

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			Result := first_item - last_item + 1
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		do
			create {XM_XPATH_ARRAY_LIST_ITERATOR [G]} Result.make_slice (list, last_item, first_item)
		end

feature -- Status report

	is_reversible_iterator: BOOLEAN is
			-- Does `Current' yield a reversible_sequence?
		do
			Result := True
		end

	is_realizable_iterator: BOOLEAN is
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end

	is_last_position_finder: BOOLEAN is
			-- Can `Current' find the last position?
		do
			Result := True
		end

	is_invulnerable: BOOLEAN is
			-- Is `Current' guaranteed free of implicit errors?
		do
			Result := True
		end

	after: BOOLEAN is
			-- Are there no more items in the sequence?
		do
			Result := cursor.before or (index > first_item - last_item + 1)
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			index := 1
			cursor.finish
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			cursor.back
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		local
			l_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			l_index: INTEGER
		do
			-- temporary is to get round expanded/reference generics problem
			create l_list.make (first_item - last_item + 1)
			from
				l_index := first_item
			until
				l_index < last_item
			loop
				l_list.put_last (list.item (l_index))
				l_index := l_index - 1
			end			
			create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (l_list)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make_slice (list, first_item, last_item)
		end
	
feature {NONE} -- Implementation

	list: DS_ARRAYED_LIST [G]
			-- The list

	cursor: DS_ARRAYED_LIST_CURSOR [G]
			-- Cursor for `list'

invariant

	list_not_void: list /= Void
	list_not_empty: not list.is_empty
	no_void_item: not list.has_void
	first_item: first_item >= 1
	last_item: last_item <= list.count
	last_not_greater_than_first: last_item <= first_item

end
	
