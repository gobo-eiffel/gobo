indexing

	description:

		"Lists implemented with arrays"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_LIST [G]

inherit

	DS_LIST [G]
		redefine
			searcher
		end

	DS_RESIZABLE [G]

creation

	make, make_equal, make_from_linear

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			ref_searcher: DS_ARRAYED_LIST_REFERENCE_SEARCHER [G]
		do
			!! storage.make (1, n)
			!! ref_searcher
			searcher := ref_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_equal (n: INTEGER) is
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		local
			value_searcher: DS_ARRAYED_LIST_VALUE_SEARCHER [G]
		do
			!! storage.make (1, n)
			!! value_searcher
			searcher := value_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_from_linear (other: DS_LINEAR [G]) is
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			i, nb: INTEGER
		do
			nb := other.count
			make (nb)
			count := nb
			from
				i := 1
				other_cursor := other.new_cursor
				other_cursor.start
			until
				i > nb
			loop
				storage.put (other_cursor.item, i)
				other_cursor.forth
				i := i + 1
			end
		ensure
			count_set: count = other.count
			capacity_set: capacity = count
		end

feature -- Access

	infix "@", item (i: INTEGER): G is
			-- Item at index `i'
		do
			Result := storage.item (i)
		end

	first: G is
			-- First item in list
		do
			Result := storage.item (1)
		end

	last: G is
			-- Last item in list
		do
			Result := storage.item (count)
		end

	new_cursor: DS_ARRAYED_LIST_CURSOR [G] is
			-- New cursor for traversal
		do
			!! Result.make (Current)
		end

	searcher: DS_ARRAYED_LIST_SEARCHER [G]
			-- List searcher

feature -- Measurement

	count: INTEGER
			-- Number of items in list

	capacity: INTEGER is
			-- Maximum number of items in list
		do
			Result := storage.count
		end

feature -- Status report

	extendible (nb: INTEGER): BOOLEAN is
			-- May list be extended with `nb' items?
		do
			Result := capacity >= count + nb
		ensure then
			enough_space: Result implies capacity >= count + nb
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current list.
		do
			standard_copy (other)
			storage := clone (storage)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is list equal to `other'?
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if same_type (other) and other.count = count then
				other_storage := other.storage
				from
					i := 1
					nb := count
					Result := True
				until
					not Result or i > nb
				loop
					Result := storage.item (i) = other_storage.item (i)
					i := i + 1
				end
			end
		end

feature -- Element change

	replace (v: G; i: INTEGER) is
			-- Replace item at index `i' by `v'.
		do
			storage.put (v, i)
		end

	put_first (v: G) is
			-- Add `v' to beginning of list.
		do
			move_right (1, 1)
			storage.put (v, 1)
		end

	put_last (v: G) is
			-- Add `v' to end of list.
		do
			count := count + 1
			storage.put (v, count)
		end

	put (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		do
			move_right (i, 1)
			storage.put (v, i)
		end

	put_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
		local
			i: INTEGER
		do
			i := a_cursor.index
			move_right (i, 1)
			storage.put (v, i)
			a_cursor.forth
		end

	put_right (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
		local
			i: INTEGER
		do
			i := a_cursor.index + 1
			move_right (i, 1)
			storage.put (v, i)
		end

	force_first (v: G) is
			-- Add `v' to beginning of list.
			-- Resize structure if needed.
		do
			if not extendible (1) then
				resize (capacity + 1)
			end
			move_right (1, 1)
			storage.put (v, 1)
		end

	force_last (v: G) is
			-- Add `v' to end of list.
			-- Resize structure if needed.
		do
			if not extendible (1) then
				resize (capacity + 1)
			end
			count := count + 1
			storage.put (v, count)
		end

	force (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
			-- Resize structure if needed.
		do
			if not extendible (1) then
				resize (capacity + 1)
			end
			move_right (i, 1)
			storage.put (v, i)
		end

	force_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Resize structure if needed.
		local
			i: INTEGER
		do
			if not extendible (1) then
				resize (capacity + 1)
			end
			i := a_cursor.index
			move_right (i, 1)
			storage.put (v, i)
			a_cursor.forth
		end

	force_right (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Resize structure if needed.
		local
			i: INTEGER
		do
			if not extendible (1) then
				resize (capacity + 1)
			end
			i := a_cursor.index + 1
			move_right (i, 1)
			storage.put (v, i)
		end

	extend_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of list.
		do
			extend (other, 1)
		end

	extend_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of list.
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			i := count + 1
			count := count + other.count
			other_cursor := other.new_cursor
			from other_cursor.start until other_cursor.after loop
				storage.put (other_cursor.item, i)
				i := i + 1
				other_cursor.forth
			end
		end

	extend (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
		local
			k: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			move_right (i, other.count)
			k := i
			other_cursor := other.new_cursor
			from other_cursor.start until other_cursor.after loop
				storage.put (other_cursor.item, k)
				k := k + 1
				other_cursor.forth
			end
		end

	extend_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to left of `a_cursor' position.
		local
			i: INTEGER
		do
			i := a_cursor.index
			extend (other, i)
			a_cursor.go_to (i + other.count)
		end

	extend_right (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to right of `a_cursor' position.
		do
			extend (other, a_cursor.index + 1)
		end

	append_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of list.
			-- Resize structure if needed.
		do
			append (other, 1)
		end

	append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of list.
			-- Resize structure if needed.
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (capacity + nb)
			end
			extend_last (other)
		end

	append (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
			-- Resize structure if needed.
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (capacity + nb)
			end
			extend (other, i)
		end

	append_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to left of `a_cursor' position.
			-- Resize structure if needed.
		local
			i: INTEGER
		do
			i := a_cursor.index
			append (other, i)
			a_cursor.go_to (i + other.count)
		end

	append_right (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to right of `a_cursor' position.
			-- Resize structure if needed.
		do
			append (other, a_cursor.index + 1)
		end

feature -- removal

	remove_first is
			-- Remove item at beginning of list.
		do
			move_left (2, 1)
		end

	remove_last is
			-- Remove item at end of list.
		do
			count := count - 1
		end

	remove (i: INTEGER) is
			-- Remove item at `i'-th position.
		do
			move_left (i + 1, 1)
		end

	remove_at (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move `a_cursor' to next position.
		do
			move_left (a_cursor.index + 1, 1)
		end

	remove_left (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
		do
			move_left (a_cursor.index, 1)
		end

	remove_right (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
		do
			move_left (a_cursor.index + 2, 1)
		end

	prune_first (n: INTEGER) is
			-- Remove `n' first items from list.
		do
			move_left (n + 1, n)
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
		do
			count := count - n
		end

	prune (n: INTEGER; i: INTEGER) is
			-- Remove `n' items at and after `i'-th position.
		do
			move_left (i + n, n)
		end

	prune_left (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
		do
			move_left (a_cursor.index + n - 1, n)
		end

	prune_right (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
		do
			move_left (a_cursor.index + n + 1, n)
		end

	keep_first (n: INTEGER) is
			-- Keep `n' first items in list.
		do
			count := n
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in list.
		do
			move_left (count - n + 1, count - n)
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `searcher''s comparison criterion.)
		local
			a_cursor: like new_cursor
			a_searcher: like searcher
		do
			from
				a_searcher := searcher
				a_cursor := new_cursor
				a_cursor.finish
				a_searcher.search_back (a_cursor, v)
			until
				a_cursor.before
			loop
				remove (a_cursor.index)
				a_cursor.back
				a_searcher.search_back (a_cursor, v)
			end
		end

	wipe_out is
			-- Remove all items from list.
		do
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize structure so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage.resize (1, n)
		end

feature {DS_ARRAYED_LIST} -- Implementation

	storage: ARRAY [G]
			-- Storage for items of the list

feature {NONE} -- Implementation

	move_right (index, offset: INTEGER) is
			-- Move items at and after `index' position
			-- by `offset' positions to the right.
		require
			valid_index: valid_index (index)
			positive_offset: offset >= 0
			extendible: extendible (offset)
		local
			i: INTEGER
		do
			from
				i := count
				count := count + offset
			until
				i < index
			loop
				storage.put (storage.item (i), i + offset)
				i := i - 1
			end
		ensure
			count_set: count = old count + offset
		end

	move_left (index, offset: INTEGER) is
			-- Move items at and after `index' position
			-- by `offset' positions to the left.
		require
			valid_index: valid_index (index)
			positive_offset: offset >= 0
			constraint: offset < index
		local
			i, nb: INTEGER
		do
			from
				i := index
				nb := count
			until
				i > nb
			loop
				storage.put (storage.item (i), i - offset)
				i := i + 1
			end
			count := count - offset
		ensure
			count_set: count = old count - offset
		end

invariant

	storage_not_void: storage /= Void
	storage_lower: storage.lower = 1

end -- class DS_ARRAYED_LIST
