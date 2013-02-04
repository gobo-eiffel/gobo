note

	description:
		"Unbounded queues, implemented by resizable arrays"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: dispenser, array;
	representation: array;
	access: fixed, fifo, membership;
	size: fixed;
	contents: generic;
	date: "$Date: 2010-03-23 11:11:37 +0100 (Tue, 23 Mar 2010) $"
	revision: "$Revision: 448 $"

class ARRAYED_QUEUE [G] inherit

	QUEUE [G]
		undefine
			copy, is_equal, prune_all
		redefine
			linear_representation, has, is_empty
		select
			count, is_empty, put
		end

	ARRAY [G]
		rename
			count as array_count,
			force as force_i_th,
			item as i_th,
			make as array_make,
			put as put_i_th,
			grow as array_grow,
			is_empty as array_empty
		export
			{ANY} valid_index
			{ARRAYED_QUEUE} lower, upper, i_th, area, subarray
			{NONE} all
		redefine
			wipe_out, extend, prunable,
			linear_representation,
			has, full, extendible,
			valid_index_set,
			index_set, trim
		end

	MISMATCH_CORRECTOR
		export {NONE}
			all
		undefine
			is_equal, copy
		redefine
			correct_mismatch
		end

create

	make

feature -- Initialization

	make (n: INTEGER)
			-- Create queue for at most `n' items.
		require
			non_negative_argument: n >= 0
		do
			array_make (1, n)
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
			i: INTEGER
			j: INTEGER
		do
			i := out_index
			j := count
			if object_comparison then
				from
				until
					j = 0 or v ~ i_th (i)
				loop
					i := i + 1
					if i > capacity then
						i := 1
					end
					j := j - 1
				end
			else
				from
				until
					j = 0 or v = i_th (i)
				loop
					i := i + 1
					if i > capacity then
						i := 1
					end
					j := j - 1
				end
			end
			Result := j > 0
		end

feature -- Measurement

	count: INTEGER
			-- Number of items

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

	full: BOOLEAN
			-- Is structure filled to capacity?
		do
			Result := count = capacity
		end

	extendible: BOOLEAN
			-- May items be added? (Answer: yes.)
		do
			Result := True
		end

	prunable: BOOLEAN
			-- May items be removed? (Answer: yes.)
		do
			Result := True
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
				grow
				l_capacity := capacity
			end
			area.put (v, in_index - lower)
			count := l_count + 1
		end

	replace (v: like item)
			-- Replace oldest item by `v'.
		do
			put_i_th (v, out_index)
		end

feature -- Removal

	remove
			-- Remove oldest item.
		local
			l_out_index: like out_index
			l_capacity: like capacity
		do
			l_out_index := out_index
			l_capacity := capacity
			area.put_default (l_out_index - lower)
			l_out_index := (l_out_index + 1) \\ l_capacity
			if l_out_index = 0 then
				l_out_index := l_capacity
			end
			out_index := l_out_index
			count := count - 1
		end

	wipe_out
			-- Remove all items.
		do
			clear_all
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
				area := area.resized_area (n)
				upper := lower + n - 1
			end
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
			-- (in the original insertion order)
		local
			i: INTEGER
			j: INTEGER
		do
			j := count
			create Result.make (j)
			from
				i := out_index
			until
				j = 0
			loop
				Result.extend (i_th (i))
				i := i + 1
				if i > capacity then i := 1 end
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
				lower := 1
				upper := a.capacity
			else
				Precursor
			end
		end

feature {NONE} -- Inapplicable

	start
			-- Move cursor to first position.
		do
		end

	finish
			-- Move cursor to last position.
		do
		end

	forth
			-- Move cursor to next position.
		do
		end

	valid_index_set: BOOLEAN
		do
			Result := True
		end

feature {ARRAYED_QUEUE} -- Implementation

	out_index: INTEGER
			-- Position of oldest item

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

	grow
		local
			i, j: INTEGER
		do
			i := array_count
			conservative_resize (1, capacity + additional_space)
			if out_index > 1 then
				from
					j := capacity
				until
					i < out_index
				loop
					put_i_th (i_th (i), j)
					i := i - 1
					area.put_default (i)
					j := j - 1
				end
				out_index := j + 1
			end
		ensure
			in_index_unchanged: in_index = old in_index or else in_index = old (in_index + capacity)
		end

invariant

	extendible: extendible
	prunable: prunable
	empty_means_storage_empty: is_empty implies all_default

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2010, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class ARRAYED_QUEUE
