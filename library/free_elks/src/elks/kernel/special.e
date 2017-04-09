note
	description: "[
		Special objects: homogeneous sequences of values,
		used to represent arrays and strings
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2016-04-13 06:29:38 -0700 (Wed, 13 Apr 2016) $"
	revision: "$Revision: 98619 $"

frozen class
	SPECIAL [T]

inherit
	ABSTRACT_SPECIAL
		redefine
			debug_output
		end

	READABLE_INDEXABLE [T]
		redefine
			new_cursor
		end

create
	make_empty,
	make_filled,
	make_from_native_array

feature {NONE} -- Initialization

	make_empty (n: INTEGER)
			-- Create a special object for `n' entries.
		require
			non_negative_argument: n >= 0
		external
			"built_in"
		ensure
			capacity_set: capacity = n
			count_set: count = 0
		end

	make_filled (v: T; n: INTEGER)
			-- Create a special object for `n' entries initialized with `v'.
		require
			non_negative_argument: n >= 0
		do
			make_empty (n)
			fill_with (v, 0, n - 1)
		ensure
			capacity_set: capacity = n
			count_set: count = n
			filled: filled_with (v, 0, n - 1)
		end

	make_from_native_array (an_array: like native_array)
			-- Create a special object from `an_array'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			an_array_not_void: an_array /= Void
		do
		end

feature -- Access

	item alias "[]" (i: INTEGER): T assign put
			-- Item at `i'-th position
			-- (indices begin at 0)
		external
			"built_in"
		end

	at alias "@" (i: INTEGER): T
			-- Item at `i'-th position
			-- (indices begin at 0)
		require
			valid_index: valid_index (i)
		do
			Result := item (i)
		end

	index_of (v: T; start_position: INTEGER): INTEGER
			-- Index of first occurrence of item identical to `v'.
			-- -1 if none.
			-- (Use object equality for comparison.)
		require
			valid_start_position: start_position >= 0
		local
			nb: INTEGER
		do
			from
				Result := start_position
				nb := count
			until
				Result >= nb or else item (Result) ~ v
			loop
				Result := Result + 1
			end
			if Result >= nb then
				Result := -1
			end
		ensure
			found_or_not_found: Result = -1 or else (Result >= 0 and then Result < count)
		end

	item_address (i: INTEGER): POINTER
			-- Address of element at position `i'.
			-- Use only when interfacing with C externals when Current is guaranteed to not move in memory.
		require
			not_dotnet: not {PLATFORM}.is_dotnet
			index_large_enough: i >= 0
			index_small_enough: i < count
		do
			Result := base_address + i * element_size
		ensure
			element_address_not_null: Result /= default_pointer
		end

	base_address: POINTER
			-- Address of element at position `0'.
			-- Use only when interfacing with C externals when Current is guaranteed to not move in memory.
		require
			not_dotnet: not {PLATFORM}.is_dotnet
		external
			"built_in"
		ensure
			base_address_not_null: Result /= default_pointer
		end

	native_array: NATIVE_ARRAY [T]
			-- Only for compatibility with .NET
		require
			is_dotnet: {PLATFORM}.is_dotnet
		do
			create Result
		end

	to_array: ARRAY [T]
			-- Build an array representation of Current from `1' to `count'.
		do
			create Result.make_from_special (Current)
		ensure
			to_array_attached: Result /= Void
			to_array_lower_set: Result.lower = 1
			to_array_upper_set: Result.upper = count
		end

	new_cursor: SPECIAL_ITERATION_CURSOR [T]
			-- <Precursor>
		do
			create Result.make (Current)
		end

feature -- Measurement

	lower: INTEGER = 0
			-- Minimum index of Current

	upper: INTEGER
			-- Maximum index of Current
		do
			Result := count - 1
		end

	count: INTEGER
			-- Count of special area
		external
			"built_in"
		end

	capacity: INTEGER
			-- Capacity of special area
		external
			"built_in"
		end

