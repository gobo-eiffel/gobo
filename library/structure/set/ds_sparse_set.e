note

	description:

		"Sets implemented with sparse arrays. Ancestor of hash sets %
		%which should supply its hashing mechanism."

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_SPARSE_SET [G]

inherit

	DS_SET [G]
		undefine
			has,
			cursor_off
		end

	DS_SPARSE_CONTAINER [G, G]
		undefine
			occurrences,
			equality_tester_settable
		redefine
			has,
			new_cursor,
			search
		end

	KL_IMPORTED_ANY_ROUTINES
		export
			{NONE} all
		undefine
			copy
		redefine
			is_equal
		end

feature {NONE} -- Initialization

	make_equal (n: INTEGER)
			-- Create an empty set and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			make (n)
			create equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_default
			-- Create an empty set and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion.
		do
			make (default_capacity)
		ensure then
			before: before
		end

feature -- Access

	at alias "@", item (v: G): G
			-- Item equal to `v' held in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			search_position (v)
			check
				hash_v: position /= No_position
			end
			Result := item_storage_item (position)
		end

	new_cursor: DS_SPARSE_SET_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Does set include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not Void, use `=' criterion otherwise.)
		do
			search_position (v)
			Result := position /= No_position
		end

	extendible (n: INTEGER): BOOLEAN
			-- May set be extended with `n' items?
		do
			Result := (capacity >= count + n)
		ensure then
			enough_space: Result implies (capacity >= count + n)
		end

	is_subset (other: DS_SET [G]): BOOLEAN
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
					not Result or i < 0
				loop
					if clashes_item (i) > Free_watermark then
						an_item := item_storage_item (i)
						Result := other.has (an_item)
					end
					i := i - 1
				end
			end
		end

	is_disjoint (other: DS_SET [G]): BOOLEAN
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
					not Result or i < 0
				loop
					if clashes_item (i) > Free_watermark then
						an_item := item_storage_item (i)
						Result := not other.has (an_item)
					end
					i := i - 1
				end
			end
		end

feature -- Search

	search (v: G)
			-- Search for item equal to `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not Void, use `=' criterion otherwise.)
			-- If found, set `found' to true, and make that
			-- item available in `found_item'.
		do
			search_position (v)
			found_position := position
		ensure then
			found_set: found = has (v)
			found_item_set: found implies (found_item = item (v))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is set equal to `other'?
			-- Do not take cursor positions, and capacity into
			-- account, but `equality_tester' should be the same.
		local
			an_item: G
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and count = other.count and same_equality_tester (other) then
				from
					i := last_position
					Result := True
				until
					not Result or i < 0
				loop
					if clashes_item (i) > Free_watermark then
						an_item := item_storage_item (i)
						Result := other.has (an_item)
					end
					i := i - 1
				end
			end
		end

feature -- Element change

	put (v: G)
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
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
				count := count + 1
			end
		end

	put_new (v: G)
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
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
			item_storage_put (v, i)
			count := count + 1
		end

	put_last (v: G)
			-- Add `v' at the end of set if not already included,
			-- or replace it otherwise.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Do not move cursors.
		local
			i, h: INTEGER
		do
			unset_found_item
			search_position (v)
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
				count := count + 1
			end
		ensure then
			last: (not old has (v)) implies last = v
		end

	force (v: G)
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
				item_storage_put (v, position)
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
				item_storage_put (v, i)
				count := count + 1
			end
		end

	force_new (v: G)
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Resize set if necessary.
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
			h := hash_position (v)
			clashes_put (slots_item (h), i)
			slots_put (i, h)
			item_storage_put (v, i)
			count := count + 1
		end

	force_last (v: G)
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
				item_storage_put (v, position)
			else
				i := last_position + 1
				if i >= capacity then
					resize (new_capacity (i + 1))
					h := hash_position (v)
				else
					h := slots_position
				end
				last_position := i
				clashes_put (slots_item (h), i)
				slots_put (i, h)
				item_storage_put (v, i)
				count := count + 1
			end
		ensure then
			last: (not old has (v)) implies last = v
