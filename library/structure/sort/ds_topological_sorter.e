indexing

	description:

		"Topological sorters"

	note:

		"Use the algorithm described by D. Knuth in "The Art of %
		%Computer Programming", Vol.1 3rd ed. p.265. The detection %
		%of cycles is described in exercise 23 p.271 and p.548."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_TOPOLOGICAL_SORTER [G]

creation

	make, make_with_capacity, make_with_items

feature {NONE} -- Initialization

	make is
			-- Create a new topological sorter.
		do
			make_with_capacity (10)
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new topological sorter.
			-- Set initial capacity of `items' to `nb'.
		require
			nb_positive: nb >= 0
		do
			!! items.make (nb)
			!! counts.make (nb)
			!! successors.make (nb)
		ensure
			capacity_set: items.capacity = nb
		end

	make_with_items (some_items: like items) is
			-- Create a new topological sorter to
			-- sort `some_items'.
		require
			some_items_not_void: some_items /= Void
		local
			nb: INTEGER
		do
			items := some_items
			nb := some_items.count
			!! counts.make (nb)
			!! successors.make (nb)
		ensure
			items_set: items = some_items
		end

feature -- Access

	items: DS_ARRAYED_LIST [G]
			-- Items to be sorted

	sorted_items: DS_ARRAYED_LIST [G]
			-- Sorted items

	cycle: DS_ARRAYED_LIST [G]
			-- Items involved in a cycle if any
			-- (Note: the items in `cycle' are stored in reverse order
			-- and the first item is repeated at the end of the list.)

feature -- Status report

	is_sorted: BOOLEAN is
			-- Have items been sorted?
		do
			Result := (sorted_items /= Void)
		ensure
			definition: Result = (sorted_items /= Void)
		end

	has_cycle: BOOLEAN is
			-- Has a cycle been detected?
		do
			Result := (cycle /= Void)
		ensure
			definition: Result = (cycle /= Void)
		end

feature -- Element change

	force_relation (u, v: G) is
			-- State that `u' should appear before `v'
			-- in the sorted list.
		local
			iu, iv: INTEGER
			succ: DS_LINKABLE [INTEGER]
		do
			reset
			iu := index_of (u)
			iv := index_of (v)
			counts.replace (counts.item (iv) + 1, iv)
			!! succ.make (iv)
			succ.put_right (successors.item (iu))
			successors.replace (succ, iu)
		end

feature -- Removal

	reset is
			-- Discard result of last sort.
		do
			sorted_items := Void
			cycle := Void
		ensure
			not_sorted: not is_sorted
			no_cycle: not has_cycle
		end

	wipe_out is
			-- Wipe out items.
		do
			reset
			items.wipe_out
		ensure
			not_sorted: not is_sorted
			no_cycle: not has_cycle
			empty: items.is_empty
		end

feature -- Sort

	sort is
			-- Sort items held in `items' according to the
			-- relations which have been recorded since last sort.
		local
			i, nb: INTEGER
			front, rear: INTEGER
			qlinks: DS_ARRAYED_LIST [INTEGER]
			succ: DS_LINKBALE [INTEGER]
			marks: ARRAY [BOOLEAN]
		do
			-- See description of algorithm in "The Art of Computer
			-- Programming", Vol.1 3rd ed. p.265. The detection of
			-- cycles is described in exercise 23 p.271 and p.548.

			reset
			nb := items.count
			!! sorted_items.make (nb)
				-- T4. Scan for zeros.
				-- `qlinks' is a queue containing items not processed
				-- yet but which don't have predecessors or whose
				-- predecessors have already been processed. `front'
				-- and `rear' are the indexes to the front and rear
				-- of this queue. `qlinks' shares the same memory space
				-- as `counts' since the corresponding slots in `counts'
				-- are not used anymore.
			qlinks := counts
			from i := 1 until i > nb loop
				if counts.item (i) = 0 then
					if front = 0 then
						front := i
						rear := i
					else
						qlinks.replace (i, rear)
						rear := i
					end
				end
				i := i + 1
			end
			from until front = 0 loop
					-- T5. Output front of queue.
				succ := successors.item (front)
				from until succ = Void loop
						-- T6. Erase relation.
					i := succ.item
					nb := counts.item (i) - 1
					counts.replace (nb, i)
					if nb = 0 then
							-- Add to `qlinks'.
						qlinks.replace (i, rear)
						rear := i
					end
					succ := succ.right
				end
				successors.replace (Void, front)
				qlinks.replace (0, front)
				sorted_items.put_last (items.item (front))
				front := qlinks.item (front)
			end
			nb := items.count - sorted_items.count
			if nb /= 0 then
					-- A cycle has been detected.
				!! cycle.make (nb + 1)
					-- T8.
				nb := items.count
				from i := 1 until i > nb loop
					qlinks.replace (0, i)
					i := i + 1
				end
					-- T9.
				!! marks.make (1, nb)
				from i := 1 until i > nb loop
					marks.put (True, i)
					succ := successors.item (i)
						-- T10.
					from until succ = Void loop
						qlinks.replace (i, succ.item)
						succ := succ.right
					end
					successors.put (Void, i)
					i := i + 1
				end
					-- T11.
					-- Look for an item that has not been
					-- sorted in `sorted_items'.
				from i := 1 until qlinks.item (i) /= 0 loop
					i := i + 1
				end
					-- T12.
					-- Look for the start of cycle.
				from until marks.item (i) = False loop
					marks.put (False, i)
					i := qlinks.item (i)
				end
					-- T13.
					-- Traverse the cycle. Note that the items
					-- in `cycle' are stored in the reverse order.
				from until marks.item (i) = True loop
					cycle.put_last (items.item (i))
					marks.put (False, i)
					i := qlinks.item (i)
				end
				cycle.put_last (items.item (i))
					-- Reset `counts' so that its ready for next
					-- recording of relations. (`successors' has
					-- already been reset in step T9.)
				nb := items.count
				from i := 1 until i > nb loop
					counts.replace (0, i)
					i := i + 1
				end
			end
		ensure
			sorted: is_sorted
			cycle: (sorted_items.count /= items.count) implies has_cycle
		end

feature {NONE} -- Implementation

	counts: DS_ARRAYED_LIST [INTEGER]
			-- Number of predecessors for each item
			-- (same indexing as in `items'.)

	successors: DS_ARRAYED_LIST [DS_LINKABLE [INTEGER]]
			-- Successors for each item
			-- (same indexing as in `items'.)

	index_of (v: G): INTEGER is
			-- Index of `v' in `items';
			-- Side-effect: add `v' to the end of
			-- `items' if it is not already included.
		local
			i, nb: INTEGER
		do
			nb := items.count
			from i := 1 until i > nb loop
				if items.item (i) = v then
					Result := i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
			if Result = 0 then
				items.force_last (u)
				counts.force_last (0)
				successors.force_last (Void)
				Result := nb + 1
			end
		end

invariant

	items_not_void: items /= Void
	counts_not_void: counts /= Void
	counts_count: counts.count = items.count
	successors_not_void: successors = Void
	successors_count: successors.count = items.count

end -- class DS_TOPOLOGICAL_SORTER
