indexing

	description:

		"Sparse tables, implemented with arrays. Ancestor of hash tables %
		%and hash maps, which should supply their hashing mechanisms."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SPARSE_TABLE [G, K]

inherit

	DS_TABLE [G, K]
		rename
			put as force,
			put_new as force_new
		end

	DS_BILINEAR [G]
		rename
			has as has_item
		redefine
			has_item, occurrences
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
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
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			i: INTEGER
		do
			!! FIXED_ITEM_ARRAY_
			!! FIXED_KEY_ARRAY_
			items := FIXED_ITEM_ARRAY_.make (n)
			keys := FIXED_KEY_ARRAY_.make (n)
			clashes := FIXED_INTEGER_ARRAY_.make (n)
			from
				i := n - 1
				free_slot := i
			until
				i < 0
			loop
				clashes.put (Free_offset - (i - 1), i)
				i := i - 1
			end
			modulus := new_modulus (n)
			slots := FIXED_INTEGER_ARRAY_.make (modulus + 1)
			from i := modulus until i < 0 loop
				slots.put (No_position, i)
				i := i - 1
			end
			capacity := n
			position := No_position
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
			check hash_k: position /= No_position end
			Result := items.item (position)
		end

	key (k: K): K is
			-- Key associated with `k'
		require
			has_k: has (k)
		do
			search_position (k)
			check hash_k: position /= No_position end
			Result := keys.item (position)
		end

	found_item: G is
			-- Item found by last call to `search'
		require
			item_found: found
		do
			Result := items.item (found_position)
		end

	first: G is
			-- First item in table
		local
			i: INTEGER
		do
			from until
				clashes.item (i) > Free_watermark
			loop
				i := i + 1
			end
			Result := items.item (i)
		end

	last: G is
			-- Last item in table
		local
			i: INTEGER
		do
			from
				i := capacity - 1
			until
				clashes.item (i) > Free_watermark
			loop
				i := i - 1
			end
			Result := items.item (i)
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
		do
			!! Result.make (Current)
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
			a_tester: like equality_tester
		do
			i := capacity - 1
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 0 loop
					if clashes.item (i) > Free_watermark then
						if a_tester.test (items.item (i), v) then
							Result := Result + 1
						end
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 0 loop
					if clashes.item (i) > Free_watermark then
						if items.item (i) = v then
							Result := Result + 1
						end
					end
					i := i - 1
				end
			end
		end

