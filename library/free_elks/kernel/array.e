indexing

	description: "[
		Sequences of values, all of the same type or of a conforming one,
		accessible through integer indices in a contiguous interval.
		]"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ARRAY [G] inherit

	RESIZABLE [G]
		redefine
			full, copy, is_equal
		end

	INDEXABLE [G, INTEGER]
		rename
			item as item alias "[]"
		redefine
			copy, is_equal
		end

	TO_SPECIAL [G]
		export
			{ARRAY} set_area
		redefine
			copy, is_equal, item, put, infix "@", valid_index
		end

create
	make,
	make_from_array,
	make_from_cil

convert
	to_cil: {NATIVE_ARRAY [G]},
	to_special: {SPECIAL [G]},
	make_from_cil ({NATIVE_ARRAY [G]})

feature -- Initialization

	make (min_index, max_index: INTEGER) is
			-- Allocate array; set index interval to
			-- `min_index' .. `max_index'; set all values to default.
			-- (Make array empty if `min_index' = `max_index' + 1).
		require
			valid_bounds: min_index <= max_index + 1
		do
			lower := min_index
			upper := max_index
			if min_index <= max_index then
				make_area (max_index - min_index + 1)
			else
				make_area (0)
			end
		ensure
			lower_set: lower = min_index
			upper_set: upper = max_index
			items_set: all_default
		end

	make_from_array (a: ARRAY [G]) is
			-- Initialize from the items of `a'.
			-- (Useful in proper descendants of class `ARRAY',
			-- to initialize an array-like object from a manifest array.)
		require
			array_exists: a /= Void
		do
			area := a.area
			lower := a.lower
			upper := a.upper
		end

	make_from_cil (na: NATIVE_ARRAY [like item]) is
			-- Initialize array from `na'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
			na_not_void: na /= Void
		do
			create area.make_from_native_array (na)
			lower := 1
			upper := area.count
		end

feature -- Access

	item alias "[]", infix "@" (i: INTEGER): G assign put is
			-- Entry at index `i', if in index interval
		do
			Result := area.item (i - lower)
		end

	entry (i: INTEGER): G is
			-- Entry at index `i', if in index interval
		require
			valid_key: valid_index (i)
		do
			Result := item (i)
		end

	has (v: G): BOOLEAN is
			-- Does `v' appear in array?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, nb: INTEGER
			l_area: like area
			l_item: G
		do
			l_area := area
			nb := upper - lower
			if object_comparison and v /= Void then
				from
				until
					i > nb or Result
				loop
					l_item := l_area.item (i)
					Result := l_item /= Void and then l_item.is_equal (v)
					i := i + 1
				end
			else
				from
				until
					i > nb or Result
				loop
					Result := l_area.item (i) = v
					i := i + 1
				end
			end
		end

