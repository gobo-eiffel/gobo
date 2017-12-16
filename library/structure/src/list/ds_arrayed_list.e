note

	description:

		"Lists implemented with arrays"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_ARRAYED_LIST [G]

inherit

	DS_LIST [G]
		redefine
			has,
			occurrences
		end

	DS_RESIZABLE [G]

	KL_IMPORTED_ANY_ROUTINES
		export
			{NONE} all
		redefine
			copy,
			is_equal
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
		undefine
			copy, is_equal
		redefine
			correct_mismatch
		end

create

	make,
	make_equal,
	make_default,
	make_from_linear,
	make_from_array

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `=' as comparison criterion.
		require
			positive_n: n >= 0
		do
			create special_routines
			storage := special_routines.make (n)
			capacity := n
			set_internal_cursor (new_cursor)
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_equal (n: INTEGER)
			-- Create an empty list and allocate
			-- memory space for at least `n' items.
			-- Use `equal' as comparison criterion.
		require
			positive_n: n >= 0
		do
			create special_routines
			storage := special_routines.make (n)
			capacity := n
			set_internal_cursor (new_cursor)
			create equality_tester
		ensure
			empty: is_empty
			capacity_set: capacity = n
			before: before
		end

	make_from_linear (other: DS_LINEAR [G])
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
-- The following precondition is commented out because it is not
-- accepted by ISE 7.3 in void-safe mode.
--			not_same: other /= Current
		local
			other_cursor: DS_LINEAR_CURSOR [G]
			i, nb: INTEGER
		do
			nb := other.count
			make (nb)
			count := nb
			from
				i := 0
				other_cursor := other.new_cursor
				other_cursor.start
			until
				i >= nb
			loop
				special_routines.force (storage, other_cursor.item, i)
				other_cursor.forth
				i := i + 1
			end
		ensure
			count_set: count = other.count
			capacity_set: capacity = count
			before: before
		end

	make_from_array (other: ARRAY [G])
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
		local
			i, j, nb: INTEGER
		do
			nb := other.count
			make (nb)
			count := nb
			from
				j := 0
				i := other.lower
			until
				j >= nb
			loop
				special_routines.force (storage, other.item (i), j)
				j := j + 1
				i := i + 1
			end
		ensure
			count_set: count = other.count
			capacity_set: capacity = count
			before: before
		end

	make_default
			-- Create an empty list and allocate memory
			-- space for at least `default_capacity' items.
			-- Use `=' as comparison criterion.
		do
			make (default_capacity)
		ensure then
			before: before
		end

feature -- Access

	at alias "@", item (i: INTEGER): G
			-- Item at index `i'
			-- (Performance: O(1).)
		do
			Result := storage.item (i - 1)
		end

	first: G
			-- First item in list
			-- (Performance: O(1).)
		do
			Result := storage.item (0)
		end

	last: G
			-- Last item in list
			-- (Performance: O(1).)
		do
			Result := storage.item (count - 1)
		end

	new_cursor: DS_ARRAYED_LIST_CURSOR [G]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list
			-- (Performance: O(1).)

	capacity: INTEGER
			-- Maximum number of items in list

	occurrences (v: G): INTEGER
			-- Number of times `v' appears in list
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			i := count - 1
			if attached  equality_tester as l_tester then
				from
				until
					i < 0
				loop
					if l_tester.test (storage.item (i), v) then
						Result := Result + 1
					end
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					i < 0
				loop
					if storage.item (i) = v then
						Result := Result + 1
					end
					i := i - 1
				end
			end
		end

feature -- Status report

	has (v: G): BOOLEAN
			-- Does list include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			i: INTEGER
		do
			i := count - 1
			if attached equality_tester as l_tester then
				from
				until
					i < 0
				loop
					if l_tester.test (storage.item (i), v) then
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
					if storage.item (i) = v then
						Result := True
							-- Jump out of the loop.
						i := -1
					else
						i := i - 1
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN
			-- May list be extended with `n' items?
		do
			Result := capacity >= count + n
		ensure then
			enough_space: Result implies (capacity >= count + n)
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current list.
			-- Move all cursors `off' (unless `other = Current').
			-- (Performance: O(other.count).)
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
					-- Note: do not use `storage.twin' because SPECIAL.copy may
					-- shrink the 'capacity' down to 'count'.
				storage := storage.resized_area (storage.capacity)
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
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
			elseif ANY_.same_types (Current, other) and other.count = count then
				other_storage := other.storage
				from
					i := 0
					nb := count - 1
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

	replace (v: G; i: INTEGER)
			-- Replace item at `i'-th position by `v'.
			-- Do not move cursors.
			-- (Performance: O(1).)
		do
			storage.put (v, i - 1)
		end

	put_first (v: G)
			-- Add `v' to beginning of list.
			-- Do not move cursors.
			-- (Performance: O(count).)
		do
			put (v, 1)
		end

	put_last (v: G)
			-- Add `v' to end of list.
			-- Do not move cursors.
			-- (Performance: O(1).)
		do
			special_routines.force (storage, v, count)
			count := count + 1
		end

	put (v: G; i: INTEGER)
			-- Add `v' at `i'-th position.
			-- Do not move cursors.
			-- (Performance: O(count-i).)
		do
			if i = (count + 1) then
				put_last (v)
			else
				move_right (i, 1)
				move_cursors_right (i, 1)
				storage.put (v, i - 1)
			end
		end

	put_left_cursor (v: G; a_cursor: like new_cursor)
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			put (v, a_cursor.index)
		end

	put_right_cursor (v: G; a_cursor: like new_cursor)
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_right (v)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			put (v, a_cursor.index + 1)
		end

	force_first (v: G)
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

	force_last (v: G)
			-- Add `v' to end of list.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(1)[+resizing].)
		do
			if not extendible (1) then
				resize (new_capacity (count + 1))
			end
			special_routines.force (storage, v, count)
			count := count + 1
		end

	force (v: G; i: INTEGER)
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

	force_left_cursor (v: G; a_cursor: like new_cursor)
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

	force_right_cursor (v: G; a_cursor: like new_cursor)
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

	extend_first (other: DS_LINEAR [G])
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(count+other.count).)
		do
			extend (other, 1)
		end

	extend_last (other: DS_LINEAR [G])
			-- Add items of `other' to end of list.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Performance: O(other.count).)
		local
			i: INTEGER
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			i := count
			other_cursor := other.new_cursor
			from
				other_cursor.start
			until
				other_cursor.after
			loop
				special_routines.force (storage, other_cursor.item, i)
				i := i + 1
				other_cursor.forth
			end
				-- Set `count' only at this stage in order to cope
				-- properly with the case where `other = Current'.
			count := count + other.count
		end

	extend (other: DS_LINEAR [G]; i: INTEGER)
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
						create tmp.make (n)
						tmp.extend_last (other)
						extend (tmp, i)
					end
				else
					move_right (i, n)
					move_cursors_right (i, n)
					k := i - 1
					other_cursor := other.new_cursor
					from
						other_cursor.start
					until
						other_cursor.after
					loop
						storage.put (other_cursor.item, k)
						k := k + 1
						other_cursor.forth
					end
				end
			end
		end

	extend_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- Add item of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of a_cursor.extend_left (other).)
			-- (Performance: O(count-a_cursor.index+other.count).)
		do
			extend (other, a_cursor.index)
		end

	extend_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- Add item of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of a_cursor.extend_right (other).)
			-- (Performance: O(count-a_cursor.index+other.count).)
		do
			extend (other, a_cursor.index + 1)
		end

	append_first (other: DS_LINEAR [G])
			-- Add items of `other' to beginning of list.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Performance: O(count+other.count)[+resizing].)
		do
			append (other, 1)
		end

	append_last (other: DS_LINEAR [G])
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

	append (other: DS_LINEAR [G]; i: INTEGER)
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

	append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
			-- Add item of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Resize container if needed.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.append_left (other)'.)
			-- (Performance: O(count-a_cursor.index+other.count)[+resizing].)
		do
			append (other, a_cursor.index)
		end

	append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
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

	remove_first
			-- Remove item at beginning of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count).)
		do
			remove (1)
		end

	remove_last
			-- Remove item at end of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(1).)
		do
			move_last_cursors_after
			count := count - 1
			storage.keep_head (count)
		end

	remove (i: INTEGER)
			-- Remove item at `i'-th position.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(count-i).)
		do
			if i = count then
				remove_last
			else
				move_cursors_left (i + 1)
				move_left (i + 1, 1)
				storage.keep_head (count)
			end
		end

	remove_at_cursor (a_cursor: like new_cursor)
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index)
		end

	remove_left_cursor (a_cursor: like new_cursor)
			-- Remove item to left of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index - 1)
		end

	remove_right_cursor (a_cursor: like new_cursor)
			-- Remove item to right of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_right'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			remove (a_cursor.index + 1)
		end

	prune_first (n: INTEGER)
			-- Remove `n' first items from list.
			-- Move all cursors `off'.
			-- (Performance: O(count-n).)
		do
			prune (n, 1)
		end

	prune_last (n: INTEGER)
			-- Remove `n' last items from list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			count := count - n
			storage.keep_head (count)
		end

	prune (n: INTEGER; i: INTEGER)
			-- Remove `n' items at and after `i'-th position.
			-- Move all cursors `off'.
			-- (Performance: O(count-i-n).)
		do
			if (i + n) = (count + 1) then
				prune_last (n)
			else
				move_all_cursors_after
				move_left (i + n, n)
				storage.keep_head (count)
			end
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor)
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
			-- (Performance: O(count-a_cursor.index).)
		do
			prune (n, a_cursor.index - n)
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor)
			-- Remove `n' items to right of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_right (n)'.)
			-- (Performance: O(count-a_cursor.index-n).)
		do
			prune (n, a_cursor.index + 1)
		end

	keep_first (n: INTEGER)
			-- Keep `n' first items in list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			count := n
			storage.keep_head (count)
		end

	keep_last (n: INTEGER)
			-- Keep `n' last items in list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		do
			prune_first (count - n)
		end

	delete (v: G)
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
			-- (Performance: O(count).)
		local
			i, j, nb: INTEGER
		do
			move_all_cursors_after
			if not is_empty then
				nb := count - 1
				if attached equality_tester as l_tester then
					from
						i := 0
					until
						i > nb
					loop
						from
						until
							i > nb or else not l_tester.test (storage.item (i), v)
						loop
							i := i + 1
						end
						from
						until
							i > nb or else l_tester.test (storage.item (i), v)
						loop
							storage.put (storage.item (i), j)
							j := j + 1
							i := i + 1
						end
					end
				else
						-- Use `=' as comparison criterion.
					from
						i := 0
					until
						i > nb
					loop
						from
						until
							i > nb or else storage.item (i) /= v
						loop
							i := i + 1
						end
						from
						until
							i > nb or else storage.item (i) = v
						loop
							storage.put (storage.item (i), j)
							j := j + 1
							i := i + 1
						end
					end
				end
				count := j
				storage.keep_head (count)
			end
		end

	wipe_out
			-- Remove all items from list.
			-- Move all cursors `off'.
			-- (Performance: O(1).)
		do
			move_all_cursors_after
			count := 0
			storage.keep_head (0)
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize list so that it can contain
			-- at least `n' items. Do not lose any item.
		do
			storage := special_routines.aliased_resized_area (storage, n)
			capacity := n
		end

feature {DS_ARRAYED_LIST} -- Implementation

	storage: SPECIAL [G]
			-- Storage for items of the list

feature {NONE} -- Implementation

	move_right (i, offset: INTEGER)
			-- Move items at and after `i' position
			-- by `offset' positions to the right.
		require
			valid_index: 1 <= i and i <= count + 1
			positive_offset: offset >= 0
			extendible: extendible (offset)
		local
			j, nb: INTEGER
		do
			if i <= count then
					-- Fill the gap between `count' and `i + offset' if any.
				from
					j := count
					nb := i + offset - 2
				until
					j > nb
				loop
					special_routines.force (storage, storage.item (i - 1), j)
					j := j + 1
				end
					-- Move items to positions after `count'.
				from
					nb := count + offset - 1
				until
					j > nb
				loop
					special_routines.force (storage, storage.item (j - offset), j)
					j := j + 1
				end
					-- Move items to positions before `count'.
				from
					j := count - 1
					nb := i + offset - 1
				until
					j < nb
				loop
					storage.put (storage.item (j - offset), j)
					j := j - 1
				end
				count := count + offset
			end
		ensure
			count_set: count = old count + offset
		end

	move_left (i, offset: INTEGER)
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
				j := i - 1
				nb := count - 1
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

	special_routines: KL_SPECIAL_ROUTINES [G]
			-- Routines that ought to be in SPECIAL

