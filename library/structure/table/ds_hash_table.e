indexing

	description:

		"Hash tables, implemented with arrays"

	note:       "To avoid performance degradation, %
	             %make sure that `count <= capacity * 2 // 3'"
	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_TABLE [G, K]
		rename
			put as force,
			valid_entry as has
		end

	DS_BILINEAR [G]
		rename
			has as has_item
		redefine
			searcher
		end

	DS_RESIZABLE [G]

creation

	make, make_equal

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty hash table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
			dead_key: K
			ref_searcher: DS_HASH_TABLE_REFERENCE_SEARCHER [G, K]
		do
			!! storage.make (0, n)
			!! dead_cell.make (dead_item, dead_key)
			!! ref_searcher
			searcher := ref_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

	make_equal (n: INTEGER) is
			-- Create an empty hash table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
			dead_key: K
			value_searcher: DS_HASH_TABLE_VALUE_SEARCHER [G, K]
		do
			!! storage.make (0, n)
			!! dead_cell.make (dead_item, dead_key)
			!! value_searcher
			searcher := value_searcher
		ensure
			empty: is_empty
			capacity_set: capacity = n
		end

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		do
			search (k)
			check has_k: valid_cell (storage.item (position)) end
			Result := storage.item (position).first
		end

	first: G is
			-- First item in hash table
		local
			i: INTEGER
		do
			from until
				valid_cell (storage.item (i))
			loop
				i := i + 1
			end
			Result := storage.item (i).first
		end

	last: G is
			-- Last item in hash table
		local
			i: INTEGER
		do
			from
				i := storage.upper
			until
				valid_cell (storage.item (i))
			loop
				i := i - 1
			end
			Result := storage.item (i).first
		end

	new_cursor: DS_HASH_TABLE_CURSOR [G, K] is
			-- New cursor for traversal
		do
			!! Result.make (Current)
		end

	searcher: DS_HASH_TABLE_SEARCHER [G, K]
			-- Hash table searcher

feature -- Measurement

	count: INTEGER
			-- Number of items in hash table

	capacity: INTEGER is
			-- Maximum number of items in hash table
		do
			Result := storage.count - 1
		end

feature -- Status report

	valid_key (k: K): BOOLEAN is
			-- Is `k' a valid key?
		do
			Result := k /= Void
		ensure then
			key_not_void: Result implies k /= Void
		end

	has (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		local
			current_cell: like dead_cell
		do
			if valid_key (k) then
				search (k)
				current_cell := storage.item (position)
				Result := valid_cell (current_cell)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is hash table equal to `other'?
		local
			a_cursor: like new_cursor
			a_key: K
		do
			if same_type (other) and count = other.count then
				from
					a_cursor := new_cursor
					a_cursor.start
					Result := True
				until
					not Result or a_cursor.after
				loop
					a_key := a_cursor.key
					Result := other.has (a_key) and then
						other.item (a_key) = a_cursor.item
					a_cursor.forth
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current hash table.
		local
			i: INTEGER
			current_cell: like dead_cell
		do
			standard_copy (other)
			storage := clone (storage)
			from i := storage.upper until i < 0 loop
				current_cell := storage.item (i)
				if valid_cell (current_cell) then
					storage.put (clone (current_cell), i)
				end
				i := i - 1
			end
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
		do
			search (k)
			check has_k: valid_cell (storage.item (position)) end
			storage.item (position).put_first (v)
		end

	put (v: G; k: K) is
			-- Associate `v' with key `k'.
		require
			not_full: not is_full
			valid_key: valid_key (k)
		local
			current_cell: like dead_cell
		do
			search (k)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (v, k)
				storage.put (current_cell, position)
				count := count + 1
			else
				current_cell.put_first (v)
			end
		ensure
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
		end

	force (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize hash table if necessary.
		do
			if count >= capacity * 2 // 3 then
				resize ((capacity + 1) * 3 // 2)
			end
			put (v, k)
		ensure then
			one_more: (not old has (k)) implies (count = old count + 1)
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
		do
			search (k)
			storage.put (dead_cell, position)
			count := count - 1
		ensure then
			removed: not has (k)
		end

	wipe_out is
			-- Remove all items.
		local
			i: INTEGER
		do
			from i := storage.upper until i < 0 loop
				storage.put (Void, i)
				i := i - 1
			end
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize hash table so that it can contain
			-- at least `n' items. Do not lose any item.
		local
			old_storage: like storage
			current_cell: like dead_cell
			i: INTEGER
		do
			old_storage := storage
			!! storage.make (0, n)
			from i := old_storage.upper until i < 0 loop
				current_cell := old_storage.item (i)
				if valid_cell (current_cell) then
					search (current_cell.second)
					storage.put (current_cell, position)
				end
				i := i - 1
			end
		end

feature {DS_HASH_TABLE_SEARCHER, DS_HASH_TABLE_CURSOR} -- Implementation

	storage: ARRAY [DS_PAIR [G, K]]
			-- Storage for items of the table

	valid_cell (cell: like dead_cell): BOOLEAN is
			-- Does `cell' contain an item?
		do
			Result := cell /= Void and cell /= dead_cell
		ensure
			cell_not_void: Result implies cell /= Void
		end

	valid_position (i: INTEGER): BOOLEAN is
			-- Is there a valid cell at position `i'?
		require
			valid_i: 0 <= i and i <= capacity
		do
			Result := valid_cell (storage.item (i))
		end

	dead_cell: DS_PAIR [G, K]
			-- Mark for deleted items

	position: INTEGER
			-- Last position found by `search'

feature {NONE} -- Implementation

	search (k: K) is
			-- Search for position where key is equal to `k'
			-- or to possible insertion position otherwise.
		require
			valid_key: valid_key (k)
		do
			position := searcher.hash_position (Current, k)
		end
				
invariant

	storage_not_void: storage /= Void
	dead_cell: dead_cell /= Void
	valid_position: storage.valid_index (position)
	capacity_definition: capacity = storage.count - 1
	lower_definition: storage.lower = 0

end -- class DS_HASH_TABLE
