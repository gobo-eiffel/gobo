indexing
	description: "[
		Special objects: homogeneous sequences of values,
		used to represent arrays and strings
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen class
	SPECIAL [T]

inherit
	ABSTRACT_SPECIAL

create
	make,
	make_from_native_array

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Create a special object for `n' entries.
		require
			non_negative_argument: n >= 0
		external
			"built_in"
		ensure
			area_allocated: count = n
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
		require
			index_big_enough: i >= 0
			index_small_enough: i < count
		external
			"built_in"
		end

	infix "@" (i: INTEGER): T
			-- Item at `i'-th position
			-- (indices begin at 0)
		require
			index_big_enough: i >= 0
			index_small_enough: i < count
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
				Result >= nb or else equal (item (Result), v)
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
			-- Address of element at position `i'
		require
			not_dotnet: not {PLATFORM}.is_dotnet
			index_big_enough: i >= 0
			index_small_enough: i < count
		do
			Result := base_address + i * element_size
		ensure
			element_address_not_null: Result /= default_pointer
		end

	base_address: POINTER
			-- Address of element at position `0'
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

feature -- Measurement

	lower: INTEGER = 0
			-- Minimum index of Current

	upper: INTEGER
			-- Maximum index of Current
		do
			Result := count - 1
		ensure
			definition: lower <= Result + 1
		end

	count: INTEGER
			-- Count of special area
		external
			"built_in"
		end

	capacity: INTEGER
			-- Count of special area
		do
			Result := count
		ensure
			capacity_non_negative: Result >= 0
		end

feature -- Status report

	is_default (i: INTEGER): BOOLEAN
			-- Is item at index `i' set to a default value (or not set at all for attached reference types)?
		require
			index_big_enough: i >= 0
			index_small_enough: i < count
		local
			default_value: ?T
		do
			Result := item (i) = default_value
		end

	all_default (start_index, end_index: INTEGER): BOOLEAN
			-- Are all items between index `start_index' and `end_index'
			-- set to default values?
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
				Result := is_default (i)
				i := i + 1
			end
		ensure
			valid_on_empty_area: (end_index < start_index) implies Result
		end

	same_items (other: like Current; other_index, current_index, n: INTEGER): BOOLEAN
			-- Are the `n' elements of `other' from `other_index' position the same as
			-- the `n' elements of `Current' from `current_index'?
			-- (Use reference equality for comparison.)
		require
			other_not_void: other /= Void
			other_index_non_negative: other_index >= 0
			current_index_non_negative: current_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_other: other_index + n <= other.count
			n_is_small_enough_for_current: current_index + n <= count
		local
			i, j, nb: INTEGER
		do
			Result := True
			if other /= Current then
				from
					i := other_index
					j := current_index
					nb := other_index + n
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
		ensure
			definition: Result = ((0 <= i) and (i < count))
		end

feature -- Element change

	put (v: T; i: INTEGER)
			-- Replace `i'-th item by `v'.
			-- (Indices begin at 0.)
		require
			index_big_enough: i >= 0
			index_small_enough: i < count
		external
			"built_in"
		ensure
			inserted: item (i) = v
		end

	fill_with (v: T; start_index, end_index: INTEGER)
			-- Set items between `start_index' and `end_index' with `v'.
		require
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < count
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index + 1
			until
				i = nb
			loop
				put (v, i)
				i := i + 1
			end
		ensure
			filled: -- For every `i' in `start_index' .. `end_index', `item' (`i') = `v'
		end

	copy_data (other: SPECIAL [T]; source_index, destination_index, n: INTEGER)
			-- Copy `n' elements of `other' from `source_index' position to Current at
			-- `destination_index'. Other elements of Current remain unchanged.
		require
			other_not_void: other /= Void
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= other.count
			n_is_small_enough_for_destination: destination_index + n <= count
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
					put (other.item (i), j)
					i := i + 1
					j := j + 1
				end
			end
		ensure
			copied:	same_items (other, source_index, destination_index, n)
		end

	move_data (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			n_non_negative: n >= 0
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= count
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
		end

	overlapping_move (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			n_non_negative: n >= 0
			different_source_and_target: source_index /= destination_index
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= count
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
					put (item (i), i - l_offset)
					i := i + 1
				end
			end
		ensure
			moved: same_items (old twin, source_index, destination_index, n)
		end

	non_overlapping_move (source_index, destination_index, n: INTEGER)
			-- Move `n' elements of Current from `source_start' position to `destination_index'.
			-- Other elements remain unchanged.
		require
			source_index_non_negative: source_index >= 0
			destination_index_non_negative: destination_index >= 0
			n_non_negative: n >= 0
			different_source_and_target: source_index /= destination_index
			non_overlapping:
				(source_index < destination_index implies source_index + n < destination_index) or
				(source_index > destination_index implies destination_index + n < source_index)
			n_is_small_enough_for_source: source_index + n <= count
			n_is_small_enough_for_destination: destination_index + n <= count
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
				put (item (i), i + l_offset)
				i := i + 1
			end
		ensure
			moved: same_items (Current, source_index, destination_index, n)
		end

feature -- Resizing

	resized_area (n: INTEGER): like Current
			-- Create a copy of Current with a count of `n'
		require
			n_non_negative: n >= 0
		do
			create Result.make (n)
			Result.copy_data (Current, 0, 0, n.min (count))
		ensure
			Result_not_void: Result /= Void
			Result_different_from_current: Result /= Current
			new_count: Result.count = n
			preserved: Result.same_items (Current, 0, 0, n.min (old count))
		end

	aliased_resized_area (n: INTEGER): like Current
			-- Try to resize `Current' with a count of `n', if not
			-- possible a new copy
		require
			valid_new_count: n > count
		external
			"built_in"
		ensure
			Result_not_void: Result /= Void
			new_count: Result.count = n
			preserved: Result.same_items (old twin, 0, 0, old count)
		end

feature -- Removal

	clear_all
			-- Reset all items to default values.
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				put_default (i)
				i := i - 1
			end
		ensure
			cleared: all_default (0, upper)
		end

	put_default (i: INTEGER)
			-- Clear item at index `i', so that no references are kept to the object at this index.
		require
			index_big_enough: i >= 0
			index_small_enough: i < count
		local
			default_value: ?T
		do
			put (default_value, i)
		ensure
			is_default: is_default (i)
		end

	fill_with_default (start_index, end_index: INTEGER)
			-- Clear items between `start_index' and `end_index'.
		require
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < count
		local
			i, nb: INTEGER
		do
			from
				i := start_index
				nb := end_index + 1
			until
				i = nb
			loop
				put_default (i)
				i := i + 1
			end
		ensure
			filled: -- For every `i' in `start_index' .. `end_index', `is_default' (`i')
		end

feature {NONE} -- Implementation

	element_size: INTEGER
			-- Size of elements
		external
			"built_in"
		ensure
			element_size_non_negative: Result >= 0
		end

end