feature -- Measurement

	lower: INTEGER
			-- Minimum index

	upper: INTEGER
			-- Maximum index

	count, capacity: INTEGER is
			-- Number of available indices
		do
			Result := upper - lower + 1
		ensure then
			consistent_with_bounds: Result = upper - lower + 1
		end

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in structure
		local
			i: INTEGER
			x: G
		do
			if object_comparison and then v /= Void then
				from
					i := lower
				until
					i > upper
				loop
					x := item (i)
					if x /= Void and then v.is_equal (x) then
						Result := Result + 1
					end
					i := i + 1
				end
			else
				from
					i := lower
				until
					i > upper
				loop
					if item (i) = v then
						Result := Result + 1
					end
					i := i + 1
				end
			end
		end

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		do
			create Result.make (lower, upper)
		ensure then
			same_count: Result.count = count
			same_bounds:
				((Result.lower = lower) and (Result.upper = upper))
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is array made of the same items as `other'?
		local
			i: INTEGER
		do
			if other = Current then
				Result := True
			elseif lower = other.lower and then upper = other.upper and then
				object_comparison = other.object_comparison
			then
				if object_comparison then
					from
						Result := True
						i := lower
					until
						not Result or i > upper
					loop
						Result := equal (item (i), other.item (i))
						i := i + 1
					end
				else
					Result := area.same_items (other.area, 0, upper - lower)
				end
			end
		end

feature -- Status report

	all_default: BOOLEAN is
			-- Are all items set to default values?
		do
			Result := area.all_default (0, upper - lower)
		ensure
			definition: Result = (count = 0 or else
				((not {i: like item} item (upper) or else i = i.default) and
				subarray (lower, upper - 1).all_default))
		end

	full: BOOLEAN is
			-- Is structure filled to capacity? (Answer: yes)
		do
			Result := True
		end

	same_items (other: like Current): BOOLEAN is
			-- Do `other' and Current have same items?
		require
			other_not_void: other /= Void
		do
			if count = other.count then
				Result := area.same_items (other.area, 0, upper - lower)
			end
		ensure
			definition: Result = ((count = other.count) and then
				(count = 0 or else (item (upper) = other.item (other.upper)
				and subarray (lower, upper - 1).same_items
				(other.subarray (other.lower, other.upper - 1)))))
		end

	all_cleared: BOOLEAN is
			-- Are all items set to default values?
		obsolete
			"Use `all_default' instead"
		do
			Result := all_default
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of the array?
		do
			Result := (lower <= i) and then (i <= upper)
		end

	extendible: BOOLEAN is
			-- May items be added?
			-- (Answer: no, although array may be resized.)
		do
			Result := False
		end

	prunable: BOOLEAN is
			-- May items be removed? (Answer: no.)
		do
			Result := False
		end

	valid_index_set: BOOLEAN is
		do
			Result := index_set.count = count
		end

feature -- Element change

	put (v: like item; i: INTEGER) is
			-- Replace `i'-th entry, if in index interval, by `v'.
		do
			area.put (v, i - lower)
		end

	enter (v: like item; i: INTEGER) is
			-- Replace `i'-th entry, if in index interval, by `v'.
		require
			valid_key: valid_index (i)
		do
			area.put (v, i - lower)
		end

	force (v: like item; i: INTEGER) is
			-- Assign item `v' to `i'-th entry.
			-- Always applicable: resize the array if `i' falls out of
			-- currently defined bounds; preserve existing items.
		do
			if i < lower then
				auto_resize (i, upper)
			elseif i > upper then
				auto_resize (lower, i)
			end
			put (v, i)
		ensure
			inserted: item (i) = v
			higher_count: count >= old count
		end

	subcopy (other: ARRAY [like item]; start_pos, end_pos, index_pos: INTEGER) is
			-- Copy items of `other' within bounds `start_pos' and `end_pos'
			-- to current array starting at index `index_pos'.
		require
			other_not_void: other /= Void
			valid_start_pos: other.valid_index (start_pos)
			valid_end_pos: other.valid_index (end_pos)
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
			valid_index_pos: valid_index (index_pos)
			enough_space: (upper - index_pos) >= (end_pos - start_pos)
		do
			area.copy_data (other.area, start_pos - other.lower, index_pos - lower, end_pos - start_pos + 1)
		ensure
			-- copied: forall `i' in 0 .. (`end_pos'-`start_pos'),
			--     item (index_pos + i) = other.item (start_pos + i)
		end

