indexing

	description:

		"Lists implemented with arrays"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_LIST [G]

inherit

	DS_LIST [G]
		redefine
			has, occurrences
		end

	DS_RESIZABLE [G]

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]
		undefine
			is_equal, copy
		end

creation

	make, make_equal, make_from_linear

feature {NONE} -- Initialization

	make (n: INTEGER) is
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			!! FIXED_ARRAY_
			storage := FIXED_ARRAY_.make (n + 1)
			capacity := n
			internal_cursor := new_cursor
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER) is
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			!! FIXED_ARRAY_
			storage := FIXED_ARRAY_.make (n + 1)
			capacity := n
			internal_cursor := new_cursor
			!! equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_from_linear (other: DS_LINEAR [G]) is
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			i, nb: INTEGER
		do
			nb := other.count
			make (nb)
			count := nb
			from
				i := 1
				other_cursor := other.new_cursor
				other_cursor.start
			until
				i > nb
			loop
				storage.put (other_cursor.item, i)
				other_cursor.forth
				i := i + 1
			end
		ensure
			count_set: count = other.count
			capacity_set: capacity = count
			before: before
		end

feature -- Access

	infix "@", item (i: INTEGER): G is
			-- Item at index `i'
			-- (Performance: O(1).)
		do
			Result := storage.item (i)
		end

	first: G is
			-- First item in list
			-- (Performance: O(1).)
		do
			Result := storage.item (1)
		end

	last: G is
			-- Last item in list
			-- (Performance: O(1).)
		do
			Result := storage.item (count)
		end

	new_cursor: DS_ARRAYED_LIST_CURSOR [G] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list
			-- (Performance: O(1).)

	capacity: INTEGER
			-- Maximum number of items in list

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in list
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_tester: like equality_tester
		do
			i := count
			a_tester := equality_tester
			if a_tester /= Void then
				from  until i < 1 loop
					if a_tester.test (storage.item (i), v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from  until i < 1 loop
					if storage.item (i) = v then
						Result := Result + 1
					end
					i := i - 1
				end
			end
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does list include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
			a_tester: like equality_tester
		do
			i := count
			a_tester := equality_tester
			if a_tester /= Void then
				from until i < 1 loop
					if a_tester.test (storage.item (i), v) then
						Result := True
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			else
					-- Use `=' as comparison criterion.
				from until i < 1 loop
					if storage.item (i) = v then
						Result := True
						i := 0 -- Jump out of the loop.
					else
						i := i - 1
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN is
			-- May list be extended with `n' items?
		do
			Result := capacity >= count + n
		ensure then
			enough_space: Result implies (capacity >= count + n)
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current list.
			-- Move all cursors `off' (unless `other = Current').
			-- (Performance: O(other.count).)
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
				storage := clone (storage)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is list equal to `other'?
			-- Do not take cursor positions, capacity
			-- nor `equality_tester' into account.
			-- (Performance: O(count).)
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if Current = other then
				Result := True
			elseif same_type (other) and other.count = count then
				other_storage := other.storage
				from
					i := 1
					nb := count
					Result := True
				until
					not Result or i > nb
				loop
					Result := (storage.item (i) = other_storage.item (i))
					i := i + 1
				end
			end
		end

