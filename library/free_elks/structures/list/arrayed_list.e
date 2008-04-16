indexing

	description:
		"Lists implemented by resizable arrays"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: sequence;
	representation: array;
	access: index, cursor, membership;
	size: fixed;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class ARRAYED_LIST [G] inherit

	ARRAY [G]
		rename
			force as force_i_th,
			item as array_item,
			infix "@" as array_infix_at,
			make as array_make,
			put as put_i_th,
			count as array_count,
			index_set as array_index_set,
			bag_put as put,
			resize as array_resize
		export
			{NONE}
				all
			{ARRAYED_LIST}
				array_make, subcopy, area, all_default, upper, lower,
				same_items, subarray
			{ANY}
				capacity
		undefine
			linear_representation, prunable, put, is_equal,
			prune, occurrences, extendible, fill,
			for_all, there_exists, do_all, do_if
		redefine
			extend, prune_all, full, wipe_out,
			is_inserted, make_from_array, has, valid_index
		end

	DYNAMIC_LIST [G]
		undefine
			put_i_th,
			force, is_inserted, copy
		redefine
			first, last, swap, wipe_out, i_th, infix "@",
			go_i_th, move, prunable, start, finish,
			count, prune, remove,
			put_left, merge_left,
			merge_right, duplicate, prune_all, has, search,
			append, valid_index
		select
			count, index_set, i_th, infix "@"
		end

create
	make, make_filled, make_from_array

create {ARRAYED_LIST}
	array_make

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate list with `n' items.
			-- (`n' may be zero for empty list.)
		require
			valid_number_of_items: n >= 0
		do
			index := 0
			set_count (0)
			array_make (1, n)
		ensure
			correct_position: before
			is_empty: is_empty
		end

	make_filled (n: INTEGER) is
			-- Allocate list with `n' items.
			-- (`n' may be zero for empty list.)
			-- This list will be full.
		require
			valid_number_of_items: n >= 0
		do
			index := 0
			set_count (n)
			array_make (1, n)
		ensure
			correct_position: before
			filled: full
		end

	make_from_array (a: ARRAY [G]) is
			-- Create list from array `a'.
		do
			Precursor (a)
			lower := 1
			set_count (a.count)
			upper := count
			index := 0
		ensure then
			correct_position: before
			filled: count = a.count
		end

feature -- Access

	item: G is
			-- Current item
		require else
			index_is_valid: valid_index (index)
		do
			Result := area.item (index - 1)
		end

	i_th alias "[]", infix "@" (i: INTEGER): like item assign put_i_th is
			-- Item at `i'-th position
		do
			Result := area.item (i - 1)
		end

	first: like item is
			-- Item at first position
		do
			Result := area.item (0)
		end

	last: like first is
			-- Item at last position
		do
			Result := area.item (count - 1)
		end

	index: INTEGER
			-- Index of `item', if valid.

	cursor: ARRAYED_LIST_CURSOR is
			-- Current cursor position
		do
			create Result.make (index)
		end

	has (v: like item): BOOLEAN is
			-- Does current include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			l_area: like area
			i, nb: INTEGER
		do
			l_area := area
			nb := count - 1
			if object_comparison and v /= Void then
				from
				until
					i > nb or Result
				loop
					Result := {l_item: like item} l_area.item (i) and then v.is_equal (l_item)
					i := i + 1
				end
			else
				from
				until
					i > nb or Result
				loop
					Result := v = l_area.item (i)
					i := i + 1
				end
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items.

feature -- Status report

	prunable: BOOLEAN is
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

	full: BOOLEAN is
			-- Is structure filled to capacity?
		do
			Result := (count = capacity)
		end

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		do
			if {al_c: ARRAYED_LIST_CURSOR} p then
				Result := valid_cursor_index (al_c.index)
			end
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index?
		do
			Result := (1 <= i) and (i <= count)
		end

	is_inserted (v: G): BOOLEAN is
			-- Has `v' been inserted at the end by the most recent `put' or
			-- `extend'?
		do
			check
				put_constraint: (v /= last) implies not off
					-- Because, if this routine has not been called by
					-- `extend', it was called by `put' which replaces the
					-- current item, which implies the cursor is not `off'.
			end

			Result := (v = last) or else (v = item)
		end

feature -- Cursor movement

	move (i: INTEGER) is
			-- Move cursor `i' positions.
		do
			index := index + i
			if (index > count + 1) then
				index := count + 1
			elseif (index < 0) then
				index := 0
			end
		end

	start is
			-- Move cursor to first position if any.
		do
			index := 1
		ensure then
			after_when_empty: is_empty implies after
		end

	finish is
			-- Move cursor to last position if any.
		do
			index := count
		--| Temporary patch. Start moves the cursor
		--| to the first element. If the list is empty
		--| the cursor is before. The parents (CHAIN, LIST...)
		--| and decendants (ARRAYED_TREE...) need to be revised.
		ensure then
			before_when_empty: is_empty implies before
		end

	forth is
			-- Move cursor one position forward.
		do
			index := index + 1
		end

	back is
			-- Move cursor one position backward.
		do
			index := index - 1
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
		do
			index := i
		end

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		do
			if {al_c: ARRAYED_LIST_CURSOR} p then
				index := al_c.index
			else
				check
					correct_cursor_type: False
				end
			end
		end

	search (v: like item) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- If structure does not include `v' ensure that
			-- `exhausted' will be true.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			l_area: like area
			i, nb: INTEGER
			l_found: BOOLEAN
		do
			l_area := area
			nb := count - 1
				-- If we are before we need to be sure
				-- that i is positive.
			i := (index - 1).max (0)
			if object_comparison and v /= Void then
				from
				until
					i > nb or l_found
				loop
					l_found := {l_item: like item} l_area.item (i) and then v.is_equal (l_item)
					i := i + 1
				end
			else
				from
				until
					i > nb or l_found
				loop
					l_found := v = l_area.item (i)
					i := i + 1
				end
			end
				-- Set position of `index' to `i', location of item when
				-- found, otherwise to `i + 1' which corresponds to `after'.
			if l_found then
				index := i
			else
				index := i + 1
			end
		end