--			not_changed: old has (v) implies all items at the same position
		end

	extend (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- Do not move cursors.
		local
			a_cursor: DS_LINEAR_CURSOR [G]
		do
			if other /= Current then
				a_cursor := other.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					put (a_cursor.item)
					a_cursor.forth
				end
			end
		end

	extend_last (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- If items of `other' were not included yet, insert
			-- them at last position if implementation permits.
			-- Do not move cursors.
		local
			a_cursor: DS_LINEAR_CURSOR [G]
		do
			if other /= Current then
				a_cursor := other.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					put_last (a_cursor.item)
					a_cursor.forth
				end
			end
		end

	append (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- Resize set if necessary.
			-- Do not move cursors.
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (new_capacity (count + nb))
			end
			extend (other)
		end

	append_last (other: DS_LINEAR [G])
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
			-- If items of `other' were not included yet, insert
			-- them at last position if implementation permits.
			-- Resize set if necessary.
			-- Do not move cursors.
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (new_capacity (count + nb))
			end
			extend_last (other)
		end

feature -- Basic operations

	merge (other: DS_SET [G])
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
			if other /= Current then
				nb := count + other.count
				if nb > capacity then
					resize (new_capacity (nb))
				end
				a_cursor := other.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					an_item := a_cursor.item
					if not has (an_item) then
						put_new (an_item)
					end
					a_cursor.forth
				end
			end
		end

	intersect (other: DS_SET [G])
			-- Remove all items not included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		local
			i: INTEGER
			an_item: G
		do
			if other = Current then
				move_all_cursors_after
				unset_found_item
			elseif other.is_empty then
				wipe_out
			else
				move_all_cursors_after
				unset_found_item
				from
					i := last_position
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark then
						an_item := item_storage_item (i)
						if not other.has (an_item) then
							remove_position (i)
						end
					end
					i := i - 1
				end
			end
		end

	subtract (other: DS_SET [G])
			-- Remove all items also included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		local
			i: INTEGER
			an_item: G
		do
			if other.is_empty then
				move_all_cursors_after
				unset_found_item
			elseif other = Current then
				wipe_out
			else
				move_all_cursors_after
				unset_found_item
				from
					i := last_position
				until
					i < 0
				loop
					if clashes_item (i) > Free_watermark then
						an_item := item_storage_item (i)
						if other.has (an_item) then
							remove_position (i)
						end
					end
					i := i - 1
				end
			end
		end

	symdif (other: DS_SET [G])
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
			if other.is_empty then
				move_all_cursors_after
				unset_found_item
			elseif other = Current then
				wipe_out
			elseif is_empty then
				merge (other)
			else
				move_all_cursors_after
				unset_found_item
				nb := count + other.count
				if nb > capacity then
					resize (new_capacity (nb))
				end
				a_cursor := other.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
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
		end

feature {DS_SPARSE_SET_CURSOR} -- Implementation

	key_storage_item (i: INTEGER): G
			-- Item at position `i' in `key_storage'
		do
			Result := item_storage_item (i)
		end

feature {NONE} -- Implementation

	key_equality_tester: detachable KL_EQUALITY_TESTER [G]
			-- Equality tester for keys;
			-- A void equality tester means that `='
			-- will be used as comparison criterion.
		do
			Result := equality_tester
		end

	internal_set_key_equality_tester (a_tester: like key_equality_tester)
			-- Set `key_equality_tester' to `a_tester'.
			-- (No precondition, to be used internally only.)
		do
			equality_tester := a_tester
		end

	make_key_storage (n: INTEGER)
			-- Create storage for keys of the set indexed
			-- from 0 to `n-1' (position 0 is not used).
		do
		end

	key_storage_put (k: G; i: INTEGER)
			-- Put `k' at position `i' in `key_storage'.
		do
		end

	clone_key_storage
			-- Clone `key_storage'.
		do
		end

	key_storage_resize (n: INTEGER)
			-- Resize `key_storage'.
		do
		end

	key_storage_wipe_out
			-- Wipe out items in `key_storage'.
		do
		end

	key_storage_keep_head (n: INTEGER)
			-- Keep the first `n' items in `key_storage'.
		do
		end

end
