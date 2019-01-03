note
	description: "Unbounded queues, implemented by resizable arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dispenser, array
	representation: array
	access: fixed, fifo, membership
	size: fixed
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

class ARRAYED_QUEUE [G]

inherit
	QUEUE [G]
		redefine
			is_empty,
			is_equal, copy, prune_all
		end

	RESIZABLE [G]
		redefine
			is_equal, copy, is_empty
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
		redefine
			is_equal, copy, correct_mismatch
		end

create
	make

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create queue for at most `n' items.
		require
			non_negative_argument: n >= 0
		do
			create area.make_empty (n)
			out_index := 1
			count := 0
		ensure
			capacity_expected: capacity = n
			is_empty: is_empty
		end

feature -- Access

	item: G
			-- Oldest item.
		do
			Result := area.item (out_index - lower)
		end

	has (v: like item): BOOLEAN
			-- Does queue include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, j, nb: INTEGER
		do
			i := out_index - lower
			j := count
			nb := area.capacity
			if object_comparison then
				from
				until
					j = 0 or v ~ area.item (i)
				loop
					i := i + 1
					if i = nb then
						i := 0
					end
					j := j - 1
				end
			else
				from
				until
					j = 0 or v = area.item (i)
				loop
					i := i + 1
					if i = nb then
						i := 0
					end
					j := j - 1
				end
			end
			Result := j > 0
		end

feature -- Iteration

	new_cursor: ARRAYED_QUEUE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (Current)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		local
			i, j: INTEGER
			nb, other_nb: INTEGER
			c: INTEGER
		do
			c := count
			if c = other.count and object_comparison = other.object_comparison then
				i := out_index - lower
				j := other.out_index - lower
				nb := area.capacity
				other_nb := other.area.capacity
				Result := True
				if object_comparison then
					from
					until
						c = 0 or not Result
					loop
						Result := area.item (i) ~ other.area.item (j)
						j := j + 1
						if j > other_nb then
							j := 0
						end
						i := i + 1
						if i = nb then
							i := 0
						end
						c := c - 1
					end
				else
					from
					until
						c = 0 or not Result
					loop
						Result := area.item (i) = other.area.item (j)
						j := j + 1
						if j > other_nb then
							j := 0
						end
						i := i + 1
						if i = nb then
							i := 0
						end
						c := c - 1
					end
				end
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items

	capacity: INTEGER
			-- <Precursor>
		do
			Result := area.capacity
		end

	occurrences (v: G): INTEGER
			-- <Precursor>
		local
			i, j, nb: INTEGER
		do
			i := out_index - lower
			j := count
			nb := area.capacity
			if object_comparison then
				from
				until
					j = 0
				loop
					if area.item (i) ~ v then
						Result := Result + 1
					end
					i := i + 1
					if i = nb then
						i := 0
					end
					j := j - 1
				end
			else
				from
				until
					j = 0
				loop
					if area.item (i) = v then
						Result := Result + 1
					end
					i := i + 1
					if i = nb then
						i := 0
					end
					j := j - 1
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

	is_empty, off: BOOLEAN
			-- Is the structure empty?
		do
			Result := count = 0
		end

	extendible: BOOLEAN
			-- May items be added? (Answer: yes.)
		do
			Result := True
		end

	prunable: BOOLEAN
			-- May items be removed? (Answer: no.)
		do
			Result := False
		end

feature -- Element change

	extend, put, force (v: G)
			-- Add `v' as newest item.
		local
			l_capacity: like capacity
			l_count: like count
		do
			l_capacity := capacity
			l_count := count
			if l_count >= l_capacity then
				grow (l_capacity + additional_space)
			end
			area.force (v, in_index - lower)
			count := l_count + 1
		end

	replace (v: like item)
			-- Replace oldest item by `v'.
		do
			area.put (v, out_index - lower)
		end

feature -- Duplication

	copy (other: like Current)
		do
			if other /= Current then
				standard_copy (other)
				area := area.twin
			end
		end

feature -- Removal

	remove
			-- Remove oldest item.
		require else
			writable: writable
		local
			l_removed_index: like out_index
		do
			l_removed_index := out_index
			out_index := l_removed_index \\ capacity + 1
			count := count - 1
			if count = 0 then
					-- No more elements in the queue, simply reset Current to its default state.
				wipe_out
			else
					-- We put the newest element of the queue in place of the
					-- just removed element.
				area.put (newest_item, l_removed_index - lower)
			end
		end

	prune (v: G)
			-- <Precursor>
		do

		end

	prune_all (v: G)
			-- <Precursor>
		do

		end

	wipe_out
			-- Remove all items.
		require else
			prunable: True
		do
			area.wipe_out
			out_index := 1
			count := 0
		end

feature -- Resizing

	trim
			-- <Precursor>
		local
			i: like lower
			j: like lower
			n: like count
			m: like capacity
		do
			n := count
			m := capacity
			if n < m then
					-- There are some unused slots.
				i := out_index - lower
				j := in_index - lower
				if i < j then
						-- All unused slots are in front of array.
					area.move_data (i, 0, n)
					out_index := lower
				elseif n > 0 then
						-- Unused slots are in middle of array.
					area.move_data (i, j, m - i)
						-- `out_index' will be equal to `in_index'.
					out_index := j + lower
				end
					-- All unused slots for removal are at end of array.
				area := area.aliased_resized_area (n)
			end
		ensure then
			same_items: linear_representation ~ old linear_representation
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
			-- (in the original insertion order)
		local
			i, j, nb: INTEGER
		do
			from
				i := out_index - lower
				j := count
				nb := area.capacity
				create Result.make (j)
			until
				j = 0
			loop
				Result.extend (area.item (i))
				i := i + 1
				if i = nb then
					i := 0
				end
				j := j - 1
			end
		end