feature -- Element change

	put_front (v: like item) is
			-- Add `v' to the beginning.
			-- Do not move cursor.
		do
			if is_empty then
				extend (v)
			else
				insert (v, 1)
			end
			index := index + 1
		end

	force, extend (v: like item) is
			-- Add `v' to end.
			-- Do not move cursor.
		local
			i: INTEGER
		do
			i := count + 1
			set_count (i)
			force_i_th (v, i)
		end

	put_left (v: like item) is
			-- Add `v' to the left of current position.
			-- Do not move cursor.
		do
			if after or is_empty then
				extend (v)
			else
				insert (v, index)
			end
			index := index + 1
		end

	put_right (v: like item) is
			-- Add `v' to the right of current position.
			-- Do not move cursor.
		do
			if index = count then
				extend (v)
			else
				insert (v, index + 1)
			end
		end

	replace (v: like first) is
			-- Replace current item by `v'.
		do
			put_i_th (v, index)
		end

	merge_left (other: ARRAYED_LIST [G]) is
			-- Merge `other' into current structure before cursor.
		local
			old_index: INTEGER
			old_other_count: INTEGER
		do
			old_index := index
			old_other_count := other.count
			index := index - 1
			merge_right (other)
			index := old_index + old_other_count
		end

	merge_right (other: ARRAYED_LIST [G]) is
			-- Merge `other' into current structure after cursor.
		local
			l_new_count, l_old_count: INTEGER
		do
			if not other.is_empty then
				l_old_count := count
				l_new_count := l_old_count + other.count
				conservative_resize (1, l_new_count)
				set_count (l_new_count)
				if index < l_old_count then
					subcopy (Current, index + 1, l_old_count,
						index + other.count + 1)
				end
				subcopy (other, 1, other.count, index + 1)
				other.wipe_out
			end
		end

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
		local
			c, old_count, new_count: INTEGER
		do
			if {al: ARRAYED_LIST [G]} s then -- Optimization for arrayed lists
				c := al.count
					-- If `s' is empty nothing to be done.
				if c > 0 then
					old_count := count
					new_count := old_count + c
					conservative_resize (1, new_count)
					set_count (new_count)
					subcopy (al, 1, c, old_count + 1)
				end
			else
				Precursor {DYNAMIC_LIST} (s)
			end
		end

