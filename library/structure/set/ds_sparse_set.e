indexing

	description:

		"Sets implemented with sparse arrays. Ancestor of hash sets %
		%which should supply its hashing mechanism."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SPARSE_SET [G]

inherit

	DS_SET [G]
		rename
			put as force
		undefine
			has
		redefine
			new_cursor
		end

	DS_BILINEAR [G]
		undefine
			occurrences
		redefine
			has, new_cursor
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
		end

	KL_IMPORTED_FIXED_ARRAY_TYPE [DS_CELL [G]]
		undefine
			is_equal, copy
		end

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty set and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			dead_item: G
		do
			!! FIXED_ARRAY_
			slots := new_slots (n)
			storage := FIXED_ARRAY_.make (slots + 1)
			capacity := n
			!! dead_cell.make (dead_item)
			internal_cursor := new_cursor
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER) is
			-- Create an empty set and allocate
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

	infix "@", item (v: G): G is
			-- Item equal to `v' held in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			search_position (v)
			check has_v: valid_cell (storage.item (position)) end
			Result := storage.item (position).item
		end

	found_item: G
			-- Item found by last call to `search'
--		require
--			item_found: found

	first: G is
			-- First item in set
		local
			i: INTEGER
		do
			from until
				valid_cell (storage.item (i))
			loop
				i := i + 1
			end
			Result := storage.item (i).item
		end

	last: G is
			-- Last item in set
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
			Result := storage.item (i).item
		end

	new_cursor: DS_SPARSE_SET_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in set

	capacity: INTEGER
			-- Maximum number of items in set

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does set include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not Void, use `=' criterion otherwise.)
		local
			current_cell: like dead_cell
		do
			search_position (v)
			current_cell := storage.item (position)
			Result := valid_cell (current_cell)
		end

	found: BOOLEAN
			-- Did last call to `search' succeed?

feature -- Search

	search (v: G) is
			-- Search for item equal to `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not Void, use `=' criterion otherwise.)
			-- If found, set `found' to true, and make that
			-- item available in `found_item'.
		local
			default_item: G
			a_cell: like dead_cell
		do
			search_position (v)
			a_cell := storage.item (position)
			if valid_cell (a_cell) then
				set_found_item (a_cell.item)
			else
				unset_found_item
			end
		ensure
			found_set: found = has (v)
			found_item_set: found implies (found_item = item (v))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is set equal to `other'?
			-- Do not take cursor positions, capacity into account,
			-- but `equality_tester' should be the same.
		local
			v: G
			i: INTEGER
			a_cell: like dead_cell
		do
			if Current = other then
				Result := True
			elseif same_type (other) and count = other.count and same_equality_tester (other) then
				from
					i := slots
					Result := True
				until
					not Result or i < 0
				loop
					a_cell := storage.item (i)
					if valid_cell (a_cell) then
						v := a_cell.item
						Result := other.has (v)
					end
					i := i - 1
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current set.
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

	put (v: G) is
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		require
			not_full: not is_full
		local
			current_cell: like dead_cell
		do
			unset_found_item
			search_position (v)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (v)
				storage.put (current_cell, position)
				count := count + 1
			else
				current_cell.put (v)
			end
		ensure
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

	force (v: G) is
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
			-- Move cursors `off' when resizing.
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			put (v)
		end

feature -- Removal

	remove (v: G) is
			-- Remove item equal to `v' from set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move any cursors at this position `forth'.
		do
			unset_found_item
			search_position (v)
			if valid_slot (position) then
				move_cursors_forth (position)
				storage.put (dead_cell, position)
				count := count - 1
			end
		end

	wipe_out is
			-- Remove all items from set.
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
			-- Resize set so that it can contain
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
					search_position (current_cell.item)
					storage.put (current_cell, position)
				end
				i := i - 1
			end
		end

feature {DS_SPARSE_SET_CURSOR} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Storage for items of the set indexed from 0 to `slots';
			-- entry at index `slots' is reserved for void items

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

	dead_cell: DS_CELL [G]
			-- Mark for deleted items

	position: INTEGER
			-- Last position found by `search_position'

feature {NONE} -- Implementation

	search_position (v: G) is
			-- Search for position where item is equal to `v'
			-- or to possible insertion position otherwise.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		end

	FIXED_ARRAY_: KL_FIXED_ARRAY_ROUTINES [DS_CELL [G]]
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

feature {NONE} -- Implementation

	internal_cursor: like new_cursor
			-- Internal cursor

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

end -- class DS_SPARSE_SET
