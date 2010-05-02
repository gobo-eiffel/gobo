note

	description:

		"Sparse sets implemented with multi-arrays. Ancestor of %
		%hash sets which should supply its hashing mechanism."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_MULTIARRAYED_SPARSE_SET [G]

inherit

	DS_SPARSE_SET [G]
		rename
			make as make_sparse_set,
			make_equal as make_equal_sparse_set
		redefine
			make_default,
			new_cursor
		end

	KL_IMPORTED_SPECIAL_ROUTINES
		undefine
			is_equal,
			copy
		end

	KL_IMPORTED_ARRAY_ROUTINES
		undefine
			is_equal,
			copy
		end

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty set and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make_with_chunk_size (n, default_chunk_size)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = default_chunk_size
			before: before
		end

	make_equal (n: INTEGER)
			-- Create an empty set and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `default_chunk_size'.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make_equal_with_chunk_size (n, default_chunk_size)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = default_chunk_size
			before: before
		end

	make_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER)
			-- Create an empty set and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			chunk_size := a_chunk_size
			make_sparse_set (n)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_equal_with_chunk_size (n: INTEGER; a_chunk_size: INTEGER)
			-- Create an empty set and allocate memory space
			-- for at least `n' items. Array chunks will have
			-- a size of `a_chunk_size'.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
			a_chunk_size_positive: a_chunk_size > 0
		do
			chunk_size := a_chunk_size
			make_equal_sparse_set (n)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			chunk_size_set: chunk_size = a_chunk_size
			before: before
		end

	make_default
			-- Create an empty set and allocate memory space
			-- for at least `default_capacity' items.  Array
			-- chunks will have a size of `default_chunk_size'.
			-- Use `=' as comparison criterion.
		do
			make_with_chunk_size (default_capacity, default_chunk_size)
		ensure then
			chunk_size_set: chunk_size = default_chunk_size
		end

