indexing

	description:

		"Sparse tables, implemented with arrays. Ancestor of hash tables %
		%and hash maps, which should supply their hashing mechanisms."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SPARSE_TABLE [G, K]

inherit

	DS_TABLE [G, K]
		rename
			put as force
		end

	DS_BILINEAR [G]
		rename
			has as has_item
		redefine
			has_item, occurrences, new_cursor
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE [DS_PAIR [G, K]]
		undefine
			is_equal, copy
		end

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
			dead_key: K
		do
			!! FIXED_ARRAY_
			slots := new_slots (n)
			storage := FIXED_ARRAY_.make (slots + 1)
			capacity := n
			!! dead_cell.make (dead_item, dead_key)
			internal_cursor := new_cursor
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make (n)
			!! equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		do
			search_position (k)
			check has_k: valid_cell (storage.item (position)) end
			Result := storage.item (position).first
		end

	found_item: G
			-- Item found by last call to `search'
--		require
--			item_found: found

	first: G is
			-- First item in table
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
			-- Last item in table
		local
			i: INTEGER
		do
			from
				i := slots
			until
				valid_cell (storage.item (i))
			loop
				i := i - 1
			end
			Result := storage.item (i).first
		end

	key_for_iteration: K is
			-- Key at internal cursor position
		require
			not_off: not off
		do
			Result := internal_cursor.key
		end

	new_cursor: DS_SPARSE_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		deferred
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in table

	capacity: INTEGER
			-- Maximum number of items in table

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in table
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_cell: like dead_cell
			a_tester: like equality_tester
		do
			i := slots
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 0 loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) and then a_tester.test (a_cell.first, v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 0 loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) and then a_cell.first = v then
						Result := Result + 1
					end
					i := i - 1
				end
			end
		end

feature -- Status report

	has (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		local
			current_cell: like dead_cell
		do
			search_position (k)
			current_cell := storage.item (position)
			Result := valid_cell (current_cell)
		end

	has_item (v: G): BOOLEAN is
			-- Does table include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_cell: like dead_cell
			a_tester: like equality_tester
		do
			i := slots
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 0 loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) and then a_tester.test (a_cell.first, v) then
						Result := True
						i := -1  -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 0 loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) and then a_cell.first = v then
						Result := True
						i := -1  -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

	found: BOOLEAN
			-- Did last call to `search' succeed?

	valid_key (k: K): BOOLEAN is
			-- Is `k' a valid key?
		do
			Result := True
		ensure then
			defintion: Result = True
		end

feature -- Search

	search (k: K) is
			-- Search for item at key `k'.
			-- If found, set `found' to true, and set
			-- `found_item' to item associated with `k'.
		local
			default_item: G
			a_cell: like dead_cell
		do
			search_position (k)
			a_cell := storage.item (position)
			if valid_cell (a_cell) then
				set_found_item (a_cell.first)
			else
				unset_found_item
			end
		ensure
			found_set: found = has (k)
			found_item_set: found implies (found_item = item (k))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is table equal to `other'?
			-- Do not take cursor positions, capacity
			-- nor `equality_tester' into account.
		local
			a_key: K
			i: INTEGER
			a_cell: like dead_cell
		do
			if Current = other then
				Result := True
			elseif same_type (other) and count = other.count then
				from
					i := slots
					Result := True
				until
					not Result or i < 0
				loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) then
						a_key := a_cell.second
						Result := other.has (a_key) and then
							other.item (a_key) = a_cell.first
					end
					i := i - 1
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current table.
			-- Move all cursors `off' (unless `other = Current').
		local
			i: INTEGER
			current_cell: like dead_cell
			old_cursor: like new_cursor
		do
			if other /= Current then
				old_cursor := internal_cursor
				move_all_cursors_after
				standard_copy (other)
				if old_cursor /= Void then
					internal_cursor := old_cursor
				else
					internal_cursor := new_cursor
				end
				unset_found_item
				storage := clone (storage)
				from i := slots until i < 0 loop
					current_cell := storage.item (i)
					if valid_cell (current_cell) then
						storage.put (clone (current_cell), i)
					end
					i := i - 1
				end
			end
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
			-- Do not move cursors.
		do
			unset_found_item
			search_position (k)
			check has_k: valid_cell (storage.item (position)) end
			storage.item (position).put_first (v)
		end

	put (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Do not move cursors.
		require
			not_full: not is_full
			valid_key: valid_key (k)
		local
			current_cell: like dead_cell
		do
			unset_found_item
			search_position (k)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (v, k)
				storage.put (current_cell, position)
				count := count + 1
			else
				current_cell.put_first (v)
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
		end

	force (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Move cursors `off' when resizing.
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			put (v, k)
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
			-- Move any cursors at this position `forth'.
		do
			unset_found_item
			search_position (k)
			if valid_slot (position) then
				move_cursors_forth (position)
				storage.put (dead_cell, position)
				count := count - 1
			end
		end

	wipe_out is
			-- Remove all items from table.
			-- Move all cursors `off'.
		local
			i: INTEGER
		do
			move_all_cursors_after
			unset_found_item
			from i := slots until i < 0 loop
				storage.put (Void, i)
				i := i - 1
			end
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize table so that it can contain
			-- at least `n' items. Do not lose any item.
			-- Move all cursors `off'.
		local
			old_storage: like storage
			current_cell: like dead_cell
			i, old_slots: INTEGER
		do
			move_all_cursors_after
			unset_found_item
			old_storage := storage
			old_slots := slots
			slots := new_slots (n)
			storage := FIXED_ARRAY_.make (slots + 1)
			capacity := n
			from i := old_slots until i < 0 loop
				current_cell := old_storage.item (i)
				if valid_cell (current_cell) then
					search_position (current_cell.second)
					storage.put (current_cell, position)
				end
				i := i - 1
			end
		end

feature {DS_SPARSE_TABLE_CURSOR} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Storage for items of the table indexed from 0 to `slots';
			-- entry at index `slots' is reserved for void keys

	slots: INTEGER
			-- Upper bound of `storage'

	valid_cell (cell: like dead_cell): BOOLEAN is
			-- Does `cell' contain an item?
		do
			Result := cell /= Void and cell /= dead_cell
		ensure
			cell_not_void: Result implies cell /= Void
		end

	valid_slot (i: INTEGER): BOOLEAN is
			-- Is there a valid cell at position `i'?
		require
			valid_i: valid_position (i)
		do
			Result := valid_cell (storage.item (i))
		end

	valid_position (i: INTEGER): BOOLEAN is
			-- Is there a slot at position `i'?
		do
			Result := 0 <= i and i <= slots
		ensure
			definition: Result = (0 <= i and i <= slots)
		end

	dead_cell: DS_PAIR [G, K]
			-- Mark for deleted items

	position: INTEGER
			-- Last position found by `search_position'

feature {NONE} -- Implementation

	search_position (k: K) is
			-- Search for position where key is equal to `k'
			-- or to possible insertion position otherwise.
		require
			valid_key: valid_key (k)
		deferred
		end

	FIXED_ARRAY_: KL_FIXED_ARRAY_ROUTINES [DS_PAIR [G, K]]
			-- Routines that ought to be in FIXED_ARRAY

	set_found_item (v: G) is
			-- Set `found_item' to `v'.
		do
			found_item := v
			found := True
		ensure
			found: found
			found_item_set: found_item = v
		end

	unset_found_item is
			-- Get rig of `found_item'.
		local
			default_item: G
		do
			found := False
			found_item := default_item
		ensure
			not_found: not found
		end

feature {NONE} -- Cursor movements

	move_all_cursors_after is
			-- Move `after' all cursors.
		local
			a_cursor, next_cursor: like new_cursor
		do
			from a_cursor := internal_cursor until (a_cursor = Void) loop
				a_cursor.set_after
				next_cursor := a_cursor.next_cursor
				a_cursor.set_next_cursor (Void)
				a_cursor := next_cursor
			end
		end

	move_all_cursors (old_position, new_position: INTEGER) is
			-- Move all cursors at position `old_position'
			-- to position `new_position'.
		require
			valid_old_position: valid_position (old_position)
			valid_new_position: valid_slot (new_position)
		local
			a_cursor: like new_cursor
		do
			from a_cursor := internal_cursor until (a_cursor = Void) loop
				if a_cursor.position = old_position then
					a_cursor.set_position (new_position)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

	move_cursors_after (old_position: INTEGER) is
			-- Move `after' all cursors at position `old_position'.
		require
			valid_old_position: valid_position (old_position)
		local
			a_cursor, previous_cursor, next_cursor: like new_cursor
		do
			a_cursor := internal_cursor
			if a_cursor.position = old_position then
				a_cursor.set_after
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from until (a_cursor = Void) loop
				if a_cursor.position = old_position then
					a_cursor.set_after
					next_cursor := a_cursor.next_cursor
					previous_cursor.set_next_cursor (next_cursor)
					a_cursor.set_next_cursor (Void)
					a_cursor := next_cursor
				else
					previous_cursor := a_cursor
					a_cursor := a_cursor.next_cursor
				end
			end
		end

	move_cursors_forth (old_position: INTEGER) is
			-- Move `forth' all cursors at position `old_position'.
		require
			valid_old_position: valid_position (old_position)
		local
			i: INTEGER
		do
				-- Search next valid position.
			from
				i := old_position + 1
			until
				i > slots or else
				valid_slot (i)
			loop
				i := i + 1
			end
			if i > slots then
				move_cursors_after (old_position)
			else
				move_all_cursors (old_position, i)
			end
		end

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER is
			-- New capacity which could accommodate at least
			-- `n' items (Used as argument of `resize'.)
		do
			Result := 2 * n
		end

	new_slots (a_capacity: INTEGER): INTEGER is
			-- Value for `slots' which can accommodate
			-- `a_capacity' items
		require
			a_capacity_positive: a_capacity >= 0
		do
			Result := (a_capacity + 1) * 3 // 2
		ensure
			slots_large_enough: Result > a_capacity
		end

invariant

	storage_not_void: storage /= Void
	dead_cell: dead_cell /= Void
	valid_position: valid_position (position)
	slots_definition: slots = (storage.count - 1)
	capacity_constraint: capacity < slots

end -- class DS_SPARSE_TABLE
