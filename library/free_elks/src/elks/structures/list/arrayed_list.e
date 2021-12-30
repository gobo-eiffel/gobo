note
	description: "Lists implemented by resizable arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sequence
	representation: array
	access: index, cursor, membership
	size: fixed
	contents: generic
	date: "$Date: 2021-06-18 17:01:52 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105548 $"

class ARRAYED_LIST [G] inherit

	TO_SPECIAL [G]
		rename
			put as array_put,
			at as array_at,
			item as array_item,
			valid_index as array_valid_index,
			area as area_v2
		redefine
			is_equal, copy
		end

	RESIZABLE [G]
		redefine
			is_equal, copy
		end

	DYNAMIC_LIST [G]
		undefine
			put_i_th,
			force, is_inserted
		redefine
			first, last, swap, wipe_out, i_th, at,
			go_i_th, move, prunable, start, finish,
			prune, new_cursor,
			put_left, merge_left,
			merge_right, duplicate, prune_all, has, search,
			append, valid_index, is_equal, copy,
			for_all, there_exists, do_all, do_if,
			remove_i_th
		end

	MISMATCH_CORRECTOR
		redefine
			is_equal, copy, correct_mismatch
		end

create
	make,
	make_filled,
	make_from_array,
	make_from_iterable

convert
	make_from_iterable ({ARRAY [G]})

feature -- Initialization

	make (n: INTEGER)
			-- Allocate list with `n' items.
			-- (`n' may be zero for empty list.)
		require
			valid_number_of_items: n >= 0
		do
			index := 0
			create area_v2.make_empty (n)
		ensure
			correct_position: before
			is_empty: is_empty
		end

	make_filled (n: INTEGER)
			-- Allocate list with `n' items.
			-- (`n' may be zero for empty list.)
			-- This list will be full.
		require
			valid_number_of_items: n >= 0
			has_default: ({G}).has_default
		do
			index := 0
			make_filled_area (({G}).default, n)
		ensure
			correct_position: before
			filled: full
		end

feature {NONE} -- Initialization

	make_from_array (a: ARRAY [G])
			-- Create list from array `a'.
		require
			array_exists: a /= Void
		do
			index := 0
			area_v2 := a.area
		ensure
			shared: area = a.area
			correct_position: before
			filled: count = a.count
		end

	make_from_iterable (other: ITERABLE [G])
			-- Create a circular chain with all items obtained from `other`.
		local
			a: like area_v2
			i, n: like area_v2.count
		do
			n := estimated_count_of (other)
			make (n)
			a := area_v2
			across
				other as o
			loop
				i := i + 1
				if i > n then
						-- The estimation could be approximate, resize the storage if needed.
					n := i
					a := a.aliased_resized_area (n)
					area_v2 := a
				end
				a.extend (o)
			end
		end

feature -- Access

	area: SPECIAL [G]
			-- Access to internal storage of ARRAYED_LIST
		do
				-- Internal storage is called `area_v2' so that it triggers
				-- a mismatch during retrieval.
			Result := area_v2
		end

	item: G
			-- Current item
		require else
			index_is_valid: valid_index (index)
		do
			Result := area_v2.item (index - 1)
		end

	i_th alias "[]", at alias "@" (i: INTEGER): like item assign put_i_th
			-- Item at `i'-th position
		do
			Result := area_v2.item (i - 1)
		end

	first: like item
			-- Item at first position
		do
			Result := area_v2.item (0)
		end

	last: like first
			-- Item at last position
		do
			Result := area_v2.item (count - 1)
		end

	index: INTEGER
			-- Index of `item', if valid.

	cursor: ARRAYED_LIST_CURSOR
			-- Current cursor position
		do
			create Result.make (index)
		end

	has (v: like item): BOOLEAN
			-- Does current include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			l_area: like area_v2
			i, nb: INTEGER
		do
			l_area := area_v2
			nb := count
			if object_comparison and v /= Void then
				from
				until
					i >= nb or Result
				loop
					Result := v ~ l_area.item (i)
					i := i + 1
				end
			else
				from
				until
					i >= nb or Result
				loop
					Result := v = l_area.item (i)
					i := i + 1
				end
			end
		end

	to_array: ARRAY [G]
			-- Share content to be used as an ARRAY.
			-- Note that although the content is shared, it might
			-- not be shared when a resizing occur in either ARRAY or Current.
		do
			create Result.make_from_special (area_v2)
		ensure
			to_array_attached: Result /= Void
			array_lower_set: Result.lower = 1
			array_upper_set: Result.upper = count
			shared_area: Result.area = area
		end

	new_cursor: ARRAYED_LIST_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (Current)
		end

