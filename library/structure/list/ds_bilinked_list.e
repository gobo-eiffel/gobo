indexing

	description:

		"Lists implemented with bilinked cells"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST [G]

inherit

	DS_LINKED_LIST [G]
		redefine
			new_cursor, put_left_cursor, force_left_cursor,
			extend_left_cursor, append_left_cursor,
			remove_last, remove_at_cursor,
			remove_left_cursor, prune_last,
			prune_left_cursor, keep_last,
			first_cell, set_first_cell
		end

creation

	make, make_equal, make_from_linear

feature -- Access

	new_cursor: DS_BILINKED_LIST_CURSOR [G] is
			-- New external cursor for traversal
		do
			!! Result.make (Current)
		end

feature -- Element change

	put_left_cursor, force_left_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
			-- (Performance: O(1).)
		local
			new_cell, old_cell: like first_cell
		do
			if a_cursor.after then
				put_last (v)
			elseif a_cursor.is_first then
				put_first (v)
			else
				old_cell := a_cursor.current_cell
				!! new_cell.make (v)
				old_cell.left.put_right (new_cell)
				new_cell.put_right (old_cell)
				count := count + 1
			end
		end

	extend_left_cursor, append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_left (other)'.)
			-- (Performance: O(other.count).)
		local
			linked_other: like Current
			old_cell: like first_cell
			fcell, lcell: like first_cell
		do
			if not other.is_empty then
				!! linked_other.make_from_linear (other)
				fcell := linked_other.first_cell
				lcell := linked_other.last_cell
				if is_empty then
					first_cell := fcell
					last_cell := lcell
				elseif a_cursor.after then
					last_cell.put_right (fcell)
					last_cell := lcell
				elseif a_cursor.is_first then
					lcell.put_right (first_cell)
					first_cell := fcell
				else
						-- The current cell exists (because the cursor is
						-- not `after' (see above) and not `before' (see
						-- precondition)) and it has a left neighbor
						-- (because the cursor is not `is_first' (see above)).
						-- Insert new cells in-between.
					old_cell := a_cursor.current_cell
					old_cell.left.put_right (fcell)
					lcell.put_right (old_cell)
				end
				count := count + other.count
			end
		end

feature -- Removal

	remove_last is
			-- Remove item at end of list.
			-- Move any cursors at this position `forth'.
			-- (Performance: O(1).)
		do
			if count = 1 then
				wipe_out
			else
				move_last_cursors_after
				set_last_cell (last_cell.left)
				count := count - 1
			end
		end

	remove_at_cursor (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
			-- (Performance: O(1).)
		local
			current_cell, new_right: like first_cell
		do
			if a_cursor.is_first then
				remove_first
			elseif a_cursor.is_last then
				remove_last
			else
					-- The current cell has a right and left neighbor because
					-- the cursor is neither `is_first' nor `is_last'.
				current_cell := a_cursor.current_cell
				new_right := current_cell.right
				move_all_cursors (current_cell, new_right)
				current_cell.left.put_right (new_right)
				count := count - 1
			end
		end

	remove_left_cursor (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
			-- (Performance: O(1).)
		local
			current_cell, left_cell: like first_cell
		do
			if a_cursor.after then
				remove_last
			else
				current_cell := a_cursor.current_cell
				left_cell := current_cell.left
				move_all_cursors (left_cell, current_cell)
				left_cell := left_cell.left
				if left_cell = Void then
						-- The cell to be removed was the first in the
						-- list. The cell at cursor position becomes
						-- the new first cell.
					set_first_cell (current_cell)
				else
					current_cell.put_left (left_cell)
				end
				count := count - 1
			end
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		local
			i: INTEGER
			new_last: like first_cell
		do
			if count = n then
				wipe_out
			elseif n /= 0 then
				move_all_cursors_after
				new_last := last_cell
				from i := 1 until i > n loop
					new_last := new_last.left
					i := i + 1
				end
				set_last_cell (new_last)
				count := count - n
			else
				move_all_cursors_after
			end
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
			-- (Performance: O(n).)
		local
			i: INTEGER
			current_cell, new_left: like first_cell
		do
			if a_cursor.after then
				prune_last (n)
			elseif n /= 0 then
				current_cell := a_cursor.current_cell
				move_all_cursors_after
					-- Go to the cell to the left of the first
					-- cell to be removed.
				new_left := current_cell.left
				from i := 1 until i > n loop
					new_left := new_left.left
					i := i + 1
				end
				if new_left = Void then
						-- There is no such cell. The cell at cursor
						-- position becomes the new first cell of the list.
					set_first_cell (current_cell)
				else
					new_left.put_right (current_cell)
				end
				count := count - n
			else
				move_all_cursors_after
			end
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items of list.
			-- Move all cursors `off'.
			-- (Performance: O(n).)
		local
			i: INTEGER
			new_first: like first_cell
		do
			if n = 0 then
				wipe_out
			elseif n = count then
				move_all_cursors_after
			else
				move_all_cursors_after
				new_first := last_cell
				from i := 1 until i = n loop
					new_first := new_first.left
					i := i + 1
				end
				set_first_cell (new_first)
				count := n
			end
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	first_cell: DS_BILINKABLE [G]
			-- First cell in list

feature {NONE} -- Implementation

	set_first_cell (a_cell: like first_cell) is
			-- Set `first_cell' to `a_cell'.
			-- This routine has to be called (instead of
			-- making a direct assignment to `first_cell')
			-- when `a_cell' may have dangling left neighbors
			-- that need to be gotten rid of. There is no need
			-- to call this routine when `a_cell' has just
			-- been created.
		do
			a_cell.forget_left
			first_cell := a_cell
		end

invariant

	first_constraint: first_cell /= Void implies first_cell.left = Void

end -- class DS_BILINKED_LIST