feature {NONE} -- Implementation

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		do
			internal_cursor := c
		end

	internal_cursor: like new_cursor
			-- Internal cursor

feature {NONE} -- Cursor movement

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

	move_last_cursors_after
			-- Move `after' all cursors at last position.
		local
			i: INTEGER
			a_cursor, next_cursor: detachable like new_cursor
			previous_cursor: like new_cursor
		do
			i := count - 1
			a_cursor := internal_cursor
			if a_cursor.position = i then
				a_cursor.set_after
			end
			previous_cursor := a_cursor
			a_cursor := a_cursor.next_cursor
			from
			until
				(a_cursor = Void)
			loop
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

	move_cursors_left (i: INTEGER)
			-- Move left by one position all cursors
			-- at or after index `i'.
		require
			valid_i: 2 <= i and i <= count
		local
			j: INTEGER
			a_cursor: detachable like new_cursor
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				j := a_cursor.position
				if j >= i - 1 then
					a_cursor.set_position (j - 1)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

	move_cursors_right (i, offset: INTEGER)
			-- Move right by `offset' positions all cursors
			-- at or after index `i'.
		require
			valid_index: 1 <= i and i <= (count - offset + 1)
			positive_offset: offset >= 0
		local
			a_cursor: detachable like new_cursor
			j: INTEGER
		do
			from
				a_cursor := internal_cursor
			until
				(a_cursor = Void)
			loop
				j := a_cursor.position
				if j >= i - 1 then
					a_cursor.set_position (j + offset)
				end
				a_cursor := a_cursor.next_cursor
			end
		end

