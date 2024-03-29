﻿note

	description:

		"Sparse tables, implemented with arrays. Ancestor of hash tables %
		%which should supply their hashing mechanisms."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2018, Eric Bezault and others"
	license: "MIT License"

deferred class DS_SPARSE_TABLE [G, K]

inherit

	DS_BILINEAR_TABLE [G, K]
		rename
			put as force,
			put_new as force_new
		undefine
			has_item,
			occurrences,
			cursor_off,
			key_for_iteration
		redefine
			value
		end

	DS_SPARSE_CONTAINER [G, K]
		rename
			make as make_sparse_container,
			has as has_item,
			has_void as has_void_item
		redefine
			search,
			new_cursor,
			copy
		end

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			create key_equality_tester
			make_with_equality_testers (n, Void, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER)
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			create equality_tester
			create key_equality_tester
			make_with_equality_testers (n, equality_tester, key_equality_tester)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_default
			-- Create an empty table and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion for items.
			-- Use `equal' as comparison criterion for keys.
		do
			make (default_capacity)
		ensure then
			before: before
		end

	make_map (n: INTEGER)
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

	make_map_equal (n: INTEGER)
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion for items.
			-- Use `=' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			create equality_tester
			make_with_equality_testers (n, equality_tester, Void)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_map_default
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

	make_with_equality_testers (n: INTEGER; an_item_tester: like equality_tester; a_key_tester: like key_equality_tester)
			-- Create an empty table and allocate
			-- memory space for at least `n' items.
			-- Use `an_item_tester' as comparison criterion for items.
			-- Use `a_key_tester' as comparison criterion for keys.
		require
			positive_n: n >= 0
		do
			equality_tester := an_item_tester
			key_equality_tester := a_key_tester
			make_sparse_container (n)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
			equality_tester_set: equality_tester = an_item_tester
			key_equality_tester_set: key_equality_tester = a_key_tester
		end

feature -- Access

	at alias "@", item (k: K): G
			-- Item associated with `k'
		do
			search_position (k)
			check
				hash_k: position /= No_position
			end
			Result := item_storage_item (position)
		end

	value (k: K): detachable G
			-- Item associated with `k';
			-- Return default value if no such item
			--
			-- Contrary to `item', there is no internal caching
			-- here, which allows to use this routine in a multi-threaded
			-- environment when no items are added or removed.
		local
			l_position: INTEGER
		do
			l_position := position_of_key (k)
			if l_position /= No_position then
				Result := item_storage_item (l_position)
			end
		end

	key (k: K): K
			-- Key associated with `k'
		require
			has_k: has (k)
		do
			search_position (k)
			check
				hash_k: position /= No_position
			end
			Result := key_storage_item (position)
		end

	found_key: K
			-- Key of item found by last call to `search'
		require
			key_found: found
		do
			Result := key_storage_item (found_position)
		end

	key_for_iteration: K
			-- Key at internal cursor position
		do
			Result := cursor_key (internal_cursor)
		end

	new_cursor: DS_SPARSE_TABLE_CURSOR [G, K]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

	key_equality_tester: detachable KL_EQUALITY_TESTER [K]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

	keys: DS_BILINEAR [K]
			-- View of current table as a linear representation of its keys
		local
			l_keys: like internal_keys
		do
			if attached internal_keys as l_internal_keys then
				Result := l_internal_keys
			else
				create l_keys.make (Current)
				internal_keys := l_keys
				Result := l_keys
			end
		ensure
			keys_not_void: Result /= Void
		end