feature {NONE} -- Retrieval

	correct_mismatch
		do
			if
				not mismatch_information.has ("count") and then
				attached {SPECIAL [G]} mismatch_information.item ("area") as a and then
				attached {INTEGER} mismatch_information.item ("in_index") as i and then
				attached {INTEGER} mismatch_information.item ("out_index") as o and then
				attached {BOOLEAN} mismatch_information.item ("object_comparison") as c
			then
				area := a
				out_index := o
				if a.capacity = 0 then
					count := 0
				else
					count := (i - o + a.capacity) \\ a.capacity
				end
				object_comparison := c
			else
				Precursor
			end
		end

feature {ARRAYED_QUEUE, ARRAYED_QUEUE_ITERATION_CURSOR} -- Access

	area: SPECIAL [G]
			-- Storage for queue.

	out_index: INTEGER
			-- Position of oldest item.

feature {ARRAYED_QUEUE} -- Implementation

	in_index: INTEGER
			-- Position for next insertion
		local
			c: like capacity
		do
			c := capacity
			if c > 0 then
				Result := (out_index - lower + count) \\ c + lower
			else
				Result := out_index
			end
		end

	grow (n: INTEGER)
		local
			old_count, new_capacity: like capacity
			nb: INTEGER
		do
			new_capacity := area.capacity.max (n)
			if count = 0 or else in_index > out_index then
					-- Case were queue is not full and data is contiguous from
					-- oldest item to the newest one.
				area := area.aliased_resized_area (new_capacity)
			else
				old_count := area.count
					-- Fill the empty space with the most recent added item.
				area := area.aliased_resized_area_with_default (newest_item, new_capacity)
				nb := old_count - out_index + 1
				area.move_data (out_index - lower, new_capacity - nb, nb)
				out_index := new_capacity - nb + 1
			end
		end

feature {ARRAYED_QUEUE_ITERATION_CURSOR} -- Access

	lower: INTEGER = 1
			-- Lower bound for accessing list items via indexes

feature {NONE} -- Implementation

	upper: INTEGER
			-- Upper bound for accessing list items via indexes
		do
			Result := area.count
		end

	newest_item: G
			-- Most recently added item.
		local
			l_pos: INTEGER
		do
			l_pos := in_index - 1
			if l_pos = 0 then
					-- Next element is at the beginning of the area, so previous
					-- one is at `area.upper'.
				Result :=  area.item (area.upper)
			else
				Result :=  area.item (l_pos - lower)
			end
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