feature -- Status report

	has (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		do
			search_position (k)
			Result := position /= No_position
		end

	has_item (v: G): BOOLEAN is
			-- Does table include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_tester: like equality_tester
		do
			i := capacity - 1
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 0 loop
					if
						clashes.item (i) > Free_watermark and then
						a_tester.test (items.item (i), v)
					then
						Result := True
						i := -1  -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 0 loop
					if
						clashes.item (i) > Free_watermark and then
						items.item (i) = v
					then
						Result := True
						i := -1  -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

	found: BOOLEAN is
			-- Did last call to `search' succeed?
		do
			Result := found_position /= No_position
		ensure
			definition: Result = (found_position /= No_position)
		end

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
		do
			search_position (k)
			found_position := position
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
		do
			if Current = other then
				Result := True
			elseif same_type (other) and count = other.count then
				from
					i := capacity - 1
					Result := True
				until
					not Result or i < 0
				loop
					if clashes.item (i) > Free_watermark then
						a_key := keys.item (i)
						Result := other.has (a_key) and then
							other.item (a_key) = items.item (i)
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
				items := clone (items)
				keys := clone (keys)
				slots := clone (slots)
				clashes := clone (clashes)
			end
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
			-- Do not move cursors.
		do
			unset_found_item
			search_position (k)
			check has_k: position /= No_position end
			items.put (v, position)
		end

	replace_found_item (v: G) is
			-- Replace item associated with
			-- the key of `found_item' by `v'.
			-- Do not move cursors.
		require
			item_found: found
		do
			items.put (v, found_position)
		ensure
			replaced: found_item = v
			same_count: count = old count
		end

	put (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Do not move cursors.
		require
			not_full: not is_full
			valid_key: valid_key (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				items.put (v, position)
			else
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				h := slots_position
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (v, i)
				keys.put (k, i)
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
		end

	put_new (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Do not move cursors.
		require
			not_full: not is_full
			valid_key: valid_key (k)
			new_item: not has (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			i := free_slot
			free_slot := Free_offset - clashes.item (i)
			h := hash_position (k)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			items.put (v, i)
			keys.put (k, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
		end

	force (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Move cursors `off' when resizing.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				items.put (v, position)
			else
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (k)
				else
					h := slots_position
				end
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (v, i)
				keys.put (k, i)
				count := count + 1
			end
		end

	force_new (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Move cursors `off' when resizing.
		local
			i, h: INTEGER
		do
			unset_found_item
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			i := free_slot
			free_slot := Free_offset - clashes.item (i)
			h := hash_position (k)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			items.put (v, i)
			keys.put (k, i)
			count := count + 1
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
			-- Move any cursors at this position `forth'.
		local
			dead_key: K
			dead_item: G
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				move_cursors_forth (position)
				if clashes_previous_position = No_position then
					slots.put (clashes.item (position), slots_position)
				else
					clashes.put (clashes.item (position), clashes_previous_position)
				end
				clashes.put (Free_offset - free_slot, position)
				items.put (dead_item, position)
				keys.put (dead_key, position)
				free_slot := position
				count := count - 1
			end
		end

	wipe_out is
			-- Remove all items from table.
			-- Move all cursors `off'.
		local
			i: INTEGER
			dead_key: K
			dead_item: G
		do
			move_all_cursors_after
			unset_found_item
			from
				i := capacity - 1
				free_slot := i
			until
				i < 0
			loop
				items.put (dead_item, i)
				keys.put (dead_key, i)
				clashes.put (Free_offset - (i - 1), i)
				i := i - 1
			end
			from
				i := modulus
			until
				i < 0
			loop
				slots.put (No_position, i)
				i := i - 1
			end
			count := 0
			position := No_position
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize table so that it can contain
			-- at least `n' items. Do not lose any item.
			-- Move all cursors `off'.
		local
			i, h: INTEGER
		do
			move_all_cursors_after
			unset_found_item
			modulus := new_modulus (n)
			slots := FIXED_INTEGER_ARRAY_.resize (slots, modulus + 1)
			from i := modulus until i < 0 loop
				slots.put (No_position, i)
				i := i - 1
			end
			from
				i := capacity - 1
			until
				i < 0
			loop
				if clashes.item (i) > Free_watermark then
					h := hash_position (keys.item (i))
					clashes.put (slots.item (h), i)
					slots.put (i, h)
				end
				i := i - 1
			end
			items := FIXED_ITEM_ARRAY_.resize (items, n)
			keys := FIXED_KEY_ARRAY_.resize (keys, n)
			clashes := FIXED_INTEGER_ARRAY_.resize (clashes, n)
			from
				i := capacity
				clashes.put (Free_offset - free_slot, i)
				i := i + 1
			until
				i >= n
			loop
				clashes.put (Free_offset - (i - 1), i)
				i := i + 1
			end
			free_slot := n - 1
			capacity := n
			position := No_position
		end

feature {DS_SPARSE_TABLE_CURSOR} -- Implementation

	items: like FIXED_ITEM_ARRAY_TYPE
			-- Storage for items of the table indexed from 0 to `capacity-1'

	keys: like FIXED_KEY_ARRAY_TYPE
			-- Storage for keys of the table indexed from 0 to `capacity-1'

	clashes: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items' and `keys' when there is clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of
			-- free slot positions with indexes less that or equal
			-- to `Free_watermark'

	valid_position (i: INTEGER): BOOLEAN is
			-- Is there a slot at position `i'?
		do
			Result := 0 <= i and i < capacity
		ensure
			definition: Result = (0 <= i and i < capacity)
		end

	valid_slot (i: INTEGER): BOOLEAN is
			-- Is there an item at position `i'?
		require
			valid_i: valid_position (i)
		do
			Result := clashes.item (i) > Free_watermark
		end

feature {NONE} -- Implementation

	search_position (k: K) is
			-- Search for position where key is equal to `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			slots_position_set: slots_position = hash_position (k)
			clashes_previous_previous_set: (position /= No_position and
				clashes_previous_position /= No_position) implies
					(clashes.item (clashes_previous_position) = position)
			clashes_previous_previous_not_set: (position /= No_position and
				clashes_previous_position = No_position) implies
					(slots.item (slots_position) = position)
		end

	hash_position (k: K): INTEGER is
			-- Hash position of `k' in `slots'
		require
			valid_key: valid_key (k)
		deferred
		ensure
			valid_position: Result >= 0 and result <= modulus
		end

	slots: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items' and `keys', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void keys)

	modulus: INTEGER
			-- Upper bound of `slots'

	free_slot: INTEGER
			-- Index of first free slot in `items' and `keys';
			-- `No_position' if table is full

	position: INTEGER
			-- Last position in `keys' and `items'
			-- found by `search_position'

	slots_position: INTEGER
			-- Last position in `slots' found by `search_position'

	clashes_previous_position: INTEGER
			-- Previous position of the last position in
			-- `clashes' found by `search_position'

	found_position: INTEGER
			-- Position of the last item found by `search';
			-- `No_position' if not found

	FIXED_ITEM_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

	FIXED_KEY_ARRAY_: KL_FIXED_ARRAY_ROUTINES [K]
			-- Routines that ought to be in FIXED_ARRAY

	unset_found_item is
			-- Get rig of `found_item'.
		do
			found_position := No_position
		ensure
			not_found: not found
			found_position_unset: found_position = No_position
		end

feature {NONE} -- Constants

	No_position: INTEGER is -1
			-- Not valid position mark

	Free_watermark: INTEGER is -2
			-- Limit between free and occupied slots in `clashes'

	Free_offset: INTEGER is -3
			-- Offset used to make sure that free slot indexes
			-- are below `Free_watermark' in `clashes'

feature {NONE} -- Cursor movements

	internal_cursor: like new_cursor
			-- Internal cursor

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
			valid_new_position: valid_position (new_position) and then valid_slot (new_position)
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
			i, nb: INTEGER
		do
				-- Search next valid position.
			from
				i := old_position + 1
				nb := capacity - 1
			until
				i > nb or else
				clashes.item (i) > Free_watermark
			loop
				i := i + 1
			end
			if i > nb then
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

	new_modulus (a_capacity: INTEGER): INTEGER is
			-- Value for `modulus' which can accommodate
			-- `a_capacity' items
		require
			a_capacity_positive: a_capacity >= 0
		do
			Result := (a_capacity + 1) * 3 // 2
		ensure
			modulus_large_enough: Result > a_capacity
		end

invariant

	items_not_void: items /= Void
	items_count: items.count = capacity
	keys_not_void: keys /= Void
	keys_count: keys.count = capacity
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = capacity
	slots_not_void: slots /= Void
	slots_count: slots.count = modulus + 1
	valid_position: position = No_position or else valid_position (position)
	capacity_constraint: capacity < (modulus + 1)

end -- class DS_SPARSE_TABLE
