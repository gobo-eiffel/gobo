indexing

	description:

		"Lists implemented with linked cells"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_LIST [G]

inherit

	DS_LIST [G]
		redefine
			searcher
		end

creation

	make, make_equal, make_from_linear

feature {NONE} -- Initialization

	make is
			-- Create an empty list.
			-- Use `=' as comparison criterion.
		local
			ref_searcher: DS_LINKED_LIST_REFERENCE_SEARCHER [G]
		do
			!! ref_searcher
			searcher := ref_searcher
		ensure
			empty: is_empty
		end

	make_equal is
			-- Create an empty list.
			-- Use `equal' as comparison criterion.
		local
			value_searcher: DS_LINKED_LIST_VALUE_SEARCHER [G]
		do
			!! value_searcher
			searcher := value_searcher
		ensure
			empty: is_empty
		end

	make_from_linear (other: DS_LINEAR [G]) is
			-- Create a new list and fill it with items of `other'.
			-- Use `=' as comparison criterion.
		require
			other_not_void: other /= Void
		local
			new_cell, new_last: like first_cell
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			make
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					!! first_cell.make (other_cursor.item)
					new_last := first_cell
					other_cursor.forth
				until
					other_cursor.after
				loop
					!! new_cell.make (other_cursor.item)
					new_last.put_right (new_cell)
					new_last := new_cell
					other_cursor.forth
				end
				last_cell := new_last
				count := other.count
			end
		ensure
			count_set: count = other.count
		end

