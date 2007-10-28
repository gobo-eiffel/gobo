indexing

	description:

		"Objects that iterate over a slice of an array of items"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARRAY_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			before, is_reversible_iterator, reverse_iterator,
			is_array_iterator, as_array_iterator, is_last_position_finder,
			is_invulnerable, last_position, is_realizable_iterator, realize
		end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

create

	make

		-- N.B. All items in the array should be non-void
		-- This is not specifically checked, but forth will fail it's post-condition
		-- if any item in the range is `Void'

feature {NONE} -- Initialization

	make (a_array: ARRAY [G]; a_start, an_end: INTEGER) is
		require
			array_not_void: a_array /= Void
			no_void_element: not a_array.has (Void)
			first_item: a_start >= 1 and then a_start <= a_array.count
			last_item: an_end >= a_start and then an_end <= a_array.count
		do
			items := a_array
			first_item := a_start
			last_item := an_end
		ensure
			array_set: items = a_array
			first_item_set: first_item = a_start
			last_item_set: last_item = an_end
		end
	
feature -- Access

	first_item: INTEGER
			-- First item in slice

	last_item: INTEGER
			-- Last item in slice

	item: G is
			-- Value or node at the current position
		do
			Result := items.item (index)
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		do
			-- TODO
			todo ("reverse-iterator", False)
		end

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			Result := last_item
		end

feature -- Status report

	is_array_iterator: BOOLEAN is
			-- Is `Current' an iterator over an array?
		do
			Result := True
		end

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
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	before: BOOLEAN is
		do
			Result := index < first_item
		end

	after: BOOLEAN is
			-- Are there no more items in the sequence?
		do
			Result := index > last_item
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			if index = 0 then
				index := first_item
			else
				index := index + 1
			end
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			an_index: INTEGER
		do
			-- temporary is to get round expanded/reference generics problem
			create a_list.make (items.count)
			from
				an_index := 1
			until
				an_index > items.count
			loop
				a_list.put_last (items.item (an_index))
				an_index := an_index + 1
			end
			create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (a_list)
		end

feature -- Conversion

	as_array_iterator: XM_XPATH_ARRAY_ITERATOR [G] is
			-- `Current' seen as a array iterator
		do
			Result := Current
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (items, first_item, last_item)
		end

	new_slice_iterator (a_min, a_max: INTEGER): XM_XPATH_ARRAY_ITERATOR [G] is
			-- A new ArrayIterator over the same items, with a different start point and end point
		require
			valid_minimum: a_min >= first_item and then a_min <= last_item
			valid_maximum: a_max >= a_min and then a_min <= last_item
		do
			create Result.make (items, a_min, a_max)
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	items: ARRAY [G]
			-- Underlying array

invariant

	items_not_void: items /= Void
	no_void_item: not items.has (Void)
	first_item: first_item >= 1 and then first_item <= items.count
	last_item: last_item >= first_item and then last_item <= items.count
	
end
	
