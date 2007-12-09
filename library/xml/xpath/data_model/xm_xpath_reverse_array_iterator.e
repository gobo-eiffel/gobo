indexing

	description:

		"Objects that iterate over a ARRAY in reverse order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REVERSE_ARRAY_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			before, is_reversible_iterator, reverse_iterator,
			is_last_position_finder,
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

	make (a_array: ARRAY [G]; a_start, a_end: INTEGER) is
		require
			array_not_void: a_array /= Void
			no_void_element: True -- not a_array.has (Void)
			last_item: a_end >= 1 and a_end <= a_array.count
			first_item: a_start >= a_end and a_start <= a_array.count
		do
			items := a_array
			first_item := a_start
			last_item := a_end
		ensure
			array_set: items = a_array
			first_item_set: first_item = a_start
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
			Result := items.item (first_item + 1 - index )
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		do
			create {XM_XPATH_ARRAY_ITERATOR [G]} Result.make (items, last_item, first_item)
		end

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			Result := first_item - 1
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
			-- Is `Current' guarenteed free of implicit errors?
		do
			Result := True
		end

	before: BOOLEAN is
		do
			Result := index < 1
		end

	after: BOOLEAN is
			-- Are there no more items in the sequence?
		do
			Result := index > (first_item - last_item + 1)
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
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
				a_list.put_last (items.item (first_item + 1 - index ))
				an_index := an_index + 1
			end
			create {XM_XPATH_SEQUENCE_EXTENT} last_realized_value.make_from_list (a_list)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (items, first_item, last_item)
		end


feature {NONE} -- Implementation

	items: ARRAY [G]
			-- Underlying array

invariant

	items_not_void: items /= Void
	no_void_item: True -- not items.has (Void)
	last_item: last_item >= 1 and last_item <= items.count
	first_item: first_item >= last_item and first_item <= items.count
	
end
	
