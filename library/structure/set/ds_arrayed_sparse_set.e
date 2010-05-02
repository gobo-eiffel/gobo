note

	description:

		"Sparse sets implemented with single arrays. Ancestor of %
		%hash sets which should supply its hashing mechanism."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_ARRAYED_SPARSE_SET [G]

inherit

	DS_SPARSE_SET [G]
		redefine
			new_cursor
		end

	KL_IMPORTED_SPECIAL_ROUTINES
		undefine
			is_equal,
			copy
		end

feature -- Access

	new_cursor: DS_ARRAYED_SPARSE_SET_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {DS_ARRAYED_SPARSE_SET_CURSOR} -- Implementation

	item_storage_item (i: INTEGER): G
			-- Item at position `i' in `item_storage'
		do
			Result := item_storage.item (i)
		end

	clashes_item (i: INTEGER): INTEGER
			-- Item at position `i' in `clashes'
		do
			Result := clashes.item (i)
		end

feature {NONE} -- Implementation

	item_storage: SPECIAL [G]
			-- Storage for items of the set indexed from 1 to `capacity'

	make_item_storage (n: INTEGER)
			-- Create `item_storage'.
		do
			create special_item_routines
			item_storage := special_item_routines.make (n)
		end

	item_storage_put (v: G; i: INTEGER)
			-- Put `v' at position `i' in `item_storage'.
		do
			item_storage.put (v, i)
		end

	clone_item_storage
			-- Clone `item_storage'.
		do
			item_storage := item_storage.twin
		end

	item_storage_resize (n: INTEGER)
			-- Resize `item_storage'.
		do
			item_storage := special_item_routines.resize (item_storage, n)
		end

	item_storage_wipe_out
			-- Wipe out items in `item_storage'.
		local
			i: INTEGER
			dead_item: G
		do
			from
				i := last_position
			until
				i < 1
			loop
				item_storage.put (dead_item, i)
				i := i - 1
			end
		end

	clashes: SPECIAL [INTEGER]
			-- Indexes in `item_storage' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.

	make_clashes (n: INTEGER)
			-- Create `clashes'.
		do
			clashes := SPECIAL_INTEGER_.make (n)
		end

	clashes_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `clashes'.
		do
			clashes.put (v, i)
		end

	clone_clashes
			-- Clone `clashes'.
		do
			clashes := clashes.twin
		end

	clashes_resize (n: INTEGER)
			-- Resize `clashes'.
		do
			clashes := SPECIAL_INTEGER_.resize (clashes, n)
		end

	clashes_wipe_out
			-- Wipe out items in `clashes'.
		local
			i: INTEGER
		do
			from
				i := last_position
			until
				i < 1
			loop
				clashes.put (No_position, i)
				i := i - 1
			end
		end

	slots: SPECIAL [INTEGER]
			-- Indexes in `item_storage', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	make_slots (n: INTEGER)
			-- Create `slots'.
		do
			slots := SPECIAL_INTEGER_.make (n)
		end

	slots_item (i: INTEGER): INTEGER
			-- Item at position `i' in `slots'
		do
			Result := slots.item (i)
		end

	slots_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `slots'.
		do
			slots.put (v, i)
		end

	clone_slots
			-- Clone `slots'.
		do
			slots := slots.twin
		end

	slots_resize (n: INTEGER)
			-- Resize `slots'.
		do
			slots := SPECIAL_INTEGER_.resize (slots, n)
		end

	slots_wipe_out
			-- Wipe out items in `slots'.
		local
			i: INTEGER
		do
			from
				i := modulus
			until
				i < 0
			loop
				slots.put (No_position, i)
				i := i - 1
			end
		end

	special_item_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

invariant

	item_storage_not_void: item_storage /= Void
	item_storage_count: item_storage.count = capacity + 1
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = capacity + 1
	slots_not_void: slots /= Void
	slots_count: slots.count = modulus + 1

end