feature -- Status report

	has (k: K): BOOLEAN
			-- Is there an item associated with `k'?
		do
			search_position (k)
			Result := position /= No_position
		end

	valid_key (k: K): BOOLEAN
			-- Is `k' a valid key?
		do
			Result := True
		ensure then
			defintion: Result = True
		end

	key_equality_tester_settable (a_tester: like key_equality_tester): BOOLEAN
			-- Can `set_key_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
		do
			Result := is_empty
		end

feature -- Search

	search (k: K)
			-- Search for item at key `k'.
			-- If found, set `found' to true, and set
			-- `found_item' to item associated with `k'.
		do
			search_position (k)
			found_position := position
		ensure then
			found_set: found = has (k)
			found_item_set: found implies {KL_TYPE [G]}.same_objects (found_item, item (k))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is table equal to `other'?
			-- Do not take cursor positions, capacity
			-- nor `equality_tester' into account.
		local
			a_key: K
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and count = other.count then
				from
					i := last_position
					Result := True
				until
					not Result or i < 0
				loop
					if clashes_item (i) > Free_watermark then
						a_key := key_storage_item (i)
						Result := other.has (a_key) and then other.item (a_key) = item_storage_item (i)
					end
					i := i - 1
				end
			end
		end

feature -- Setting

	set_key_equality_tester (a_tester: like key_equality_tester)
			-- Set `key_equality_tester' to `a_tester'.
			-- A void key equality tester means that `='
			-- will be used as comparison criterion.
		require
			key_equality_tester_settable: key_equality_tester_settable (a_tester)
		do
			key_equality_tester := a_tester
			if attached internal_keys as l_internal_keys then
				l_internal_keys.internal_set_equality_tester (a_tester)
			end
		ensure
			key_equality_tester_set: key_equality_tester = a_tester
		end

feature -- Element change

	replace (v: G; k: K)
			-- Replace item associated with `k' by `v'.
			-- Do not move cursors.
		do
			unset_found_item
			search_position (k)
			check
				has_k: position /= No_position
			end
			item_storage_put (v, position)
		end

	replace_found_item (v: G)
			-- Replace item associated with
			-- the key of `found_item' by `v'.
			-- Do not move cursors.
		require
			item_found: found
		do
			item_storage_put (v, found_position)
		ensure
			replaced: {KL_TYPE [G]}.same_objects (found_item, v)
			same_count: count = old count
		end

	put (v: G; k: K)
			-- Associate `v' with key `k'.
			-- Do not move cursors.
		require
			not_full: not is_full or else has (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				item_storage_put (v, position)
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
				item_storage_put (v, i)
				key_storage_put (k, i)
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
		end

	put_new (v: G; k: K)
			-- Associate `v' with key `k'.
			-- Do not move cursors.
		require
			not_full: not is_full
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
			item_storage_put (v, i)
			key_storage_put (k, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
		end

	put_last (v: G; k: K)
			-- Associate `v' with key `k'. Put `v' at the end of table
			-- if no item was already associated with `k', or replace
			-- existing item otherwise.
			-- Do not move cursors.
		require
			not_full: not is_full or else has (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				item_storage_put (v, position)
			else
				i := last_position + 1
				if i >= capacity then
					compress
					i := last_position + 1
				end
				last_position := i
				h := slots_position
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				item_storage_put (v, i)
				key_storage_put (k, i)
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
			last: (not old has (k)) implies {KL_TYPE [G]}.same_objects (last, v)
		end

	put_last_new (v: G; k: K)
			-- Associate `v' with key `k'. Put `v' at the end of table.
			-- Do not move cursors.
		require
			not_full: not is_full
			new_item: not has (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			i := last_position + 1
			if i >= capacity then
				compress
				i := last_position + 1
			end
			last_position := i
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			item_storage_put (v, i)
			key_storage_put (k, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
			last: {KL_TYPE [G]}.same_objects (last, v)
		end

	force (v: G; k: K)
			-- Associate `v' with key `k'.
			-- Resize table if necessary.
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				item_storage_put (v, position)
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
				item_storage_put (v, i)
				key_storage_put (k, i)
				count := count + 1
			end
		end

	force_new (v: G; k: K)
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
			item_storage_put (v, i)
			key_storage_put (k, i)
			count := count + 1
		end

	force_last (v: G; k: K)
			-- Associate `v' with key `k'. Put `v' at the end of table
			-- if no item was already associated with `k', or replace
			-- existing item otherwise.
			-- Resize table if necessary.
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (k)
			if position /= No_position then
				item_storage_put (v, position)
			else
				i := last_position + 1
				if i >= capacity then
					resize (new_capacity (i + 1))
					h := hash_position (k)
				else
					h := slots_position
				end
				last_position := i
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				item_storage_put (v, i)
				key_storage_put (k, i)
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
			last: (not old has (k)) implies {KL_TYPE [G]}.same_objects (last, v)
		end

	force_last_new (v: G; k: K)
			-- Associate `v' with key `k'. Put `v' at the end of table.
			-- Resize table if necessary.
			-- Do not move cursors.
		require
			new_item: not has (k)
		local
			i, h: INTEGER
		do
			unset_found_item
			i := last_position + 1
			if i >= capacity then
				resize (new_capacity (i + 1))
			end
			last_position := i
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			item_storage_put (v, i)
			key_storage_put (k, i)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then {KL_TYPE [G]}.same_objects (item (k), v)
			last: {KL_TYPE [G]}.same_objects (last, v)
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current container.
			-- Move all cursors `off' (unless `other = Current').
		do
			if other /= Current then
				precursor (other)
				internal_keys := Void
			end
		end

feature -- Iteration

	do_all_with_key (an_action: PROCEDURE [G, K])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its key.
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
					an_action.call ([item_storage_item (i), key_storage_item (i)])
				end
				i := i + 1
			end
		end

	do_all_with_key_2 (an_action: PROCEDURE [K, G])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the key and its item.
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
					an_action.call ([key_storage_item (i), item_storage_item (i)])
				end
				i := i + 1
			end
		end

	do_if_with_key (an_action: PROCEDURE [G, K]; a_test: FUNCTION [G, K, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its key.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
			l_key: K
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					l_item := item_storage_item (i)
					l_key := key_storage_item (i)
					if a_test.item ([l_item, l_key]) then
						an_action.call ([l_item, l_key])
					end
				end
				i := i + 1
			end
		end

	do_if_with_key_2 (an_action: PROCEDURE [K, G]; a_test: FUNCTION [K, G, BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the key and its item.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
			l_key: K
		do
			from
				i := 0
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					l_item := item_storage_item (i)
					l_key := key_storage_item (i)
					if a_test.item ([l_key, l_item]) then
						an_action.call ([l_key, l_item])
					end
				end
				i := i + 1
			end
		end

	there_exists_with_key (a_test: FUNCTION [G, K, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item and its key?
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
					if a_test.item ([item_storage_item (i), key_storage_item (i)]) then
						Result := True
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

	there_exists_with_key_2 (a_test: FUNCTION [K, G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one key and its item?
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
					if a_test.item ([key_storage_item (i), item_storage_item (i)]) then
						Result := True
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

	for_all_with_key (a_test: FUNCTION [G, K, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items and their keys?
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
					if not a_test.item ([item_storage_item (i), key_storage_item (i)]) then
						Result := False
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

	for_all_with_key_2 (a_test: FUNCTION [K, G, BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all keys and their items?
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
					if not a_test.item ([key_storage_item (i), item_storage_item (i)]) then
						Result := False
							-- Jump out of the loop.
						i := last_position
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	internal_set_key_equality_tester (a_tester: like key_equality_tester)
			-- Set `key_equality_tester' to `a_tester'.
			-- (No precondition, to be used internally only.)
		do
			key_equality_tester := a_tester
			if attached internal_keys as l_internal_keys then
				l_internal_keys.internal_set_equality_tester (a_tester)
			end
		end

	internal_keys: detachable DS_SPARSE_TABLE_KEYS [G, K]
			-- View of current table as a linear representation of its keys

feature {DS_SPARSE_TABLE_KEYS} -- Implementation

	set_internal_keys (a_keys: like internal_keys)
			-- Set `internal_keys' to `a_keys'
		require
			a_keys_not_void: a_keys /= Void
			valid_keys: a_keys.table = Current
		do
			internal_keys := a_keys
		ensure
			internal_keys_set: internal_keys = a_keys
		end

feature {DS_SPARSE_TABLE_CURSOR} -- Cursor implementation

	cursor_key (a_cursor: like new_cursor): K
			-- Key at `a_cursor' position
		do
			Result := key_storage_item (a_cursor.position)
		end

invariant

	internal_keys_consistent: attached internal_keys as l_internal_keys implies l_internal_keys.table = Current

end
