indexing

	description:

		"Sparse sets implemented with multi-arrays. Ancestor of %
		%hash sets which should supply its hashing mechanism."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_MULTIARRAYED_SPARSE_SET [G]

inherit

	DS_SPARSE_SET [G]
		redefine
			new_cursor
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]
		rename
			FIXED_ARRAY_TYPE as FIXED_ITEM_ARRAY_TYPE
		undefine
			is_equal, copy
		end

	KL_IMPORTED_FIXED_ARRAY_ROUTINES
		undefine
			is_equal, copy
		end

feature -- Access

	new_cursor: DS_MULTIARRAYED_SPARSE_SET_CURSOR [G] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

feature {DS_MULTIARRAYED_SPARSE_SET_CURSOR} -- Implementation

	items_item (i: INTEGER): G is
			-- Item at position `i' in `items'
		local
			subitems: like FIXED_ITEM_ARRAY_TYPE
		do
			subitems := items.item (i // chunk_size)
			if subitems /= Void then
				Result := subitems.item (i \\ chunk_size)
			end
		end

	clashes_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `clashes'
		local
			subclashes: like FIXED_INTEGER_ARRAY_TYPE
		do
			subclashes := clashes.item (i // chunk_size)
			if subclashes /= Void then
				Result := subclashes.item (i \\ chunk_size)
			end
		end

feature {NONE} -- Implementation

	items: ARRAY [like FIXED_ITEM_ARRAY_TYPE]
			-- Storage for items of the set indexed from 0 to `capacity-1'

	make_items (n: INTEGER) is
			-- Create `items'.
		do
			!! FIXED_ITEM_ARRAY_
			if n = 0 then
				!! items.make (0, -1)
			else
				!! items.make (0, ((n - 1) // chunk_size))
			end
		end

	items_put (v: G; i: INTEGER) is
			-- Put `v' at position `i' in `items'.
		local
			subitems: like FIXED_ITEM_ARRAY_TYPE
			j: INTEGER
		do
			j := i // chunk_size
			subitems := items.item (j)
			if subitems = Void then
				subitems := FIXED_ITEM_ARRAY_.make (chunk_size)
				items.put (subitems, j)
			end
			subitems.put (v, i \\ chunk_size)
		end

	clone_items is
			-- Clone `items'.
		local
			i, nb: INTEGER
		do
			items := clone (items)
			nb := items.upper
			from i := 0 until i > nb loop
				items.put (clone (items.item (i)), i)
				i := i + 1
			end
		end

	items_resize (n: INTEGER) is
			-- Resize `items'.
		do
			items.resize (0, ((n - 1) // chunk_size))
		end

	clashes: ARRAY [like FIXED_INTEGER_ARRAY_TYPE]
			-- Indexes in `items' when there is clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of
			-- free slot positions with indexes less that or equal
			-- to `Free_watermark'

	make_clashes (n: INTEGER) is
			-- Create `clashes'.
		do
			if n = 0 then
				!! clashes.make (0, -1)
			else
				!! clashes.make (0, ((n - 1) // chunk_size))
			end
		end

	clashes_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `clashes'.
		local
			subclashes: like FIXED_INTEGER_ARRAY_TYPE
			j: INTEGER
		do
			j := i // chunk_size
			subclashes := clashes.item (j)
			if subclashes = Void then
				subclashes := FIXED_INTEGER_ARRAY_.make (chunk_size)
				clashes.put (subclashes, j)
			end
			subclashes.put (v, i \\ chunk_size)
		end

	clone_clashes is
			-- Clone `clashes'.
		local
			i, nb: INTEGER
		do
			clashes := clone (clashes)
			nb := clashes.upper
			from i := 0 until i > nb loop
				clashes.put (clone (clashes.item (i)), i)
				i := i + 1
			end
		end

	clashes_resize (n: INTEGER) is
			-- Resize `clashes'.
		do
			clashes.resize (0, ((n - 1) // chunk_size))
		end

	slots: ARRAY [like FIXED_INTEGER_ARRAY_TYPE]
			-- Indexes in `items', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER) is
			-- Create `slots'.
		do
			if n = 0 then
				!! slots.make (0, -1)
			else
				!! slots.make (0, ((n - 1) // chunk_size))
			end
		end

	slots_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `slots'
		local
			subslots: like FIXED_INTEGER_ARRAY_TYPE
		do
			subslots := slots.item (i // chunk_size)
			if subslots /= Void then
				Result := subslots.item (i \\ chunk_size)
			end
		end

	slots_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `slots'.
		local
			subslots: like FIXED_INTEGER_ARRAY_TYPE
			j: INTEGER
		do
			j := i // chunk_size
			subslots := slots.item (j)
			if subslots = Void then
				subslots := FIXED_INTEGER_ARRAY_.make (chunk_size)
				slots.put (subslots, j)
			end
			subslots.put (v, i \\ chunk_size)
		end

	clone_slots is
			-- Clone `slots'.
		local
			i, nb: INTEGER
		do
			slots := clone (slots)
			nb := slots.upper
			from i := 0 until i > nb loop
				slots.put (clone (slots.item (i)), i)
				i := i + 1
			end
		end

	slots_resize (n: INTEGER) is
			-- Resize `slots'.
		do
			slots.resize (0, ((n - 1) // chunk_size))
		end

	FIXED_ITEM_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

feature {NONE} -- Constants

	chunk_size: INTEGER is 30000
			-- Size of array chunks

invariant

	items_not_void: items /= Void
	items_count1: capacity = 0 implies items.count = 0
	items_count2: capacity > 0 implies (items.count = ((capacity - 1) // chunk_size) + 1)
	clashes_not_void: clashes /= Void
	clashes_count1: capacity = 0 implies clashes.count = 0
	clashes_count2: capacity > 0 implies (clashes.count = ((capacity - 1) // chunk_size) + 1)
	slots_not_void: slots /= Void
	slots_count: slots.count = (modulus // chunk_size) + 1

end -- class DS_MULTIARRAYED_SPARSE_SET
