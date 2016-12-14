note

	description:

		"Sparse sets implemented with multi-arrays. Ancestor of %
		%hash sets which should supply its hashing mechanism."

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
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

	MISMATCH_CORRECTOR
		export
			{NONE} all
		undefine
			copy, is_equal
		redefine
			correct_mismatch
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
			subitems: detachable SPECIAL [G]
		do
			subitems := item_storage.item (i // chunk_size)
			check valid_index: subitems /= Void then
				Result := subitems.item (i \\ chunk_size)
			end
		end

	clashes_item (i: INTEGER): INTEGER
			-- Item at position `i' in `clashes'
		local
			subclashes: detachable SPECIAL [INTEGER]
		do
			subclashes := clashes.item (i // chunk_size)
			if subclashes /= Void then
				Result := subclashes.item (i \\ chunk_size)
			else
				Result := No_position
			end
		end

feature {NONE} -- Implementation

	item_storage: ARRAY [detachable SPECIAL [G]]
			-- Storage for items of the set indexed from 1 to `capacity'

	make_item_storage (n: INTEGER)
			-- Create `item_storage'.
		do
			create special_item_routines
			create array_special_item_routines
			create item_storage.make_filled (Void, 0, ((n - 1) // chunk_size))
		end

	item_storage_put (v: G; i: INTEGER)
			-- Put `v' at position `i' in `item_storage'.
		local
			subitems: detachable SPECIAL [G]
			j: INTEGER
		do
			j := i // chunk_size
			subitems := item_storage.item (j)
			if subitems = Void then
				subitems := special_item_routines.make (chunk_size)
				item_storage.put (subitems, j)
			end
			special_item_routines.force (subitems, v, i \\ chunk_size)
		end

	clone_item_storage
			-- Clone `item_storage'.
		local
			i, nb: INTEGER
			subitems: detachable SPECIAL [G]
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
						-- Note that SPECIAL.copy may shrink 'capacity'
						-- down to 'count'. So do not use SPECIAL.twin here.
					item_storage.put (subitems.resized_area (subitems.capacity), i)
				end
				i := i + 1
			end
		end

	item_storage_resize (n: INTEGER)
			-- Resize `item_storage'.
		do
			array_special_item_routines.resize_with_default (item_storage, Void, 0, ((n - 1) // chunk_size))
		end

	item_storage_wipe_out
			-- Wipe out items in `item_storage'.
		do
			item_storage.fill_with (Void)
		end

	item_storage_keep_head (n: INTEGER)
			-- Keep the first `n' items in `item_storage'.
		local
			subitems: detachable SPECIAL [G]
			i, j: INTEGER
			l_upper: INTEGER
		do
			i := n // chunk_size
			j := n \\ chunk_size
			if j = 0 then
				item_storage.put (Void, i)
			else
				subitems := item_storage.item (i)
				if subitems /= Void then
					subitems.keep_head (j)
				end
				from
					i := i + 1
					l_upper := item_storage.upper
				until
					i > l_upper
				loop
					item_storage.put (Void, i)
					i := i + 1
				end
			end
		end

	clashes: ARRAY [detachable SPECIAL [INTEGER]]
			-- Indexes in `item_storage' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER)
			-- Create `clashes'.
		do
			create clashes.make_filled (Void, 0, ((n - 1) // chunk_size))
		end

	clashes_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `clashes'.
		local
			subclashes: detachable SPECIAL [INTEGER]
			j: INTEGER
		do
			j := i // chunk_size
			subclashes := clashes.item (j)
			if subclashes = Void then
				create subclashes.make_filled (No_position, chunk_size)
				clashes.put (subclashes, j)
			end
			subclashes.put (v, i \\ chunk_size)
		end

	clone_clashes
			-- Clone `clashes'.
		local
			i, nb: INTEGER
			subclashes: detachable SPECIAL [INTEGER]
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
						-- Note that SPECIAL.copy may shrink 'capacity'
						-- down to 'count'. So do not use SPECIAL.twin here.
					clashes.put (subclashes.resized_area (subclashes.capacity), i)
				end
				i := i + 1
			end
		end

	clashes_resize (n: INTEGER)
			-- Resize `clashes'.
		do
			ARRAY_SPECIAL_INTEGER_.resize_with_default (clashes, Void, 0, ((n - 1) // chunk_size))
		end

	clashes_wipe_out
			-- Wipe out items in `clashes'.
		do
			clashes.fill_with (Void)
		end

	slots: ARRAY [detachable SPECIAL [INTEGER]]
			-- Indexes in `item_storage', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER)
			-- Create `slots'.
		do
			create slots.make_filled (Void, 0, ((n - 1) // chunk_size))
		end

	slots_item (i: INTEGER): INTEGER
			-- Item at position `i' in `slots'
		local
			subslots: detachable SPECIAL [INTEGER]
		do
			subslots := slots.item (i // chunk_size)
			if subslots /= Void then
				Result := subslots.item (i \\ chunk_size)
			else
				Result := No_position
			end
		end

	slots_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `slots'.
		local
			subslots: detachable SPECIAL [INTEGER]
			j: INTEGER
		do
			j := i // chunk_size
			subslots := slots.item (j)
			if subslots = Void then
				create subslots.make_filled (No_position, chunk_size)
				slots.put (subslots, j)
			end
			subslots.put (v, i \\ chunk_size)
		end

	clone_slots
			-- Clone `slots'.
		local
			i, nb: INTEGER
			subslots: detachable SPECIAL [INTEGER]
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
						-- Note that SPECIAL.copy may shrink 'capacity'
						-- down to 'count'. So do not use SPECIAL.twin here.
					slots.put (subslots.resized_area (subslots.capacity), i)
				end
				i := i + 1
			end
		end

	slots_resize (n: INTEGER)
			-- Resize `slots'.
		do
			ARRAY_SPECIAL_INTEGER_.resize_with_default (slots, Void, 0, ((n - 1) // chunk_size))
		end

	slots_wipe_out
			-- Wipe out items in `slots'.
		do
			slots.fill_with (Void)
		end

	special_item_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

	array_special_item_routines: KL_ARRAY_ROUTINES [detachable SPECIAL [G]]
			-- Routines that ought to be in ARRAY

feature {NONE} -- Storable mismatch

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_stored_version_number: INTEGER
		do
			if not attached mismatch_information.stored_version as l_stored_version or else l_stored_version.is_empty then
				correct_mismatch_20130823
			elseif l_stored_version.is_integer then
				l_stored_version_number := l_stored_version.to_integer
				if l_stored_version_number < 20130823 then
					correct_mismatch_20130823
				else
					precursor
				end
			else
				precursor
			end
		end

	correct_mismatch_20130823
			-- Correct storable mismatch introducted in version "20130823".
		local
			i, nb: INTEGER
			j, l_count: INTEGER
		do
			from
				i := item_storage.lower
				nb := item_storage.upper
			until
				i > nb
			loop
				if attached item_storage.item (i) as l_subitems then
					l_count := l_subitems.count
					if i /= 0 and then l_count > 0 then
						item_storage_put (l_subitems.item (0), i * chunk_size - 1)
					end
					l_count := l_count - 1
					if l_count > 0 then
						l_subitems.move_data (1, 0, l_count)
						l_subitems.keep_head (l_count)
					else
						item_storage.put (Void, i)
					end
				end
				i := i + 1
			end
			if item_storage.count /= ((capacity - 1) // chunk_size) + 1 then
				item_storage := item_storage.subarray (0, (capacity - 1) // chunk_size)
			end
			from
				i := clashes.lower
				nb := clashes.upper
			until
				i > nb
			loop
				if attached clashes.item (i) as l_subclashes then
					l_count := l_subclashes.count
					if i /= 0 and then l_count > 0 then
						clashes_put (l_subclashes.item (0) - 1, i * chunk_size - 1)
					end
					from
						j := 1
						l_count := l_count - 1
					until
						j > nb
					loop
						l_subclashes.put (l_subclashes.item (j) - 1, j - 1)
						j := j + 1
					end
					l_subclashes.put (No_position, l_count)
				end
				i := i + 1
			end
			if clashes.count /= ((capacity - 1) // chunk_size) + 1 then
				clashes := clashes.subarray (0, (capacity - 1) // chunk_size)
			end
			from
				i := slots.lower
				nb := slots.upper
			until
				i > nb
			loop
				if attached slots.item (i) as l_subslots then
					from
						j := l_subslots.count - 1
					until
						j < 0
					loop
						l_subslots.put (l_subslots.item (j) - 1, j)
						j := j - 1
					end
				end
				i := i + 1
			end
			clashes_previous_position := clashes_previous_position - 1
			found_position := found_position - 1
			free_slot := free_slot - 1
			position := position - 1
			last_position := last_position - 1
		end

invariant

	chunk_size_positive: chunk_size > 0
	item_storage_not_void: item_storage /= Void
	item_storage_count: item_storage.count = ((capacity - 1) // chunk_size) + 1
	special_item_routines_not_void: special_item_routines /= Void
	array_special_item_routines_not_void: array_special_item_routines /= Void
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = ((capacity - 1) // chunk_size) + 1
	slots_not_void: slots /= Void
	slots_count: slots.count = (modulus // chunk_size) + 1

end
