note
	description: "Priority queues implemented as heaps"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sorted_priority_queue, dispenser, heap
	representation: heap
	access: fixed, membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

class HEAP_PRIORITY_QUEUE [G -> COMPARABLE]

inherit
	PRIORITY_QUEUE [G]
		redefine
			is_equal, copy,
			replaceable
		end

	RESIZABLE [G]
		redefine
			is_equal, copy
		end

create
	make,
	make_from_iterable

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Allocate heap space.
		do
			create area.make_empty (n)
		end

	make_from_iterable (other: ITERABLE [G])
			-- Create a priority queue with all items obtained from `other`.
		do
			make (estimated_count_of (other))
			across
				other as o
			loop
				extend (o.item)
			end
		end

feature -- Access

	item: G
			-- Entry at top of heap.
		do
			Result := i_th (1)
		end

	has (v: G): BOOLEAN
			-- <Precursor>
		local
			i, nb: INTEGER
			l_area: like area
		do
			l_area := area
			nb := l_area.count
			if object_comparison and v /= Void then
				from
				until
					i = nb or Result
				loop
					Result := l_area.item (i) ~ v
					i := i + 1
				end
			else
				from
				until
					i = nb or Result
				loop
					Result := l_area.item (i) = v
					i := i + 1
				end
			end
		end

feature -- Iteration

	new_cursor: HEAP_PRIORITY_QUEUE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items
		do
			Result := area.count
		end

	capacity: INTEGER
		do
			Result := area.capacity
		end

	occurrences (v: G): INTEGER
		local
			i, nb: INTEGER
		do
			if object_comparison then
				from
					i := lower
					nb := count
				until
					i > nb
				loop
					if i_th (i) ~ v then
						Result := Result + 1
					end
					i := i + 1
				end
			else
				from
					i := lower
					nb := count
				until
					i > nb
				loop
					if i_th (i) = v then
						Result := Result + 1
					end
					i := i + 1
				end
			end
		end

	index_set: INTEGER_INTERVAL
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure then
			count_definition: Result.count = count
		end

feature -- Status report

	extendible: BOOLEAN
			-- May items be added?
		do
			Result := not full
		end

	replaceable: BOOLEAN
		do
			Result := False
		end

	prunable: BOOLEAN = True
			-- May items be removed? (Answer: yes.)

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		local
			l_current, l_other: like Current
		do
			if other = Current then
				Result := True
			elseif
				object_comparison = other.object_comparison and then
				count = other.count
			then
				l_current := twin
				l_other := other.twin
				from
					Result := True
				until
					not Result or l_current.is_empty
				loop
					if object_comparison then
						Result := l_current.item ~ l_other.item
					else
						Result := l_current.item = l_other.item
					end
					l_current.remove
					l_other.remove
				end
			end
		end