feature -- Resizing

	resize (new_capacity: INTEGER) is
			-- Resize list so that it can contain
			-- at least `n' items. Do not lose any item.
		require
			new_capacity_large_enough: new_capacity >= capacity
		do
			grow (new_capacity)
		ensure
			capacity_set: capacity >= new_capacity
		end

feature -- Removal

	prune (v: like item) is
			-- Remove first occurrence of `v', if any,
			-- after cursor position.
			-- Move cursor to right neighbor.
			-- (or `after' if no right neighbor or `v' does not occur)
		do
			if before then index := 1 end
			if object_comparison then
				if v /= Void then
					from
					until
						after or else ({i: like item} item and then v.is_equal (i))
					loop
						forth
					end
				end
			else
				from
				until
					after or else item = v
				loop
					forth
				end
			end
			if not after then remove end
		end

	remove is
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor)
		local
			default_value: G
		do
			if index < count then
				subcopy (Current, index + 1, count, index)
			end
			set_count (count - 1)
			area.put (default_value, count)
		ensure then
			index: index = old index
		end

	prune_all (v: like item) is
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, nb: INTEGER
			offset: INTEGER
			res: BOOLEAN
			obj_cmp: BOOLEAN
			default_val: like item
			l_area: like area
		do
			obj_cmp := object_comparison
			from
				l_area := area
				i := 0
				nb := count
			until
				i = count
			loop
				if i < nb - offset then
					if offset > 0 then
						l_area.put (l_area.item (i + offset), i)
					end
					if obj_cmp then
						res := equal (v, l_area.item (i))
					else
						res := (v = l_area.item (i))
					end
					if res then
						offset := offset + 1
					else
						i := i + 1
					end
				else
					l_area.put (default_val, i)
					i := i + 1
				end
			end
			set_count (count - offset)
			index := count + 1
		ensure then
			is_after: after
		end

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			index := index - 1
			remove
		end

	remove_right is
			-- Remove item to the right of cursor position
			-- Do not move cursor
		do
			index := index + 1
			remove
			index := index - 1
		end

	wipe_out is
			-- Remove all items.
		do
			set_count (0)
			index := 0
			clear_all
		end

feature -- Transformation

	swap (i: INTEGER) is
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		local
			old_item: like item
		do
			old_item := item
			replace (area.item (i - 1))
			area.put (old_item, i - 1)
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-list beginning at current position
			-- and having min (`n', `count' - `index' + 1) items.
		local
			end_pos: INTEGER
		do
			if after then
				Result := new_filled_list (0)
			else
				end_pos := count.min (index + n - 1)
				Result := new_filled_list (end_pos - index + 1)
				Result.subcopy (Current, index, end_pos, 1)
			end
		end

feature {NONE} -- Inapplicable

	new_chain: like Current is
			-- Unused
		do
			Result := Current
		end

feature {NONE} -- Implementation

	insert (v: like item; pos: INTEGER) is
			-- Add `v' at `pos', moving subsequent items
			-- to the right.
		require
			index_small_enough: pos <= count
			index_large_enough: pos >= 1
		do
			if count + 1 > capacity then
				auto_resize (lower, count + 1)
			end
			set_count (count + 1)
			subcopy (Current, pos , count - 1 , pos + 1)
			enter (v, pos)
		ensure
			new_count: count = old count + 1
			index_unchanged: index = old index
			insertion_done: i_th (pos) = v
		end

	set_count (new_count: INTEGER) is
			-- Set `count' to `new_count'
		do
			count := new_count
		end

	new_filled_list (n: INTEGER): like Current is
			-- New list with `n' elements.
		require
			n_non_negative: n >=0
		do
			create Result.make_filled (n)
		ensure
			new_filled_list_not_void: Result /= Void
			new_filled_list_count_set: Result.count = n
			new_filled_list_full: Result.full
			new_filled_list_before: Result.before
		end

invariant

	prunable: prunable
	starts_from_one: lower = 1
	empty_means_storage_empty: is_empty implies all_default

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class ARRAYED_LIST
