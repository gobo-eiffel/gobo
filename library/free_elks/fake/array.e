class ARRAY [G]

inherit

	TO_SPECIAL [G]
		redefine
			copy,
			put, valid_index, item
		end

create

	make

feature

	make (min_index, max_index: INTEGER) is
		do
			lower := min_index
			upper := max_index
			if min_index <= max_index then
				make_area (max_index - min_index + 1)
			else
				make_area (0)
			end
		end

	item alias "[]" (i: INTEGER): G is
		do
			Result := area.item (i - lower)
		end

	put (v: G; i: INTEGER) is
		do
			area.put (v, i - lower)
		end

	force (v: G; i: INTEGER) is
		do
			if not valid_index (i) then
				conservative_resize (lower.min (i), upper.max (i))
			end
			area.put (v, i - lower)
		end

	count: INTEGER is
		do
			Result := upper - lower + 1
		end

	valid_index (i: INTEGER): BOOLEAN is
		do
			Result := i >= lower and i <= upper
		end

	lower: INTEGER

	upper: INTEGER

	copy (other: like Current) is
			-- Reinitialize by copying all the items of `other'.
			-- (This is also used by `clone'.)
		do
			if other /= Current then
				standard_copy (other)
				area := other.area.twin
			end
		end

	subcopy (other: ARRAY [G]; start_pos, end_pos, index_pos: INTEGER) is
		do
			area.copy_data (other.area, start_pos - other.lower, index_pos - lower, end_pos - start_pos + 1)
		end

	conservative_resize (min_index, max_index: INTEGER) is
		local
			old_size, new_size, old_count: INTEGER
			new_lower, new_upper: INTEGER
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
--			elseif new_size > old_size or new_lower < lower then
--				area := area.aliased_resized_area_and_keep (new_size, lower - new_lower, old_count)
			else
				if new_size > old_size then
					area := area.resized_area (new_size)
				end
				if new_lower < lower then
					area.overlapping_move (0, lower - new_lower, old_count)
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

end