feature -- Iteration

	do_all (action: PROCEDURE [G])
			-- Apply `action' to every item, from first to last.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		do
			area_v2.do_all_in_bounds (action, 0, area_v2.count - 1)
		end

	do_if (action: PROCEDURE [G]; test: FUNCTION [G, BOOLEAN])
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		do
			area_v2.do_if_in_bounds (action, test, 0, area_v2.count - 1)
		end

	there_exists (test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `test' true for at least one item?
		do
			Result := area_v2.there_exists_in_bounds (test, 0, area_v2.count - 1)
		end

	for_all (test: FUNCTION [G, BOOLEAN]): BOOLEAN
			-- Is `test' true for all items?
		do
			Result := area_v2.for_all_in_bounds (test, 0, area_v2.count - 1)
		end

	do_all_with_index (action: PROCEDURE [G, INTEGER])
			-- Apply `action' to every item, from first to last.
			-- `action' receives item and its index.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
		local
			i, j, nb: INTEGER
			l_area: like area_v2
		do
			from
				i := 0
				j := lower
				nb := count - 1
				l_area := area_v2
			until
				i > nb
			loop
				action.call ([l_area.item (i), j])
				j := j + 1
				i := i + 1
			end
		end

	do_if_with_index (action: PROCEDURE [G, INTEGER]; test: FUNCTION [G, INTEGER, BOOLEAN])
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- `action' and `test' receive the item and its index.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
			test_not_void: test /= Void
		local
			i, j, nb: INTEGER
			l_area: like area_v2
		do
			from
				i := 0
				j := lower
				nb := count - 1
				l_area := area_v2
			until
				i > nb
			loop
				if test.item ([l_area.item (i), j]) then
					action.call ([l_area.item (i), j])
				end
				j := j + 1
				i := i + 1
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items.
		do
			Result := area_v2.count
		end

	capacity: INTEGER
		do
			Result := area_v2.capacity
		end

	upper: INTEGER
			-- Maximum index.
			-- Use `count' instead.
		do
			Result := area_v2.count
		ensure
			definition: Result = count
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is array made of the same items as `other'?
		local
			i: INTEGER
		do
			if other = Current then
				Result := True
			elseif count = other.count and then object_comparison = other.object_comparison then
				if object_comparison then
					from
						Result := True
						i := lower
					until
						not Result or i > upper
					loop
						Result := i_th (i) ~ other.i_th (i)
						i := i + 1
					end
				else
					Result := area_v2.same_items (other.area_v2, 0, 0, count)
				end
			end
		end

