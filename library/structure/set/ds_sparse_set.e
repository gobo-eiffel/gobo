indexing

	description:

		"Sets implemented with sparse arrays. Ancestor of hash sets %
		%which should supply its hashing mechanism."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2000, Eric Bezault and others"
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

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty set and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		local
			i: INTEGER
		do
			!! FIXED_ITEM_ARRAY_
			items := FIXED_ITEM_ARRAY_.make (n)
			clashes := FIXED_INTEGER_ARRAY_.make (n)
			from
				i := 0
				free_slot := i
			until
				i >= n
			loop
				clashes.put (Free_offset - (i + 1), i)
				i := i + 1
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

	make_default is
			-- Create an empty set and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion.
		do
			make (default_capacity)
		ensure then
			before: before
		end

feature -- Access

	infix "@", item (v: G): G is
			-- Item equal to `v' held in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			search_position (v)
			check hash_v: position /= No_position end
			Result := items.item (position)
		end

	found_item: G is
			-- Item found by last call to `search'
		require
			item_found: found
		do
			Result := items.item (found_position)
		end

	first: G is
			-- First item in set
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
			-- Last item in set
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

	new_cursor: DS_SPARSE_SET_CURSOR [G] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
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
		do
			search_position (v)
			Result := position /= No_position
		end

	found: BOOLEAN is
			-- Did last call to `search' succeed?
		do
			Result := found_position /= No_position
		ensure
			definition: Result = (found_position /= No_position)
		end

	is_subset (other: DS_SET [G]): BOOLEAN is
			-- Are all items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			an_item: G
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif is_empty then
				Result := True
			elseif count <= other.count then
				from
					i := capacity - 1
					Result := True
				until
					not Result or i < 0
				loop
					if clashes.item (i) > Free_watermark then
						an_item := items.item (i)
						Result := other.has (an_item)
					end
					i := i - 1
				end
			end
		end

	is_disjoint (other: DS_SET [G]): BOOLEAN is
			-- Are none of the items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			an_item: G
			i: INTEGER
		do
			if other.is_empty then
				Result := True
			elseif Current /= other then
				from
					i := capacity - 1
					Result := True
				until
					not Result or i < 0
				loop
					if clashes.item (i) > Free_watermark then
						an_item := items.item (i)
						Result := not other.has (an_item)
					end
					i := i - 1
				end
			end
		end

feature -- Search

	search (v: G) is
			-- Search for item equal to `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not Void, use `=' criterion otherwise.)
			-- If found, set `found' to true, and make that
			-- item available in `found_item'.
		do
			search_position (v)
			found_position := position
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
			an_item: G
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif same_type (other) and count = other.count and same_equality_tester (other) then
				from
					i := capacity - 1
					Result := True
				until
					not Result or i < 0
				loop
					if clashes.item (i) > Free_watermark then
						an_item := items.item (i)
						Result := other.has (an_item)
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
				slots := clone (slots)
				clashes := clone (clashes)
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
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
			if position /= No_position then
				items.put (v, position)
			else
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				h := slots_position
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (v, i)
				count := count + 1
			end
		ensure
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
			inserted: has (v) and then item (v) = v
		end

	put_new (v: G) is
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		require
			not_full: not is_full
			new_item: not has (v)
		local
			i, h: INTEGER
		do
			unset_found_item
			i := free_slot
			free_slot := Free_offset - clashes.item (i)
			h := hash_position (v)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			items.put (v, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (v) and then item (v) = v
		end

	force (v: G) is
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
			-- Move cursors `off' when resizing.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
			if position /= No_position then
				items.put (v, position)
			else
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (v)
				else
					h := slots_position
				end
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (v, i)
				count := count + 1
			end
		end

	force_new (v: G) is
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
			-- Move cursors `off' when resizing.
		require
			new_item: not has (v)
		local
			i, h: INTEGER
		do
			unset_found_item
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			i := free_slot
			free_slot := Free_offset - clashes.item (i)
			h := hash_position (v)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			items.put (v, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (v) and then item (v) = v
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
			if position /= No_position then
				remove_position (position)
			end
		end

	remove_found_item is
			-- Remove item found by last call to `search'.
			-- Move any cursors at this position `forth'.
		require
			item_found: found
		do
			remove_position (found_position)
			unset_found_item
		ensure
			one_less: count = old count - 1
		end

	wipe_out is
			-- Remove all items from set.
			-- Move all cursors `off'.
		local
			i, nb: INTEGER
			dead_item: G
		do
			move_all_cursors_after
			unset_found_item
			if count > 0 then
				from
					i := 0
					nb := capacity
					free_slot := i
				until
					i >= nb
				loop
					items.put (dead_item, i)
					clashes.put (Free_offset - (i + 1), i)
					i := i + 1
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
			end
			position := No_position
		end

