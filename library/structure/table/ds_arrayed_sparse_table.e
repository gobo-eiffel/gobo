indexing

	description:

		"Sparse tables implemented with single arrays. Ancestor of %
		%hash tables which should supply its hashing mechanism."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_ARRAYED_SPARSE_TABLE [G, K]

inherit

	DS_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]
		rename
			FIXED_ARRAY_TYPE as FIXED_ITEM_ARRAY_TYPE
		undefine
			is_equal, copy
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE2 [K]
		rename
			FIXED_ARRAY_TYPE as FIXED_KEY_ARRAY_TYPE
		undefine
			is_equal, copy
		end

	KL_IMPORTED_FIXED_ARRAY_ROUTINES
		undefine
			is_equal, copy
		end

feature -- Access

	new_cursor: DS_ARRAYED_SPARSE_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {DS_ARRAYED_SPARSE_TABLE_CURSOR} -- Implementation

	items_item (i: INTEGER): G is
			-- Item at position `i' in `items'
		do
			Result := items.item (i)
		end

	items_put (v: G; i: INTEGER) is
			-- Put `v' at position `i' in `items'.
		do
			items.put (v, i)
		end

	keys_item (i: INTEGER): K is
			-- Item at position `i' in `keys'
		do
			Result := keys.item (i)
		end

	clashes_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `clashes'
		do
			Result := clashes.item (i)
		end

feature {NONE} -- Implementation

	items: like FIXED_ITEM_ARRAY_TYPE
			-- Storage for items of the table indexed from 1 to `capacity'

	make_items (n: INTEGER) is
			-- Create `items'.
		do
			create FIXED_ITEM_ARRAY_
			items := FIXED_ITEM_ARRAY_.make (n)
		end

	clone_items is
			-- Clone `items'.
		do
			items := clone (items)
		end

	items_resize (n: INTEGER) is
			-- Resize `items'.
		do
			items := FIXED_ITEM_ARRAY_.resize (items, n)
		end

	items_wipe_out is
			-- Wipe out items in `items'.
		local
			i: INTEGER
			dead_item: G
		do
			from i := last_position until i < 1 loop
				items.put (dead_item, i)
				i := i - 1
			end
		end

	keys: like FIXED_KEY_ARRAY_TYPE
			-- Storage for keys of the table indexed from 1 to `capacity'

	make_keys (n: INTEGER) is
			-- Create `keys'.
		do
			create FIXED_KEY_ARRAY_
			keys := FIXED_KEY_ARRAY_.make (n)
		end

	keys_put (k: K; i: INTEGER) is
			-- Put `k' at position `i' in `keys'.
		do
			keys.put (k, i)
		end

	clone_keys is
			-- Clone `keys'.
		do
			keys := clone (keys)
		end

	keys_resize (n: INTEGER) is
			-- Resize `keys'.
		do
			keys := FIXED_KEY_ARRAY_.resize (keys, n)
		end

	keys_wipe_out is
			-- Wipe out items in `keys'.
		local
			i: INTEGER
			dead_key: K
		do
			from i := last_position until i < 1 loop
				keys.put (dead_key, i)
				i := i - 1
			end
		end

	clashes: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items' and `keys' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER) is
			-- Create `clashes'.
		do
			clashes := FIXED_INTEGER_ARRAY_.make (n)
		end

	clashes_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `clashes'.
		do
			clashes.put (v, i)
		end

	clone_clashes is
			-- Clone `clashes'.
		do
			clashes := clone (clashes)
		end

	clashes_resize (n: INTEGER) is
			-- Resize `clashes'.
		do
			clashes := FIXED_INTEGER_ARRAY_.resize (clashes, n)
		end

	clashes_wipe_out is
			-- Wipe out items in `clashes'.
		local
			i: INTEGER
		do
			from i := last_position until i < 1 loop
				clashes.put (No_position, i)
				i := i - 1
			end
		end

	slots: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items' and `keys', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER) is
			-- Create `slots'.
		do
			slots := FIXED_INTEGER_ARRAY_.make (n)
		end

	slots_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `slots'
		do
			Result := slots.item (i)
		end

	slots_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `slots'.
		do
			slots.put (v, i)
		end

	clone_slots is
			-- Clone `slots'.
		do
			slots := clone (slots)
		end

	slots_resize (n: INTEGER) is
			-- Resize `slots'.
		do
			slots := FIXED_INTEGER_ARRAY_.resize (slots, n)
		end

	slots_wipe_out is
			-- Wipe out items in `slots'.
		local
			i: INTEGER
		do
			from i := modulus until i < 0 loop
				slots.put (No_position, i)
				i := i - 1
			end
		end

	FIXED_ITEM_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

	FIXED_KEY_ARRAY_: KL_FIXED_ARRAY_ROUTINES [K]
			-- Routines that ought to be in FIXED_ARRAY

invariant

	items_not_void: items /= Void
	items_count: items.count = capacity + 1
	keys_not_void: keys /= Void
	keys_count: keys.count = capacity + 1
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = capacity + 1
	slots_not_void: slots /= Void
	slots_count: slots.count = modulus + 1

end
