indexing
	description: "Priority queues implemented as heaps"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sorted_priority_queue, dispenser, heap;
	representation: heap;
	access: fixed, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class HEAP_PRIORITY_QUEUE [G -> COMPARABLE] inherit

	PRIORITY_QUEUE [G]
		undefine
			is_equal, copy, is_empty
		redefine
			linear_representation
		select
			count
		end

	ARRAY [G]
		rename
			make as array_make,
			item as i_th,
			put as put_i_th,
			bag_put as put,
			force as array_force,
			count as array_count
		export
			{NONE}
				all
			{HEAP_PRIORITY_QUEUE}
				put_i_th, area, i_th, valid_index, upper, lower, subarray
		redefine
			full, prunable, prune,
			put, extendible, wipe_out,
			linear_representation,
			index_set, is_equal
		end

create
	make

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate heap space.
		do
			array_make (1, n)
		end

feature -- Access

	item: G is
			-- Entry at top of heap.
		do
			Result := i_th (1)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure then
			count_definition: Result.count = count
		end

feature -- Status report

	extendible: BOOLEAN is
			-- May items be added?
		do
			Result := not full
		end

	full: BOOLEAN is
			-- Is structure filled to capacity?
		do
			Result := (count = capacity)
		end

	prunable: BOOLEAN is True
			-- May items be removed? (Answer: yes.)

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
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
				l_current := duplicate (count)
				l_other := other.duplicate (count)
				from
					Result := True
				until
					not Result or l_current.is_empty
				loop
					if object_comparison then
						Result := equal (l_current.item, l_other.item)
					else
						Result := l_current.item = l_other.item
					end
					l_current.remove
					l_other.remove
				end
			end
		end

feature -- Element change

	force (v: like item) is
			-- Add item `v' at its proper position.
		do
			if full then
				auto_resize (1, count + additional_space)
			end
			put (v)
		end
		
	put (v: like item) is
			-- Insert item `v' at its proper position.
		local
			i: INTEGER
		do
			count := count + 1
			from
				i := count
			until
				i <= 1 or else not safe_less_than (i_th (i // 2), v)
			loop
				put_i_th (i_th (i // 2), i)
				i := i // 2
			end
			put_i_th (v, i)
		end

feature -- Removal

	remove is
			-- Remove item of highest value.
		local
			l_default: G
			i, j: INTEGER
			up: like item
			stop: BOOLEAN
		do
			count := count - 1
			if count > 0 then
				from
					i := 1
					up := i_th (count + 1)
				until
					stop or i > count // 2
				loop
					j := 2 * i
					if (j < count) and safe_less_than (i_th (j), i_th (j + 1)) then
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
			put_i_th (l_default, count + 1)
		end

	prune (v: G) is
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
					if not l_done and equal (l_item, v) then
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
				from
					l_tmp.start
					wipe_out
				until
					l_tmp.after
				loop
					put (l_tmp.item)
					l_tmp.forth
				end
			end
		end

	wipe_out is
			-- Remove all items.
		do
			count := 0
			discard_items
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
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

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- New priority queue containing `n' greatest items of Current.
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
			from
				create Result.make (n)
				l_tmp.start
			until
				l_tmp.after
			loop
				Result.put (l_tmp.item)
				l_tmp.forth
			end
		end

feature {NONE} -- Inapplicable

	replace (v: like item) is
		do
		end

feature {NONE} -- Comparison

	safe_less_than (a, b: G): BOOLEAN is
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
			definition: (a /= Void and b /= Void) implies Result = (a < b)
			left_void_definition: (a = Void and b /= Void) implies Result
			right_void_definition: (a /= Void and b = Void) implies not Result
		end

invariant

	empty_means_storage_empty: is_empty implies all_default

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class HEAP_PRIORITY_QUEUE