feature -- Basic operations

	union (other: DS_SET [G]) is
			-- Add all items of `other' to current set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		local
			nb: INTEGER
			an_item: G
			a_cursor: DS_SET_CURSOR [G]
		do
			nb := count + other.count
			if nb > capacity then
				resize (new_capacity (nb))
			end
			a_cursor := other.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_item := a_cursor.item
				if not has (an_item) then
					put (an_item)
				end
				a_cursor.forth
			end
		end

	intersect (other: DS_SET [G]) is
			-- Remove all items not included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		local
			i: INTEGER
			an_item: G
		do
			move_all_cursors_after
			unset_found_item
			i := capacity - 1
			from until i < 0 loop
				if clashes.item (i) > Free_watermark then
					an_item := items.item (i)
					if not other.has (an_item) then
						remove_position (i)
					end
				end
				i := i - 1
			end
		end

	subtract (other: DS_SET [G]) is
			-- Remove all items also included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		local
			i: INTEGER
			an_item: G
		do
			move_all_cursors_after
			unset_found_item
			i := capacity - 1
			from until i < 0 loop
				if clashes.item (i) > Free_watermark then
					an_item := items.item (i)
					if other.has (an_item) then
						remove_position (i)
					end
				end
				i := i - 1
			end
		end

	symdif (other: DS_SET [G]) is
			-- Add items of `other' which are not included
			-- in current set and remove those which are.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		local
			nb: INTEGER
			an_item: G
			a_cursor: DS_SET_CURSOR [G]
		do
			move_all_cursors_after
			unset_found_item
			nb := count + other.count
			if nb > capacity then
				resize (new_capacity (nb))
			end
			a_cursor := other.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_item := a_cursor.item
				if has (an_item) then
					remove (an_item)
				else
					put (an_item)
				end
				a_cursor.forth
			end
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize set so that it can contain
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
					h := hash_position (items.item (i))
					clashes.put (slots.item (h), i)
					slots.put (i, h)
				end
				i := i - 1
			end
			items := FIXED_ITEM_ARRAY_.resize (items, n)
			clashes := FIXED_INTEGER_ARRAY_.resize (clashes, n)
			from
				i := capacity
			until
				i >= n
			loop
				clashes.put (Free_offset - (i + 1), i)
				i := i + 1
			end
			capacity := n
			position := No_position
		end

feature {DS_SPARSE_SET_CURSOR} -- Implementation

	items: like FIXED_ITEM_ARRAY_TYPE
			-- Storage for items of the set indexed from 0 to `capacity-1'

	clashes: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items' when there is clashes
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

	search_position (v: G) is
			-- Search for position where item is equal to `v'
			-- or to possible insertion position otherwise.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			prev: INTEGER
			a_tester: like equality_tester
		do
			if v = Void then
				position := slots.item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			else
				a_tester := equality_tester
				if a_tester /= Void then
					if
						position = No_position or else
						not a_tester.test (v, items.item (position))
					then
						from
							slots_position := hash_position (v)
							i := slots.item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if a_tester.test (v, items.item (i)) then
								position := i
								i := No_position -- Jump out of the loop.
							else
								prev := i
								i := clashes.item (i)
							end
						end
						clashes_previous_position := prev
					end
				else
					if
						position = No_position or else
						v /= items.item (position)
					then
						from
							slots_position := hash_position (v)
							i := slots.item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if v = items.item (i) then
								position := i
								i := No_position -- Jump out of the loop.
							else
								prev := i
								i := clashes.item (i)
							end
						end
						clashes_previous_position := prev
					end
				end
			end
		ensure
			slots_position_set: slots_position = hash_position (v)
			clashes_previous_position_set: (position /= No_position and
				clashes_previous_position /= No_position) implies
					(clashes.item (clashes_previous_position) = position)
			clashes_previous_position_not_set: (position /= No_position and
				clashes_previous_position = No_position) implies
					(slots.item (slots_position) = position)
		end

	hash_position (v: G): INTEGER is
			-- Hash position of `v' in `slots'
		deferred
		ensure
			valid_position: Result >= 0 and Result <= modulus
		end

	remove_position (i: INTEGER) is
			-- Remove item at position `i'.
			-- Move any cursors at this position `forth'.
		require
			valid_position: valid_position (i)
			valid_slot: valid_slot (i)
		local
			dead_item: G
		do
			position := i
			move_cursors_forth (position)
			if clashes_previous_position = No_position then
				slots.put (clashes.item (position), slots_position)
			else
				clashes.put (clashes.item (position), clashes_previous_position)
			end
			clashes.put (Free_offset - free_slot, position)
			items.put (dead_item, position)
			free_slot := position
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	slots: like FIXED_INTEGER_ARRAY_TYPE
			-- Indexes in `items', indexed by hash codes
			-- from 0 to `modulus' (the entry at index `modulus'
			-- being reserved for void items)

	modulus: INTEGER
			-- Upper bound of `slots'

	free_slot: INTEGER
			-- Index of first free slot in `items';
			-- `No_position' if set is full

	position: INTEGER
			-- Last position in `items'
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
	clashes_not_void: clashes /= Void
	clashes_count: clashes.count = capacity
	slots_not_void: slots /= Void
	slots_count: slots.count = modulus + 1
	valid_position: position = No_position or else valid_position (position)
	capacity_constraint: capacity < (modulus + 1)

end -- class DS_SPARSE_SET
