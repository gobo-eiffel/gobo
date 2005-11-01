class STRING

inherit

	HASHABLE
		redefine
			out, copy, is_equal
		end

	COMPARABLE
		undefine
			out, copy, is_equal
		end

	TO_SPECIAL [CHARACTER]
		rename
			item as item
		undefine
			out, copy, is_equal
		redefine
			put, valid_index, infix "@", item
		end

create

	make, make_empty

feature

	out: STRING is
			-- Printable representation
		do
			create Result.make (count)
			Result.append_string (Current)
		end

	make (nb: INTEGER) is
		do
			count := 0
			make_area (nb + 1)
		end

	make_empty is
		do
			make (0)
		end

	hash_code: INTEGER is
		local
			i, nb: INTEGER
			l_area: like area
		do
					-- The magic number `8388593' below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				from
					i := 0
					nb := count
					l_area := area
				until
					i = nb
				loop
					Result := ((Result \\ 8388593).bit_shift_left (8)) + l_area.item (i).code
					i := i + 1
				end
		end

	wipe_out is
		do
			area := empty_area
			count := 0
		end

	item (i: INTEGER): CHARACTER is
		do
			Result := area.item (i - 1)
		end

	item_code (i: INTEGER): INTEGER is
		do
			Result := area.item (i - 1).code
		end

	put (c: CHARACTER; i: INTEGER) is
		do
			area.put (c, i - 1)
		end

	infix "+" (other: STRING): STRING is
		do
			Result := new_string (count + other.count)
			Result.append_string (Current)
			Result.append_string (other)
		end

	new_string (n: INTEGER): like Current is
			-- New instance of current with space for at least `n' characters.
		require
			n_non_negative: n >= 0
		do
			create Result.make (n)
		end

	append_character (c: CHARACTER) is
		local
			current_count: INTEGER
		do
			current_count := count
			if current_count = capacity then
				resize (current_count + additional_space)
			end
			area.put (c, current_count)
			count := current_count + 1
		end

	append_string (s: STRING) is
		local
			l_count, l_s_count, l_new_size: INTEGER
		do
			if s /= Void then
				l_s_count := s.count
				if l_s_count > 0 then
					l_count := count
					l_new_size := l_s_count + l_count
					if l_new_size > capacity then
						resize (l_new_size + additional_space)
					end
					area.copy_data (s.area, 0, l_count, l_s_count)
					count := l_new_size
				end
			end
		end

	additional_space: INTEGER is
			-- Proposed number of additional items
			--| Result is a reasonable value, resulting from a space-time tradeoff.
		do
			Result := (capacity * Growth_percentage // 100).max (Minimal_increase)
		ensure
			At_least_one: Result >= 1
		end

	Growth_percentage: INTEGER is 50
			-- Percentage by which structure will grow automatically

	Minimal_increase: INTEGER is 5
			-- Minimal number of additional items

	capacity: INTEGER is
		do
			Result := area.count - 1
		end

	count: INTEGER

	set_count (nb: INTEGER) is
		do
			count := nb
		end

	to_integer: INTEGER is
		local
			l_c: CHARACTER; 
			l_is_negative: BOOLEAN
			l_area: like area
			i, nb: INTEGER
		do
				-- Skip spaces.
			from
				l_area := area
				nb := count
				i := 0
			until
				l_area.item (i) /= ' '
			loop
				i := i + 1
			end

				-- Read sign mark if any.
			l_c := l_area.item (i)
			i := i + 1
			if l_c = '+' then
				l_c := l_area.item (i)
				i := i + 1
			elseif l_c = '-' then
				l_is_negative := True
				l_c := l_area.item (i)
				i := i + 1
			end
			from
				Result := l_c.code - 48
			until
				i = nb
			loop
				l_c := l_area.item (i)
				if l_c >= '0' and l_c <= '9' then
					Result := 10 * Result + l_c.code - 48
				else
					i := nb - 1 -- Jump out of loop
				end
				i := i + 1
			end
			if l_is_negative then
				Result := -Result
			end
		end

	append_integer (i: INTEGER) is
		local
			l_value: INTEGER
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
			l_area: like area
			p: PLATFORM
		do
			if i = 0 then
				append_character ('0')
			else
				create p
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					if i < 0 then
						append_character ('-')
						l_starting_index := l_starting_index + 1
						l_value := -i
							-- Special case for minimum integer value as negating it
							-- as no effect.
						if l_value = p.Minimum_integer then
							append_character ((-(l_value \\ 10) + 48).to_character)
							l_value := -(l_value // 10)
						end
					else
						l_value := i
					end
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character)
					l_value := l_value // 10
				end

					-- Now put digits in correct order from left to right.
				from
					l_ending_index := count - 1
					l_area := area
				until
					l_starting_index >= l_ending_index
				loop
					l_temp := l_area.item (l_starting_index)
					l_area.put (l_area.item (l_ending_index), l_starting_index)
					l_area.put (l_temp, l_ending_index)
					l_ending_index := l_ending_index - 1
					l_starting_index := l_starting_index + 1
				end
			end
		end

	substring (start_index, end_index: INTEGER): like Current is
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				Result := new_string (end_index - start_index + 1)
				Result.area.copy_data (area, start_index - 1, 0, end_index - start_index + 1)
				Result.set_count (end_index - start_index + 1)
			else
				Result := new_string (0)
			end
		end

	clear_all is
		do
			count := 0
		end

	string: STRING is
		do
			create Result.make (count)
			Result.append_string (Current)
		end

	subcopy (other: like Current; start_pos, end_pos, index_pos: INTEGER) is
		local
			l_other_area, l_area: like area
		do
			l_other_area := other.area
			l_area := area
			if end_pos >= start_pos then
				if l_area /= l_other_area then
					l_area.copy_data (l_other_area, start_pos - 1, index_pos - 1,
						end_pos - start_pos + 1)
				else
					l_area.overlapping_move (start_pos - 1, index_pos - 1,
						end_pos - start_pos + 1)
				end
			end
		end

	resize (newsize: INTEGER) is
		local
			area_count: INTEGER
		do
			area_count := area.count
			if newsize >= area_count then
				if area = empty_area then
					make_area (newsize + 1)
				else
					area := area.resized_area (newsize + 1)
				end
			end
		end

	copy (other: like Current) is
		local
			old_area: like area
		do
			if other /= Current then
				old_area := area
				standard_copy (other)
					-- Note: <= is needed as all Eiffel string should have an
					-- extra character to insert null character at the end.
				if old_area = Void or else old_area.count <= count then
					area := area.twin
				else
					old_area.copy_data (area, 0, 0, count)
					area := old_area
				end
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is string made of same character sequence as `other'
			-- (possibly with a different capacity)?
		local
			l_count: INTEGER
		do
			if other = Current then
				Result := True
			else
				l_count := count
				if l_count = other.count then
					Result := str_strict_cmp (area, other.area, l_count) = 0
				end
			end
		end

	str_strict_cmp (this, other: like area; nb: INTEGER): INTEGER is
			-- Compare `this' and `other' strings 
			-- for the first `nb' characters.
			-- 0 if equal, < 0 if `this' < `other',
			-- > 0 if `this' > `other'
		require
			this_not_void: this /= Void or else nb = 0
			other_not_void: other /= Void
			nb_non_negative: nb >= 0
			nb_valid: (this /= Void implies nb <= this.count) and nb <= other.count
		local
			i, l_current_code, l_other_code: INTEGER
		do
			from
			until
				i = nb
			loop
				l_current_code := this.item (i).code
				l_other_code := other.item (i).code
				if l_current_code /= l_other_code then
					Result := l_current_code - l_other_code
					i := nb - 1 -- Jump out of loop
				end
				i := i + 1
			end
		end

	same_string (other: STRING): BOOLEAN is
		local
			i, nb: INTEGER
			l_area, l_other_area: like area
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				Result := True
				nb := count
				if same_type (other) then
					from
						l_area := area
						l_other_area := other.area
					until
						i = nb
					loop
						if l_area.item (i) /= l_other_area.item (i) then
							Result := False
							i := nb -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				else
					from
						i := 1
						nb := nb + 1
					until
						i = nb
					loop
						if item (i) /= other.item (i) then
							Result := False
							i := nb -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	empty_area: SPECIAL [CHARACTER] is
			-- Empty `area' to avoid useless creation of empty areas when wiping out a STRING.
		once
			create Result.make (1)
		ensure
			empty_area_not_void: Result /= Void
		end

feature -- Not used.

	index_of (c: CHARACTER; p: INTEGER): INTEGER is
		do
print ("TODO STRING")
		end

	has_substring (s: STRING): BOOLEAN is
		do
print ("TODO STRING")
		end

	occurrences (c: CHARACTER): INTEGER is
		do
print ("TODO STRING")
		end

	remove (i: INTEGER) is
		do
print ("TODO STRING")
		end

	infix "@" (i: INTEGER): CHARACTER is
		do
print ("TODO STRING")
		end

	is_empty: BOOLEAN is
		do
print ("TODO STRING")
		end

	empty: BOOLEAN is
		do
print ("TODO STRING")
		end

	left_adjust is
		do
print ("TODO STRING")
		end

	right_adjust is
		do
print ("TODO STRING")
		end

	share (other: STRING) is
		do
print ("TODO STRING")
		end

	mirror: STRING is
		do
print ("TODO STRING")
		end

	make_from_string (s: STRING) is
		do
print ("TODO STRING")
		end

	make_filled (c: CHARACTER; nb: INTEGER) is
		do
print ("TODO STRING")
		end

	has (c: CHARACTER): BOOLEAN is
		do
print ("TODO STRING")
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER) is
		do
print ("TODO STRING")
		end

	to_lower is
		do
print ("TODO STRING")
		end

	to_upper is
		do
print ("TODO STRING")
		end

	insert_character (c: CHARACTER; i: INTEGER) is
		do
print ("TODO STRING")
		end

	insert_string (s: STRING; i: INTEGER) is
		do
print ("TODO STRING")
		end

	head, keep_head (n: INTEGER) is
		do
print ("TODO STRING")
		end

	tail, keep_tail (n: INTEGER) is
		do
print ("TODO STRING")
		end

	remove_head (n: INTEGER) is
		do
print ("TODO STRING")
		end

	remove_tail (n: INTEGER) is
		do
print ("TODO STRING")
		end

	remove_substring (start_index, end_index: INTEGER) is
		do
print ("TODO STRING")
		end

	as_lower: STRING is
		do
print ("TODO STRING")
		end

	as_upper: STRING is
		do
print ("TODO STRING")
		end

	fill_with (c: CHARACTER) is
		do
print ("TODO STRING")
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
		do
print ("TODO STRING")
		end

	valid_index (i: INTEGER): BOOLEAN is
		do
print ("TODO STRING")
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
print ("TODO STRING")
		end

end