feature -- Status report

	prunable: BOOLEAN
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

	valid_cursor (p: CURSOR): BOOLEAN
			-- Can the cursor be moved to position `p'?
		do
			if attached {ARRAYED_LIST_CURSOR} p as al_c then
				Result := valid_cursor_index (al_c.index)
			end
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index?
		do
			Result := (1 <= i) and (i <= count)
		end

	is_inserted (v: G): BOOLEAN
			-- Has `v' been inserted at the end by the most recent `put' or
			-- `extend'?
		do
			if not is_empty then
				Result := (v = last) or else (not off and then (v = item))
			end
		end

	all_default: BOOLEAN
			-- Are all items set to default values?
		require
			has_default: ({G}).has_default
		do
			Result := area_v2.filled_with (({G}).default, 0, area_v2.upper)
		end

feature -- Cursor movement

	move (i: INTEGER)
			-- Move cursor `i' positions.
		do
			index := index + i
			if index > count + 1 then
				index := count + 1
			elseif index < 0 then
				index := 0
			end
		end

	start
			-- Move cursor to first position if any.
		do
			index := 1
		ensure then
			after_when_empty: is_empty implies after
		end

	finish
			-- Move cursor to last position if any.
		do
			index := count
		ensure then
			before_when_empty: is_empty implies before
		end

	forth
			-- Move cursor one position forward.
		do
			index := index + 1
		end

	back
			-- Move cursor one position backward.
		do
			index := index - 1
		end

	go_i_th (i: INTEGER)
			-- Move cursor to `i'-th position.
		do
			index := i
		end

	go_to (p: CURSOR)
			-- Move cursor to position `p'.
		do
			if attached {ARRAYED_LIST_CURSOR} p as al_c then
				index := al_c.index
			else
				check
					correct_cursor_type: False
				end
			end
		end

	search (v: like item)
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- If structure does not include `v' ensure that
			-- `exhausted' will be true.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			l_area: like area_v2
			i, nb: INTEGER
			l_found: BOOLEAN
		do
			l_area := area_v2
			nb := count - 1
				-- If we are before we need to be sure
				-- that i is positive.
			i := (index - 1).max (0)
			if object_comparison and v /= Void then
				from
				until
					i > nb or l_found
				loop
					l_found := v ~ l_area.item (i)
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

	put_front (v: like item)
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

	put_i_th (v: like i_th; i: INTEGER_32)
			-- Replace `i'-th entry, if in index interval, by `v'.
		do
			area_v2.put (v, i - 1)
		end

	force, extend (v: like item)
			-- Add `v' to end.
			-- Do not move cursor.
		local
			i: INTEGER
			l_area: like area_v2
		do
			i := count + 1
			l_area := area_v2
			if i > l_area.capacity then
				l_area := l_area.aliased_resized_area (i + additional_space)
				area_v2 := l_area
			end
			l_area.extend (v)
		end

	put_left (v: like item)
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

	put_right (v: like item)
			-- Add `v' to the right of current position.
			-- Do not move cursor.
		do
			if index = count then
				extend (v)
			else
				insert (v, index + 1)
			end
		end

	replace (v: like first)
			-- Replace current item by `v'.
		do
			put_i_th (v, index)
		end

	merge_left (other: ARRAYED_LIST [G])
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

	merge_right (other: ARRAYED_LIST [G])
			-- Merge `other' into current structure after cursor.
		local
			l_new_count: INTEGER
		do
			if not other.is_empty then
				l_new_count := count + other.count
				if l_new_count > area_v2.capacity then
					area_v2 := area_v2.aliased_resized_area (l_new_count)
				end
				area_v2.insert_data (other.area_v2, 0, index, other.count)
				other.wipe_out
			end
		end

	append (s: SEQUENCE [G])
			-- Append a copy of `s'.
		local
			c, old_count, new_count: INTEGER
		do
			if attached {ARRAYED_LIST [G]} s as al then -- Optimization for arrayed lists
				c := al.count
					-- If `s' is empty nothing to be done.
				if c > 0 then
					old_count := count
					new_count := old_count + al.count
					if new_count > area_v2.capacity then
						area_v2 := area_v2.aliased_resized_area (new_count)
					end
					area_v2.copy_data (al.area_v2, 0, old_count, c)
				end
			else
				Precursor {DYNAMIC_LIST} (s)
			end
		end

feature -- Resizing

	grow (i: INTEGER)
			-- Change the capacity to at least `i'.
		do
			if i > area_v2.capacity then
				area_v2 := area_v2.aliased_resized_area (i)
			end
		end

	resize (new_capacity: INTEGER)
			-- Resize list so that it can contain
			-- at least `n' items. Do not lose any item.
		require
			resizable: resizable
			new_capacity_large_enough: new_capacity >= capacity
		do
			grow (new_capacity)
		ensure
			capacity_set: capacity >= new_capacity
		end

	trim
			-- <Precursor>
		local
			n: like count
		do
			n := count
			if n < area_v2.capacity then
				area_v2 := area_v2.aliased_resized_area (n)
			end
		ensure then
			same_items: to_array.same_items (old to_array)
		end

feature -- Duplication

	copy (other: like Current)
			-- Reinitialize by copying all the items of `other'.
			-- (This is also used by `clone'.)
		do
			if other /= Current then
				standard_copy (other)
				set_area (other.area_v2.twin)
			end
		ensure then
			equal_areas: area_v2 ~ other.area_v2
		end

	duplicate (n: INTEGER): like Current
			-- Copy of sub-list beginning at current position
			-- and having min (`n', `count' - `index' + 1) items.
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
		local
			m: INTEGER
		do
			if after then
				Result := new_filled_list (0)
			else
				m := (count  - index + 1).min (n)
				Result := new_filled_list (m)
				Result.area_v2.copy_data (area_v2, index - 1, 0, m)
			end
		end