feature -- Element change

	force (v: like item)
			-- Add item `v' at its proper position.
		do
			if full then
				grow (count + additional_space)
			end
			put (v)
		end

	put (v: like item)
			-- Insert item `v' at its proper position.
		local
			i: INTEGER
		do
			from
				i := count + 1
			until
				i <= 1 or else not safe_less_than (i_th (i // 2), v)
			loop
				force_i_th (i_th (i // 2), i)
				i := i // 2
			end
			force_i_th (v, i)
		end

	extend (v: like item)
			-- <Precursor>
		do
			put (v)
		end

feature -- Duplication

	copy (other: like Current)
			-- <Precursor>
		do
			if other /= Current then
				standard_copy (other)
				area := area.twin
			end
		end

	duplicate (n: INTEGER): like Current
			-- New priority queue containing `n' greatest items of Current.
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
		require
			n_positive: n >= 0
			n_in_bounds: n <= count
		local
			l_current: like Current
			l_tmp: ARRAYED_LIST [G]
			i: INTEGER
		do
				--| Extract `n' greatest items of Current.
			from
				l_current := twin
				create l_tmp.make (n)
				i := 1
			until
				i > n
			loop
				l_tmp.extend (l_current.item)
				l_current.remove
				i := i + 1
			end

				--| Insert `n' greatest items into new queue.
			across
				l_tmp as x
			from
				create Result.make (n)
			loop
				Result.put (x.item)
			end
		end

feature -- Removal

	remove
			-- Remove item of highest value.
		local
			i, j: INTEGER
			up: like item
			nb: INTEGER
			stop: BOOLEAN
		do
			nb := count - 1
			if nb > 0 then
				from
					i := 1
					up := i_th (nb + 1)
				until
					stop or i > nb // 2
				loop
					j := 2 * i
					if (j < nb) and safe_less_than (i_th (j), i_th (j + 1)) then
						j := j + 1
					end
					stop := not safe_less_than (up, i_th (j))
					if not stop then
						put_i_th (i_th (j), i)
						i := j
					end
				end
				put_i_th (up, i)
			end
			area.remove_tail (1)
		end

	prune (v: G)
			-- Remove first occurrence of `v' if any.
		local
			i, nb: INTEGER
			l_tmp: ARRAYED_LIST [G]
			l_item: G
			l_done: BOOLEAN
		do
				--| Create an ARRAYED_LIST with all items of Current except first
				--| occurrence of `v'. Then recreate current with items from ARRAYED_LIST
				--| if `v' was found.
			create l_tmp.make (count)
			if object_comparison then
				from
					i := 1
					nb := count
				until
					i > nb
				loop
					l_item := i_th (i)
					if not l_done and l_item ~ v then
						l_done := True
					else
						l_tmp.extend (l_item)
					end
					i := i + 1
				end
			else
				from
					i := 1
					nb := count
				until
					i > nb
				loop
					l_item := i_th (i)
					if not l_done and l_item = v then
						l_done := True
					else
						l_tmp.extend (l_item)
					end
					i := i + 1
				end
			end

			if l_tmp.count = count - 1 then
					--| Item was found, we can update `Current'.
				across
					l_tmp as x
				from
					wipe_out
				loop
					put (x.item)
				end
			end
		end

	wipe_out
			-- Remove all items.
		do
			area.wipe_out
		end

feature -- Resizing

	grow (i: INTEGER)
			-- <Precursor>
		do
			if i > area.capacity then
				area := area.aliased_resized_area (i)
			end
		end

	trim
			-- <Precursor>
		local
			n: like count
		do
			n := count
			if n < capacity then
				area := area.aliased_resized_area (n)
			end
		ensure then
			same_items: linear_representation.is_equal (old linear_representation)
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
			-- (Sorted according to decreasing priority)
		local
			l_current: like Current
		do
			from
				l_current := twin
				create Result.make (count)
			until
				l_current.is_empty
			loop
				Result.extend (l_current.item)
				l_current.remove
			end
		end

feature {HEAP_PRIORITY_QUEUE, HEAP_PRIORITY_QUEUE_ITERATION_CURSOR} -- Access

	lower: INTEGER = 1
			-- Lower bound for internal access to `area`.

	area: SPECIAL [G]
			-- Storage for queue.

feature {HEAP_PRIORITY_QUEUE} -- Implementation

	i_th (i: INTEGER): G
		require
			valid_index: area.valid_index (i - lower)
		do
			Result := area.item (i - lower)
		end

	put_i_th (v: G; i: INTEGER)
		require
			valid_index: area.valid_index (i - lower)
		do
			area.put (v, i - lower)
		end

	force_i_th (v: G; i: INTEGER)
		require
			valid_index: i >= lower and i <= count + lower
			valid_upper: i = count + lower implies count < capacity
		do
			area.force (v, i - lower)
		end

feature {NONE} -- Inapplicable

	replace (v: like item)
		do
		end

feature {NONE} -- Comparison

	safe_less_than (a, b: G): BOOLEAN
			-- Same as `a < b' when `a' and `b' are not Void.
			-- If `a' is Void and `b' is not, then True
			-- Otherwise False
		do
			if a /= Void and b /= Void then
				Result := a < b
			elseif a = Void and b /= Void then
				Result := True
			else
				Result := False
			end
		ensure
			asymmetric: Result implies not safe_less_than (b, a)
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
