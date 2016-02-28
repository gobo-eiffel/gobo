note
	description: "Circular chains implemented by resizable arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: arrayed_circular, ring, sequence;
	representation: array;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class ARRAYED_CIRCULAR [G] inherit

	DYNAMIC_CIRCULAR [G]
		undefine
			readable, isfirst, writable, is_equal
		redefine
			start, islast, wipe_out
		select
			remove, go_i_th, after, before, off,
			prune_all, prune, first, forth
		end

	LIST [G]
		rename
			after as l_after,
			before as l_before,
			remove as l_remove,
			first as l_first,
			off as l_off,
			prune as l_prune,
			prune_all as l_prune_all,
			go_i_th as l_go_i_th,
			forth as l_forth
		export {NONE}
			l_after, l_before, l_remove, l_first,
			l_off, l_prune, l_prune_all, l_go_i_th, l_forth
		undefine
			last, exhausted, move, valid_cursor_index,
			isfirst, readable, islast, start, writable
		end

create

	make

feature -- Initialization

	make (n: INTEGER)
			-- Create a circular chain with `n' items.
		require
			at_least_one: n >= 1
		do
			create list.make (n)
		end

feature -- Access

	item: G
			-- Current item
		do
			Result := list.item
		end

	cursor: CIRCULAR_CURSOR
			-- Current cursor position
		do
			create Result.make (list.cursor, internal_exhausted, starter)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items
		do
			Result := list.count
		end

feature -- Status report

	full: BOOLEAN
			-- Is structure filled to capacity?
		do
			Result := list.full
		end

	readable: BOOLEAN
			-- Is there a current item that may be read?
		do
			Result := list.readable
		end

	valid_cursor (p: CURSOR): BOOLEAN
			-- Can the cursor be moved to position `p'?
		do
			if attached {CIRCULAR_CURSOR} p as c_c then
				Result := list.valid_cursor (c_c.cursor) and then
					c_c.starter >= 0 and then c_c.starter <= count
			end
		end

	writable: BOOLEAN
			-- Is there a current item that may be written?
		do
			Result := list.writable
		end

	isfirst: BOOLEAN
			-- Is cursor on first item?
		do
			if not is_empty then
				if starter = 0 then
					Result := list.isfirst
				else
					Result := (standard_index = starter)
				end
			end
		end

	islast: BOOLEAN
			-- Is cursor on last item?
		do
			if not is_empty then
				if (starter = 0) or (starter = 1) then
					Result := standard_islast
				else
					Result := (standard_index = starter - 1)
				end
			end
		end

feature -- Cursor movement

	go_to (p: CURSOR)
			-- Move cursor to position `p'.
		do
			if attached {CIRCULAR_CURSOR} p as c_c then
				list.go_to (c_c.cursor)
				internal_exhausted := c_c.internal_exhausted
				starter := c_c.starter
			end
		end
	set_start
			-- Select current item as the first.
		do
			starter := standard_index
			internal_exhausted := False
		end

	start
			-- Move to position currently selected as first.
		do
			internal_exhausted := False
			if starter = 0 then
				standard_start
				starter := 1
			else
				standard_go_i_th (starter)
				if standard_off then standard_start end
			end
		end

feature -- Element change

	replace (v: G)
			-- Replace current item by `v'.
		do
			list.replace (v)
		end

	merge_right (other: like Current)
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		do
			list.merge_right (other.list)
		end

	put_right (v: like item)
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		do
			list.put_right (v)
		end

	put_front (v: like item)
			-- Add `v' to beginning.
			-- Do not move cursor.
		do
			list.put_front (v)
		end

	extend (v: like item)
			-- Add `v' to end.
			-- Do not move cursor except if it was `off'.
		do
			list.extend (v)
			if standard_index = 0 then list.forth end
		end

	merge_left (other: like Current)
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		do
			list.merge_left (other.list)
		end

	put_left (v: like item)
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		do
			list.put_left (v)
		end

feature -- Removal

	remove_left
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		require else
			count > 1
		do
			if standard_isfirst then
				standard_finish
				 remove
			else
				standard_remove_left
			end
		end

	remove_right
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		require else
			count > 1
		do
			if standard_islast then
				standard_start
				remove
				finish
			else
				standard_remove_right
			end
		end

	wipe_out
			-- Remove all items.
		do
			list.wipe_out
			starter := 0
			internal_exhausted := False
		end

feature {ARRAYED_CIRCULAR} -- Implementation

	fix_start_for_remove
			-- Before deletion, update starting position if necessary.
		do
			if count = 1 or starter = 0 then
				starter := 0
			elseif starter = standard_index then
				if standard_islast then
					starter := 1
				else
					starter := starter + 1
				end
			end
		end

	starter: INTEGER
			-- The position currently selected as first

	new_chain: like Current
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (count)
		end

	list: ARRAYED_LIST [G]

	standard_after: BOOLEAN
			do
				Result := list.after
			end

	standard_back
			do
				list.back
			end

	standard_before: BOOLEAN
			do
				Result := list.before
			end

	standard_finish
			do
				list.finish
			end

	standard_forth
			do
				list.forth
			end

	standard_go_i_th (i: INTEGER)
			do
				list.go_i_th (i)
			end

	standard_index: INTEGER
			do
				Result := list.index
			end

	standard_isfirst: BOOLEAN
			do
				Result := list.isfirst
			end

	standard_islast: BOOLEAN
			do
				Result := list.islast
			end

	standard_move (i: INTEGER)
			do
				list.move (i)
			end

	standard_off: BOOLEAN
			do
				Result := list.off
			end

	standard_remove
			do
				list.remove
			end

	standard_remove_left
			do
				list.remove_left
			end

	standard_remove_right
			do
				list.remove_right
			end

	standard_search (v: G)
			do
				list.search (v)
			end

	standard_start
			do
				list.start
			end

feature {NONE} -- Inapplicable

	l_forth
		do
		end

invariant
	non_negative_count: count >= 0
	valid_starter: starter >= 0 and starter <= count

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
