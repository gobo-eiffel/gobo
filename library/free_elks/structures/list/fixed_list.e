note

	description:
		"Lists with fixed maximum numbers of items, implemented by arrays"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: fixed, sequence;
	representation: array;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class FIXED_LIST [G] inherit

	LIST [G]
		export
			{ANY}
				put
			{NONE}
				force, extend,
				fill,
				prune, prune_all
		undefine
			force, prune, at, put_i_th,
			prune_all, copy, i_th
		redefine
			first,
			last,
			swap,
			duplicate,
			move,
			start,
			finish,
			go_i_th,
			put,
			remove
		select
			extendible, index_set
		end

	ARRAY [G]
		rename
			make as array_make,
			put as put_i_th,
			item as i_th alias "[]",
			force as force_i_th,
			bag_put as put,
			index_set as array_index_set,
			make_filled as array_make_filled,
			extendible as array_extendible
		export
			{NONE}
				all
			{ANY}
				i_th,
				put_i_th,
				at,
				is_equal,
				occurrences,
				valid_index,
				copy,
				area,
				has
			{FIXED_LIST, FIXED_TREE}
				array_make, lower, upper, subarray
		undefine
			count, linear_representation, put, resizable, fill,
			for_all, there_exists, do_all, do_if, occurrences, has,
			valid_index, is_equal
		redefine
			full, extend, prunable
		end

	FIXED [G]
		undefine
			copy, is_equal,
			full
		end

create

	make, make_filled

feature -- Initialization

	make (n: INTEGER)
			-- Create an empty list.
		do
			array_make (1, n)
			count := 0
		ensure
			is_before: before
			new_count: count = 0
		end

	make_filled (n: INTEGER)
			-- Create a list with `n' void elements.
		do
			array_make (1, n)
			count := n
		ensure
			is_before: before
			new_count: count = n
		end

feature -- Access

	index: INTEGER
		-- Current position in the list

	item: G
			-- Current item
		do
			Result := area.item (index - 1)
		end

	first: G
			-- Item at first position
		do
			Result := area.item (0)
		end

	last: like first
			-- Item at last position
		do
			Result := area.item (count - 1)
		end

	cursor: ARRAYED_LIST_CURSOR
			-- Current cursor position
		do
			create Result.make (index)
		end

feature -- Measurement

	count: INTEGER

feature -- Status report

	extendible: BOOLEAN
			-- May new items be added?
		do
			Result := (count < capacity)
		end

	prunable: BOOLEAN
			-- May items be removed?
		do
			Result := not is_empty
		end

	full: BOOLEAN
			-- Is the list full?
		do
			Result := count = capacity
		end

	valid_cursor (p: CURSOR): BOOLEAN
			-- Is `p' a valid cursor?
		do
			if attached {ARRAYED_LIST_CURSOR} p as fl_c then
				Result := valid_cursor_index (fl_c.index)
			end
		end

feature -- Cursor movement

	move (i: INTEGER)
			-- Move cursor `i' positions.
		do
			index := index + i
			if (index > count + 1) then
				index := count + 1
			elseif index < 0 then
				index := 0
			end
		end

	start
			-- Move cursor to first position.
		do
			index := 1
		end

	finish
			-- Move cursor to last position.
		do
			index := count
		end

	forth
			-- Move cursor to next position, if any.
		do
			index := index + 1
		end

	back
			-- Move cursor to previous position, if any.
		do
			index := index - 1
		end

	go_i_th (i: INTEGER)
			-- Move cursor to `i'-th position.
		do
			index := i
		end

	go_to (p: CURSOR)
			-- Move cursor to element remembered in `p'.
		do
			if attached {ARRAYED_LIST_CURSOR} p as fl_c then
				index := fl_c.index
			end
		end

feature -- Element change

	put (v: like first)
			-- Replace current item by `v'.
			-- (Synonym for `replace')
		require else
			True
		do
			replace (v)
		end

	replace (v: like first)
			-- Replace current item by `v'.
		do
			put_i_th (v, index)
		end

	extend (v: like item)
			-- Add `v' to end.
			-- Move index to the current item.
		do
			count := count + 1
			index := count
			force_i_th (v, count)
		end

	remove
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor)
		local
			i, j: INTEGER
		do
			if not off then
				from
					i := index - 1
				until
					i >= count - 1
				loop
					j := i + 1
					area.put (area.item (j), i)
					i := j
				end
				area.put_default (i)
				count := count - 1
			end
		end

feature -- Transformation

	swap (i: INTEGER)
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		local
			old_item: like item
		do
			old_item := item
			replace (i_th (i))
			put_i_th (old_item, i)
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-list beginning at cursor position
			-- and having min (`n', `count' - `index' + 1) items
		local
			pos: INTEGER
		do
			create Result.make_filled (n.min (count - index + 1))
			from
				Result.start
				pos := index
			until
				Result.exhausted
			loop
				Result.replace (item)
				forth
				Result.forth
			end
			Result.start
			index := pos
		end

feature {NONE} -- Implementation

	force (v: like item)
			-- Not used since extend is not always applicable.
		do
		end

invariant

	empty_means_storage_empty: is_empty implies all_default

note
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







end -- class FIXED_LIST



