indexing

	description:

		"EiffelBase HASH_TABLE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class HASH_TABLE [G, H -> HASHABLE]

inherit

	CONTAINER [G]
		rename
			has as has_item,
			wipe_out as clear_all,
			put as bag_put
		undefine
			copy, is_equal
		redefine
			compare_objects, compare_references
		end

	DS_HASH_TABLE [G, H]
		rename
			is_empty as empty,
			wipe_out as clear_all,
			go_to as ds_go_to,
			valid_cursor as ds_valid_cursor,
			put as ds_put,
			force as ds_force,
			replace as ds_replace,
			remove as ds_remove,
			make as ds_make,
			item as ds_item,
			infix "@" as ds_item_at
		redefine
			unset_found_item, search,
			found_item, replace_found_item
		end

creation

	make

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
		do
			ds_make (n)
			control := Unknown_constant
		end

	accommodate (n: INTEGER) is
			-- Reallocate table with enough space for `n' items;
			-- keep all current items.
		require
			n >= 0
		do
			if n > capacity then
				resize (n)
			end
		ensure
			count_not_changed: count = old count
		end

feature -- Access

	infix "@", item (k: H): G is
			-- Item associated with `k', if present
			-- otherwise default value of type `G'
		do
			search_position (k)
			if position /= No_position then
				Result := items.item (position)
			end
		end

	found_item: G
			-- Item found by last call to `search'

	cursor: CURSOR is
			-- Current cursor position
		do
			!HASH_TABLE_CURSOR! Result.make (internal_cursor.position)
		end

	current_keys: ARRAY [H] is
			-- New array containing actually used keys, from 1 to `count'
		local
			i, j, nb: INTEGER
		do
			-- j := 0
			nb := count
			!! Result.make (1, nb)
			from i := 1 until i > nb loop
				from
				until
					clashes.item (j) > Free_watermark
				loop
					j := j + 1
				end
				Result.put (keys.item (j), i)
				i := i + 1
				j := j + 1
			end
		ensure
			current_keys_not_void: Result /= Void
			good_count: Result.count = count
		end

feature -- Status report

	inserted: BOOLEAN is
			-- Did last operation insert an item?
		do
			Result := (control = Inserted_constant)
		end

	replaced: BOOLEAN is
			-- Did last operation replace an item?
		do
			Result := (control = Replaced_constant)
		end

	removed: BOOLEAN is
			-- Did last operation remove an item?
		do
			Result := (control = Removed_constant)
		end

	conflict: BOOLEAN is
			-- Did last operation cause a conflict?
		do
			Result := (control = Conflict_constant)
		end

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		local
			a_cursor: HASH_TABLE_CURSOR
			i: INTEGER
		do
			a_cursor ?= p
			if a_cursor /= Void then
				Result := internal_cursor.valid_position (a_cursor.position)
			end
		end

feature -- Search

	search (k: H) is
			-- Search for item at key `k'.
			-- If found, set `found' to true, and set
			-- `found_item' to item associated with `k'.
		do
			search_position (k)
			if position = No_position then
				unset_found_item
			else
				set_found_item (items.item (position), position)
			end
		end

feature -- Cursor movement

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		local
			a_cursor: HASH_TABLE_CURSOR
		do
			a_cursor ?= p
			internal_cursor.set_position (a_cursor.position)
		end

