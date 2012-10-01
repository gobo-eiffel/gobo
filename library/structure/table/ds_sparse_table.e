note

	description:

		"Sparse tables, implemented with arrays. Ancestor of hash tables %
		%which should supply their hashing mechanisms."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			key_for_iteration,
			initialized
		end

	DS_SPARSE_CONTAINER [G, K]
		rename
			make as make_sparse_container,
			has as has_item,
			has_void as has_void_item
		redefine
			search,
			new_cursor,
			copy,
			initialized
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
			create internal_keys.make (Current)
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

	key_equality_tester: KL_EQUALITY_TESTER [K]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.

	keys: DS_BILINEAR [K]
			-- View of current table as a linear representation of its keys
		do
			Result := internal_keys
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
			found_item_set: found implies (found_item = item (k))
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
					not Result or i < 1
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
			internal_keys.internal_set_equality_tester (a_tester)
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
			replaced: found_item = v
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
			inserted: has (k) and then item (k) = v
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
			inserted: has (k) and then item (k) = v
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
				if i > capacity then
					compress
					i := last_position + 1
				end
				h := slots_position
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				item_storage_put (v, i)
				key_storage_put (k, i)
				last_position := i
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
			last: (not old has (k)) implies last = v
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
			if i > capacity then
				compress
				i := last_position + 1
			end
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			item_storage_put (v, i)
			key_storage_put (k, i)
			last_position := i
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
			last: last = v
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
				if i > capacity then
					resize (new_capacity (i))
					h := hash_position (k)
				else
					h := slots_position
				end
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				item_storage_put (v, i)
				key_storage_put (k, i)
				last_position := i
				count := count + 1
			end
		ensure
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
			inserted: has (k) and then item (k) = v
			last: (not old has (k)) implies last = v
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
			if i > capacity then
				resize (new_capacity (i))
			end
			h := hash_position (k)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			item_storage_put (v, i)
			key_storage_put (k, i)
			last_position := i
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
			last: last = v
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current container.
			-- Move all cursors `off' (unless `other = Current').
		local
			l_keys: like internal_keys
		do
			l_keys := internal_keys
			precursor (other)
			internal_keys := l_keys
		end

feature -- Iteration

	do_all_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its key.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					an_action.call ([item_storage_item (i), key_storage_item (i)])
				end
				i := i + 1
			end
		end

	do_if_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]]; a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its key.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_item: G
			l_key: K
		do
			from
				i := 1
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

	there_exists_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item and its key?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					if a_test.item ([item_storage_item (i), key_storage_item (i)]) then
						Result := True
							-- Jump out of the loop.
						i := last_position + 1
					end
				end
				i := i + 1
			end
		end

	for_all_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items and their keys?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			i: INTEGER
		do
			Result := True
			from
				i := 1
			until
				i > last_position
			loop
				if clashes_item (i) > Free_watermark then
					if not a_test.item ([item_storage_item (i), key_storage_item (i)]) then
						Result := False
							-- Jump out of the loop.
						i := last_position + 1
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
			internal_keys.internal_set_equality_tester (a_tester)
		end

	internal_keys: DS_SPARSE_TABLE_KEYS [G, K]
			-- View of current table as a linear representation of its keys

	initialized: BOOLEAN
			-- Some Eiffel compilers check invariants even when the
			-- execution of the creation procedure is not completed.
			-- (In this case, checking the assertions of the being
			-- created `internal_cursor' and `internal_keys'
			-- triggers the invariants on the current container.
			-- So these invariants need to be protected.)
		do
			Result := (internal_cursor /= Void and internal_keys /= Void)
		end

feature {DS_SPARSE_TABLE_CURSOR} -- Cursor implementation

	cursor_key (a_cursor: like new_cursor): K
			-- Key at `a_cursor' position
		do
			Result := key_storage_item (a_cursor.position)
		end

invariant

	internal_keys_not_void: initialized implies internal_keys /= Void
	internal_keys_consistent: initialized implies internal_keys.table = Current

end
