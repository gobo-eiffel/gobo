note

	description:

		"Sparse containers. Used for implementation of sparse tables and sparse sets."

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2003-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/10/06 $"
	revision: "$Revision: #16 $"

deferred class DS_SPARSE_CONTAINER [G, K]

inherit

	DS_CONTAINER [G]

	DS_BILINEAR [G]
		redefine
			has,
			occurrences
		end

	DS_RESIZABLE [G]
		redefine
			new_capacity
		end

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty container and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			capacity := n
			make_item_storage (n)
			make_key_storage (n)
			make_clashes (n)
			modulus := new_modulus (n)
			make_slots (modulus + 1)
			last_position := No_position
			free_slot := No_position
			position := No_position
			unset_found_item
			set_internal_cursor (new_cursor)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

feature -- Access

	found_item: G
			-- Item found by last call to `search'
		require
			item_found: found
		do
			Result := item_storage_item (found_position)
		end

	first: G
			-- First item in container
		local
			i: INTEGER
		do
			from
				i := 0
			until
				clashes_item (i) > Free_watermark
			loop
				i := i + 1
			end
			Result := item_storage_item (i)
		end

	last: G
			-- Last item in container
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
			Result := item_storage_item (i)
		end

	new_cursor: DS_SPARSE_CONTAINER_CURSOR [G, K]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in container

	capacity: INTEGER
			-- Maximum number of items in container

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in container
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			i := last_position
			if attached equality_tester as l_tester then
				from
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark then
						if l_tester.test (item_storage_item (i), v) then
							Result := Result + 1
						end
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark then
						if item_storage_item (i) = v then
							Result := Result + 1
						end
					end
					i := i - 1
				end
			end
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Does container include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			i := last_position
			if attached equality_tester as l_tester then
				from
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark and then l_tester.test (item_storage_item (i), v) then
						Result := True
							-- Jump out of the loop.
						i := -1
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark and then item_storage_item (i) = v then
						Result := True
							-- Jump out of the loop.
						i := -1
					else
						i := i - 1
					end
				end
			end
		end

	found: BOOLEAN
			-- Did last call to `search' succeed?
		do
			Result := found_position /= No_position
		ensure
			definition: Result = (found_position /= No_position)
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [G])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					an_action.call ([item_storage_item (i)])
				end
				i := i + 1
			end
		end

	do_all_with_index (an_action: PROCEDURE [G, INTEGER])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i, j: INTEGER
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					j := j + 1
					an_action.call ([item_storage_item (i), j])
				end
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					l_item := item_storage_item (i)
					if a_test.item ([l_item]) then
						an_action.call ([l_item])
					end
				end
				i := i + 1
			end
		end

	do_if_with_index (an_action: PROCEDURE [G, INTEGER]; a_test: FUNCTION [G, INTEGER, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i, j: INTEGER
			l_item: G
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					j := j + 1
					l_item := item_storage_item (i)
					if a_test.item ([l_item, j]) then
						an_action.call ([l_item, j])
					end
				end
				i := i + 1
			end
		end

	do_until (an_action: PROCEDURE [G]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 0
			invariant
				i_large_enough: i >= 0
				i_small_enough: i <= last_position + 1
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					l_item := item_storage_item (i)
					if a_condition.item ([l_item]) then
							-- Stop.
						i := last_position
					else
						an_action.call ([l_item])
					end
				end
				i := i + 1
			variant
				index: last_position - i + 1
			end
		end

	do_if_until (an_action: PROCEDURE [G]; a_test: FUNCTION [G, BOOLEAN]; a_condition: FUNCTION [G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
			--
			-- The iteration will be interrupted if `a_condition' starts returning True.
		local
			i: INTEGER
			l_item: G
		do
			from
				i := 0
			invariant
				i_large_enough: i >= 0
				i_small_enough: i <= last_position + 1
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					l_item := item_storage_item (i)
					if a_condition.item ([l_item]) then
							-- Stop.
						i := last_position
					elseif a_test.item ([l_item]) then
						an_action.call ([l_item])
					end
				end
				i := i + 1
			variant
				index: last_position - i + 1
			end
		end

	there_exists (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					if a_test.item ([item_storage_item (i)]) then
						Result := True
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

	for_all (a_test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			Result := True
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					if not a_test.item ([item_storage_item (i)]) then
						Result := False
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

feature -- Search

	search (k: K)
			-- Search for item at key `k'.
			-- If found, set `found' to true, and set
			-- `found_item' to item associated with `k'.
		do
			search_position (k)
			found_position := position
		end

	unset_found_item
			-- Get rid of `found_item'.
		do
			found_position := No_position
		ensure
			not_found: not found
			found_position_unset: found_position = No_position
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current container.
			-- Move all cursors `off' (unless `other = Current').
		local
			old_cursor: detachable like new_cursor
		do
			if other /= Current then
				old_cursor := internal_cursor
				move_all_cursors_after
				standard_copy (other)
				if old_cursor /= Void and then valid_cursor (old_cursor) then
					set_internal_cursor (old_cursor)
				else
					set_internal_cursor (new_cursor)
				end
				unset_found_item
				clone_item_storage
				clone_key_storage
				clone_slots
				clone_clashes
			end
		end

feature -- Removal

	remove (k: K)
			-- Remove item associated with `k'.
			-- Move any cursors at this position `forth'.
			--
			-- Note: the item and key of attached types may still be referenced
			-- internally. In order to release it to the garbage collector, you
			-- will need to call `compress'.
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				remove_position (position)
			end
		end

	remove_found_item
			-- Remove item found by last call to `search'.
			-- Move any cursors at this position `forth'.
			--
			-- Note: the item and key of attached types may still be referenced
			-- internally. In order to release it to the garbage collector, you
			-- will need to call `compress'.
		require
			item_found: found
		do
			remove_position (found_position)
			unset_found_item
		ensure
			one_less: count = old count - 1
		end

	wipe_out
			-- Remove all items from container.
			-- Move all cursors `off'.
		do
			move_all_cursors_after
			unset_found_item
			if count > 0 then
				item_storage_wipe_out
				key_storage_wipe_out
				clashes_wipe_out
				slots_wipe_out
				last_position := No_position
				free_slot := No_position
				count := 0
			end
			position := No_position
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize container so that it can contain
			-- at least `n' items. Do not lose any item.
			-- Do not move cursors.
		local
			m: INTEGER
			i, h: INTEGER
		do
			unset_found_item
			m := new_modulus (n)
			slots_resize (m + 1)
			from
				i := modulus
			until
				i < 0
			loop
				slots_put (No_position, i)
				i := i - 1
			end
			modulus := m
			from
				i := last_position
			until
				i < 0
			loop
				if clashes_item (i) > Free_watermark then
					h := hash_position (key_storage_item (i))
					clashes_put (slots_item (h), i)
					slots_put (i, h)
				end
				i := i - 1
			end
			item_storage_resize (n)
			key_storage_resize (n)
			clashes_resize (n)
			capacity := n
			position := No_position
		end

feature -- Optimization

	compress
			-- Remove holes between stored items. May avoid
			-- resizing when calling `force_last' for example.
			-- Do not lose any item. Do not move cursors.
		local
			i, j, nb, h: INTEGER
		do
			if last_position /= count - 1 then
				unset_found_item
				nb := last_position
				from
					i := 0
					j := 0
				until
					i > nb
				loop
					if clashes_item (i) > Free_watermark then
						if j /= i then
							item_storage_put (item_storage_item (i), j)
							key_storage_put (key_storage_item (i), j)
								-- Make sure that the slot at position `j' is considered as
								-- a valid slot before calling `move_all_cursors'.
							clashes_put (No_position, j)
							move_all_cursors (i, j)
						end
						j := j + 1
					end
					i := i + 1
				end
				item_storage_keep_head (count)
				key_storage_keep_head (count)
				clashes_wipe_out
				slots_wipe_out
				nb := count - 1
				from
					i := 0
				until
					i > nb
				loop
					h := hash_position (key_storage_item (i))
					clashes_put (slots_item (h), i)
					slots_put (i, h)
					i := i + 1
				end
				last_position := nb
				position := No_position
			end
		ensure
			same_count: count = old count
			compressed: last_position = count - 1
			not_resized: capacity = old capacity
		end

feature {DS_SPARSE_CONTAINER_CURSOR} -- Implementation

	last_position: INTEGER
			-- All slots to the right of this position
			-- are guaranteed to be free

	item_storage_item (i: INTEGER): G
			-- Item at position `i' in `item_storage'
		require
			i_large_enough: i >= 0
			i_small_enough: i <= last_position
		deferred
		end

	item_storage_put (v: G; i: INTEGER)
			-- Put `v' at position `i' in `item_storage'.
		require
			i_large_enough: i >= 0
			i_small_enough: i <= last_position
		deferred
		ensure
			inserted: item_storage_item (i) = v
		end

	key_storage_item (i: INTEGER): K
			-- Item at position `i' in `key_storage'
		require
			i_large_enough: i >= 0
			i_small_enough: i <= last_position
		deferred
		end

	clashes_item (i: INTEGER): INTEGER
			-- Item at position `i' in `clashes'
		require
			i_large_enough: i >= 0
			i_small_enough: i < capacity
		deferred
		end

	valid_position (i: INTEGER): BOOLEAN
			-- Is there a slot at position `i'?
		do
			Result := 0 <= i and i < capacity
		ensure
			definition: Result = (0 <= i and i < capacity)
		end

	valid_slot (i: INTEGER): BOOLEAN
			-- Is there an item at position `i'?
		require
			valid_i: valid_position (i)
		do
			Result := i <= last_position and then clashes_item (i) > Free_watermark
		end

feature {NONE} -- Implementation

	search_position (k: K)
			-- Search for position where key is equal to `k',
			-- or 'No_position' otherwise.
			-- (Use `key_equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			prev: INTEGER
			l_position: INTEGER
			l_slots_position: INTEGER
		do
			if k = Void then
				position := slots_item (modulus)
				slots_position := modulus
				clashes_previous_position := No_position
			else
				l_position := position
				if attached key_equality_tester as l_tester then
						-- Keep track of `slots_position' and `clashes_previous_position' before
						-- the call to `l_tester.test' in case of a re-entrant call to `search_position'.
					l_slots_position := slots_position
					prev := clashes_previous_position
					if
						l_position = No_position or else
						clashes_item (l_position) <= Free_watermark or else
						not l_tester.test (k, key_storage_item (l_position))
					then
						from
							l_slots_position := hash_position (k)
							i := slots_item (l_slots_position)
							l_position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if l_tester.test (k, key_storage_item (i)) then
								l_position := i
									-- Jump out of the loop.
								i := No_position
							else
								prev := i
								i := clashes_item (i)
							end
						end
					end
					position := l_position
					slots_position := l_slots_position
					clashes_previous_position := prev
				else
					if
						l_position = No_position or else
						clashes_item (l_position) <= Free_watermark or else
						k /= key_storage_item (l_position)
					then
						from
							l_slots_position := hash_position (k)
							i := slots_item (l_slots_position)
							l_position := No_position
							prev := No_position
						until
							i = No_position
						loop
							if k = key_storage_item (i) then
								l_position := i
									-- Jump out of the loop.
								i := No_position
							else
								prev := i
								i := clashes_item (i)
							end
						end
						position := l_position
						slots_position := l_slots_position
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

	position_of_key (k: K): INTEGER
			-- Position where key is equal to `k',
			-- or 'No_position' otherwise.
			-- (Use `key_equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			--
			-- Contrary to `search_position', there is no internal caching
			-- here, which allows to use this routine in a multi-threaded
			-- environment when no items are added or removed.
		local
			i: INTEGER
			l_position: INTEGER
			l_slots_position: INTEGER
		do
			if k = Void then
				Result := slots_item (modulus)
			else
				if attached key_equality_tester as l_tester then
					from
						l_slots_position := hash_position (k)
						i := slots_item (l_slots_position)
						l_position := No_position
					until
						i = No_position
					loop
						if l_tester.test (k, key_storage_item (i)) then
							l_position := i
								-- Jump out of the loop.
							i := No_position
						else
							i := clashes_item (i)
						end
					end
				else
					from
						l_slots_position := hash_position (k)
						i := slots_item (l_slots_position)
						l_position := No_position
					until
						i = No_position
					loop
						if k = key_storage_item (i) then
							l_position := i
								-- Jump out of the loop.
							i := No_position
						else
							i := clashes_item (i)
						end
					end
				end
				Result := l_position
			end
		end

	key_equality_tester: detachable KL_EQUALITY_TESTER [K]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.
		deferred
		end

	internal_set_key_equality_tester (a_tester: like key_equality_tester)
			-- Set `key_equality_tester' to `a_tester'.
			-- (No precondition, to be used internally only.)
		deferred
		ensure
			key_equality_tester_set: key_equality_tester = a_tester
		end

	hash_position (k: K): INTEGER
			-- Hash position of `k' in `slots'
		deferred
		ensure
			valid_position: Result >= 0 and Result <= modulus
			void_position: (k = Void) = (Result = modulus)
		end

	remove_position (i: INTEGER)
			-- Remove item at position `i'.
			-- Move any cursors at this position `forth'.
			--
			-- Note: the item and key of attached types may still be referenced
			-- internally. In order to release it to the garbage collector, you
			-- will need to call `compress'.
		require
			valid_position: valid_position (i)
			valid_slot: valid_slot (i)
		local
			k: K
			h: INTEGER
			a_tester: like key_equality_tester
		do
			if i /= position then
				k := key_storage_item (i)
				h := hash_position (k)
				if slots_item (h) = i then
					position := i
					slots_position := h
					clashes_previous_position := No_position
				else
					a_tester := key_equality_tester
					internal_set_key_equality_tester (Void)
					search_position (k)
					internal_set_key_equality_tester (a_tester)
				end
			end
			move_cursors_forth (position)
			if clashes_previous_position = No_position then
				slots_put (clashes_item (position), slots_position)
			else
				clashes_put (clashes_item (position), clashes_previous_position)
			end
			if free_slot = No_position and position = last_position then
				item_storage_keep_head (position)
				key_storage_keep_head (position)
				clashes_put (No_position, position)
				position := No_position
				last_position := last_position - 1
			else
				if ({G}).has_default then
					item_storage_put (({G}).default, position)
				end
				if ({K}).has_default then
					key_storage_put (({K}).default, position)
				end
				clashes_put (Free_offset - free_slot, position)
				free_slot := position
			end
			count := count - 1
		ensure
			one_less: count = old count - 1
		end

	make_item_storage (n: INTEGER)
			-- Create storage for items of the table indexed
			-- from 0 to `n-1'.
		require
			positive_n: n >= 0
		deferred
		end

	clone_item_storage
			-- Clone `item_storage'.
		deferred
		end

	item_storage_resize (n: INTEGER)
			-- Resize `item_storage'.
		require
			n_large_enough: n >= capacity
		deferred
		end

	item_storage_wipe_out
			-- Wipe out items in `item_storage'.
		deferred
		end

	item_storage_keep_head (n: INTEGER)
			-- Keep the first `n' items in `item_storage'.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= last_position + 1
		deferred
		end

	make_key_storage (n: INTEGER)
			-- Create storage for keys of the set indexed
			-- from 0 to `n-1'.
		require
			positive_n: n >= 0
		deferred
		end

	key_storage_put (k: K; i: INTEGER)
			-- Put `k' at position `i' in `key_storage'.
		require
			i_large_enough: i >= 0
			i_small_enough: i <= last_position
		deferred
		end

	clone_key_storage
			-- Clone `key_storage'.
		deferred
		end

	key_storage_resize (n: INTEGER)
			-- Resize `key_storage'.
		require
			n_large_enough: n >= capacity
		deferred
		end

	key_storage_wipe_out
			-- Wipe out items in `key_storage'.
		deferred
		end

	key_storage_keep_head (n: INTEGER)
			-- Keep the first `n' items in `key_storage'.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= last_position + 1
		deferred
		end

	make_clashes (n: INTEGER)
			-- Create table of indexes in `item_storage' and `key_storage' when there are
			-- clashes in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached. Also keep track of free
			-- slot positions located before or at `last_position' with
			-- indexes less that or equal to `Free_watermark'.
		require
			positive_n: n >= 0
		deferred
		end

	clashes_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `clashes'.
		require
			i_large_enough: i >= 0
			i_small_enough: i < capacity
		deferred
		ensure
			inserted: clashes_item (i) = v
		end

	clone_clashes
			-- Clone `clashes'.
		deferred
		end

	clashes_resize (n: INTEGER)
			-- Resize `clashes'.
		require
			n_large_enough: n >= capacity
		deferred
		end

	clashes_wipe_out
			-- Wipe out items in `clashes'.
		deferred
		end

	make_slots (n: INTEGER)
			-- Create table of indexes in `item_storage' and `key_storage', indexed
			-- by hash codes from 0 to `n-1' (the entry at index
			-- `n-1' being reserved for void keys)
		require
			positive_n: n >= 0
		deferred
		end

	slots_item (i: INTEGER): INTEGER
			-- Item at position `i' in `slots'
		require
			i_large_enough: i >= 0
			i_small_enough: i <= modulus
		deferred
		end

	slots_put (v: INTEGER; i: INTEGER)
			-- Put `v' at position `i' in `slots'.
		require
			i_large_enough: i >= 0
			i_small_enough: i <= modulus
		deferred
		ensure
			inserted: slots_item (i) = v
		end

	clone_slots
			-- Clone `slots'.
		deferred
		end

	slots_resize (n: INTEGER)
			-- Resize `slots'.
		require
			n_large_enough: n > modulus
		deferred
		end

	slots_wipe_out
			-- Wipe out items in `slots'.
		deferred
		end

	modulus: INTEGER
			-- Upper bound of `slots'

	free_slot: INTEGER
			-- Index of first free slot in `item_storage' and `key_storage';
			-- `No_position' if there is no free slot at positions
			-- between 1 and `last_position'

	position: INTEGER
			-- Last position in `key_storage' and `item_storage'
			-- found by `search_position'

	slots_position: INTEGER
			-- Last position in `slots' found by `search_position'

	clashes_previous_position: INTEGER
			-- Previous position of the last position in
			-- `clashes' found by `search_position'

	found_position: INTEGER
			-- Position of the last item found by `search';
			-- `No_position' if not found

feature {NONE} -- Constants

	No_position: INTEGER = -1
			-- Not valid position mark

	Free_watermark: INTEGER = -2
			-- Limit between free and occupied slots in `clashes'

	Free_offset: INTEGER = -3
			-- Offset used to make sure that free slot indexes
			-- are below `Free_watermark' in `clashes'

feature {NONE} -- Cursor movements

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		do
			internal_cursor := c
		end

	internal_cursor: like new_cursor
			-- Internal cursor

	move_all_cursors_after
			-- Move `after' all cursors.
		local
			a_cursor, next_cursor: detachable like new_cursor
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				a_cursor.set_after
				next_cursor := a_cursor.next_cursor
				a_cursor.set_next_cursor (Void)
				a_cursor := next_cursor
			end
		end

	move_all_cursors (old_position, new_position: INTEGER)
			-- Move all cursors at position `old_position'
			-- to position `new_position'.
		require
			valid_old_position: valid_position (old_position)
			valid_new_position: valid_position (new_position) and then valid_slot (new_position)
		local
			a_cursor: detachable like new_cursor
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				if a_cursor.position = old_position then
					a_cursor.set_position (new_position)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

	move_cursors_after (old_position: INTEGER)
			-- Move `after' all cursors at position `old_position'.
		require
			valid_old_position: valid_position (old_position)
		local
			a_cursor, next_cursor: detachable like new_cursor
			previous_cursor: like new_cursor
		do
			a_cursor := internal_cursor
			if a_cursor.position = old_position then
				a_cursor.set_after
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from
			until
				(a_cursor = Void)
			loop
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

	move_cursors_forth (old_position: INTEGER)
			-- Move `forth' all cursors at position `old_position'.
		require
			valid_old_position: valid_position (old_position)
		local
			a_cursor, next_cursor: detachable like new_cursor
			previous_cursor: detachable like new_cursor
			i, nb: INTEGER
		do
			from
				a_cursor := internal_cursor
			until
				a_cursor = Void
			loop
				if a_cursor.position = old_position then
					if i = 0 then
							-- Next position not computed yet.
						from
							i := old_position + 1
							nb := last_position
						until
							i > nb or else clashes_item (i) > Free_watermark
						loop
							i := i + 1
						end
					end
					if i > nb then
							-- Move after.
						a_cursor.set_after
						if previous_cursor = Void then
								-- Do not remove `internal_cursor'.
							previous_cursor := a_cursor
							a_cursor := a_cursor.next_cursor
						else
							next_cursor := a_cursor.next_cursor
							previous_cursor.set_next_cursor (next_cursor)
							a_cursor.set_next_cursor (Void)
							a_cursor := next_cursor
						end
					else
							-- Move to position `i'.
						a_cursor.set_position (i)
						a_cursor := a_cursor.next_cursor
					end
				else
					previous_cursor := a_cursor
					a_cursor := a_cursor.next_cursor
				end
			end
		end

feature {DS_SPARSE_CONTAINER_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G
			-- Item at `a_cursor' position
		do
			Result := item_storage_item (a_cursor.position)
		end

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on first item?
		local
			i: INTEGER
		do
			if not is_empty then
				from
					i := 0
				until
					clashes_item (i) > Free_watermark
				loop
					i := i + 1
				end
				Result := (a_cursor.position = i)
			end
		end

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
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

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		do
			Result := (a_cursor.position = other.position)
		end

	cursor_start (a_cursor: like new_cursor)
			-- Move `a_cursor' to first position.
		local
			i, nb: INTEGER
			was_off: BOOLEAN
		do
			if is_empty then
				a_cursor.set_after
			else
				was_off := cursor_off (a_cursor)
				from
					i := 0
					nb := last_position
				until
					i > nb or else clashes_item (i) > Free_watermark
				loop
					i := i + 1
				end
				if i > nb then
					a_cursor.set_after
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

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
		local
			i: INTEGER
			was_off: BOOLEAN
		do
			if is_empty then
				a_cursor.set_before
			else
				was_off := cursor_off (a_cursor)
				from
					i := last_position
				until
					i < 0 or else clashes_item (i) > Free_watermark
				loop
					i := i - 1
				end
				if i < 0 then
					a_cursor.set_before
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

	cursor_forth (a_cursor: like new_cursor)
			-- Move `a_cursor' to next position.
		local
			i, nb: INTEGER
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			if p = a_cursor.before_position then
				was_off := True
				i := 0
			else
				was_off := False
				i := p + 1
			end
			from
				nb := last_position
			until
				i > nb or else clashes_item (i) > Free_watermark
			loop
				i := i + 1
			end
			if i > nb then
				a_cursor.set_after
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

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
		local
			i: INTEGER
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			if p = a_cursor.after_position then
				was_off := True
				i := last_position
			else
				was_off := False
				i := p - 1
			end
			from
			until
				i < 0 or else clashes_item (i) > Free_watermark
			loop
				i := i - 1
			end
			if i < 0 then
				a_cursor.set_before
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

	cursor_search_forth (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		do
			if attached equality_tester as l_tester then
				from
				until
					cursor_after (a_cursor) or else l_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_forth (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					cursor_after (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_forth (a_cursor)
				end
			end
		end

	cursor_search_back (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		do
			if attached equality_tester as l_tester then
				from
				until
					cursor_before (a_cursor) or else l_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_back (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					cursor_before (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_back (a_cursor)
				end
			end
		end

	cursor_go_after (a_cursor: like new_cursor)
			-- Move `a_cursor' to `after' position.
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_after
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
		local
			was_off: BOOLEAN
		do
			was_off := cursor_off (a_cursor)
			a_cursor.set_before
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_to (a_cursor, other: like new_cursor)
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

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER
			-- New capacity which could accommodate at least
			-- `n' items (Used as argument of `resize'.)
		do
			Result := 2 * n
		end

	new_modulus (a_capacity: INTEGER): INTEGER
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