feature -- Access

	infix "@", item (i: INTEGER): G is
			-- Item at index `i'
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.go_to (i)
			Result := a_cursor.item
		end

	first: G is
			-- First item in list
		do
			Result := first_cell.item
		end

	last: G is
			-- Last item in list
		do
			Result := last_cell.item
		end

	new_cursor: DS_LINKED_LIST_CURSOR [G] is
			-- New cursor for traversal
		do
			!! Result.make (Current)
		end

	searcher: DS_LINKED_LIST_SEARCHER [G]
			-- List searcher

feature -- Measurement

	count: INTEGER
			-- Number of items in list

feature -- Status report

	extendible (nb: INTEGER): BOOLEAN is
			-- May list be extended with `nb' items?
		do
			Result := True
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to list.
		local
			new_cell, new_last: like first_cell
			other_cursor: like new_cursor
		do
			standard_copy (other)
			if not other.is_empty then
				from
					other_cursor := other.new_cursor
					other_cursor.start
					!! first_cell.make (other_cursor.item)
					new_last := first_cell
					other_cursor.forth
				until
					other_cursor.after
				loop
					!! new_cell.make (other_cursor.item)
					new_last.put_right (new_cell)
					new_last := new_cell
					other_cursor.forth
				end
				last_cell := new_last
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is list equal to `other'?
		local
			current_cursor, other_cursor: like new_cursor
		do
			if same_type (other) and other.count = count then
				from
					current_cursor := new_cursor
					other_cursor := other.new_cursor
					current_cursor.start
					other_cursor.start
					Result := True
				until
					not Result or current_cursor.after
				loop
					Result := current_cursor.item = other_cursor.item
					current_cursor.forth
					other_cursor.forth
				end
			end
		end

feature -- Element change

	put_first, force_first (v: G) is
			-- Add `v' to beginning of list.
		local
			old_cell: like first_cell
		do
			if is_empty then
				!! first_cell.make (v)
				last_cell := first_cell
				count := 1
			else
				old_cell := first_cell
				!! first_cell.make (v)
				first_cell.put_right (old_cell)
				count := count + 1
			end
		end

	put_last, force_last (v: G) is
			-- Add `v' to end of list.
		local
			old_cell: like first_cell
		do
			if is_empty then
				!! first_cell.make (v)
				last_cell := first_cell
				count := 1
			else
				old_cell := last_cell
				!! last_cell.make (v)
				old_cell.put_right (last_cell)
				count := count + 1
			end
		end

	replace (v: G; i: INTEGER) is
			-- Replace item at index `i' by `v'.
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.go_to (i)
			a_cursor.put (v)
		end

	put, force (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		local
			a_cursor: like new_cursor
		do
			if i = 1 then
				put_first (v)
			elseif i = count + 1 then
				put_last (v)
			else
				a_cursor := new_cursor
				a_cursor.go_to (i - 1)
				put_right (v, a_cursor)
			end
		end

	put_left, force_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
		local
			other_cursor: like new_cursor
		do
			if a_cursor.after then
				put_last (v)
			elseif a_cursor.is_first then
				put_first (v)
			else
				other_cursor := clone (a_cursor)
				other_cursor.back
				put_right (v, other_cursor)
			end
		end

	put_right, force_right (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
		local
			new_cell, old_cell: like first_cell
		do
			if a_cursor.before then
				put_first (v)
			elseif a_cursor.is_last then
				put_last (v)
			else
				old_cell := a_cursor.current_cell
				!! new_cell.make (v)
				new_cell.put_right (old_cell.right)
				old_cell.put_right (new_cell)
				count := count + 1
			end
		end

	extend_first, append_first (other: DS_LINEAR [G]) is
			-- Add items of `other' to beginning of list.
		local
			linked_other: like Current
		do
			if not other.is_empty then
				!! linked_other.make_from_linear (other)
				if is_empty then
					first_cell := linked_other.first_cell
					last_cell := linked_other.last_cell
					count := other.count
				else	
					linked_other.last_cell.put_right (first_cell)
					first_cell := linked_other.first_cell
					count := count + other.count
				end
			end
		end

	extend_last, append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of list.
		local
			linked_other: like Current
		do
			if not other.is_empty then
				!! linked_other.make_from_linear (other)
				if is_empty then
					first_cell := linked_other.first_cell
					last_cell := linked_other.last_cell
					count := other.count
				else
					last_cell.put_right (linked_other.first_cell)
					last_cell := linked_other.last_cell
					count := count + other.count
				end
			end
		end

	extend, append (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
		local
			a_cursor: like new_cursor
		do
			if i = 1 then
				extend_first (other)
			elseif i = count + 1 then
				extend_last (other)
			else
				a_cursor := new_cursor
				a_cursor.go_to (i - 1)
				extend_right (other, a_cursor)
			end
		end

	extend_left, append_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
		local
			other_cursor: like new_cursor
		do
			if a_cursor.after then
				extend_last (other)
			elseif a_cursor.is_first then
				extend_first (other)
			elseif not other.is_empty then
				other_cursor := clone (a_cursor)
				other_cursor.back
				extend_right (other, other_cursor)
			end
		end

	extend_right, append_right (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
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
				elseif a_cursor.before then
					linked_other.last_cell.put_right (first_cell)
					first_cell := linked_other.first_cell
					count := count + other.count
				elseif a_cursor.is_last then
					last_cell.put_right (linked_other.first_cell)
					last_cell := linked_other.last_cell
					count := count + other.count
				else
					old_cell := a_cursor.current_cell
					linked_other.last_cell.put_right (old_cell.right)
					old_cell.put_right (linked_other.first_cell)
					count := count + other.count
				end
			end
		end

feature -- Removal

	remove_first is
			-- Remove item at beginning of list.
		do
			if count = 1 then
				wipe_out
			else
				set_first_cell (first_cell.right)
				count := count - 1
			end
		end

	remove_last is
			-- Remove item at end of list.
		local
			a_cursor: like new_cursor
		do
			if count = 1 then
				wipe_out
			else
				a_cursor := new_cursor
				a_cursor.go_to (count - 1)
				set_last_cell (a_cursor.current_cell)
				count := count - 1
			end
		end

	remove (i: INTEGER) is
			-- Remove item at `i'-th position.
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.go_to (i - 1)
			remove_right (a_cursor)
		end

	remove_at (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move `a_cursor' to next position.
		local
			other_cursor: like new_cursor
		do
			if a_cursor.is_first then
				a_cursor.forth
				remove_first
			elseif a_cursor.is_last then
				a_cursor.forth
				remove_last
			else
				other_cursor := clone (a_cursor)
				a_cursor.forth
				other_cursor.back
				remove_right (other_cursor)
			end
		end
		
	remove_left (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cusor' position.
		local
			new_left, current_cell: like first_cell
		do
			if a_cursor.after then
				remove_last
			else
				current_cell := a_cursor.current_cell
				new_left := first_cell
				if new_left.right = current_cell then
					set_first_cell (current_cell)
				else
					from
					until
						new_left.right.right = current_cell
					loop
						new_left := new_left.right
					end
					new_left.put_right (current_cell)
				end
				count := count - 1
			end
		end

	remove_right (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
		local
			current_cell, new_right: like first_cell
		do
			if a_cursor.before then
				remove_first
			else
				current_cell := a_cursor.current_cell
				new_right := current_cell.right.right
				if new_right = Void then
					set_last_cell (current_cell)
				else
					current_cell.put_right (new_right)
				end
				count := count - 1
			end
		end

	prune_first (n: INTEGER) is
			-- Remove `n' first items from list.
		local
			i: INTEGER
			new_first: like first_cell
		do
			if count = n then
				wipe_out
			else
				new_first := first_cell
				from i := 1 until i > n loop
					new_first := new_first.right
					i := i + 1
				end
				set_first_cell (new_first)
				count := count - n
			end
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from list.
		do
			keep_first (count - n)
		end
			
	prune (n: INTEGER; i: INTEGER) is
			-- Remove `n' items at and after `i'-th position.
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.go_to (i - 1)
			prune_right (n, a_cursor)
		end

	prune_left (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
		local
			other_cursor: like new_cursor
		do
			if a_cursor.after then
				prune_last (n)
			elseif n /= 0 then
				other_cursor := new_cursor
				other_cursor.go_to (a_cursor.index - n - 1)
				prune_right (n, other_cursor)
			end
		end

	prune_right (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
		local
			i: INTEGER
			new_right, current_cell: like first_cell
		do
			if a_cursor.before then
				prune_first (n)
			else
				current_cell := a_cursor.current_cell
				new_right := current_cell.right
				from i := 1 until i > n loop
					new_right := new_right.right
					i := i + 1
				end
				if new_right = Void then
					set_last_cell (current_cell)
				else
					current_cell.put_right (new_right)
				end
				count := count - n
			end
		end

	keep_first (n: INTEGER) is
			-- Keep `n' first items in list.
		local
			i: INTEGER
			new_last: like first_cell
		do
			if n = 0 then
				wipe_out
			else
				new_last := first_cell
				from i := 1 until i = n loop
					new_last := new_last.right
					i := i + 1
				end
				set_last_cell (new_last)
				count := n
			end
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in list.
		do
			prune_first (count - n)
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `searcher''s comparison criterion.)
		local
			i: INTEGER
			a_searcher: like searcher
			a_cursor: like new_cursor
			deleted: DS_ARRAYED_LIST [DS_LINKABLE [G]]
			old_cell, previous_cell, current_cell: like first_cell
		do
			!! deleted.make (count + 1)
			from
				a_searcher := searcher
				a_cursor := new_cursor
				a_cursor.start
				a_searcher.search_forth (a_cursor, v)
			until
				a_cursor.after
			loop
				deleted.put_last (a_cursor.current_cell)
				a_cursor.forth
				a_searcher.search_forth (a_cursor, v)
			end
			if deleted.count = count then
				wipe_out
			elseif not deleted.is_empty then
				count := count - deleted.count
				deleted.put_last (Void)
				from
					i := 1
					old_cell := deleted.item (i)
					current_cell := first_cell
				until
					old_cell = Void or
					current_cell /= old_cell
				loop
					current_cell := current_cell.right
					i := i + 1
					old_cell := deleted.item (i)
				end
				from
					set_first_cell (current_cell)
					previous_cell := current_cell
					current_cell := current_cell.right
				until
					old_cell = Void
				loop
					if current_cell = old_cell then
						current_cell := current_cell.right
						if current_cell /= Void then
							previous_cell.put_right (current_cell)
						end
					else
						previous_cell := current_cell
						current_cell := current_cell.right
					end
					i := i + 1
					old_cell := deleted.item (i)
				end
				if current_cell = Void then
					set_last_cell (previous_cell)
				end
			end
		end

	wipe_out is
			-- Remove all items from list.
		do
			first_cell := Void
			last_cell := Void
			count := 0
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR, DS_LINKED_LIST_SEARCHER} -- Implementation

	first_cell: DS_LINKABLE [G]
			-- First cell in list

	last_cell: like first_cell
			-- Last cell in list

feature {NONE} -- Implementation

	set_first_cell (cell: like first_cell) is
			-- Set `first_cell' to `cell'.
		require
			cell_not_void: cell /= Void
		do
			first_cell := cell
		ensure
			first_cell_set: first_cell = cell
		end

	set_last_cell (cell: like first_cell) is
			-- Set `last_cell' to `cell'.
			-- Get rid of `cell''s right neighbor.
		require
			cell_not_void: cell /= Void
		do
			cell.forget_right
			last_cell := cell
		ensure
			last_cell_set: last_cell = cell
		end

invariant

	first_cell: not is_empty implies first_cell /= Void
	last_cell: not is_empty implies last_cell /= Void
	last_constraint: last_cell /= Void implies last_cell.right = Void

end -- class DS_LINKED_LIST