feature -- Status report

	filled_with (v: T; start_index, end_index: INTEGER): BOOLEAN
			-- Are all items between index `start_index' and `end_index'
			-- set to `v'?
			-- (Use reference equality for comparison.)			
		require
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < count
		local
			i: INTEGER
		do
			from
				Result := True
				i := start_index
			until
				i > end_index or else not Result
			loop
				Result := item (i) = v
				i := i + 1
			end
		end

	same_items (other: like Current; source_index, destination_index, n: INTEGER): BOOLEAN
			-- Are the `n' elements of `other' from `source_index' position the same as
			-- the `n' elements of `Current' from `destination_index'?
			-- (Use reference equality for comparison.)
		require
			other_not_void: other /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= other.count
			n_is_small_enough_for_destination: destination_index + n <= count
		local
			i, j, nb: INTEGER
		do
			Result := True
			if other /= Current then
				from
					i := source_index
					j := destination_index
					nb := source_index + n
				until
					i = nb
				loop
					if other.item (i) /= item (j) then
						Result := False
						i := nb - 1
					end
					i := i + 1
					j := j + 1
				end
			end
		ensure
			valid_on_empty_area: (n = 0) implies Result
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of Current?
		do
			Result := (0 <= i) and (i < count)
		end

feature -- Element change

	put (v: T; i: INTEGER)
			-- Replace `i'-th item by `v'.
			-- (Indices begin at 0.)
		require
			index_large_enough: i >= 0
			index_small_enough: i < count
		external
			"built_in"
		ensure
			inserted: item (i) = v
			same_count: count = old count
			same_capacity: capacity = old capacity
		end

	force (v: T; i: INTEGER)
			-- If `i' is equal to `count' increase `count' by one and insert `v' at index `count',
			-- otherwise replace `i'-th item by `v'.
			-- (Indices begin at 0.)
		require
			index_large_enough: i >= 0
			index_small_enough: i <= count
			not_full: i = count implies count < capacity
		do
			if i < count then
				put (v, i)
			else
				extend (v)
			end
		ensure
			count_updated: count = (i + 1).max (old count)
			same_capacity: capacity = old capacity
			inserted: item (i) = v
		end

	extend (v: T)
			-- Add `v' at index `count'.
		require
			count_small_enough: count < capacity
		external
			"built_in"
		ensure
			count_increased: count = old count + 1
			same_capacity: capacity = old capacity
			inserted: item (count - 1) = v
		end

	extend_filled (v: T)
			-- Set items between `count' and `capacity - 1' with `v'.
		do
			fill_with (v, count, capacity - 1)
		ensure
			same_capacity: capacity = old capacity
			count_increased: count = capacity
			filled: filled_with (v, old count, capacity - 1)
		end

	fill_with (v: T; start_index, end_index: INTEGER)
			-- Set items between `start_index' and `end_index' with `v'.
		require
			start_index_non_negative: start_index >= 0
			start_index_in_bound: start_index <= count
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < capacity
		local
			i, nb: INTEGER
			l_count: like count
		do
			from
				i := start_index
				l_count := count.min (end_index + 1)
				nb := l_count
			until
				i = nb
			loop
				put (v, i)
				i := i + 1
			end
			from
				i := l_count
				nb := end_index + 1
			until
				i = nb
			loop
				extend (v)
				i := i + 1
			end
		ensure
			same_capacity: capacity = old capacity
			count_definition: count = (old count).max (end_index + 1)
			filled: filled_with (v, start_index, end_index)
		end

	fill_with_default (start_index, end_index: INTEGER)
			-- Clear items between `start_index' and `end_index'.
		require
			is_self_initializing: ({T}).has_default
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < count
		do
			fill_with (({T}).default, start_index, end_index)
		ensure
			filled: filled_with (({T}).default, start_index, end_index)
		end

	insert_data (other: SPECIAL [T]; source_index, destination_index, n: INTEGER)
			-- Insert `n' elements of `other' from `source_index' position to Current at
			-- `destination_index' and shift elements between `destination_index' and `count'
			-- to the right. Other elements of Current remain unchanged.
		require
			other_not_void: other /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= other.count
			n_is_small_enough_for_destination: count + n <= capacity
			same_type: other.conforms_to (Current)
		local
			l_remaining_items, l_offset, l_nb_items_left: INTEGER
			l_source_index, l_end_index, l_destination_index: INTEGER
		do
			l_remaining_items := count - destination_index
			if l_remaining_items = 0 then
					-- It is being added at the end of Current, therefore we can simply extend.
				copy_data (other, source_index, destination_index, n)
			elseif n <= l_remaining_items then
					-- Simple case where we can perform a move of the existing items to the end
					-- and then copy the elements of `other'.
				move_data (destination_index, destination_index + n, l_remaining_items)
				copy_data (other, source_index, destination_index, n)
			else
					-- Because we cannot have uninitialized items, we cannot move all the remaining items beyond count
					-- instead we copy by chunks of `l_remaining_items'.
				from
					l_source_index := source_index
					l_destination_index := destination_index
					l_end_index := source_index + n
					l_nb_items_left := n
					l_offset := l_remaining_items
				until
					l_source_index >= l_end_index
				loop
					move_data (l_destination_index, l_destination_index + l_offset, l_remaining_items)
					copy_data (other, l_source_index, l_destination_index, l_offset)
					l_destination_index := l_destination_index + l_offset
					l_source_index := l_source_index + l_offset
						-- Compute how many more items we have to copy.
					l_nb_items_left := l_nb_items_left - l_remaining_items
					l_offset := l_offset.min (l_nb_items_left)
				end
			end
		ensure
			copied: same_items (other, source_index, destination_index, n)
			count_updated: count = old count + n
		end

	copy_data (other: SPECIAL [T]; source_index, destination_index, n: INTEGER)
			-- Copy `n' elements of `other' from `source_index' position to Current at
			-- `destination_index'. Other elements of Current remain unchanged.
		require
			other_not_void: other /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= other.count
			n_is_small_enough_for_destination: destination_index + n <= capacity
			same_type: other.conforms_to (Current)
		local
			i, j, nb: INTEGER
		do
			if other = Current then
				move_data (source_index, destination_index, n)
			else
				from
					i := source_index
					j := destination_index
					nb := source_index + n
				until
					i = nb
				loop
					force (other.item (i), j)
					i := i + 1
					j := j + 1
				end
			end
		ensure
			copied:	same_items (other, source_index, destination_index, n)
			count_updated: count = (old count).max (destination_index + n)
		end

	move_data (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= capacity
		do
			if source_index = destination_index then
			elseif source_index > destination_index then
				if destination_index + n < source_index then
					non_overlapping_move (source_index, destination_index, n)
				else
					overlapping_move (source_index, destination_index, n)
				end
			else
				if source_index + n < destination_index then
					non_overlapping_move (source_index, destination_index, n)
				else
					overlapping_move (source_index, destination_index, n)
				end
			end
		ensure
			moved: same_items (old twin, source_index, destination_index, n)
			count_updated: count = (old count).max (destination_index + n)
		end

	overlapping_move (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			different_source_and_target: source_index /= destination_index
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= capacity
		local
			i, nb: INTEGER
			l_offset: INTEGER
		do
			if source_index < destination_index then
					-- We shift from left to right starting from the end
					-- due to possible overlapping.
				from
					i := source_index + n - 1
					nb := source_index - 1
					l_offset := destination_index - source_index
					if destination_index + n >= count then
							-- Initialize elements above `count' to a dummy item.
						fill_with (item (source_index), count, destination_index + n - 1)
					end
					check
						l_offset_positive: l_offset > 0
					end
				until
					i = nb
				loop
					put (item (i), i + l_offset)
					i := i - 1
				end
			else
					-- We shift from right to left.
				from
					i := source_index
					nb := source_index + n
					l_offset := source_index - destination_index
					check
						l_offset_positive: l_offset > 0
					end
				until
					i = nb
				loop
					force (item (i), i - l_offset)
					i := i + 1
				end
			end
		ensure
			moved: same_items (old twin, source_index, destination_index, n)
			count_updated: count = (old count).max (destination_index + n)
		end

	non_overlapping_move (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			destination_index_in_bound: destination_index <= count
			n_non_negative: n >= 0
			different_source_and_target: source_index /= destination_index
			non_overlapping:
				(source_index < destination_index implies source_index + n < destination_index) or
				(source_index > destination_index implies destination_index + n < source_index)
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= capacity
		local
			i, nb: INTEGER
			l_offset: INTEGER
		do
			from
				i := source_index
				nb := source_index + n
				l_offset := destination_index - source_index
			until
				i = nb
			loop
				force (item (i), i + l_offset)
				i := i + 1
			end
		ensure
			moved: same_items (Current, source_index, destination_index, n)
			count_updated: count = (old count).max (destination_index + n)
		end

feature -- Resizing

	keep_head (n: INTEGER)
			-- Keep the first `n' entries.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= count
		do
			set_count (n)
		ensure
			count_updated: count = n
			kept: same_items (old twin, 0, 0, n)
		end

	keep_tail (n: INTEGER)
			-- Keep the last `n' entries.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= count
		do
			overlapping_move (count - n, 0, n)
			set_count (n)
		ensure
			count_updated: count = n
			kept: same_items (old twin, n, 0, n)
		end

	remove_head (n: INTEGER)
			-- Remove the first `n' entries.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= count
		do
			keep_tail (count - n)
		ensure
			count_updated: count = old count - n
			kept: same_items (old twin, n, 0, count)
		end

	remove_tail (n: INTEGER)
			-- Keep the first  `count - n' entries.
		require
			non_negative_argument: n >= 0
			less_than_count: n <= count
		do
			keep_head (count - n)
		ensure
			count_updated: count = old count - n
			kept: same_items (old twin, 0, 0, count)
		end

	resized_area (n: INTEGER): like Current
			-- Create a copy of Current with a count of `n'
		require
			n_non_negative: n >= 0
		do
			create Result.make_empty (n)
			Result.copy_data (Current, 0, 0, n.min (count))
		ensure
			Result_not_void: Result /= Void
			Result_different_from_current: Result /= Current
			new_count: Result.count = n.min (old count)
			new_capacity: Result.capacity = n
			preserved: Result.same_items (Current, 0, 0, n.min (old count))
		end

	resized_area_with_default (a_default_value: T; n: INTEGER): like Current
			-- Create a copy of Current with a count of `n' where not yet initialized
			-- entries are set to `a_default_value'.
		require
			n_non_negative: n >= 0
		do
			create Result.make_empty (n)
			if n > count then
				Result.copy_data (Current, 0, 0, count)
				Result.fill_with (a_default_value, count, n - 1)
			else
				Result.copy_data (Current, 0, 0, n)
			end
		ensure
			Result_not_void: Result /= Void
			Result_different_from_current: Result /= Current
			new_count: Result.count = n
			new_capacity: Result.capacity = n
			preserved: Result.same_items (Current, 0, 0, n.min (old count))
		end

	aliased_resized_area (n: INTEGER): like Current
			-- Try to resize `Current' with a count of `n', if not
			-- possible a new copy
		require
			n_non_negative: n >= 0
		external
			"built_in"
		ensure
			Result_not_void: Result /= Void
			new_count: Result.count = n.min (old count)
			new_capacity: Result.capacity = n
			preserved: Result.same_items (old twin, 0, 0, n.min (old count))
		end

	aliased_resized_area_with_default (a_default_value: T; n: INTEGER): like Current
			-- Try to resize `Current' with a count of `n', if not
			-- possible a new copy. Non yet initialized entries are set to `a_default_value'.
		require
			n_non_negative: n >= 0
		do
			Result := aliased_resized_area (n)
			Result.fill_with (a_default_value, Result.count, n - 1)
		ensure
			Result_not_void: Result /= Void
			new_count: Result.count = n
			new_capacity: Result.capacity = n
			preserved: Result.same_items (old twin, 0, 0, n.min (old count))
		end

feature -- Removal

	replace_all (v: T)
			-- Replace all items with `v'.
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				put (v, i)
				i := i - 1
			end
		ensure
			cleared: filled_with (v, 0, upper)
		end

	wipe_out
			-- Reset count to zero.
		do
			set_count (0)
		ensure
			same_capacity: capacity = old capacity
			count_reset: count = 0
		end

	clear_all
			-- Reset all items to default values.
		obsolete
			"Because of the new precondition, it is recommended to use `fill_with' instead. [2017-05-31]"
		require
			has_default: ({T}).has_default
		do
			fill_with_default (0, upper)
		ensure
			same_capacity: capacity = old capacity
			count_reset: count = old count
		end

feature -- Iteration

	do_all_in_bounds (action: PROCEDURE [T]; start_index, end_index: INTEGER)
			-- Apply `action' to every item, from first to last.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index
			until
				i > nb
			loop
				action.call ([item (i)])
				i := i + 1
			end
		end

	do_if_in_bounds (action: PROCEDURE [T]; test: FUNCTION [T, BOOLEAN]; start_index, end_index: INTEGER)
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
			test_not_void: test /= Void
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index
			until
				i > nb
			loop
				if test.item ([item (i)]) then
					action.call ([item (i)])
				end
				i := i + 1
			end
		end

	there_exists_in_bounds (test: FUNCTION [T, BOOLEAN]; start_index, end_index: INTEGER): BOOLEAN
			-- Is `test' true for at least one item?
		require
			test_not_void: test /= Void
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index
			until
				i > nb or Result
			loop
				Result := test.item ([item (i)])
				i := i + 1
			end
		end

	for_all_in_bounds (test: FUNCTION [T, BOOLEAN]; start_index, end_index: INTEGER): BOOLEAN
			-- Is `test' true for all items?
		require
			test_not_void: test /= Void
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index
				Result := True
			until
				i > nb or not Result
			loop
				Result := test.item ([item (i)])
				i := i + 1
			end
		end

	do_all_with_index_in_bounds (action: PROCEDURE [T, INTEGER]; start_index, end_index: INTEGER)
			-- Apply `action' to every item, from first to last.
			-- `action' receives item and its index.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
		local
			i, j, nb: INTEGER
		do
			from
				i := start_index
				j := lower
				nb := end_index
			until
				i > nb
			loop
				action.call ([item (i), j])
				j := j + 1
				i := i + 1
			end
		end

	do_if_with_index_in_bounds (action: PROCEDURE [T, INTEGER]; test: FUNCTION [T, INTEGER, BOOLEAN]; start_index, end_index: INTEGER)
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- `action' and `test' receive the item and its index.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
			test_not_void: test /= Void
		local
			i, j, nb: INTEGER
		do
			from
				i := start_index
				j := lower
				nb := end_index
			until
				i > nb
			loop
				if test.item ([item (i), j]) then
					action.call ([item (i), j])
				end
				j := j + 1
				i := i + 1
			end
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'.
		do
			Result := Precursor
			Result.append_string (", capacity=")
			Result.append_integer (capacity)
		end

feature {NONE} -- Implementation

	element_size: INTEGER
			-- Size of elements
		external
			"built_in"
		ensure
			element_size_non_negative: Result >= 0
		end

	set_count (n: INTEGER)
			-- Set `count' with `n'.
		require
			n_non_negative: n >= 0
			valid_new_count: n <= count
		external
			"built_in"
		ensure
			count_set: count = n
			capacity_preserved: capacity = old capacity
		end

invariant
	count_less_than_capacity: count <= capacity
	consistent_index_boundaries: lower <= upper + 1

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