feature -- Iteration

	do_all (action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `action' to every item, from first to last.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
		local
			t: TUPLE [G]
			i, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				nb := capacity - 1
				l_area := area
			until
				i > nb
			loop
				t.put (l_area.item (i), 1)
				action.call (t)
				i := i + 1
			end
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
			test_not_void: test /= Void
		local
			t: TUPLE [G]
			i, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				nb := capacity - 1
				l_area := area
			until
				i > nb
			loop
				t.put (l_area.item (i), 1)
				if test.item (t) then
					action.call (t)
				end
				i := i + 1
			end
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for at least one item?
		require
			test_not_void: test /= Void
		local
			t: TUPLE [G]
			i, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				nb := capacity - 1
				l_area := area
			until
				i > nb or Result
			loop
				t.put (l_area.item (i), 1)
				Result := test.item (t)
				i := i + 1
			end
		end

	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for all items?
		require
			test_not_void: test /= Void
		local
			t: TUPLE [G]
			i, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				nb := capacity - 1
				l_area := area
				Result := True
			until
				i > nb or not Result
			loop
				t.put (l_area.item (i), 1)
				Result := test.item (t)
				i := i + 1
			end
		end

	do_all_with_index (action: PROCEDURE [ANY, TUPLE [G, INTEGER]]) is
			-- Apply `action' to every item, from first to last.
			-- `action' receives item and its index.
			-- Semantics not guaranteed if `action' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
		local
			t: TUPLE [G, INTEGER]
			i, j, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				j := lower
				nb := capacity - 1
				l_area := area
			until
				i > nb
			loop
				t.put (l_area.item (i), 1)
				t.put (j, 2)
				action.call (t)
				j := j + 1
				i := i + 1
			end
		end

	do_if_with_index (action: PROCEDURE [ANY, TUPLE [G, INTEGER]]; test: FUNCTION [ANY, TUPLE [G, INTEGER], BOOLEAN]) is
			-- Apply `action' to every item that satisfies `test', from first to last.
			-- `action' and `test' receive the item and its index.
			-- Semantics not guaranteed if `action' or `test' changes the structure;
			-- in such a case, apply iterator to clone of structure instead.
		require
			action_not_void: action /= Void
			test_not_void: test /= Void
		local
			t: TUPLE [G, INTEGER]
			i, j, nb: INTEGER
			l_area: like area
		do
			from
				create t
				i := 0
				j := lower
				nb := capacity - 1
				l_area := area
			until
				i > nb
			loop
				t.put (l_area.item (i), 1)
				t.put (j, 2)
				if test.item (t) then
					action.call (t)
				end
				j := j + 1
				i := i + 1
			end
		end

feature -- Removal

	wipe_out is
			-- Make array empty.
		obsolete
			"Not applicable since not `prunable'. Use `discard_items' instead."
		do
			discard_items
		end

	discard_items is
			-- Reset all items to default values with reallocation.
		do
			make_area (capacity)
		ensure
			default_items: all_default
		end

	clear_all is
			-- Reset all items to default values.
		do
			area.clear_all
		ensure
			stable_lower: lower = old lower
			stable_upper: upper = old upper
			default_items: all_default
		end

feature -- Resizing

	grow (i: INTEGER) is
			-- Change the capacity to at least `i'.
		do
			if i > capacity then
				conservative_resize (lower, upper + i - capacity)
			end
		end

	conservative_resize (min_index, max_index: INTEGER) is
			-- Rearrange array so that it can accommodate
			-- indices down to `min_index' and up to `max_index'.
			-- Do not lose any previously entered item.
		require
			good_indices: min_index <= max_index
		local
			old_size, new_size, old_count: INTEGER
			new_lower, new_upper: INTEGER
			offset: INTEGER
			v: like item
		do
			if empty_area then
				new_lower := min_index
				new_upper := max_index
			else
				new_lower := min_index.min (lower)
				new_upper := max_index.max (upper)
			end
			new_size := new_upper - new_lower + 1
			if not empty_area then
				old_size := area.count
				old_count := upper - lower + 1
			end
			if empty_area then
				make_area (new_size)
			else
				if new_size > old_size then
					area := area.aliased_resized_area (new_size)
				end
				if new_lower < lower then
					offset := lower - new_lower
					area.move_data (0, offset, old_count)
					area.fill_with (v, 0, offset - 1)
				end
			end
			lower := new_lower
			upper := new_upper
		ensure
			no_low_lost: lower = min_index or else lower = old lower
			no_high_lost: upper = max_index or else upper = old upper
		end

	resize (min_index, max_index: INTEGER) is
			-- Rearrange array so that it can accommodate
			-- indices down to `min_index' and up to `max_index'.
			-- Do not lose any previously entered item.
		obsolete
			"Use `conservative_resize' instead as future versions will implement `resize' as specified in ELKS."
		require
			good_indices: min_index <= max_index
		do
			conservative_resize (min_index, max_index)
		ensure
			no_low_lost: lower = min_index or else lower = old lower
			no_high_lost: upper = max_index or else upper = old upper
		end

feature -- Conversion

	to_c: ANY is
			-- Address of actual sequence of values,
			-- for passing to external (non-Eiffel) routines.
		require
			not_is_dotnet: not {PLATFORM}.is_dotnet
		do
			Result := area
		end

	to_cil: NATIVE_ARRAY [G] is
			-- Address of actual sequence of values,
			-- for passing to external (non-Eiffel) routines.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		do
			Result := area.native_array
		ensure
			to_cil_not_void: Result /= Void
		end

	to_special: SPECIAL [G] is
			-- 'area'.
		do
			Result := area
		ensure
			to_special_not_void: Result /= Void
		end

	linear_representation: LINEAR [G] is
			-- Representation as a linear structure
		local
			temp: ARRAYED_LIST [G]
			i: INTEGER
		do
			create temp.make (capacity)
			from
				i := lower
			until
				i > upper
			loop
				temp.extend (item (i))
				i := i + 1
			end
			Result := temp
		end

feature -- Duplication

	copy (other: like Current) is
			-- Reinitialize by copying all the items of `other'.
			-- (This is also used by `clone'.)
		do
			if other /= Current then
				standard_copy (other)
				set_area (other.area.twin)
			end
		ensure then
			equal_areas: area.is_equal (other.area)
		end

	subarray (start_pos, end_pos: INTEGER): ARRAY [G] is
			-- Array made of items of current array within
			-- bounds `start_pos' and `end_pos'.
		require
			valid_start_pos: valid_index (start_pos)
			valid_end_pos: end_pos <= upper
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
		do
			create Result.make (start_pos, end_pos)
			if start_pos <= end_pos then
					-- Only copy elements if needed.
				Result.subcopy (Current, start_pos, end_pos, start_pos)
			end
		ensure
			lower: Result.lower = start_pos
			upper: Result.upper = end_pos
			-- copied: forall `i' in `start_pos' .. `end_pos',
			--     Result.item (i) = item (i)
		end

feature {NONE} -- Inapplicable

	prune (v: G) is
			-- Remove first occurrence of `v' if any.
			-- (Precondition is False.)
		do
		end

	extend (v: G) is
			-- Add `v' to structure.
			-- (Precondition is False.)
		do
		end

feature {NONE} -- Implementation

	auto_resize (min_index, max_index: INTEGER) is
			-- Rearrange array so that it can accommodate
			-- indices down to `min_index' and up to `max_index'.
			-- Do not lose any previously entered item.
			-- If area must be extended, ensure that space for at least
			-- additional_space item is added.
		require
			valid_indices: min_index <= max_index
		local
			old_size, new_size: INTEGER
			new_lower, new_upper: INTEGER
			offset: INTEGER
			v: like item
		do
			if empty_area then
				new_lower := min_index
				new_upper := max_index
			else
				new_lower := min_index.min (lower)
				new_upper := max_index.max (upper)
			end
			new_size := new_upper - new_lower + 1
			if not empty_area then
				old_size := area.count
				if new_size > old_size
					 and new_size - old_size < additional_space
				then
					new_size := old_size + additional_space
				end
			end
			if empty_area then
				make_area (new_size)
			else
				if new_size > old_size then
					area := area.aliased_resized_area (new_size)
				end
				if new_lower < lower then
					offset := lower - new_lower
					area.move_data (0, offset, capacity)
					area.fill_with (v, 0, offset - 1)
				end
			end
			lower := new_lower
			upper := new_upper
		end

	empty_area: BOOLEAN is
			-- Is `area' empty?
		do
			Result := area = Void or else area.count = 0
		end

invariant

	area_exists: area /= Void
	consistent_size: capacity = upper - lower + 1
	non_negative_count: count >= 0
	index_set_has_same_count: valid_index_set
-- Internal discussion haven't reached an agreement on this invariant
--	index_set_has_same_bounds: ((index_set.lower = lower) and
--				(index_set.upper = lower + count - 1))

end
