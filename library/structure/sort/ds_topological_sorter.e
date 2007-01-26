indexing

	description:

		"Topological sorters"

	remark:

		"Use the algorithm described by D. Knuth in 'The Art of %
		%Computer Programming', Vol.1 3rd ed. p.265. The detection %
		%of cycles is described in exercise 23 p.271 and p.548."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TOPOLOGICAL_SORTER [G]

inherit

	ANY -- Needed for SE 2.1b1.

create

	make, make_default

feature {NONE} -- Initialization

	make (nb: INTEGER) is
			-- Create a new topological sorter.
			-- Set initial capacity to `nb'.
		require
			nb_positive: nb >= 0
		do
			create items.make (nb)
			create counts.make (nb)
			create successors.make (nb)
		ensure
			capacity_set: capacity = nb
		end

	make_default is
			-- Create a new topological sorter.
			-- Set initial capacity to a default value.
		do
			make (10)
		end

feature -- Access

	index_of (v: G): INTEGER is
			-- Index of `v' in the list of items to be sorted;
			-- Return 'count + 1' if `v' is not in the list yet
		do
			items.start
			items.search_forth (v)
			Result := items.index
		ensure
			index_large_enough: Result >= 1
			index_small_enough: Result <= count + 1
		end

	sorted_items: DS_ARRAYED_LIST [G]
			-- Sorted items

	cycle: DS_ARRAYED_LIST [G]
			-- Items involved in a cycle if any
			-- (Note: the items in `cycle' are stored in reverse order
			-- and the first item is repeated at the end of the list.)

	equality_tester: KL_EQUALITY_TESTER [G] is
			-- Equality tester to compare items to be sorted;
			-- A void equality tester means that `=' will be
			-- used as comparison criterion.
		do
			Result := items.equality_tester
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items to be sorted
		do
			Result := items.count
		ensure
			count_positive: Result >= 0
		end

	capacity: INTEGER is
			-- Maximum number of items to be sorted
		do
			Result := items.capacity
		ensure
			capacity_large_enough: Result >= count
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Are there no items yet to be sorted?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has (v: G): BOOLEAN is
			-- Is `v' included in the list of items to be sorted?
		do
			Result := items.has (v)
		end

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
			Result := (cycle /= Void and then not cycle.is_empty)
		ensure
			definition: Result = (cycle /= Void and then not cycle.is_empty)
		end

	equality_tester_settable (a_tester: like equality_tester): BOOLEAN is
			-- Can `set_equality_tester' be called with `a_tester'
			-- as argument in current state of the sorter?
		do
			Result := is_empty
		ensure
			definition: Result = is_empty
		end

feature -- Setting

	set_equality_tester (a_tester: like equality_tester) is
			-- Set `equality_tester' to `a_tester'.
			-- A void equality tester means that `='
			-- will be used as comparison criterion.
		require
			equality_tester_settable: equality_tester_settable (a_tester)
		do
			items.set_equality_tester (a_tester)
		ensure
			equality_tester_set: equality_tester = a_tester
		end

feature -- Element change

	put (v: G) is
			-- Add `v' to the list of items to be sorted.
		require
			not_has: not has (v)
			not_full: count < capacity
		do
			items.put_last (v)
			counts.put_last (0)
			successors.put_last (Void)
		ensure
			one_more: count = old count + 1
			inserted: has (v)
			last: index_of (v) = count
		end

	force (v: G) is
			-- Add `v' to the list of items to be sorted.
			-- Resize the list of items if needed.
		require
			not_has: not has (v)
		local
			nb: INTEGER
		do
			if count >= capacity then
				nb := count + 10
				items.resize (nb)
				counts.resize (nb)
				successors.resize (nb)
			end
			put (v)
		ensure
			one_more: count = old count + 1
			inserted: has (v)
			last: index_of (v) = count
		end

	put_relation (u, v: G) is
			-- Specify that item `u' should appear
			-- before item `v' in the sorted list.
		require
			has_u: has (u)
			has_v: has (v)
		do
			put_indexed_relation (index_of (u), index_of (v))
		end

	force_relation (u, v: G) is
			-- Specify that item `u' should appear
			-- before item `v' in the sorted list.
			-- Insert `u' and `v' in the list of items
			-- to be sorted if not already done.
		local
			iu, iv: INTEGER
		do
			iu := index_of (u)
			if iu = count + 1 then
				force (u)
			end
			iv := index_of (v)
			if iv = count + 1 then
				force (v)
			end
			put_indexed_relation (iu, iv)
		end

	put_indexed_relation (i, j: INTEGER) is
			-- Specify that item at index `i' should
			-- appear before item at index `j' in
			-- the sorted list.
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
			j_large_enough: j >= 1
			j_small_enough: j <= count
		local
			succ, succ2: DS_LINKABLE [INTEGER]
		do
			reset
			counts.replace (counts.item (j) + 1, j)
			succ2 := successors.item (i)
			create succ.make (j)
			successors.replace (succ, i)
			if succ2 /= Void then
				succ.put_right (succ2)
			end
		end