feature {DS_ARRAYED_LIST_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G
			-- Item at `a_cursor' position
			-- (Performance: O(1).)
		do
			Result := storage.item (a_cursor.position)
		end

	cursor_index (a_cursor: like new_cursor): INTEGER
			-- Index of `a_cursor''s current position
			-- (Performance: O(1).)
		do
			Result := a_cursor.position
			if Result = a_cursor.after_position then
				Result := count
			end
			Result := Result + 1
		end

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on first item?
		do
			Result := not is_empty and a_cursor.position = 0
		end

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on last item?
		do
			Result := not is_empty and a_cursor.position = count - 1
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		do
			Result := (a_cursor.position = other.position)
		end

	cursor_start (a_cursor: like new_cursor)
			-- Move `a_cursor' to first position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			if is_empty then
				a_cursor.set_after
			else
				a_cursor.set_position (0)
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			a_cursor.set_position (count - 1)
			if count /= 0 and was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_forth (a_cursor: like new_cursor)
			-- Move `a_cursor' to next position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			was_off := (p = -1)
			p := p + 1
			if p >= count then
				p := a_cursor.after_position
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
			a_cursor.set_position (p)
		end

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
			p: INTEGER
		do
			p := a_cursor.position
			if p = a_cursor.after_position then
				was_off := True
				p := count - 1
			else
				p := p - 1
			end
			a_cursor.set_position (p)
			if p = -1 then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_search_forth (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			i, nb: INTEGER
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			i := a_cursor.position
			nb := count - 1
			if i = a_cursor.after_position then
				i := nb + 1
			elseif attached equality_tester as l_tester then
				from
				until
					i > nb or else l_tester.test (storage.item (i), v)
				loop
					i := i + 1
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					i > nb or else storage.item (i) = v
				loop
					i := i + 1
				end
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

	cursor_search_back (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
			-- (Performance: O(a_cursor.index).)
		local
			i: INTEGER
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			i := a_cursor.position
			if attached equality_tester as l_tester then
				from
				until
					i < 0 or else l_tester.test (storage.item (i), v)
				loop
					i := i - 1
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					i < 0 or else storage.item (i) = v
				loop
					i := i - 1
				end
			end
			a_cursor.set_position (i)
			if i = -1 then
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			elseif was_off then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_go_after (a_cursor: like new_cursor)
			-- Move `a_cursor' to `after' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			a_cursor.set_after
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			a_cursor.set_position (-1)
			if not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_to (a_cursor, other: like new_cursor)
			-- Move `a_cursor' to `other''s position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			a_cursor.set_position (other.position)
			if not a_cursor.off then
				if was_off then
					add_traversing_cursor (a_cursor)
				end
			elseif not was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_i_th (a_cursor: like new_cursor; i: INTEGER)
			-- Move `a_cursor' to `i'-th position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			was_off := a_cursor.off
			if i > count then
				a_cursor.set_after
				if not was_off then
					remove_traversing_cursor (a_cursor)
				end
			else
				a_cursor.set_position (i - 1)
				if i = 0 then
					if not was_off then
						remove_traversing_cursor (a_cursor)
					end
				elseif was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

feature {NONE} -- Storable mismatch

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_stored_version_number: INTEGER
		do
			if not attached mismatch_information.stored_version as l_stored_version or else l_stored_version.is_empty then
				correct_mismatch_20130823
			elseif l_stored_version.is_integer then
				l_stored_version_number := l_stored_version.to_integer
				if l_stored_version_number < 20130823 then
					correct_mismatch_20130823
				else
					precursor
				end
			else
				precursor
			end
		end

	correct_mismatch_20130823
			-- Correct storable mismatch introducted in version "20130823".
		do
			storage.move_data (1, 0, count)
			storage.keep_head (count)
			capacity := storage.capacity
		end

invariant

	storage_not_void: storage /= Void
	capacity_definition: capacity = storage.capacity
	special_routines_not_void: special_routines /= Void

end
