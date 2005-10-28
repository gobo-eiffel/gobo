class SPECIAL [G]

create

	make

feature

	make (nb: INTEGER) is
		external
			"built_in"
		end

	item (i: INTEGER): G is
		external
			"built_in"
		end

	put (v: G; i: INTEGER) is
		external
			"built_in"
		end

	count: INTEGER is
		external
			"built_in"
		end

	frozen base_address: POINTER is
			-- Address of element at position `0'.
		do
			Result := $Current
		end

	clear_all is
		local
			i: INTEGER
			v: G
		do
			from
				i := count - 1
			until
				i < 0
			loop
				put (v, i)
				i := i - 1
			end
		end

	resized_area (nb: INTEGER): like Current is
		local
			i: INTEGER
		do
			create Result.make (nb)
			from
				i := count - 1
			until
				i < 0
			loop
				Result.put (item (i), i)
				i := i - 1
			end
		end

	frozen copy_data (other: like Current; source_index, destination_index, n: INTEGER) is
			-- Copy `n' elements of `other' from `source_start' position to Current at
			-- `destination_index'. Other elements of Current remain unchanged.
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
		end

	frozen move_data (source_index, destination_index, n: INTEGER) is
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
		end

	frozen overlapping_move (source_index, destination_index, n: INTEGER) is
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
		end

	frozen non_overlapping_move (source_index, destination_index, n: INTEGER) is
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
		end

end
