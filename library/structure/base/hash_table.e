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
			-- Item associated with `key', if present
			-- otherwise default value of type `G'
		local
			a_cell: like dead_cell
		do
			search_position (k)
			a_cell := storage.item (position)
			if valid_cell (a_cell) then
				Result := a_cell.first
			end
		end

	cursor: CURSOR is
			-- Current cursor position
		do
			!HASH_TABLE_CURSOR! Result.make (internal_cursor.position)
		end

	current_keys: ARRAY [H] is
			-- New array containing actually used keys, from 1 to `count'
		local
			i, j, nb: INTEGER
			a_cell: like dead_cell
		do
			-- j := 0
			nb := count
			!! Result.make (1, nb)
			from i := 1 until i > nb loop
				from
					a_cell := storage.item (j)
				until
					valid_cell (a_cell)
				loop
					j := j + 1
					a_cell := storage.item (j)
				end
				Result.put (a_cell.second, i)
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

	put (new: G; key: H) is
			-- Insert `new' with `key' if there is no other item
			-- associated with the same key.
			-- Set `inserted' if and only if an insertion has
			-- been made (i.e. `key' was not present).
			-- If not, set `conflict'.
			-- In either case, set `found_item' to the item
			-- now associated with `key' (previous item if
			-- there was one, `new' otherwise).
		require
			valid_key: valid_key (key)
		local
			current_cell: like dead_cell
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			search_position (key)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (new, key)
				storage.put (current_cell, position)
				count := count + 1
				control := Inserted_constant
				set_found_item (new)
			else
				control := Conflict_constant
				set_found_item (current_cell.first)
			end
		ensure
			insertion_done: (not old has (key)) implies item (key) = new
			now_present: has (key)
			one_more_if_inserted: (not old has (key)) implies (count = old count + 1)
			unchanged_if_conflict: (old has (key)) implies (count = old count)
		end

	force (new: G; key: H) is
			-- Update table so that `new' will be the item associated
			-- with `key'.
			-- If there was an item for that key, set `found'
			-- and set `found_item' to that item.
			-- If there was none, set `found' to False.
		local
			current_cell: like dead_cell
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			search_position (key)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				!! current_cell.make (new, key)
				storage.put (current_cell, position)
				count := count + 1
				unset_found_item
			else
				set_found_item (current_cell.first)
				current_cell.put_first (new)
			end
			control := Inserted_constant
		ensure
			insertion_done: item (key) = new
			now_present: has (key)
			found_item_is_old_item: found implies (found_item = old (item (key)))
		end

	extend (new: G; key: H) is
			-- Assuming there is no item of key `key',
			-- insert `new' with `key'.
			-- Set `inserted'.
		require
			not_present: not has (key)
		local
			current_cell: like dead_cell
		do
			if count = capacity then
				resize (new_capacity (count + 1))
			end
			search_position (key)
			check not_has: not valid_cell (storage.item (position)) end
			!! current_cell.make (new, key)
			storage.put (current_cell, position)
			count := count + 1
			unset_found_item
			control := Inserted_constant
		ensure
			insertion_done: item (key) = new
			one_more: count = old count + 1
		end

	replace (new: G; key: H) is
			-- Replace item at `key', if present,
			-- with `new'; do not change associated key.
			-- Set `replaced' if and only if a replacement has been made
			-- (i.e. `key' was present); otherwise set `found' to false.
			-- Set `found_item' to the item previously associated
			-- with `key'.
		local
			current_cell: like dead_cell
		do
			search_position (key)
			current_cell := storage.item (position)
			if not valid_cell (current_cell) then
				control := Unknown_constant
				unset_found_item
			else
				set_found_item (current_cell.first)
				current_cell.put_first (new)
				control := Replaced_constant
			end
		ensure
			insertion_done: (old has (key)) implies item (key) = new
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
			current_cell: like dead_cell
			old_position: INTEGER
		do
			move_all_cursors_after
			search_position (old_key)
			current_cell := storage.item (position)
			if valid_cell (current_cell) then
				old_position := position
				set_found_item (current_cell.first)
				search_position (new_key)
				if not valid_cell (storage.item (position)) then
					storage.put (dead_cell, old_position)
					!! current_cell.make (found_item, new_key)
					storage.put (current_cell, position)
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

feature -- Removal

	remove (key: H) is
			-- Remove item associated with `key', if present.
			-- Set `removed' if and only if an item has been
			-- removed (i.e. `key' was present);
			-- If not, set `found' to false.
		local
			i: INTEGER
		do
			search_position (key)
			if valid_slot (position) then
				move_cursors_forth (position)
				storage.put (dead_cell, position)
				count := count - 1
				control := Removed_constant
			else
				control := Unknown_constant
			end
			unset_found_item
		ensure
			not_present: not has (key)
			one_less: (old has (key)) implies (count = old count - 1)
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
			a_cell: like dead_cell
		do
			-- j := 0
			nb := count
			!! Result.make (nb)
			from i := 1 until i > nb loop
				from
					a_cell := storage.item (j)
				until
					valid_cell (a_cell)
				loop
					j := j + 1
					a_cell := storage.item (j)
				end
				Result.put_last (a_cell.first)
				i := i + 1
				j := j + 1
			end
		end

feature {NONE} -- Implementation

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