feature -- Element change

	replace (v: G; i: INTEGER) is
			-- Replace item at `i'-th position by `v'.
			-- Do not move cursors.
			-- (Performance: O(1).)
		do
			storage.put (v, i)
		end

	put_first (v: G) is
			-- Add `v' to beginning of list.
			-- Do not move cursors.
			-- (Performance: O(count).)
		do
			put (v, 1)
		end

	put_last (v: G) is
			-- Add `v' to end of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		do
			count := count + 1
			storage.put (v, count)
		end

	put (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
			-- Do not move cursors.
			-- (Performance: O(count-i).)
		do
			if i = (count + 1) then
				put_last (v)
			else
				move_right (i, 1)
				move_cursors_right (i, 1)
				storage.put (v, i)
			end
		end

	put_left_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			put (v, a_cursor.index)
		end

	put_right_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_right (v)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			put (v, a_cursor.index + 1)
		end

	force_first (v: G) is
			-- Add `v' to beginning of list.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(count)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			put (v, 1)
		end

	force_last (v: G) is
			-- Add `v' to end of list.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(1)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			count := count + 1
			storage.put (v, count)
		end

	force (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(count-i)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			put (v, i)
		end

	force_left_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.force_left (v)'.)
			-- (Performance: O(count-a_cursor.index)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			put (v, a_cursor.index)
		end

	force_right_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.force_right (v)'.)
			-- (Performance: O(count-a_cursor.index)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			put (v, a_cursor.index + 1)
		end

	extend_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(count+other.count).)
		do
			extend (other, 1)
		end

	extend_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			i := count + 1
			other_cursor := other.new_cursor
			from other_cursor.start until other_cursor.after loop
				storage.put (other_cursor.item, i)
				i := i + 1
				other_cursor.forth
			end
				-- Set `count' only at this stage in order to cope
				-- properly with the case where `other = Current'.
			count := count + other.count
		end

	extend (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(count-i+other.count).)
		local
			k, n: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
			tmp: DS_ARRAYED_LIST [G]
		do
			if i = (count + 1) then
				extend_last (other)
			else
				n := other.count
				if other = Current then
					if n > 0 then
						!! tmp.make (n)
						tmp.extend_last (other)
						extend (tmp, i)
					end
				else
					move_right (i, n)
					move_cursors_right (i, n)
					k := i
					other_cursor := other.new_cursor
					from other_cursor.start until other_cursor.after loop
						storage.put (other_cursor.item, k)
						k := k + 1
						other_cursor.forth
					end
				end
			end
		end

	extend_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of a_cursor.extend_left (other).)
			-- (Performance: O(count-a_cursor.index+other.count).)
		do
			extend (other, a_cursor.index)
		end

	extend_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of a_cursor.extend_right (other).)
			-- (Performance: O(count-a_cursor.index+other.count).)
		do
			extend (other, a_cursor.index + 1)
		end

	append_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(count+other.count)[+resizing].)
		do
			append (other, 1)
		end

	append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of list.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(other.count)[+resizing].)
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (new_capacity (count + nb))
			end
			extend_last (other)
		end

	append (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(count-i+other.count)[+resizing].)
		local
			nb: INTEGER
		do
			nb := other.count
			if not extendible (nb) then
				resize (new_capacity (count + nb))
			end
			extend (other, i)
		end

	append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.append_left (other)'.)
			-- (Performance: O(count-a_cursor.index+other.count)[+resizing].)
		do
			append (other, a_cursor.index)
		end

	append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add item of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.append_right (other)'.)
			-- (Performance: O(count-a_cursor.index+other.count)[+resizing].)
		do
			append (other, a_cursor.index + 1)
		end

