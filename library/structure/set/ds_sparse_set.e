indexing

	description:

		"Sets implemented with sparse arrays. Ancestor of hash sets %
		%which should supply its hashing mechanism."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
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
			occurrences,
			equality_tester_settable
		redefine
			has, new_cursor
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
		end

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty set and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			capacity := n
			make_items (n + 1)
			make_clashes (n + 1)
			modulus := new_modulus (n)
			make_slots (modulus + 1)
			last_position := 0
			free_slot := No_position
			position := No_position
			unset_found_item
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
			Result := items_item (position)
		end

	found_item: G is
			-- Item found by last call to `search'
		require
			item_found: found
		do
			Result := items_item (found_position)
		end

	first: G is
			-- First item in set
		local
			i: INTEGER
		do
			from i := 1 until
				clashes_item (i) > Free_watermark
			loop
				i := i + 1
			end
			Result := items_item (i)
		end

	last: G is
			-- Last item in set
		local
			i: INTEGER
		do
			from
				i := last_position
			until
				clashes_item (i) > Free_watermark
			loop
				i := i - 1
			end
			Result := items_item (i)
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
					i := last_position
					Result := True
				until
					not Result or i < 1
				loop
					if clashes_item (i) > Free_watermark then
						an_item := items_item (i)
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
			if is_empty or other.is_empty then
				Result := True
			elseif Current /= other then
				from
					i := last_position
					Result := True
				until
					not Result or i < 1
				loop
					if clashes_item (i) > Free_watermark then
						an_item := items_item (i)
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
			-- Do not take cursor positions, and capacity into
			-- account, but `equality_tester' should be the same.
		local
			an_item: G
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif same_type (other) and count = other.count and same_equality_tester (other) then
				from
					i := last_position
					Result := True
				until
					not Result or i < 1
				loop
					if clashes_item (i) > Free_watermark then
						an_item := items_item (i)
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
				clone_items
				clone_slots
				clone_clashes
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
				items_put (v, position)
			else
				i := free_slot
				if i = No_position then
					last_position := last_position + 1
					i := last_position
				else
					free_slot := Free_offset - clashes_item (i)
				end
				h := slots_position
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				items_put (v, i)
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
			if i = No_position then
				last_position := last_position + 1
				i := last_position
			else
				free_slot := Free_offset - clashes_item (i)
			end
			h := hash_position (v)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			items_put (v, i)
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
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
			if position /= No_position then
				items_put (v, position)
			else
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (v)
				else
					h := slots_position
				end
				i := free_slot
				if i = No_position then
					last_position := last_position + 1
					i := last_position
				else
					free_slot := Free_offset - clashes_item (i)
				end
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				items_put (v, i)
				count := count + 1
			end
		end

	force_new (v: G) is
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
			-- Do not move cursors.
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
			if i = No_position then
				last_position := last_position + 1
				i := last_position
			else
				free_slot := Free_offset - clashes_item (i)
			end
			h := hash_position (v)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			items_put (v, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (v) and then item (v) = v
		end

	force_last (v: G) is
			-- Add `v' at the end of set if not already included,
			-- or replace it otherwise.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
			if position /= No_position then
				items_put (v, position)
			else
				last_position := last_position + 1
				i := last_position
				if i > capacity then
					resize (new_capacity (i))
					h := hash_position (v)
				else
					h := slots_position
				end
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				items_put (v, i)
				count := count + 1
			end
		ensure
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
			inserted: has (v) and then item (v) = v
			last: (not old has (v)) implies last = v
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
		do
			move_all_cursors_after
			unset_found_item
			if count > 0 then
				items_wipe_out
				clashes_wipe_out
				slots_wipe_out
				last_position := 0
				free_slot := No_position
				count := 0
			end
			position := No_position
		end

feature -- Basic operations

	append (other: DS_SET [G]) is
			-- Add all items of `other' to current set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		local
			nb: INTEGER
			an_item: G
			a_cursor: DS_SET_CURSOR [G]
		do
			unset_found_item
			nb := count + other.count
			if nb > capacity then
				resize (new_capacity (nb))
			end
			a_cursor := other.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_item := a_cursor.item
				if not has (an_item) then
					put_new (an_item)
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
			i := last_position
			from until i < 1 loop
				if clashes_item (i) > Free_watermark then
					an_item := items_item (i)
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
			i := last_position
			from until i < 1 loop
				if clashes_item (i) > Free_watermark then
					an_item := items_item (i)
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
				search (an_item)
				if found then
					remove_found_item
				else
					put_new (an_item)
				end
				a_cursor.forth
			end
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize set so that it can contain
			-- at least `n' items. Do not lose any item.
			-- Do not move cursors.
		local
			m: INTEGER
			i, h: INTEGER
		do
			unset_found_item
			m := new_modulus (n)
			slots_resize (m + 1)
			from i := modulus until i < 0 loop
				slots_put (No_position, i)
				i := i - 1
			end
			modulus := m
			from i := last_position until i < 1 loop
				if clashes_item (i) > Free_watermark then
					h := hash_position (items_item (i))
					clashes_put (slots_item (h), i)
					slots_put (i, h)
				end
				i := i - 1
			end
			items_resize (n + 1)
			clashes_resize (n + 1)
			capacity := n
			position := No_position
		end

feature {DS_SPARSE_SET_CURSOR} -- Implementation

	last_position: INTEGER
			-- All slots to the right of this position
			-- are guaranteed to be free

	items_item (i: INTEGER): G is
			-- Item at position `i' in `items'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		end

	clashes_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `clashes'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		end

	valid_position (i: INTEGER): BOOLEAN is
			-- Is there a slot at position `i'?
		do
			Result := 1 <= i and i <= capacity
		ensure
			definition: Result = (1 <= i and i <= capacity)
		end

	valid_slot (i: INTEGER): BOOLEAN is
			-- Is there an item at position `i'?
		require
			valid_i: valid_position (i)
		do
			Result := i <= last_position and then clashes_item (i) > Free_watermark
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
				position := slots_item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			else
				a_tester := equality_tester
				if a_tester /= Void then
					if
						position = No_position or else
						not a_tester.test (v, items_item (position))
					then
						from
							slots_position := hash_position (v)
							i := slots_item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if a_tester.test (v, items_item (i)) then
								position := i
								i := No_position -- Jump out of the loop.
							else
								prev := i
								i := clashes_item (i)
							end
						end
						clashes_previous_position := prev
					end
				else
					if
						position = No_position or else
						v /= items_item (position)
					then
						from
							slots_position := hash_position (v)
							i := slots_item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if v = items_item (i) then
								position := i
								i := No_position -- Jump out of the loop.
							else
								prev := i
								i := clashes_item (i)
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
					(clashes_item (clashes_previous_position) = position)
			clashes_previous_position_not_set: (position /= No_position and
				clashes_previous_position = No_position) implies
					(slots_item (slots_position) = position)
		end

	hash_position (v: G): INTEGER is
			-- Hash position of `v' in `slots'
		deferred
		ensure
			valid_position: Result >= 0 and Result <= modulus
			void_position: (v = Void) = (Result = modulus)
		end

	remove_position (i: INTEGER) is
			-- Remove item at position `i'.
			-- Move any cursors at this position `forth'.
		require
			valid_position: valid_position (i)
			valid_slot: valid_slot (i)
		local
			v, dead_item: G
			h: INTEGER
		do
			if i /= position then
				v := items_item (i)
				h := hash_position (v)
				if slots_item (h) = i then
					position := i
					slots_position := h
					clashes_previous_position := No_position
				else
					search_position (v)
				end
			end
			move_cursors_forth (position)
			if clashes_previous_position = No_position then
				slots_put (clashes_item (position), slots_position)
			else
				clashes_put (clashes_item (position), clashes_previous_position)
			end
			items_put (dead_item, position)
			if free_slot = No_position and position = last_position then
				last_position := last_position - 1
				clashes_put (No_position, position)
			else
				clashes_put (Free_offset - free_slot, position)
				free_slot := position
			end
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	make_items (n: INTEGER) is
			-- Create storage for items of the set indexed
			-- from 0 to `n-1' (position 0 is not used).
		require
			positive_n: n > 0
		deferred
		end

	items_put (v: G; i: INTEGER) is
			-- Put `v' at position `i' in `items'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		ensure
			inserted: items_item (i) = v
		end

	clone_items is
			-- Clone `items'.
		deferred
		end

	items_resize (n: INTEGER) is
			-- Resize `items'.
		require
			n_large_enough: n > capacity
		deferred
		end

	items_wipe_out is
			-- Wipe out items in `items'.
		deferred
		end

	make_clashes (n: INTEGER) is
			-- Create table of indexes in `items' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.
		require
			positive_n: n > 0
		deferred
		end

	clashes_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `clashes'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		ensure
			inserted: clashes_item (i) = v
		end

	clone_clashes is
			-- Clone `clashes'.
		deferred
		end

	clashes_resize (n: INTEGER) is
			-- Resize `clashes'.
		require
			n_large_enough: n > capacity
		deferred
		end

	clashes_wipe_out is
			-- Wipe out items in `clashes'.
		deferred
		end

	make_slots (n: INTEGER) is
			-- Create table of indexes in `items', indexed by
			-- hash codes from 0 to `n-1' (the entry at index
			-- `n-1' being reserved for void items)
		require
			positive_n: n > 0
		deferred
		end

	slots_item (i: INTEGER): INTEGER is
			-- Item at position `i' in `slots'
		require
			i_large_enough: i >= 0
			i_small_enough: i <= modulus
		deferred
		end

	slots_put (v: INTEGER; i: INTEGER) is
			-- Put `v' at position `i' in `slots'.
		require
			i_large_enough: i >= 0
			i_small_enough: i <= modulus
		deferred
		ensure
			inserted: slots_item (i) = v
		end

	clone_slots is
			-- Clone `slots'.
		deferred
		end

	slots_resize (n: INTEGER) is
			-- Resize `slots'.
		require
			n_large_enough: n > modulus
		deferred
		end

	slots_wipe_out is
			-- Wipe out items in `slots'.
		deferred
		end

	modulus: INTEGER
			-- Upper bound of `slots'

	free_slot: INTEGER
			-- Index of first free slot in `items';
			-- `No_position' if there is no free slot at positions
			-- between 1 and `last_position'

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

	unset_found_item is
			-- Get rig of `found_item'.
		do
			found_position := No_position
		ensure
			not_found: not found
			found_position_unset: found_position = No_position
		end

feature {NONE} -- Constants

	No_position: INTEGER is 0
			-- Not valid position mark

	Free_watermark: INTEGER is -1
			-- Limit between free and occupied slots in `clashes'

	Free_offset: INTEGER is -1
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
				nb := last_position
			until
				i > nb or else
				clashes_item (i) > Free_watermark
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

	valid_position: position = No_position or else valid_position (position)
	capacity_constraint: capacity < modulus

end -- class DS_SPARSE_SET
