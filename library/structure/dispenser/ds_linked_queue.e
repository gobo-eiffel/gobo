indexing

	description:

		"Queues (First-In, First-Out) implemented with linked cells"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_QUEUE [G]

inherit

	DS_QUEUE [G]

creation

	make, make_equal

feature {NONE} -- Initialization

	make is
			-- Create an empty queue.
			-- Use `=' as comparison criterion.
		do
		ensure
			empty: is_empty
		end

	make_equal is
			-- Create an empty queue.
			-- Use `equal' as comparison criterion.
		do
			!! equality_tester
		ensure
			empty: is_empty
		end

feature -- Status report

	has (v: G): BOOLEAN is
			-- Does queue include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_tester: like equality_tester
			a_cell: like first_cell
		do
			a_cell := first_cell
			a_tester := equality_tester
			if a_tester /= Void then
				from  until (a_cell = Void) loop
					if a_tester.test (a_cell.item, v) then
						Result := True
						a_cell := Void  -- Jump out of the loop.
					else
						a_cell := a_cell.right
					end
				end
			else
					-- Use `=' as comparison criterion.
				from  until (a_cell = Void) loop
					if a_cell.item = v then
						Result := True
						a_cell := Void  -- Jump out of the loop.
					else
						a_cell := a_cell.right
					end
				end
			end
		end

	extendible (n: INTEGER): BOOLEAN is
			-- May queue be extended with `n' items?
		do
			Result := True
		ensure then
			definition: Result = True
		end

feature -- Access

	item: G is
			-- Item at front of queue
		do
			Result := first_cell.item
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in queue

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in queue
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_tester: like equality_tester
			a_cell: like first_cell
		do
			a_cell := first_cell
			a_tester := equality_tester
			if a_tester /= Void then
				from  until (a_cell = Void) loop
					if a_tester.test (a_cell.item, v) then
						Result := Result + 1
					end
					a_cell := a_cell.right
				end
			else
					-- Use `=' as comparison criterion.
				from  until (a_cell = Void) loop
					if a_cell.item = v then
						Result := Result + 1
					end
					a_cell := a_cell.right
				end
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current queue.
		local
			a_cell, new_cell, old_cell: like first_cell
		do
			if other /= Current then
				standard_copy (other)
				if not other.is_empty then
					from
						old_cell := other.first_cell
						!! first_cell.make (old_cell.item)
						a_cell := first_cell
						old_cell := old_cell.right
					until
						old_cell = Void
					loop
						!! new_cell.make (old_cell.item)
						a_cell.put_right (new_cell)
						a_cell := new_cell
						old_cell := old_cell.right
					end
					last_cell := a_cell
				end
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current queue equal to `other'?
		local
			a_cell, other_cell: like first_cell
		do
			if Current = other then
				Result := True
			elseif same_type (other) and other.count = count then
				from
					a_cell := first_cell
					other_cell := other.first_cell
					Result := True
				until
					a_cell = Void
				loop
					if a_cell.item /= other_cell.item then
						Result := False
						a_cell := Void  -- Jump out of the loop.
					else
						a_cell := a_cell.right
						other_cell := other_cell.right
					end
				end
			end
		end

feature -- Element change

	put, force (v: G) is
			-- Add `v' to back of queue.
		local
			a_cell: like first_cell
		do
			!! a_cell.make (v)
			if is_empty then
				first_cell := a_cell
				last_cell := a_cell
				count := 1
			else
				last_cell.put_right (a_cell)
				last_cell := a_cell
				count := count + 1
			end
		end

	extend, append (other: DS_LINEAR [G]) is
			-- Add items of `other' to back of queue.
			-- Add `other.first' first, etc.
		local
			a_cell, new_last, new_first: like first_cell
			other_cursor: DS_LINEAR_CURSOR [G]
		do
			if not other.is_empty then
				other_cursor := other.new_cursor
				from
					other_cursor.start
					!! a_cell.make (other_cursor.item)
					new_first := a_cell
					new_last := a_cell
					other_cursor.forth
				until
					other_cursor.after
				loop
					!! a_cell.make (other_cursor.item)
					new_last.put_right (a_cell)
					new_last := a_cell
					other_cursor.forth
				end
				if is_empty then
					first_cell := new_first
				else
					last_cell.put_right (new_first)
				end
				last_cell := new_last
				count := count + other.count
			end
		end

feature -- Removal

	remove is
			-- Remove from item from queue.
		do
			if count = 1 then
				wipe_out
			else
				first_cell := first_cell.right
				count := count - 1
			end
		end

	prune (n: INTEGER) is
			-- Remove `n' items from queue.
		local
			i: INTEGER
			a_cell: like first_cell
		do
			if n = count then
				wipe_out
			else
				a_cell := first_cell
				from i := 1 until i > n loop
					a_cell := a_cell.right
					i := i + 1
				end
				first_cell := a_cell
				count := count - n
			end
		end

	keep (n: INTEGER) is
			-- Keep `n' items in queue.
		do
			prune (count - n)
		end

	wipe_out is
			-- Remove all items from queue.
		do
			first_cell := Void
			last_cell := Void
			count := 0
		end

feature {DS_LINKED_QUEUE} -- Implementation

	first_cell: DS_LINKABLE [G]
			-- First cell in queue

	last_cell: like first_cell
			-- Last cell in queue

invariant

	first_cell: is_empty = (first_cell = Void)
	last_cell: is_empty = (last_cell = Void)

end -- class DS_LINKED_QUEUE