feature -- removal

	remove_first is
			-- Remove item at beginning of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count).)
		do
			remove (1)
		end

	remove_last is
			-- Remove item at end of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(1).)
		local
			dead_item: G
		do
			move_last_cursors_after
			storage.put (dead_item, count)
			count := count - 1
		end

	remove (i: INTEGER) is
			-- Remove item at `i'-th position.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count-i).)
		local
			dead_item: G
		do
			if i = count then
				remove_last
			else
				move_cursors_left (i + 1)
				move_left (i + 1, 1)
				storage.put (dead_item, count + 1)
			end
		end

	remove_at_cursor (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index)
		end

	remove_left_cursor (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index - 1)
		end

	remove_right_cursor (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_right'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index + 1)
		end

	prune_first (n: INTEGER) is
			-- Remove `n' first items from list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		do
			prune (n, 1)
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			clear_items (count - n + 1, count)
			count := count - n
		end

	prune (n: INTEGER; i: INTEGER) is
			-- Remove `n' items at and after `i'-th position.
			-- Move all cursors `off'.
			-- (Performance: O(count-i-n).)
		do
			if (i + n) = (count + 1) then
				prune_last (n)
			else
				move_all_cursors_after
				move_left (i + n, n)
				clear_items (count + 1, count + n)
			end
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			prune (n, a_cursor.index - n)
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_right (n)'.)
			-- (Performance: O(count-a_cursor.index-n).)
		do
			prune (n, a_cursor.index + 1)
		end

	keep_first (n: INTEGER) is
			-- Keep `n' first items in list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			clear_items (n + 1, count)
			count := n
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		do
			prune_first (count - n)
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
			-- (Performance: O(count^2).)
		local
			i, j, k: INTEGER
			old_count: INTEGER
			a_tester: like equality_tester
		do
			move_all_cursors_after
			if not is_empty then
				old_count := count
				a_tester := equality_tester
				if a_tester /= Void then
					from i := count until i < 1 loop
						if a_tester.test (storage.item (i), v) then
							from
								k := i + 1
								j := 1 
								i := i - 1
							until
								i < 1 or else
								not a_tester.test (storage.item (i), v)
							loop
								j := j + 1
								i := i - 1
							end
							move_left (k, j)
						else
							i := i - 1
						end
					end
				else
						-- Use `=' as comparison criterion.
					from i := count until i < 1 loop
						if storage.item (i) = v then
							from
								k := i + 1
								j := 1 
								i := i - 1
							until
								i < 1 or else
								storage.item (i) /= v
							loop
								j := j + 1
								i := i - 1
							end
							move_left (k, j)
						else
							i := i - 1
						end
					end
				end
				clear_items (count + 1, old_count)
			end
		end

	wipe_out is
			-- Remove all items from list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			clear_items (1, count)
			count := 0
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize list so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage := FIXED_ARRAY_.resize (storage, n + 1)
			capacity := n
		end

feature {DS_ARRAYED_LIST} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Storage for items of the list

feature {NONE} -- Implementation

	move_right (i, offset: INTEGER) is
			-- Move items at and after `i' position
			-- by `offset' positions to the right.
		require
			valid_index: 1 <= i and i <= count + 1
			positive_offset: offset >= 0
			extendible: extendible (offset)
		local
			j: INTEGER
		do
			from
				j := count
				count := count + offset
			until
				j < i
			loop
				storage.put (storage.item (j), j + offset)
				j := j - 1
			end
		ensure
			count_set: count = old count + offset
		end

	move_left (i, offset: INTEGER) is
			-- Move items at and after `i' position
			-- by `offset' positions to the left.
		require
			valid_index: 1 <= i and i <= count + 1
			positive_offset: offset >= 0
			constraint: offset < i
		local
			j, nb: INTEGER
		do
			from
				j := i
				nb := count
			until
				j > nb
			loop
				storage.put (storage.item (j), j - offset)
				j := j + 1
			end
			count := count - offset
		ensure
			count_set: count = old count - offset
		end

	clear_items (s, e: INTEGER) is
			-- Clear items in `storage' within bounds `s'..`e'.
		require
			s_large_enough: s >= 1
			e_small_enough: e <= capacity
			valid_bound: s <= e + 1
		local
			dead_item: G
			i: INTEGER
		do
			from i := s until i > e loop
				storage.put (dead_item, i)
				i := i + 1
			end
		end

	FIXED_ARRAY_: KL_FIXED_ARRAY_ROUTINES [G]
			-- Routines that ought to be in FIXED_ARRAY

feature {NONE} -- Implementation

	internal_cursor: like new_cursor
			-- Internal cursor

feature {NONE} -- Cursor movement

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

	move_last_cursors_after is
			-- Move `after' all cursors at last position.
		local
			i: INTEGER
			a_cursor, previous_cursor, next_cursor: like new_cursor
		do
			i := count
			a_cursor := internal_cursor
			if a_cursor.position = i then
				a_cursor.set_after
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from until (a_cursor = Void) loop
				if a_cursor.position = i then
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

	move_cursors_left (i: INTEGER) is
			-- Move left by one position all cursors
			-- at or after index `i'.
		require
			valid_i: 2 <= i and i <= count
		local
			j: INTEGER
			a_cursor, previous_cursor, next_cursor: like new_cursor
		do
			from a_cursor := internal_cursor until (a_cursor = Void) loop
				j := a_cursor.position
				if j >= i then
					a_cursor.set_position (j - 1)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

	move_cursors_right (i, offset: INTEGER) is
			-- Move right by `offset' positions all cursors
			-- at or after index `i'.
		require
			valid_index: 1 <= i and i <= (count - offset + 1)
			positive_offset: offset >= 0
		local
			a_cursor: like new_cursor
			j: INTEGER
		do
			from a_cursor := internal_cursor until (a_cursor = Void) loop
				j := a_cursor.position
				if j >= i then
					a_cursor.set_position (j + offset)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

invariant

	storage_not_void: storage /= Void
	capacity_definition: capacity = storage.count - 1
	fixed_array_routines_not_void: FIXED_ARRAY_ /= Void

end -- class DS_ARRAYED_LIST