feature -- Access

	new_cursor: DS_MULTIARRAYED_SPARSE_SET_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	chunk_size: INTEGER
			-- Size of array chunks

	default_chunk_size: INTEGER
			-- Default value for `chunk_size'
			-- (Default vale: 30000)
		do
			Result := 30000
		ensure
			default_chunk_size_positive: Result > 0
		end

feature {DS_MULTIARRAYED_SPARSE_SET_CURSOR} -- Implementation

	item_storage_item (i: INTEGER): G
			-- Item at position `i' in `item_storage'
		local
			subitems: SPECIAL [G]
		do
			subitems := item_storage.item (i // chunk_size)
			if subitems /= Void then
				Result := subitems.item (i \\ chunk_size)
			end
		end

	clashes_item (i: INTEGER): INTEGER
			-- Item at position `i' in `clashes'
		local
			subclashes: SPECIAL [INTEGER]
		do
			subclashes := clashes.item (i // chunk_size)
			if subclashes /= Void then
				Result := subclashes.item (i \\ chunk_size)
			end
		end

feature {NONE} -- Implementation

	item_storage: ARRAY [SPECIAL [G]]
			-- Storage for items of the set indexed from 1 to `capacity'

	make_item_storage (n: INTEGER)
			-- Create `item_storage'.
		do
			create special_item_routines
			create array_special_item_routines
			create item_storage.make (0, ((n - 1) // chunk_size))
		end

	item_storage_put (v: G; i: INTEGER)
			-- Put `v' at position `i' in `item_storage'.
		local
			subitems: SPECIAL [G]
			j: INTEGER
		do
			j := i // chunk_size
			subitems := item_storage.item (j)
			if subitems = Void then
				subitems := special_item_routines.make (chunk_size)
				item_storage.put (subitems, j)
			end
			subitems.put (v, i \\ chunk_size)
		end

	clone_item_storage
			-- Clone `item_storage'.
		local
			i, nb: INTEGER
			subitems: SPECIAL [G]
		do
			item_storage := array_special_item_routines.cloned_array (item_storage)
			nb := item_storage.upper
			from
				i := 0
			until
				i > nb
			loop
				subitems := item_storage.item (i)
				if subitems /= Void then
					item_storage.put (subitems.twin, i)
				end
				i := i + 1
			end
		end

	item_storage_resize (n: INTEGER)
			-- Resize `item_storage'.
		do
			array_special_item_routines.resize (item_storage, 0, ((n - 1) // chunk_size))
		end

	item_storage_wipe_out
			-- Wipe out items in `item_storage'.
		local
			i, nb: INTEGER
		do
			nb := item_storage.upper
			from
				i := 0
			until
				i > nb
			loop
				item_storage.put (Void, i)
				i := i + 1
			end
		end

	clashes: ARRAY [SPECIAL [INTEGER]]
			-- Indexes in `item_storage' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER)
			-- Create `clashes'.
		do
			create clashes.make (0, ((n - 1) // chunk_size))
		end

	clashes_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `clashes'.
		local
			subclashes: SPECIAL [INTEGER]
			j: INTEGER
		do
			j := i // chunk_size
			subclashes := clashes.item (j)
			if subclashes = Void then
				subclashes := SPECIAL_INTEGER_.make (chunk_size)
				clashes.put (subclashes, j)
			end
			subclashes.put (v, i \\ chunk_size)
		end

	clone_clashes
			-- Clone `clashes'.
		local
			i, nb: INTEGER
			subclashes: SPECIAL [INTEGER]
		do
			clashes := ARRAY_SPECIAL_INTEGER_.cloned_array (clashes)
			nb := clashes.upper
			from
				i := 0
			until
				i > nb
			loop
				subclashes := clashes.item (i)
				if subclashes /= Void then
					clashes.put (subclashes.twin, i)
				end
				i := i + 1
			end
		end

	clashes_resize (n: INTEGER)
			-- Resize `clashes'.
		do
			ARRAY_SPECIAL_INTEGER_.resize (clashes, 0, ((n - 1) // chunk_size))
		end

	clashes_wipe_out
			-- Wipe out items in `clashes'.
		local
			i, nb: INTEGER
		do
			nb := clashes.upper
			from
				i := 0
			until
				i > nb
			loop
				clashes.put (Void, i)
				i := i + 1
			end
		end

	slots: ARRAY [SPECIAL [INTEGER]]
			-- Indexes in `item_storage', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER)
			-- Create `slots'.
		do
			create slots.make (0, ((n - 1) // chunk_size))
		end

	slots_item (i: INTEGER): INTEGER
			-- Item at position `i' in `slots'
		local
			subslots: SPECIAL [INTEGER]
		do
			subslots := slots.item (i // chunk_size)
			if subslots /= Void then
				Result := subslots.item (i \\ chunk_size)
			end
		end

	slots_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `slots'.
		local
			subslots: SPECIAL [INTEGER]
			j: INTEGER
		do
			j := i // chunk_size
			subslots := slots.item (j)
			if subslots = Void then
				subslots := SPECIAL_INTEGER_.make (chunk_size)
				slots.put (subslots, j)
			end
			subslots.put (v, i \\ chunk_size)
		end

	clone_slots
			-- Clone `slots'.
		local
			i, nb: INTEGER
			subslots: SPECIAL [INTEGER]
		do
			slots := ARRAY_SPECIAL_INTEGER_.cloned_array (slots)
			nb := slots.upper
			from
				i := 0
			until
				i > nb
			loop
				subslots := slots.item (i)
				if subslots /= Void then
					slots.put (subslots.twin, i)
				end
				i := i + 1
			end
		end

	slots_resize (n: INTEGER)
			-- Resize `slots'.
		do
			ARRAY_SPECIAL_INTEGER_.resize (slots, 0, ((n - 1) // chunk_size))
		end

	slots_wipe_out
			-- Wipe out items in `slots'.
		local
			i, nb: INTEGER
		do
			nb := slots.upper
			from
				i := 0
			until
				i > nb
			loop
				slots.put (Void, i)
				i := i + 1
			end
		end

	special_item_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

	array_special_item_routines: KL_ARRAY_ROUTINES [SPECIAL [G]]
			-- Routines that ought to be in ARRAY

invariant

	chunk_size_positive: chunk_size > 0
	item_storage_not_void: item_storage /= Void
	item_storage_count: item_storage.count = (capacity // chunk_size) + 1
	special_item_routines_not_void: special_item_routines /= Void
	array_special_item_routines_not_void: array_special_item_routines /= Void
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = (capacity // chunk_size) + 1
	slots_not_void: slots /= Void
	slots_count: slots.count = (modulus // chunk_size) + 1

end