feature -- Removal

	prune (v: like item)
			-- Remove first occurrence of `v', if any,
			-- after cursor position.
			-- Move cursor to right neighbor.
			-- (or `after' if no right neighbor or `v' does not occur)
		do
			if before then
				index := 1
			end
			if object_comparison then
				from
				until
					after or else item ~ v
				loop
					forth
				end
			else
				from
				until
					after or else item = v
				loop
					forth
				end
			end
			if not after then
				remove
			end
		end

	remove
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor)
		do
			if index < count then
				area_v2.move_data (index, index - 1, count - index)
			end
			area_v2.remove_tail (1)
		ensure then
			index: index = old index
		end

	remove_i_th (i: INTEGER)
			-- <Precursor>
		do
			if i < count then
				area_v2.move_data (i, i - 1, count - i)
			end
			area_v2.remove_tail (1)
			if index > i then
					-- Take into account that the old `i`-th element has been removed.
				index := index - 1
			end
		end

	prune_all (v: like item)
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, nb: INTEGER
			offset: INTEGER
			res: BOOLEAN
			obj_cmp: BOOLEAN
			l_area: like area_v2
		do
			obj_cmp := object_comparison
			from
				l_area := area_v2
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
						res := v ~ l_area.item (i)
					else
						res := v = l_area.item (i)
					end
					if res then
						offset := offset + 1
					else
						i := i + 1
					end
				else
					i := i + 1
				end
			end
			l_area.remove_tail (offset)
			index := count + 1
		ensure then
			is_after: after
		end

	remove_left
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			index := index - 1
			remove
		end

	remove_right
			-- Remove item to the right of cursor position
			-- Do not move cursor
		do
			index := index + 1
			remove
			index := index - 1
		end

	wipe_out
			-- Remove all items.
		do
			area_v2.wipe_out
			index := 0
		end

feature -- Transformation

	swap (i: INTEGER)
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		local
			old_item: like item
		do
			old_item := item
			replace (area_v2.item (i - 1))
			area_v2.put (old_item, i - 1)
		end

feature -- Retrieval

	correct_mismatch
		local
			i: INTEGER
		do
			if
				not mismatch_information.has ("area_v2") and then
				attached {SPECIAL [G]} mismatch_information.item ("area") as l_area and then
				attached {INTEGER} mismatch_information.item ("count") as l_count and then
				attached {BOOLEAN} mismatch_information.item ("object_comparison") as l_comp and then
				attached {INTEGER} mismatch_information.item ("index") as l_index
			then
				create area_v2.make_empty (l_count)
				from
					i := 0
				until
					i = l_count
				loop
					area_v2.extend (l_area.item (i))
					i := i + 1
				end
				object_comparison := l_comp
				index := l_index
			else
				Precursor
			end
		end

feature {NONE} -- Inapplicable

	new_chain: like Current
			-- Unused
		obsolete "Use explicit creation instead. See also explanations for `duplicate`. [2018-11-30]"
		do
			Result := Current
		end

feature {NONE} -- Implementation

	force_i_th (v: like i_th; pos: INTEGER)
		do
			if count + 1 > capacity then
				grow (count + additional_space)
			end
			area_v2.force (v, pos)
		end

	insert (v: like item; pos: INTEGER)
			-- Add `v' at `pos', moving subsequent items
			-- to the right.
		require
			index_small_enough: pos <= count
			index_large_enough: pos >= 1
		do
			if count + 1 > capacity then
				grow (count + additional_space)
			end
			area_v2.move_data (pos - 1, pos, count - pos + 1)
			put_i_th (v, pos)
		ensure
			new_count: count = old count + 1
			index_unchanged: index = old index
			insertion_done: i_th (pos) = v
		end

	new_filled_list (n: INTEGER): like Current
			-- New list with `n' elements.
		obsolete "Use explicit creation instead. See also explanations for `duplicate`. [2018-11-30]"
		require
			n_non_negative: n >=0
		do
			create Result.make (n)
		ensure
			new_filled_list_not_void: Result /= Void
			new_filled_list_count_set: Result.is_empty
			new_filled_list_before: Result.before
		end

invariant
	prunable: prunable
	starts_from_one: lower = 1

note
	ca_ignore: "CA033", "CA033: very large class"
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