feature -- Removal

	remove (v: G) is
			-- Remove `v' to the list of items to be sorted.
			-- Keep the order relation for the sorting though.
		require
			has: has (v)
		local
			k, j: INTEGER
			s1, s2, s3, s4, old_s: DS_LINKABLE [INTEGER]
			i, nb: INTEGER
		do
			k := index_of (v)
			old_s := successors.item (k)
			from
				s1 := old_s
			until
				s1 = Void
			loop
				j := s1.item
				counts.replace (counts.item (j) - 1, j)
				s1 := s1.right
			end
			items.remove (k)
			counts.remove (k)
			successors.remove (k)
			nb := successors.count
			from i := 1 until i > nb loop
				from
					s1 := successors.item (i)
					s2 := Void
				until
					s1 = Void
				loop
					if s1.item = k then
						if s2 = Void then
							successors.put (s1.right, i)
						else
							s2.put_right (s1.right)
						end
						from
							s3 := old_s
						until
							s3 = Void
						loop
							j := s3.item
							if j /= k then
								if j > k then
									j := j - 1
								end
								create s4.make (j)
								if s2 = Void then
									s2 := s4
									successors.put (s2, i)
									s2.put_right (s1.right)
								else
									s4.put_right (s2.right)
									s2.put_right (s4)
									s2 := s4
								end
								counts.replace (counts.item (j) + 1, j)
							end
							s3 := s3.right
						end
						s1 := s1.right
					elseif s1.item > k then
						s1.put (s1.item - 1)
						s2 := s1
						s1 := s1.right
					else
						s2 := s1
						s1 := s1.right
					end
				end
				i := i + 1
			end
		ensure
			one_less: count = old count - 1
			removed: not has (v)
		end

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
			counts.wipe_out
			successors.wipe_out
		ensure
			not_sorted: not is_sorted
			no_cycle: not has_cycle
			empty: count = 0
		end

feature -- Sort

	sort is
			-- Sort items held in `items' according to the
			-- relations which have been recorded.
		local
			i, nb: INTEGER
			front, rear, old_front: INTEGER
			qlinks: DS_ARRAYED_LIST [INTEGER]
			succ: DS_LINKABLE [INTEGER]
			marks: ARRAY [BOOLEAN]
			a_counts: like counts
			a_successors: like successors
		do
			-- See description of algorithm in "The Art of Computer
			-- Programming", Vol.1 3rd ed. p.265. The detection of
			-- cycles is described in exercise 23 p.271 and p.548.

			reset
				-- Clone `counts' and `successors' because they
				-- are overwritten during the sort.
			a_counts := counts.cloned_object
			a_successors := successors.cloned_object
			nb := items.count
			create sorted_items.make (nb)
				-- T4. Scan for zeros.
				-- `qlinks' is a queue containing items not processed
				-- yet but which don't have predecessors or whose
				-- predecessors have already been processed. `front'
				-- and `rear' are the indexes to the front and rear
				-- of this queue. `qlinks' shares the same memory space
				-- as `a_counts' since the corresponding slots in `a_counts'
				-- are not used anymore.
			qlinks := a_counts
			from i := 1 until i > nb loop
				if a_counts.item (i) = 0 then
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
				succ := a_successors.item (front)
				from until succ = Void loop
						-- T6. Erase relation.
					i := succ.item
					nb := a_counts.item (i) - 1
					a_counts.replace (nb, i)
					if nb = 0 then
							-- Add to `qlinks'.
						qlinks.replace (i, rear)
						rear := i
					end
					succ := succ.right
				end
				a_successors.replace (Void, front)
				sorted_items.put_last (items.item (front))
				old_front := front
				front := qlinks.item (old_front)
				qlinks.replace (0, old_front)
			end
			nb := items.count - sorted_items.count
			if nb /= 0 then
					-- A cycle has been detected.
				create cycle.make (nb + 1)
					-- T8.
				nb := items.count
				from i := 1 until i > nb loop
					qlinks.replace (0, i)
					i := i + 1
				end
					-- T9.
				create marks.make (1, nb)
				from i := 1 until i > nb loop
					marks.put (True, i)
					succ := a_successors.item (i)
						-- T10.
					from until succ = Void loop
						qlinks.replace (i, succ.item)
						succ := succ.right
					end
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
					marks.put (True, i)
					i := qlinks.item (i)
				end
				cycle.put_last (items.item (i))
			end
		ensure
			sorted: is_sorted
			cycle: (sorted_items.count /= count) implies has_cycle
		end

feature {NONE} -- Implementation

	items: DS_ARRAYED_LIST [G]
			-- Items to be sorted

	counts: DS_ARRAYED_LIST [INTEGER]
			-- Number of predecessors for each item
			-- (same indexing as in `items'.)

	successors: DS_ARRAYED_LIST [DS_LINKABLE [INTEGER]]
			-- Successors for each item
			-- (same indexing as in `items'.)

invariant

	items_not_void: items /= Void
	counts_not_void: counts /= Void
	counts_count: counts.count = items.count
	counts_capacity: counts.capacity = items.capacity
	successors_not_void: successors /= Void
	successors_count: successors.count = items.count
	successors_capacity: successors.capacity = items.capacity
	has_cycle: has_cycle implies cycle.count >= 2 and then cycle.first = cycle.last

end
