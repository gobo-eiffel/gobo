indexing

	description:

		"Sparse tables, implemented with arrays. Ancestor of hash tables %
		%which should supply their hashing mechanisms."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			has_item, occurrences,
			cursor_off
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
		end

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			!! key_equality_tester
			make_with_equality_testers (n, Void, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			!! equality_tester
			!! key_equality_tester
			make_with_equality_testers (n, equality_tester, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_default is
			-- Create an empty table and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		do
			make (default_capacity)
		ensure then
			before: before
		end

	make_map (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			make_with_equality_testers (n, Void, Void)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_map_equal (n: INTEGER) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			!! equality_tester
			make_with_equality_testers (n, equality_tester, Void)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_map_default is
			-- Create an empty table and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		do
			make_map (default_capacity)
		ensure
			empty: is_empty
			capacity_set: capacity = default_capacity
			before: before
		end

	make_with_equality_testers (n: INTEGER;
		an_item_tester: like equality_tester;
		a_key_tester: like key_equality_tester) is
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `an_item_tester' as comparison criterion for items.
			-- Use `a_key_tester' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			equality_tester := an_item_tester
			key_equality_tester := a_key_tester
			capacity := n
			make_items (n + 1)
			make_keys (n + 1)
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
			equality_tester_set: equality_tester = an_item_tester
			key_equality_tester_set: key_equality_tester = a_key_tester
		end

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		do
			search_position (k)
			check hash_k: position /= No_position end
			Result := items_item (position)
		end

	key (k: K): K is
			-- Key associated with `k'
		require
			has_k: has (k)
		do
			search_position (k)
			check hash_k: position /= No_position end
			Result := keys_item (position)
		end

	found_item: G is
			-- Item found by last call to `search'
		require
			item_found: found
		do
			Result := items_item (found_position)
		end

	found_key: K is
			-- Key of item found by last call to `search'
		require
			key_found: found
		do
			Result := keys_item (found_position)
		end

	first: G is
			-- First item in table
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
			-- Last item in table
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

	key_for_iteration: K is
			-- Key at internal cursor position
		require
			not_off: not off
		do
			Result := cursor_key (internal_cursor)
		end

	new_cursor: DS_SPARSE_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

	key_equality_tester: DS_EQUALITY_TESTER [K]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

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
			i := last_position
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 1 loop
					if clashes_item (i) > Free_watermark then
						if a_tester.test (items_item (i), v) then
							Result := Result + 1
						end
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 1 loop
					if clashes_item (i) > Free_watermark then
						if items_item (i) = v then
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
			i := last_position
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 1 loop
					if
						clashes_item (i) > Free_watermark and then
						a_tester.test (items_item (i), v)
					then
						Result := True
						i := 0  -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 1 loop
					if
						clashes_item (i) > Free_watermark and then
						items_item (i) = v
					then
						Result := True
						i := 0  -- Jump out of the loop.
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

	key_equality_tester_settable (a_tester: like key_equality_tester): BOOLEAN is
			-- Can `set_key_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
		do
			Result := is_empty
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
					i := last_position
					Result := True
				until
					not Result or i < 1
				loop
					if clashes_item (i) > Free_watermark then
						a_key := keys_item (i)
						Result := other.has (a_key) and then
							other.item (a_key) = items_item (i)
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
				clone_items
				clone_keys
				clone_slots
				clone_clashes
			end
		end

feature -- Setting

	set_key_equality_tester (a_tester: like key_equality_tester) is
			-- Set `key_equality_tester' to `a_tester'.
			-- A void key equality tester means that `='
			-- will be used as comparison criterion.
		require
			key_equality_tester_settable: key_equality_tester_settable (a_tester)
		do
			key_equality_tester := a_tester
		ensure
			key_equality_tester_set: key_equality_tester = a_tester
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
			-- Do not move cursors.
		do
			unset_found_item
			search_position (k)
			check has_k: position /= No_position end
			items_put (v, position)
		end

	replace_found_item (v: G) is
			-- Replace item associated with
			-- the key of `found_item' by `v'.
			-- Do not move cursors.
		require
			item_found: found
		do
			items_put (v, found_position)
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
				keys_put (k, i)
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
			if i = No_position then
				last_position := last_position + 1
				i := last_position
			else
				free_slot := Free_offset - clashes_item (i)
			end
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			items_put (v, i)
			keys_put (k, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
		end

	put_last (v: G; k: K) is
			-- Associate `v' with key `k'. Put `v' at the end of table
			-- if no item was already associated with `k', or replace
			-- existing item otherwise.
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
				items_put (v, position)
			else
				i := last_position + 1
				if i > capacity then
					compress
					i := last_position + 1
				end
				h := slots_position
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				items_put (v, i)
				keys_put (k, i)
				last_position := i
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
			last: (not old has (k)) implies last = v
		end

	force (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				items_put (v, position)
			else
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (k)
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
				keys_put (k, i)
				count := count + 1
			end
		end

	force_new (v: G; k: K) is
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Do not move cursors.
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
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			items_put (v, i)
			keys_put (k, i)
			count := count + 1
		end

	force_last (v: G; k: K) is
			-- Associate `v' with key `k'. Put `v' at the end of table
			-- if no item was already associated with `k', or replace
			-- existing item otherwise.
			-- Resize table if necessary.
			-- Do not move cursors.
		require
			valid_key: valid_key (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				items_put (v, position)
			else
				i := last_position + 1
				if i > capacity then
					resize (new_capacity (i))
					h := hash_position (k)
				else
					h := slots_position
				end
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				items_put (v, i)
				keys_put (k, i)
				last_position := i
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
			last: (not old has (k)) implies last = v
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
			-- Move any cursors at this position `forth'.
		do
			unset_found_item
			search_position (k)
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
			-- Remove all items from table.
			-- Move all cursors `off'.
		do
			move_all_cursors_after
			unset_found_item
			if count > 0 then
				items_wipe_out
				keys_wipe_out
				clashes_wipe_out
				slots_wipe_out
				last_position := 0
				free_slot := No_position
				count := 0
			end
			position := No_position
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize table so that it can contain
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
					h := hash_position (keys_item (i))
					clashes_put (slots_item (h), i)
					slots_put (i, h)
				end
				i := i - 1
			end
			items_resize (n + 1)
			keys_resize (n + 1)
			clashes_resize (n + 1)
			capacity := n
			position := No_position
		end

feature -- Optimization

	compress is
			-- Remove holes between stored items. May avoid
			-- resizing when calling `force_last' for example.
			-- Do not lose any item. Do not move cursors.
		local
			i, j, nb, h: INTEGER
			dead_item: G
			dead_key: K
		do
			if last_position /= count then
				unset_found_item
				nb := last_position
				from i := 1 until i > nb loop
					if clashes_item (i) > Free_watermark then
						j := j + 1
						if j /= i then
							items_put (items_item (i), j)
							keys_put (keys_item (i), j)
							move_all_cursors (i, j)
						end
					end
					i := i + 1
				end
				from j := j + 1 until j > nb loop
					items_put (dead_item, j)
					keys_put (dead_key, j)
					j := j + 1
				end
				nb := count
				from i := 1 until i > nb loop
					h := hash_position (keys_item (i))
					clashes_put (slots_item (h), i)
					slots_put (i, h)
					i := i + 1
				end
				clashes_wipe_out
				slots_wipe_out
				last_position := nb
				position := No_position
			end
		ensure
			same_count: count = old count
			compressed: last_position = count
			not_reszied: capacity = old capacity
		end

feature {DS_SPARSE_TABLE_CURSOR} -- Implementation

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

	items_put (v: G; i: INTEGER) is
			-- Put `v' at position `i' in `items'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		ensure
			inserted: items_item (i) = v
		end

	keys_item (i: INTEGER): K is
			-- Item at position `i' in `keys'
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

	search_position (k: K) is
			-- Search for position where key is equal to `k'.
			-- or to possible insertion position otherwise.
			-- (Use `key_equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			valid_key: valid_key (k)
		local
			i: INTEGER
			prev: INTEGER
			a_tester: like key_equality_tester
		do
			if k = Void then
				position := slots_item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			else
				a_tester := key_equality_tester
				if a_tester /= Void then
					if
						position = No_position or else
						not a_tester.test (k, keys_item (position))
					then
						from
							slots_position := hash_position (k)
							i := slots_item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if a_tester.test (k, keys_item (i)) then
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
						k /= keys_item (position)
					then
						from
							slots_position := hash_position (k)
							i := slots_item (slots_position)
							position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if k = keys_item (i) then
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
			slots_position_set: slots_position = hash_position (k)
			clashes_previous_position_set: (position /= No_position and
				clashes_previous_position /= No_position) implies
					(clashes_item (clashes_previous_position) = position)
			clashes_previous_position_not_set: (position /= No_position and
				clashes_previous_position = No_position) implies
					(slots_item (slots_position) = position)
		end

	hash_position (k: K): INTEGER is
			-- Hash position of `k' in `slots'
		require
			valid_key: valid_key (k)
		deferred
		ensure
			valid_position: Result >= 0 and Result <= modulus
			void_position: (k = Void) = (Result = modulus)
		end

	remove_position (i: INTEGER) is
			-- Remove item at position `i'.
			-- Move any cursors at this position `forth'.
		require
			valid_position: valid_position (i)
			valid_slot: valid_slot (i)
		local
			dead_item: G
			k, dead_key: K
			h: INTEGER
		do
			if i /= position then
				k := keys_item (i)
				h := hash_position (k)
				if slots_item (h) = i then
					position := i
					slots_position := h
					clashes_previous_position := No_position
				else
					search_position (k)
				end
			end
			move_cursors_forth (position)
			if clashes_previous_position = No_position then
				slots_put (clashes_item (position), slots_position)
			else
				clashes_put (clashes_item (position), clashes_previous_position)
			end
			items_put (dead_item, position)
			keys_put (dead_key, position)
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
			-- Create storage for items of the table indexed
			-- from 0 to `n-1' (position 0 is not used).
		require
			positive_n: n > 0
		deferred
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

	make_keys (n: INTEGER) is
			-- Create storage for keys of the set indexed
			-- from 0 to `n-1' (position 0 is not used).
		require
			positive_n: n > 0
		deferred
		end

	keys_put (k: K; i: INTEGER) is
			-- Put `k' at position `i' in `keys'.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= capacity
		deferred
		ensure
			inserted: keys_item (i) = k
		end

	clone_keys is
			-- Clone `keys'.
		deferred
		end

	keys_resize (n: INTEGER) is
			-- Resize `keys'.
		require
			n_large_enough: n > capacity
		deferred
		end

	keys_wipe_out is
			-- Wipe out items in `keys'.
		deferred
		end

	make_clashes (n: INTEGER) is
			-- Create table of indexes in `items' and `keys' when there are
			-- clashes in `slots'. Each entry points to the next alternative
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
			-- Create table of indexes in `items' and `keys', indexed
			-- by hash codes from 0 to `n-1' (the entry at index
			-- `n-1' being reserved for void keys)
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
			-- Index of first free slot in `items' and `keys';
			-- `No_position' if there is no free slot at positions
			-- between 1 and `last_position'

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
				a_cursor.set_position (after_position)
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
				a_cursor.set_position (after_position)
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from until (a_cursor = Void) loop
				if a_cursor.position = old_position then
					a_cursor.set_position (after_position)
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

feature {DS_SPARSE_TABLE_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G is
			-- Item at `a_cursor' position
		do
			Result := items_item (a_cursor.position)
		end

	cursor_key (a_cursor: like new_cursor): K is
			-- Key at `a_cursor' position
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			a_cursor_not_off: not cursor_off (a_cursor)
		do
			Result := keys_item (a_cursor.position)
		end

	cursor_after (a_cursor: like new_cursor): BOOLEAN is
			-- Is there no valid position to right of `a_cursor'?
		do
			Result := (a_cursor.position = after_position)
		end

	cursor_before (a_cursor: like new_cursor): BOOLEAN is
			-- Is there no valid position to left of `a_cursor'?
		do
			Result := (a_cursor.position = before_position)
		end

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN is
			-- Is `a_cursor' on first item?
		local
			i: INTEGER
		do
			if not is_empty then
				from
					i := 1
				until
					clashes_item (i) > Free_watermark
				loop
					i := i + 1
				end
				Result := (a_cursor.position = i)
			end
		end

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN is
			-- Is `a_cursor' on last item?
		local
			i: INTEGER
		do
			if not is_empty then
				from
					i := last_position
				until
					clashes_item (i) > Free_watermark
				loop
					i := i - 1
				end
				Result := (a_cursor.position = i)
			end
		end

	cursor_off (a_cursor: like new_cursor): BOOLEAN is
			-- Is there no item at `a_cursor' position?
		do
			Result := (a_cursor.position < 0)
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN is
			-- Is `a_cursor' at same position as `other'?
		do
			Result := (a_cursor.position = other.position)
		end

	cursor_start (a_cursor: like new_cursor) is
			-- Move `a_cursor' to first position.
		local
			i, nb: INTEGER
			was_off: BOOLEAN
		do
			if is_empty then
				a_cursor.set_position (after_position)
			else
				was_off := cursor_off (a_cursor)
				from
					i := 1
					nb := last_position
				until
					i > nb or else
					clashes_item (i) > Free_watermark
				loop
					i := i + 1
				end
				if i > nb then
					a_cursor.set_position (after_position)
					if not was_off then
						remove_traversing_cursor (a_cursor)
					end
				else
					a_cursor.set_position (i)
					if was_off then
						add_traversing_cursor (a_cursor)
					end
				end
			end
		end

	cursor_finish (a_cursor: like new_cursor) is
			-- Move `a_cursor' to last position.
		local
			i: INTEGER
			was_off: BOOLEAN
		do
			if is_empty then
				a_cursor.set_position (before_position)
			else
				was_off := cursor_off (a_cursor)
				from
					i := last_position
				until
					i < 1 or else
					clashes_item (i) > Free_watermark
				loop
					i := i - 1
				end
				if i < 0 then
					a_cursor.set_position (before_position)
					if not was_off then
						remove_traversing_cursor (a_cursor)
					end
				else
					a_cursor.set_position (i)
					if was_off then
						add_traversing_cursor (a_cursor)
					end
				end
			end
		end

	cursor_forth (a_cursor: like new_cursor) is
			-- Move `a_cursor' to next position.
		local
			i, nb: INTEGER
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			if p = before_position then
				was_off := True
				-- i := 0
			else
				-- was_off := False
				i := p + 1
			end
			from
				nb := last_position
			until
				i > nb or else
				clashes_item (i) > Free_watermark
			loop
				i := i + 1
			end
			if i > nb then
				a_cursor.set_position (after_position)
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			else
				a_cursor.set_position (i)
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

	cursor_back (a_cursor: like new_cursor) is
			-- Move `a_cursor' to previous position.
		local
			i: INTEGER
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			if p = after_position then
				was_off := True
				i := last_position
			else
				-- was_off := False
				i := p - 1
			end
			from
			until
				i < 1 or else
				clashes_item (i) > Free_watermark
			loop
				i := i - 1
			end
			if i < 1 then
				a_cursor.set_position (before_position)
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			else
				a_cursor.set_position (i)
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

	cursor_search_forth (a_cursor: like new_cursor; v: G) is
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from until
					cursor_after (a_cursor) or else a_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_forth (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from until
					cursor_after (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_forth (a_cursor)
				end
			end
		end

	cursor_search_back (a_cursor: like new_cursor; v: G) is
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from until
					cursor_before (a_cursor) or else a_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_back (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from until
					cursor_before (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_back (a_cursor)
				end
			end
		end

	cursor_go_after (a_cursor: like new_cursor) is
			-- Move `a_cursor' to `after' position.
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_position (after_position)
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_before (a_cursor: like new_cursor) is
			-- Move `a_cursor' to `before' position.
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_position (before_position)
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_to (a_cursor, other: like new_cursor) is
			-- Move `a_cursor' to `other''s position.
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_position (other.position)
			if not cursor_off (a_cursor) then
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			elseif not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	before_position: INTEGER is -1
	after_position: INTEGER is -2
			-- Special values for before and after cursor positions

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

end
