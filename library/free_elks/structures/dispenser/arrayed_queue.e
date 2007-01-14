indexing

	description:
		"Unbounded queues, implemented by resizable arrays"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: dispenser, array;
	representation: array;
	access: fixed, fifo, membership;
	size: fixed;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

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
			index_set
		end

create

	make

feature -- Initialization

	make (n: INTEGER) is
			-- Create queue for at most `n' items.
		require
			non_negative_argument: n >= 0
		do
			array_make (1, n)
			in_index := 1
			out_index := 1
				-- One entry is kept free
		ensure
			capacity_expected: capacity = n
		end

feature -- Access

	item: G is
			-- Oldest item.
		do
			Result := area.item (out_index - lower)
		end

	has (v: like item): BOOLEAN is
			-- Does queue include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i: INTEGER
		do
			if object_comparison then
				if v /= Void then
					from
						i := out_index
					until
						i = in_index or (i_th (i) /= Void and then v.is_equal (i_th (i)))
					loop
						i := i + 1
						if i > capacity then
							i := 1
						end
					end
				end
			else
				from
					i := out_index
				until
					i = in_index or v = i_th (i)
				loop
					i := i + 1
					if i > capacity then
						i := 1
					end
				end
			end
			Result := (i /= in_index)
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items.
		local
			l_capacity: like capacity
		do
			l_capacity := capacity
			if l_capacity > 0 then
				Result := (in_index - out_index + l_capacity) \\ l_capacity
			end
		end

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure then
			count_definition: Result.count = count
		end

feature -- Status report

	is_empty, off: BOOLEAN is
			-- Is the structure empty?
		do
			Result := (in_index = out_index)
		end

	full: BOOLEAN is
			-- Is structure filled to capacity?
			-- (Answer: no.)
		do
			Result := False
		end

	extendible: BOOLEAN is
			-- May items be added? (Answer: yes.)
		do
			Result := True
		end

	prunable: BOOLEAN is
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

feature -- Element change

	extend, put, force (v: G) is
			-- Add `v' as newest item.
		local
			l_in_index: like in_index
			l_capacity: like capacity
		do
			l_capacity := capacity
			l_in_index := in_index			
			if l_capacity = 0 or ((l_in_index - out_index + l_capacity) \\ l_capacity + 1 >= l_capacity) then
				grow
				l_capacity := capacity
			end
			area.put (v, l_in_index - lower)
			l_in_index := (l_in_index + 1) \\ l_capacity
			if l_in_index = 0 then
				l_in_index := l_capacity
			end
			in_index := l_in_index
		end

	replace (v: like item) is
			-- Replace oldest item by `v'.
		do
			put_i_th (v, out_index)
		end

feature -- Removal

	remove is
			-- Remove oldest item.
		local
			default_value: G
			l_out_index: like out_index
			l_capacity: like capacity
		do
			l_out_index := out_index
			l_capacity := capacity
			area.put (default_value, l_out_index - lower)
			l_out_index := (l_out_index + 1) \\ l_capacity
			if l_out_index = 0 then
				l_out_index := l_capacity 
			end
			out_index := l_out_index
		end

	wipe_out is
			-- Remove all items.
		do
			clear_all
			out_index := 1
			in_index := 1
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (in the original insertion order)
		local
			i: INTEGER
		do
			create Result.make (count)
			from
				i := out_index
			until
				i = in_index
			loop
				Result.extend (i_th (i))
				i := i + 1
				if i > capacity then i := 1 end
			end
			i := 1
		end

feature {NONE} -- Inapplicable

	start is
			-- Move cursor to first position.
		do
		end

	finish is
			-- Move cursor to last position.
		do
		end

	forth is
			-- Move cursor to next position.
		do
		end

	valid_index_set: BOOLEAN is
		do
			Result := True
		end

feature {ARRAYED_QUEUE} -- Implementation

	out_index: INTEGER
			-- Position of oldest item

	in_index: INTEGER
			-- Position for next insertion

	grow is
		local
			i, j: INTEGER
			default_value: G
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
					put_i_th (default_value, i)
					i := i - 1
					j := j - 1
				end
				out_index := j + 1
			end
		ensure
			in_index_unchanged: in_index = old in_index
		end

invariant

	not_full: not full
	extendible: extendible
	prunable: prunable
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







end -- class ARRAYED_QUEUE



