indexing

	description:

		"Lists implemented with bilinked cells"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST [G]

inherit

	DS_LINKED_LIST [G]
		redefine
			new_cursor, put_left, force_left,
			extend_left, append_left,
			remove_last, remove_at,
			remove_left, prune_last,
			prune_left, keep_last,
			first_cell, set_first_cell,
			make, make_equal, delete,
			searcher
		end

creation

	make, make_equal, make_from_linear

feature {NONE} -- Initialization

	make is
			-- Create an empty list.
			-- Use `=' as comparison criterion.
		local
			ref_searcher: DS_BILINKED_LIST_REFERENCE_SEARCHER [G]
		do
			!! ref_searcher
			searcher := ref_searcher
		end

	make_equal is
			-- Create an empty list.
			-- Use `equal' as comparison criterion.
		local
			value_searcher: DS_BILINKED_LIST_VALUE_SEARCHER [G]
		do
			!! value_searcher
			searcher := value_searcher
		end

feature -- Access

	new_cursor: DS_BILINKED_LIST_CURSOR [G] is
			-- New cursor for traversal
		do
			!! Result.make (Current)
		end

	searcher: DS_BILINKED_LIST_SEARCHER [G]
			-- List searcher

feature -- Element change

	put_left, force_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
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

	extend_left, append_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
		local
			linked_other: like Current
			old_cell: like first_cell
		do
			if not other.is_empty then
				!! linked_other.make_from_linear (other)
				if is_empty then
					first_cell := linked_other.first_cell
					last_cell := linked_other.last_cell
					count := other.count
				elseif a_cursor.after then
					last_cell.put_right (linked_other.first_cell)
					last_cell := linked_other.last_cell
					count := count + other.count
				elseif a_cursor.is_first then
					linked_other.last_cell.put_right (first_cell)
					first_cell := linked_other.first_cell
					count := count + other.count
				else
					old_cell := a_cursor.current_cell
					old_cell.left.put_right (linked_other.first_cell)
					linked_other.last_cell.put_right (old_cell)
					count := count + other.count
				end
			end
		end

feature -- Removal

	remove_last is
			-- Remove item at end of list.
		do
			if count = 1 then
				wipe_out
			else
				set_last_cell (last_cell.left)
				count := count - 1
			end
		end

	remove_at (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move `a_cursor' to next position.
		local
			current_cell: like first_cell
		do
			if a_cursor.is_first then
				a_cursor.forth
				remove_first
			elseif a_cursor.is_last then
				a_cursor.forth
				remove_last
			else
				current_cell := a_cursor.current_cell
				a_cursor.forth
				current_cell.left.put_right (current_cell.right)
				count := count - 1
			end
		end

	remove_left (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
		local
			current_cell, new_left: like first_cell
		do
			if a_cursor.after then
				remove_last
			else
				current_cell := a_cursor.current_cell
				new_left := current_cell.left.left
				if new_left = Void then
					set_first_cell (current_cell)
				else
					current_cell.put_left (new_left)
				end
				count := count - 1
			end
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
		local
			i: INTEGER
			new_last: like first_cell
		do
			if count = n then
				wipe_out
			else
				new_last := last_cell
				from i := 1 until i > n loop
					new_last := new_last.left
					i := i + 1
				end
				set_last_cell (new_last)
				count := count - n
			end
		end

	prune_left (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
		local
			i: INTEGER
			current_cell, new_left: like first_cell
		do
			if a_cursor.after then
				prune_last (n)
			else
				current_cell := a_cursor.current_cell
				new_left := current_cell.left
				from i := 1 until i > n loop
					new_left := new_left.left
					i := i + 1
				end
				if new_left = Void then
					set_first_cell (current_cell)
				else
					new_left.put_right (current_cell)
				end
				count := count - n
			end
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items of list.
		local
			i: INTEGER
			new_first: like first_cell
		do
			if n = 0 then
				wipe_out
			else
				new_first := last_cell
				from i := 1 until i = n loop
					new_first := new_first.left
					i := i + 1
				end
				set_first_cell (new_first)
				count := n
			end
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `searcher''s comparison criterion.)
		local
			a_cursor: like new_cursor
			a_searcher: like searcher
		do
			from
				a_searcher := searcher
				a_cursor := new_cursor
				a_cursor.start
				a_searcher.search_forth (a_cursor, v)
			until
				a_cursor.after
			loop
				remove_at (a_cursor)
				a_searcher.search_forth (a_cursor, v)
			end
		end
 
feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	first_cell: DS_BILINKABLE [G]
			-- First cell in list

feature {NONE} -- Implementation

	set_first_cell (cell: like first_cell) is
			-- Set `first_cell' to `cell'.
			-- Get rid of `cell''s left neighbor.
		do
			cell.forget_left
			first_cell := cell
		end

invariant

	first_constraint: first_cell /= Void implies first_cell.left = Void

end -- class DS_BILINKED_LIST