feature -- Element change

	put (new: G; a_key: H) is
			-- Insert `new' with `a_key' if there is no other item
			-- associated with the same key.
			-- Set `inserted' if and only if an insertion has
			-- been made (i.e. `a_key' was not present).
			-- If not, set `conflict'.
			-- In either case, set `found_item' to the item
			-- now associated with `a_key' (previous item if
			-- there was one, `new' otherwise).
		require
			valid_key: valid_key (a_key)
		local
			i, h: INTEGER
		do
			search_position (a_key)
			if position = No_position then
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (a_key)
				else
					h := slots_position
				end
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (new, i)
				keys.put (a_key, i)
				count := count + 1
				control := Inserted_constant
				set_found_item (new, i)
			else
				control := Conflict_constant
				set_found_item (items.item (position), position)
			end
		ensure
			insertion_done: (not old has (a_key)) implies item (a_key) = new
			now_present: has (a_key)
			one_more_if_inserted: (not old has (a_key)) implies (count = old count + 1)
			unchanged_if_conflict: (old has (a_key)) implies (count = old count)
		end

	force (new: G; a_key: H) is
			-- Update table so that `new' will be the item associated
			-- with `a_key'.
			-- If there was an item for that key, set `found'
			-- and set `found_item' to that item.
			-- If there was none, set `found' to False.
		local
			i, h: INTEGER
		do
			search_position (a_key)
			if position = No_position then
				if count = capacity then
					resize (new_capacity (count + 1))
					h := hash_position (a_key)
				else
					h := slots_position
				end
				i := free_slot
				free_slot := Free_offset - clashes.item (i)
				clashes.put (slots.item (h), i)
				slots.put (i, h)
				items.put (new, i)
				keys.put (a_key, i)
				count := count + 1
				unset_found_item
			else
				set_found_item (items.item (position), position)
				items.put (new, position)
			end
			control := Inserted_constant
		ensure
			insertion_done: item (a_key) = new
			now_present: has (a_key)
			found_item_is_old_item: found implies (found_item = old (item (a_key)))
		end

	extend (new: G; a_key: H) is
			-- Assuming there is no item of key `a_key',
			-- insert `new' with `a_key'.
			-- Set `inserted'.
		require
			not_present: not has (a_key)
		local
			i, h: INTEGER
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			i := free_slot
			free_slot := Free_offset - clashes.item (i)
			h := hash_position (a_key)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			items.put (new, i)
			keys.put (a_key, i)
			count := count + 1
			unset_found_item
			control := Inserted_constant
		ensure
			insertion_done: item (a_key) = new
			one_more: count = old count + 1
		end

	replace (new: G; a_key: H) is
			-- Replace item at `a_key', if present,
			-- with `new'; do not change associated key.
			-- Set `replaced' if and only if a replacement has been made
			-- (i.e. `a_key' was present); otherwise set `found' to false.
			-- Set `found_item' to the item previously associated
			-- with `a_key'.
		do
			search_position (a_key)
			if position = No_position then
				control := Unknown_constant
				unset_found_item
			else
				set_found_item (items.item (position), position)
				items.put (new, position)
				control := Replaced_constant
			end
		ensure
			insertion_done: (old has (a_key)) implies item (a_key) = new
		end

	replace_key (new_key: H; old_key: H) is
			-- If there is an item of key `old_key' and no item of key
			-- `new_key', replace the former's key by `new_key',
			-- set `replaced', and set `found_item' to the item
			-- previously associated with `old_key'.
			-- Otherwise set `found' to false or `conflict' respectively.
			-- If `conflict', set `found_item' to the item previously
			-- associated with `new_key'.
		local
			old_position: INTEGER
			old_slots_position: INTEGER
			old_clashes_previous_position: INTEGER
			h: INTEGER
		do
			move_all_cursors_after
			search_position (old_key)
			if position /= No_position then
				old_position := position
				old_slots_position := slots_position
				old_clashes_previous_position := clashes_previous_position
				set_found_item (items.item (old_position), old_position)
				search_position (new_key)
				if position = No_position then
						-- Remove old key:
					if old_clashes_previous_position = No_position then
						slots.put (clashes.item (old_position), old_slots_position)
					else
						clashes.put (clashes.item (old_position), old_clashes_previous_position)
					end
						-- Add new key:
					h := slots_position
					clashes.put (slots.item (h), old_position)
					slots.put (old_position, h)
					control := Replaced_constant
				else
					control := Conflict_constant
				end
			else
				unset_found_item
				control := Unknown_constant
			end
		ensure
			same_count: count = old count
			new_present: (replaced or conflict) implies has (new_key)
			new_item: (old has (old_key)) implies (item (new_key) = old (item (old_key)))
			not_inserted_if_conflict: (old has (new_key)) implies (item (new_key) = old (item (new_key)))
		end

	replace_found_item (v: G) is
			-- Replace `found_item' by `v'.
		do
			found_item := v
			items.put (v, found_position)
		end

feature -- Removal

	remove (a_key: H) is
			-- Remove item associated with `a_key', if present.
			-- Set `removed' if and only if an item has been
			-- removed (i.e. `a_key' was present);
			-- If not, set `found' to false.
		local
			dead_item: G
			dead_key: H
		do
			search_position (a_key)
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
				control := Removed_constant
			else
				control := Unknown_constant
			end
			unset_found_item
		ensure
			not_present: not has (a_key)
			one_less: (old has (a_key)) implies (count = old count - 1)
		end

feature -- Status setting

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			object_comparison := True
			!! equality_tester
		end

	compare_references is
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		do
			object_comparison := False
			equality_tester := Void
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
		local
			i, j, nb: INTEGER
		do
			-- j := 0
			nb := count
			!! Result.make (nb)
			from i := 1 until i > nb loop
				from
				until
					clashes.item (j) > Free_watermark
				loop
					j := j + 1
				end
				Result.put_last (items.item (j))
				i := i + 1
				j := j + 1
			end
		end

feature {NONE} -- Implementation

	set_found_item (v: G; pos: INTEGER) is
			-- Set `found_item' to `v'.
		do
			found_item := v
			found_position := pos
		ensure
			found: found
			found_item_set: found_item = v
			found_position_set: found_position = pos
		end

	unset_found_item is
			-- Get rig of `found_item'.
		local
			default_item: G
		do
			found_position := No_position
			found_item := default_item
		end

	add_space is
			-- Increase capacity.
		do
			resize (new_capacity (capacity))
		ensure
			count_not_changed: count = old count
		end

	control: INTEGER
	Inserted_constant: INTEGER is unique
	Replaced_constant: INTEGER is unique
	Removed_constant: INTEGER is unique
	Conflict_constant: INTEGER is unique
	Unknown_constant: INTEGER is unique

feature {NONE} -- Inapplicable

	bag_put (v: G) is do end

	extendible: BOOLEAN is False
			-- May new items be added?

end -- class HASH_TABLE
