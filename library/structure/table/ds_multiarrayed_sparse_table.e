indexing

	description:

		"Sparse tables implemented with multi-arrays. Ancestor of %
		%hash tables which should supply its hashing mechanism."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_MULTIARRAYED_SPARSE_TABLE [G, K]

inherit

	DS_SPARSE_TABLE [G, K]
		rename
			make_with_equality_testers as make_sparse_table_with_equality_testers
		redefine
			make, make_equal, make_default,
			make_map, make_map_equal, make_map_default,
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

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		do
			create key_equality_tester
			make_with_chunk_size_and_equality_testers (n,
				default_chunk_size, Void, key_equality_tester)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_equal (n: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `equal' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		do
			create equality_tester
			create key_equality_tester
			make_with_chunk_size_and_equality_testers (n,
				default_chunk_size, equality_tester, key_equality_tester)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			create key_equality_tester
			make_with_chunk_size_and_equality_testers (n,
				a_chunk_size, Void, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_equal_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `equal' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			create equality_tester
			create key_equality_tester
			make_with_chunk_size_and_equality_testers (n,
				a_chunk_size, equality_tester, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_default is
			-- Create an empty table and allocate memory space
			-- for at least `default_capacity' items. Array
			-- chunks will have a size of `default_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		do
			create key_equality_tester
			make_with_chunk_size_and_equality_testers (default_capacity,
				default_chunk_size, Void, key_equality_tester)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_map (n: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		do
			make_with_chunk_size_and_equality_testers (n,
				default_chunk_size, Void, Void)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_map_equal (n: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `equal' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		do
			create equality_tester
			make_with_chunk_size_and_equality_testers (n,
				default_chunk_size, equality_tester, Void)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_map_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			make_with_chunk_size_and_equality_testers (n,
				a_chunk_size, Void, Void)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_map_equal_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER) is
			-- Create an empty table and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `equal' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			create equality_tester
			make_with_chunk_size_and_equality_testers (n,
				a_chunk_size, equality_tester, Void)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_map_default is
			-- Create an empty table and allocate memory space
			-- for at least `default_capacity' items.  Array
			-- chunks will have a size of `default_chunk_size'.
			-- Use `=' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		do
			make_with_chunk_size_and_equality_testers (default_capacity,
				default_chunk_size, Void, Void)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

	make_with_equality_testers (n: INTEGER;
		an_item_tester: like equality_tester;
		a_key_tester: like key_equality_tester) is
			-- Create an empty table and allocate memory space for at
			-- least `n' items. Array chunks will have a size of
			-- `default_chunk_size'.
			-- Use `an_item_tester' as comparison criterion for items.
			-- Use `a_key_tester' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			make_with_chunk_size_and_equality_testers (n,
				default_chunk_size, an_item_tester, a_key_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = default_chunk_size
			before: before
			equality_tester_set: equality_tester = an_item_tester
			key_equality_tester_set: key_equality_tester = a_key_tester
		end

	make_with_chunk_size_and_equality_testers (n: INTEGER;
		a_chunk_size: INTEGER; an_item_tester: like equality_tester;
		a_key_tester: like key_equality_tester) is
			-- Create an empty table and allocate memory space for at
			-- least `n' items. Array chunks will have a size of `a_chunk_size'.
			-- Use `an_item_tester' as comparison criterion for items.
			-- Use `a_key_tester' as comparison criterion for keys.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			chunk_size := a_chunk_size
			make_sparse_table_with_equality_testers (n, an_item_tester, a_key_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
			equality_tester_set: equality_tester = an_item_tester
			key_equality_tester_set: key_equality_tester = a_key_tester
		end

feature -- Access

	new_cursor: DS_MULTIARRAYED_SPARSE_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	chunk_size: INTEGER
			-- Size of array chunks

	default_chunk_size: INTEGER is
			-- Default value for `chunk_size'
			-- (Default value: 30000)
		once
			Result := 30000
		ensure
			default_chunk_size_positive: Result > 0
		end

feature {DS_MULTIARRAYED_SPARSE_TABLE_CURSOR} -- Implementation

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

	keys_item (i: INTEGER): K is
			-- Item at position `i' in `keys'
		local
			subkeys: like FIXED_KEY_ARRAY_TYPE
		do
			subkeys := keys.item (i // chunk_size)
			if subkeys /= Void then
				Result := subkeys.item (i \\ chunk_size)
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
			-- Storage for items of the table indexed from 1 to `capacity'

	make_items (n: INTEGER) is
			-- Create `items'.
		do
			create FIXED_ITEM_ARRAY_
			create items.make (0, ((n - 1) // chunk_size))
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

	items_wipe_out is
			-- Wipe out items in `items'.
		local
			i, nb: INTEGER
		do
			nb := items.upper
			from i := 0 until i > nb loop
				items.put (Void, i)
				i := i + 1
			end
		end

	keys: ARRAY [like FIXED_KEY_ARRAY_TYPE]
			-- Storage for keys of the table indexed from 1 to `capacity'

	make_keys (n: INTEGER) is
			-- Create `keys'.
		do
			create FIXED_KEY_ARRAY_
			create keys.make (0, ((n - 1) // chunk_size))
		end

	keys_put (k: K; i: INTEGER) is
			-- Put `k' at position `i' in `keys'.
		local
			subkeys: like FIXED_KEY_ARRAY_TYPE
			j: INTEGER
		do
			j := i // chunk_size
			subkeys := keys.item (j)
			if subkeys = Void then
				subkeys := FIXED_KEY_ARRAY_.make (chunk_size)
				keys.put (subkeys, j)
			end
			subkeys.put (k, i \\ chunk_size)
		end

	clone_keys is
			-- Clone `keys'.
		local
			i, nb: INTEGER
		do
			keys := clone (keys)
			nb := keys.upper
			from i := 0 until i > nb loop
				keys.put (clone (keys.item (i)), i)
				i := i + 1
			end
		end

	keys_resize (n: INTEGER) is
			-- Resize `keys'.
		do
			keys.resize (0, ((n - 1) // chunk_size))
		end

	keys_wipe_out is
			-- Wipe out items in `keys'.
		local
			i, nb: INTEGER
		do
			nb := keys.upper
			from i := 0 until i > nb loop
				keys.put (Void, i)
				i := i + 1
			end
		end

	clashes: ARRAY [like FIXED_INTEGER_ARRAY_TYPE]
			-- Indexes in `items' and `keys'  when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER) is
			-- Create `clashes'.
		do
			create clashes.make (0, ((n - 1) // chunk_size))
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

	clashes_wipe_out is
			-- Wipe out items in `clashes'.
		local
			i, nb: INTEGER
		do
			nb := clashes.upper
			from i := 0 until i > nb loop
				clashes.put (Void, i)
				i := i + 1
			end
		end

	slots: ARRAY [like FIXED_INTEGER_ARRAY_TYPE]
			-- Indexes in `items' and `keys', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER) is
			-- Create `slots'.
		do
			create slots.make (0, ((n - 1) // chunk_size))
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

	slots_wipe_out is
			-- Wipe out items in `slots'.
		local
			i, nb: INTEGER
		do
			nb := slots.upper
			from i := 0 until i > nb loop
				slots.put (Void, i)
				i := i + 1
			end
		end

	FIXED_ITEM_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

	FIXED_KEY_ARRAY_: KL_FIXED_ARRAY_ROUTINES [K]
			-- Routines that ought to be in FIXED_ARRAY

invariant

	chunk_size_positive: chunk_size > 0
	items_not_void: items /= Void
	items_count1: capacity = 0 implies items.count = 0
	items_count2: capacity > 0 implies (items.count = ((capacity) // chunk_size) + 1)
	keys_not_void: keys /= Void
	keys_count1: capacity = 0 implies keys.count = 0
	keys_count2: capacity > 0 implies (keys.count = ((capacity) // chunk_size) + 1)
	clashes_not_void: clashes /= Void
	clashes_count1: capacity = 0 implies clashes.count = 0
	clashes_count2: capacity > 0 implies (clashes.count = ((capacity) // chunk_size) + 1)
	slots_not_void: slots /= Void
	slots_count: slots.count = (modulus // chunk_size) + 1

end
