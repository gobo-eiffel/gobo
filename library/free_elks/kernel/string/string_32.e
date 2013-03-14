note
	description: "[
		Sequences of 32-bit characters, accessible through integer indices
		in a contiguous range.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-30 21:23:58 +0100 (Wed, 30 Jan 2013) $"
	revision: "$Revision: 733 $"

class
	STRING_32

inherit
	READABLE_STRING_32
		export
			{ANY} make, make_empty, make_filled, make_from_c, make_from_string, fill_character
		redefine
			area
		end

	STRING_GENERAL
		rename
			append as append_string_general,
			append_substring as append_substring_general,
			prepend as prepend_string_general,
			prepend_substring as prepend_substring_general,
			same_string as same_string_general,
			starts_with as starts_with_general,
			ends_with as ends_with_general,
			is_case_insensitive_equal as is_case_insensitive_equal_general
		undefine
			copy, is_equal, out, has, index_of, last_index_of, occurrences
		redefine
			append_string_general,
			prepend_string_general
		end

	INDEXABLE [CHARACTER_32, INTEGER]
		undefine
			copy, is_equal, out
		redefine
			prune_all,
			changeable_comparison_criterion
		end

	RESIZABLE [CHARACTER_32]
		undefine
			copy, is_equal, out
		redefine
			changeable_comparison_criterion
		end

	TO_SPECIAL [CHARACTER_32]
		undefine
			copy, is_equal, out, item, at, put, valid_index
		redefine
			area
		end

	MISMATCH_CORRECTOR
		undefine
			copy, is_equal, out
		redefine
			correct_mismatch
		end

create
	make,
	make_empty,
	make_filled,
	make_from_string,
	make_from_string_general,
	make_from_c,
	make_from_c_pointer,
	make_from_cil,
	make_from_separate

convert
	to_cil: {SYSTEM_STRING},
	make_from_cil ({SYSTEM_STRING}),
	as_string_8: {READABLE_STRING_8, STRING_8}

feature -- Initialization

	make_from_string_general (s: READABLE_STRING_GENERAL)
			-- Initialize from the characters of `s'.
		do
			if attached {READABLE_STRING_32} s as s32 then
				make_from_string (s32)
			else
				make (s.count)
				append_string_general (s)
			end
		end

	make_from_cil (a_system_string: detachable SYSTEM_STRING)
			-- Initialize Current with `a_system_string'.
		local
			l_count: INTEGER
		do
			if a_system_string /= Void then
				l_count := a_system_string.length + dotnet_convertor.escape_count (a_system_string)
			end
			make (l_count)
			if l_count > 0 and then a_system_string /= Void then
				set_count (l_count)
				dotnet_convertor.read_system_string_into (a_system_string, Current)
			end
		end

	from_c (c_string: POINTER)
			-- Reset contents of string from contents of `c_string',
			-- a string created by some C function.
		require
			c_string_exists: c_string /= default_pointer
		local
			l_count: INTEGER
		do
			c_string_provider.set_shared_from_pointer (c_string)
				-- Resize string in case it is not big enough
			l_count := c_string_provider.count
			grow (l_count + 1)
			count := l_count
			internal_hash_code := 0
			c_string_provider.read_string_into (Current)
		ensure
			no_zero_byte: not has ('%/0/')
			-- characters: for all i in 1..count, item (i) equals
			--			 ASCII character at address c_string + (i - 1)
			-- correct_count: the ASCII character at address c_string + count
			--			 is NULL
		end

	from_c_substring (c_string: POINTER; start_pos, end_pos: INTEGER)
			-- Reset contents of string from substring of `c_string',
			-- a string created by some C function.
		require
			c_string_exists: c_string /= default_pointer
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
		local
			l_count: INTEGER
		do
			l_count := end_pos - start_pos + 1
			c_string_provider.set_shared_from_pointer_and_count (c_string + (start_pos - 1), l_count)
				-- Resize string in case it is not big enough
			grow (l_count + 1)
			count := l_count
			internal_hash_code := 0
			c_string_provider.read_substring_into (Current, 1, l_count)
		ensure
			valid_count: count = end_pos - start_pos + 1
			-- characters: for all i in 1..count, item (i) equals
			--			 ASCII character at address c_string + (i - 1)
		end

	adapt (s: STRING_32): like Current
			-- Object of a type conforming to the type of `s',
			-- initialized with attributes from `s'
		do
			Result := new_string (0)
			Result.share (s)
		ensure
			adapt_not_void: Result /= Void
			shared_implementation: Result.shared_with (s)
		end

	remake (n: INTEGER)
			-- Allocate space for at least `n' characters.
		obsolete
			"Use `make' instead"
		require
			non_negative_size: n >= 0
		do
			make (n)
		ensure
			empty_string: count = 0
			area_allocated: capacity >= n
		end

feature -- Access

	item alias "[]", at alias "@" (i: INTEGER): CHARACTER_32 assign put
			-- Character at position `i'
		do
			Result := area.item (i - 1)
		end

	code (i: INTEGER): NATURAL_32
			-- Character at position `i'
		do
			Result := area.item (i - 1).code.to_natural_32
		end

	item_code (i: INTEGER): INTEGER
			-- Character at position `i'
		obsolete
			"Due to potential truncation it is recommended to use `code (i)' instead."
		do
			Result := area.item (i - 1).natural_32_code.as_integer_32
		end

	area: SPECIAL [CHARACTER_32]
			-- Storage for characters

feature -- Status report

	extendible: BOOLEAN = True
			-- May new items be added? (Answer: yes.)

	prunable: BOOLEAN
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

	changeable_comparison_criterion: BOOLEAN = False

feature -- Element change

	set (t: READABLE_STRING_32; n1, n2: INTEGER)
			-- Set current string to substring of `t' from indices `n1'
			-- to `n2', or to empty string if no such substring.
		require
			argument_not_void: t /= Void
		local
			s: READABLE_STRING_32
		do
			s := t.substring (n1, n2)
			area := s.area
			count := s.count
			internal_hash_code := 0
		ensure
			is_substring: same_string (t.substring (n1, n2))
		end

	subcopy (other: READABLE_STRING_32; start_pos, end_pos, index_pos: INTEGER)
			-- Copy characters of `other' within bounds `start_pos' and
			-- `end_pos' to current string starting at index `index_pos'.
		require
			other_not_void: other /= Void
			valid_start_pos: other.valid_index (start_pos)
			valid_end_pos: other.valid_index (end_pos)
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
			valid_index_pos: valid_index (index_pos)
			enough_space: (count - index_pos) >= (end_pos - start_pos)
		local
			l_other_area, l_area: like area
		do
			if end_pos >= start_pos then
				l_other_area := other.area
				l_area := area
				if l_area /= l_other_area then
					l_area.copy_data (l_other_area, start_pos - 1, index_pos - 1,
						end_pos - start_pos + 1)
				else
					l_area.overlapping_move (start_pos - 1, index_pos - 1,
						end_pos - start_pos + 1)
				end
				internal_hash_code := 0
			end
		ensure
			same_count: count = old count
			copied: elks_checking implies
				(Current ~ (old substring (1, index_pos - 1) +
				old other.substring (start_pos, end_pos) +
				old substring (index_pos + (end_pos - start_pos + 1), count)))
		end

	replace_substring (s: READABLE_STRING_32; start_index, end_index: INTEGER)
			-- Replace characters from `start_index' to `end_index' with `s'.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningfull_interval: start_index <= end_index + 1
		local
			new_size: INTEGER
			diff: INTEGER
			l_area: like area
			s_count: INTEGER
			old_count: INTEGER
		do
			s_count := s.count
			old_count := count
			diff := s_count - (end_index - start_index + 1)
			new_size := diff + old_count
			if diff > 0 then
					-- We need to resize the string.
				grow (new_size)
			end

			l_area := area
				--| We move the end of the string forward (if diff is > 0), backward (if diff < 0),
				--| and nothing otherwise.
			if diff /= 0 then
				l_area.overlapping_move (end_index, end_index + diff, old_count - end_index)
			end
				--| Set new count
			set_count (new_size)
				--| We copy the substring.
			l_area.copy_data (s.area, s.area_lower, start_index - 1, s_count)
		ensure
			new_count: count = old count + old s.count - end_index + start_index - 1
			replaced: elks_checking implies
				(Current ~ (old (substring (1, start_index - 1) +
					s + substring (end_index + 1, count))))
		end

	replace_substring_all (original, new: READABLE_STRING_32)
			-- Replace every occurrence of `original' with `new'.
		require
			original_exists: original /= Void
			new_exists: new /= Void
			original_not_empty: not original.is_empty
		local
			l_first_pos, l_next_pos: INTEGER
			l_orig_count, l_new_count, l_new_lower, l_count, i, l_index_count: INTEGER
			l_src_index, l_dest_index, l_prev_index, l_copy_delta: INTEGER
			l_area, l_new_area: like area
			l_offset: INTEGER
			l_string_searcher: like string_searcher
			l_index_list: SPECIAL [INTEGER]
		do
			if not is_empty then
				l_count := count
				l_string_searcher := string_searcher
				l_string_searcher.initialize_deltas (original)
				l_orig_count := original.count
				l_new_count := new.count
				if l_orig_count >= l_new_count then
					l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, 1, l_count)
					if l_first_pos > 0 then
						if l_orig_count = l_new_count then
								-- String will not be resized, simply perform character substitution
							from
								l_area := area
								l_new_area := new.area
								l_new_lower := new.area_lower
							until
								l_first_pos = 0
							loop
								l_area.copy_data (l_new_area, l_new_lower, l_first_pos - 1, l_new_count)
								if l_first_pos + l_new_count <= l_count then
									l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_new_count, l_count)
								else
									l_first_pos := 0
							end
						end
					elseif l_orig_count > l_new_count then
							-- New string is smaller than previous string, we can optimize
							-- substitution by only moving block between two occurrences of `orginal'.
						from
							l_next_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_orig_count, l_count)
							l_area := area
							l_new_area := new.area
							l_new_lower := new.area_lower
						until
							l_next_pos = 0
						loop
								-- Copy new string into Current
							l_area.copy_data (l_new_area, l_new_lower, l_first_pos - 1 - l_offset, l_new_count)
								-- Shift characters between `l_first_pos' and `l_next_pos'
							l_area.overlapping_move (l_first_pos + l_orig_count - 1,
								l_first_pos + l_new_count - 1 - l_offset, l_next_pos - l_first_pos - l_orig_count)
							l_first_pos := l_next_pos
							l_offset := l_offset + (l_orig_count - l_new_count)
							if l_first_pos + l_new_count <= l_count then
								l_next_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_orig_count, l_count)
							else
								l_next_pos := 0
							end
						end
							-- Perform final substitution:
							-- Copy new string into Current
						l_area.copy_data (l_new_area, l_new_lower, l_first_pos - 1 - l_offset, l_new_count)
							-- Shift characters between `l_first_pos' and the end of the string
						l_area.overlapping_move (l_first_pos + l_orig_count - 1,
							l_first_pos + l_new_count - 1 - l_offset, l_count + 1 - l_first_pos - l_orig_count)
								-- Perform last substitution
						l_offset := l_offset + (l_orig_count - l_new_count)

							-- Update `count'
						set_count (l_count - l_offset)
						end
							-- String was modified we need to recompute the `hash_code'.
						internal_hash_code := 0
					end
				elseif attached l_string_searcher.substring_index_list_with_deltas (Current, original, 1, l_count) as l_list then
						-- Get the number of substitution to be performed by getting a list
						-- of location where `original' appears.
					l_index_list := l_list.area
					l_index_count := l_index_list.count
						-- Store the index of the last character up to which we need to move
						-- characters in the reallocated string.
					l_prev_index := l_count
						-- Resize Current with the appropriate number of characters
					l_copy_delta := l_new_count - l_orig_count
					l_count := l_count + (l_index_count * l_copy_delta)
					l_area := area.resized_area_with_default ('%U', l_count + 1)
					area := l_area
						-- Perform the substitution starting from the end.
					from
						i := l_index_count
						l_new_lower := new.area_lower
						l_new_area := new.area
					until
						i = 0
					loop
						i := i - 1
						l_src_index := l_index_list.item (i)
						l_dest_index := l_src_index + (i) * l_copy_delta
							-- Shift non-matching characters to the right of the newly replaced string.
						l_area.overlapping_move (l_src_index + l_orig_count - 1, l_dest_index + l_new_count - 1, l_prev_index - l_src_index - l_orig_count + 1)
							-- Store new end of string where characters will be moved.
						l_prev_index := l_src_index - 1

							-- Copy `new' to its appropriate position
						l_area.copy_data (l_new_area, l_new_lower, l_dest_index - 1, l_new_count)
					end
						-- Update the new `count' which also resets the `hash_code'.
					set_count (l_count)
				end
			end
		end

	replace_blank
			-- Replace all current characters with blanks.
		do
			fill_with (' ')
		ensure
			same_size: (count = old count) and (capacity = old capacity)
			all_blank: elks_checking implies occurrences (' ') = count
		end

	fill_blank
			-- Fill with `capacity' blank characters.
		do
			fill_character (' ')
		ensure
			filled: full
			same_size: (count = capacity) and (capacity = old capacity)
			-- all_blank: For every `i' in `count'..`capacity', `item' (`i') = `Blank'
		end

	fill_with (c: CHARACTER_32)
			-- Replace every character with `c'.
		local
			l_count: INTEGER
		do
			l_count := count
			if l_count /= 0 then
				area.fill_with (c, 0, l_count - 1)
				internal_hash_code := 0
			end
		ensure
			same_count: (count = old count) and (capacity = old capacity)
			filled: elks_checking implies occurrences (c) = count
		end

	replace_character (c: CHARACTER_32)
			-- Replace every character with `c'.
		obsolete
			"ELKS 2001: use `fill_with' instead'"
		do
			fill_with (c)
		ensure
			same_count: (count = old count) and (capacity = old capacity)
			filled: elks_checking implies occurrences (c) = count
		end

	keep_head (n: INTEGER)
			-- Remove all characters except for the first `n';
			-- do nothing if `n' >= `count'.
		do
			if n < count then
				count := n
				internal_hash_code := 0
			end
		end

	keep_tail (n: INTEGER)
			-- Remove all characters except for the last `n';
			-- do nothing if `n' >= `count'.
		local
			nb: like count
		do
			nb := count
			if n < nb then
				area.overlapping_move (nb - n, 0, n)
				count := n
				internal_hash_code := 0
			end
		end

	left_adjust
			-- Remove leading whitespace.
		local
			nb, nb_space: INTEGER
			l_area: like area
			l_prop: like character_properties
		do
			l_prop := character_properties

				-- Compute number of spaces at the left of current string.
			from
				nb := count - 1
				l_area := area
			until
				nb_space > nb or else not l_prop.is_space (l_area.item (nb_space))
			loop
				nb_space := nb_space + 1
			end

			if nb_space > 0 then
					-- Set new count value.
				nb := nb + 1 - nb_space
					-- Shift characters to the left.
				l_area.overlapping_move (nb_space, 0, nb)
					-- Set new count.
				count := nb
				internal_hash_code := 0
			end
		end

	right_adjust
			-- Remove trailing whitespace.
		local
			i, nb: INTEGER
			nb_space: INTEGER
			l_area: like area
			c: CHARACTER_32
			l_prop: like character_properties
		do
			l_prop := character_properties
				-- Compute number of spaces at the right of current string.
			from
				nb := count - 1
				i := nb
				l_area := area
			until
				i < 0
			loop
				c := l_area.item (i)
				if not l_prop.is_space (c) then
						-- We are done.
					i := -1
				else
					nb_space := nb_space + 1
					i := i - 1
				end
			end

			if nb_space > 0 then
					-- Set new count.
				count := nb + 1 - nb_space
				internal_hash_code := 0
			end
		end

	share (other: STRING_32)
			-- Make current string share the text of `other'.
			-- Subsequent changes to the characters of current string
			-- will also affect `other', and conversely.
		require
			argument_not_void: other /= Void
		do
			area := other.area
			count := other.count
			internal_hash_code := 0
		ensure
			shared_count: other.count = count
			shared_area: other.area = area
		end

	put (c: CHARACTER_32; i: INTEGER)
			-- Replace character at position `i' by `c'.
		do
			area.put (c, i - 1)
			internal_hash_code := 0
		ensure then
			stable_count: count = old count
			stable_before_i: elks_checking implies substring (1, i - 1) ~ (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count) ~ (old substring (i + 1, count))
		end

	put_code (v: NATURAL_32; i: INTEGER)
			-- Replace character at position `i' by character of code `v'.
		do
			area.put (v.to_character_32, i - 1)
			internal_hash_code := 0
		end

	prepend_string_general (s: READABLE_STRING_GENERAL)
			-- Prepend characters of `s' at front.
		do
			if attached {READABLE_STRING_32} s as l_s32 then
				prepend (l_s32)
			else
				Precursor {STRING_GENERAL} (s)
			end
		end

	precede, prepend_character (c: CHARACTER_32)
			-- Add `c' at front.
		local
			l_area: like area
		do
			if count = capacity then
				resize (count + additional_space)
			end
			l_area := area
			l_area.overlapping_move (0, 1, count)
			l_area.put (c, 0)
			count := count + 1
			internal_hash_code := 0
		ensure
			new_count: count = old count + 1
		end

	prepend (s: READABLE_STRING_32)
			-- Prepend characters of `s' at front.
		require
			argument_not_void: s /= Void
		do
			insert_string (s, 1)
		ensure
			new_count: count = old (count + s.count)
			inserted: elks_checking implies same_string (old (s + Current))
		end

	prepend_substring (s: READABLE_STRING_32; start_index, end_index: INTEGER)
			-- Prepend characters of `s.substring (start_index, end_index)' at front.
		require
			argument_not_void: s /= Void
			start_index_valid: start_index >= 1
			end_index_valid: end_index <= s.count
			valid_bounds: start_index <= end_index + 1
		local
			new_size: INTEGER
			l_s_count: INTEGER
			l_area: like area
		do
				-- Insert `s' if `s' is not empty, otherwise is useless.
			l_s_count := end_index - start_index + 1
			if l_s_count > 0 then
					-- Resize Current if necessary.
				new_size := l_s_count + count
				if new_size > capacity then
					resize (new_size + additional_space)
				end

					-- Perform all operations using a zero based arrays.
				l_area := area

					-- First shift from `s.count' position all characters of current.
				l_area.overlapping_move (0, l_s_count, count)

					-- Copy string `s' at beginning.
				l_area.copy_data (s.area, s.area_lower + start_index - 1, 0, l_s_count)

				count := new_size
				internal_hash_code := 0
			end
		ensure
			new_count: count = old count + end_index - start_index + 1
			inserted: elks_checking implies same_string (old (s.substring (start_index, end_index) + Current))
		end

	prepend_boolean (b: BOOLEAN)
			-- Prepend the string representation of `b' at front.
		do
			prepend_string_general (b.out)
		end

	prepend_double (d: DOUBLE)
			-- Prepend the string representation of `d' at front.
		do
			prepend_string_general (d.out)
		end

	prepend_integer (i: INTEGER)
			-- Prepend the string representation of `i' at front.
		do
			prepend_string_general (i.out)
		end

	prepend_real (r: REAL)
			-- Prepend the string representation of `r' at front.
		do
			prepend_string_general (r.out)
		end

	prepend_string (s: detachable READABLE_STRING_32)
			-- Prepend characters of `s', if not void, at front.
		do
			if s /= Void then
				prepend (s)
			end
		end

	append_string_general (s: READABLE_STRING_GENERAL)
			-- Append characters of `s' at end.
		do
			if attached {READABLE_STRING_32} s as l_s32 then
				append (l_s32)
			else
				Precursor {STRING_GENERAL} (s)
			end
		end

	append (s: READABLE_STRING_32)
			-- Append characters of `s' at end.
		require
			argument_not_void: s /= Void
		local
			l_count, l_s_count, l_new_size: INTEGER
		do
			l_s_count := s.count
			if l_s_count > 0 then
				l_count := count
				l_new_size := l_s_count + l_count
				if l_new_size > capacity then
					resize (l_new_size + additional_space)
				end
				area.copy_data (s.area, s.area_lower, l_count, l_s_count)
				count := l_new_size
				internal_hash_code := 0
			end
		ensure
			new_count: count = old count + old s.count
			appended: elks_checking implies same_string (old (Current + s))
		end

	append_substring (s: READABLE_STRING_32; start_index, end_index: INTEGER)
			-- Append characters of `s.substring (start_index, end_index)' at end.
		require
			argument_not_void: s /= Void
			start_index_valid: start_index >= 1
			end_index_valid: end_index <= s.count
			valid_bounds: start_index <= end_index + 1
		local
			l_count, l_s_count, l_new_size: INTEGER
		do
			l_s_count := end_index - start_index + 1
			if l_s_count > 0 then
				l_count := count
				l_new_size := l_s_count + l_count
				if l_new_size > capacity then
					resize (l_new_size + additional_space)
				end
				area.copy_data (s.area, s.area_lower + start_index - 1, l_count, l_s_count)
				count := l_new_size
				internal_hash_code := 0
			end
		ensure
			new_count: count = old count + (end_index - start_index + 1)
			appended: elks_checking implies same_string (old (Current + s.substring (start_index, end_index)))
		end

	plus alias "+" (s: READABLE_STRING_GENERAL): like Current
			-- <Precursor>
		do
			Result := new_string (count + s.count)
			Result.append (Current)
			Result.append_string_general (s)
		end

	append_string (s: detachable READABLE_STRING_32)
			-- Append a copy of `s', if not void, at end.
		do
			if s /= Void then
				append (s)
			end
		ensure
			appended: s /= Void implies
				(elks_checking implies Current ~ (old twin + old s.twin))
		end

	append_integer (i: INTEGER)
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					if i < 0 then
						append_character ('-')
						l_starting_index := l_starting_index + 1
							-- Special case for minimum integer value as negating it
							-- as no effect.
						if i = {INTEGER}.Min_value then
							append_character ('8')
							l_value := -(i // 10)
						else
							l_value := -i
						end
					else
						l_value := i
					end
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_integer_8 (i: INTEGER_8)
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_8
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					if i < 0 then
						append_character ('-')
						l_starting_index := l_starting_index + 1
							-- Special case for minimum integer value as negating it
							-- as no effect.
						if i = {INTEGER_8}.Min_value then
							append_character ('8')
							l_value := -(i // 10)
						else
							l_value := -i
						end
					else
						l_value := i
					end
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_integer_16 (i: INTEGER_16)
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_16
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					if i < 0 then
						append_character ('-')
						l_starting_index := l_starting_index + 1
							-- Special case for minimum integer value as negating it
							-- as no effect.
						if i = {INTEGER_16}.Min_value then
							append_character ('8')
							l_value := -(i // 10)
						else
							l_value := -i
						end
					else
						l_value := i
					end
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_integer_64 (i: INTEGER_64)
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_64
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					if i < 0 then
						append_character ('-')
						l_starting_index := l_starting_index + 1
							-- Special case for minimum integer value as negating it
							-- as no effect.
						if i = {INTEGER_64}.Min_value then
							append_character ('8')
							l_value := -(i // 10)
						else
							l_value := -i
						end
					else
						l_value := i
					end
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_natural_8 (i: NATURAL_8)
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_8
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					l_value := i
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_natural_16 (i: NATURAL_16)
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_16
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					l_value := i
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_natural_32 (i: NATURAL_32)
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_32
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					l_value := i
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_natural_64 (i: NATURAL_64)
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_64
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER_32
			l_area: like area
		do
			if i = 0 then
				append_character ('0')
			else
					-- Extract integer value digit by digit from right to left.
				from
					l_starting_index := count
					l_value := i
				until
					l_value = 0
				loop
					append_character (((l_value \\ 10)+ 48).to_character_32)
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

	append_real (r: REAL)
			-- Append the string representation of `r' at end.
		do
			append_string_general (r.out)
		end

	append_double (d: DOUBLE)
			-- Append the string representation of `d' at end.
		do
			append_string_general (d.out)
		end

	append_character, extend (c: CHARACTER_32)
			-- Append `c' at end.
		local
			current_count: INTEGER
		do
			current_count := count
			if current_count = capacity then
				resize (current_count + additional_space)
			end
			area.put (c, current_count)
			count := current_count + 1
			internal_hash_code := 0
		ensure then
			item_inserted: item (count) = c
			new_count: count = old count + 1
			stable_before: elks_checking implies substring (1, count - 1) ~ (old twin)
		end

	append_boolean (b: BOOLEAN)
			-- Append the string representation of `b' at end.
		do
			append_string_general (b.out)
		end

	insert (s: READABLE_STRING_32; i: INTEGER)
			-- Add `s' to left of position `i' in current string.
		obsolete
			"ELKS 2001: use `insert_string' instead"
		require
			string_exists: s /= Void
			index_small_enough: i <= count + 1
			index_large_enough: i > 0
		do
			insert_string (s, i)
		ensure
			inserted: elks_checking implies
				(Current ~ (old substring (1, i - 1) + old (s.twin) + old substring (i, count)))
		end

	insert_string (s: READABLE_STRING_32; i: INTEGER)
			-- Insert `s' at index `i', shifting characters between ranks
			-- `i' and `count' rightwards.
		require
			string_exists: s /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			pos, new_size: INTEGER
			l_s_count: INTEGER
			l_area: like area
		do
				-- Insert `s' if `s' is not empty, otherwise is useless.
			l_s_count := s.count
			if l_s_count /= 0 then
					-- Resize Current if necessary.
				new_size := l_s_count + count
				if new_size > capacity then
					resize (new_size + additional_space)
				end

					-- Perform all operations using a zero based arrays.
				l_area := area
				pos := i - 1

					-- First shift from `s.count' position all characters starting at index `pos'.
				l_area.overlapping_move (pos, pos + l_s_count, count - pos)

					-- Copy string `s' at index `pos'.
				l_area.copy_data (s.area, s.area_lower, pos, l_s_count)

				count := new_size
				internal_hash_code := 0
			end
		ensure
			inserted: elks_checking implies (Current ~ (old substring (1, i - 1) + old (s.twin) + old substring (i, count)))
		end

	insert_character (c: CHARACTER_32; i: INTEGER)
			-- Insert `c' at index `i', shifting characters between ranks
			-- `i' and `count' rightwards.
		require
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			pos, new_size: INTEGER
			l_area: like area
		do
				-- Resize Current if necessary.
			new_size := 1 + count
			if new_size > capacity then
				resize (new_size + additional_space)
			end

				-- Perform all operations using a zero based arrays.
			pos := i - 1
			l_area := area

				-- First shift from `s.count' position all characters starting at index `pos'.
			l_area.overlapping_move (pos, pos + 1, count - pos)

				-- Insert new character
			l_area.put (c, pos)

			count := new_size
			internal_hash_code := 0
		ensure
			one_more_character: count = old count + 1
			inserted: item (i) = c
			stable_before_i: elks_checking implies substring (1, i - 1) ~ (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count) ~ (old substring (i, count))
		end

feature -- Removal

	remove (i: INTEGER)
			-- Remove `i'-th character.
		local
			l_count: INTEGER
		do
			l_count := count
				-- Shift characters to the left.
			area.overlapping_move (i, i - 1, l_count - i)
				-- Update content.
			count := l_count - 1
			internal_hash_code := 0
		end

	remove_head (n: INTEGER)
			-- Remove first `n' characters;
			-- if `n' > `count', remove all.
		require
			n_non_negative: n >= 0
		do
			if n > count then
				count := 0
				internal_hash_code := 0
			else
				keep_tail (count - n)
			end
		ensure
			removed: elks_checking implies Current ~ (old substring (n.min (count) + 1, count))
		end

	remove_substring (start_index, end_index: INTEGER)
			-- Remove all characters from `start_index'
			-- to `end_index' inclusive.
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		local
			l_count, nb_removed: INTEGER
		do
			nb_removed := end_index - start_index + 1
			if nb_removed > 0 then
				l_count := count
				area.overlapping_move (start_index + nb_removed - 1, start_index - 1, l_count - end_index)
				count := l_count - nb_removed
				internal_hash_code := 0
			end
		ensure
			removed: elks_checking implies Current ~ (old substring (1, start_index - 1) + old substring (end_index + 1, count))
		end

	remove_tail (n: INTEGER)
			-- Remove last `n' characters;
			-- if `n' > `count', remove all.
		require
			n_non_negative: n >= 0
		local
			l_count: INTEGER
		do
			l_count := count
			if n > l_count then
				count := 0
				internal_hash_code := 0
			else
				keep_head (l_count - n)
			end
		ensure
			removed: elks_checking implies Current ~ (old substring (1, count - n.min (count)))
		end

	prune (c: CHARACTER_32)
			-- Remove first occurrence of `c', if any.
		require else
			True
		local
			counter: INTEGER
		do
			from
				counter := 1
			until
				counter > count or else (item (counter) = c)
			loop
				counter := counter + 1
			end
			if counter <= count then
				remove (counter)
			end
		end

	prune_all (c: CHARACTER_32)
			-- Remove all occurrences of `c'.
		require else
			True
		local
			i, j, nb: INTEGER
			l_area: like area
			l_char: CHARACTER_32
		do
				-- Traverse string and shift characters to the left
				-- each time we find an occurrence of `c'.
			from
				l_area := area
				nb := count
			until
				i = nb
			loop
				l_char := l_area.item (i)
				if l_char /= c then
					l_area.put (l_char, j)
					j := j + 1
				end
				i := i + 1
			end
			count := j
			internal_hash_code := 0
		ensure then
			changed_count: count = (old count) - (old occurrences (c))
			-- removed: For every `i' in 1..`count', `item' (`i') /= `c'
		end

	prune_all_leading (c: CHARACTER_32)
			-- Remove all leading occurrences of `c'.
		do
			from
			until
				is_empty or else item (1) /= c
			loop
				remove (1)
			end
		end

	prune_all_trailing (c: CHARACTER_32)
			-- Remove all trailing occurrences of `c'.
		do
			from
			until
				is_empty or else item (count) /= c
			loop
				remove (count)
			end
		end

	wipe_out
			-- Remove all characters.
		do
			count := 0
			internal_hash_code := 0
		ensure then
			is_empty: count = 0
			same_capacity: capacity = old capacity
		end

	clear_all
			-- Reset all characters.
		obsolete
			"Use `wipe_out' instead."
		do
			count := 0
			internal_hash_code := 0
		ensure
			is_empty: count = 0
			same_capacity: capacity = old capacity
		end

feature -- Resizing

	adapt_size
			-- Adapt the size to accommodate `count' characters.
		do
			resize (count)
		end

	resize (newsize: INTEGER)
			-- Rearrange string so that it can accommodate
			-- at least `newsize' characters.
			-- Do not lose any previously entered character.
		do
			area := area.aliased_resized_area_with_default ('%/000/', newsize + 1)
		end

	grow (newsize: INTEGER)
			-- Ensure that the capacity is at least `newsize'.
		do
			if newsize > capacity then
				resize (newsize)
			end
		end

	trim
			-- <Precursor>
		local
			n: like count
		do
			n := count
			if n < capacity then
				area := area.aliased_resized_area (n)
			end
		ensure then
			same_string: same_string (old twin)
		end

feature -- Conversion

	as_lower: like Current
			-- New object with all letters in lower case.
		do
			Result := twin
			Result.to_lower
		end

	as_upper: like Current
			-- New object with all letters in upper case
		do
			Result := twin
			Result.to_upper
		end

	left_justify
			-- Left justify Current using `count' as witdth.
		local
			i, nb: INTEGER
			l_area: like area
		do
				-- Remove leading white spaces.
			nb := count
			left_adjust

				-- Get new count
			i := count
			if i < nb then
					-- `left_adjust' did remove some characters, so we need to add
					-- some white spaces at the end of the string.
				from
					l_area := area
				until
					i = nb
				loop
					l_area.put (' ', i)
					i := i + 1
				end
					-- Restore `count'
				count := nb
				internal_hash_code := 0
			end
		end

	center_justify
			-- Center justify Current using `count' as width.
		local
			i, nb, l_offset: INTEGER
			left_nb_space, right_nb_space: INTEGER
			l_area: like area
			l_prop: like character_properties
		do
			l_prop := character_properties

				-- Compute number of spaces at the left of current string.
			from
				nb := count
				l_area := area
			until
				left_nb_space = nb or else not l_prop.is_space (l_area.item (left_nb_space))
			loop
				left_nb_space := left_nb_space + 1
			end

				-- Compute number of spaces at the right of current string.
			from
				i := nb - 1
				l_area := area
			until
				i = -1 or else not l_prop.is_space (l_area.item (i))
			loop
				right_nb_space := right_nb_space + 1
				i := i - 1
			end

				-- We encourage that more spaces will be put to the left, when
				-- number of spaces is not even.
			l_offset := left_nb_space + right_nb_space
			if l_offset \\ 2 = 0 then
				l_offset := left_nb_space - l_offset // 2
			else
				l_offset := left_nb_space - l_offset // 2 - 1
			end
			if l_offset = 0 then
					-- Nothing to be done.
			else
					-- Shift characters to the right or left (depending on sign of
					-- `l_offset' by `l_offset' position.
				l_area.move_data (left_nb_space, left_nb_space - l_offset,
					nb - left_nb_space - right_nb_space)

				if l_offset < 0 then
						-- Fill left part with spaces.
					l_area.fill_with (' ', left_nb_space, left_nb_space - l_offset - 1)
				else
						-- Fill right part with spaces.
					l_area.fill_with (' ', nb - right_nb_space - l_offset, nb - 1)
				end
				internal_hash_code := 0
			end
		end

	right_justify
			-- Right justify Current using `count' as width.
		local
			i, nb: INTEGER
			nb_space: INTEGER
			l_area: like area
		do
			nb := count
			right_adjust
			i := count
			nb_space := nb - i
			if nb_space > 0 then
					-- Shift characters to the right.
				from
					l_area := area
				until
					i = 0
				loop
					i := i - 1
					l_area.put (l_area.item (i), i + nb_space)
				variant
					i + 1
				end

					-- Fill left part with spaces.
				from
				until
					nb_space = 0
				loop
					nb_space := nb_space - 1
					l_area.put (' ', nb_space)
				variant
					nb_space + 1
				end
					-- Restore `count'
				count := nb
				internal_hash_code := 0
			end
		ensure
			same_count: count = old count
		end

	character_justify (pivot: CHARACTER_32; position: INTEGER)
			-- Justify a string based on a `pivot'
			-- and the `position' it needs to be in
			-- the final string.
			-- This will grow the string if necessary
			-- to get the pivot in the correct place.
		require
			valid_position: position <= capacity
			positive_position: position >= 1
			pivot_not_space: pivot /= ' '
			not_empty: not is_empty
		local
			l_index_of_pivot, l_new_size: INTEGER
			l_area: like area
		do
			l_index_of_pivot := index_of (pivot, 1)
			if l_index_of_pivot /= 0 then
				if l_index_of_pivot < position then
						-- We need to resize Current so that we can shift Current by
						-- `l_index_of_pivot - position'.
					l_new_size := count + position - l_index_of_pivot
					grow (l_new_size)
					l_area := area
					l_area.move_data (0, position - l_index_of_pivot, count)
					l_area.fill_with (' ', 0, position - l_index_of_pivot - 1)
					count := l_new_size
				else
						-- Simply shift content to the left and reset trailing with spaces.
					l_area := area
					l_area.move_data (l_index_of_pivot - position, 0, count - l_index_of_pivot + position)
					l_area.fill_with (' ', count - l_index_of_pivot + position, count - 1)
				end
				internal_hash_code := 0
			end
		end

	to_lower
			-- Convert to lower case.
		do
			to_lower_area (area, 0, count - 1)
			internal_hash_code := 0
		ensure
			length_and_content: elks_checking implies Current ~ (old as_lower)
		end

	to_upper
			-- Convert to upper case.
		do
			to_upper_area (area, 0, count - 1)
			internal_hash_code := 0
		ensure
			length_and_content: elks_checking implies Current ~ (old as_upper)
		end

	linear_representation: LINEAR [CHARACTER_32]
			-- Representation as a linear structure
		local
			temp: ARRAYED_LIST [CHARACTER_32]
			i: INTEGER
		do
			create temp.make (capacity)
			from
				i := 1
			until
				i > count
			loop
				temp.extend (item (i))
				i := i + 1
			end
			Result := temp
		end

	frozen to_c: ANY
			-- A reference to a C form of current string.
			-- Useful only for interfacing with C software.
		require
			not_is_dotnet: not {PLATFORM}.is_dotnet
		local
			l_area: like area
		do
			l_area := area
			l_area.put ('%U', count)
			Result := l_area
		end

	mirrored: like Current
			-- Mirror image of string;
			-- Result for "Hello world" is "dlrow olleH".
		do
			Result := twin
			if count > 0 then
				Result.mirror
			end
		end

	mirror
			-- Reverse the order of characters.
			-- "Hello world" -> "dlrow olleH".
		local
			a: like area
			c: CHARACTER_32
			i, j: INTEGER
		do
			if count > 0 then
				from
					i := count - 1
					a := area
				until
					i <= j
				loop
					c := a.item (i)
					a.put (a.item (j), i)
					a.put (c, j)
					i := i - 1
					j := j + 1
				end
				internal_hash_code := 0
			end
		ensure
			same_count: count = old count
			-- reversed: For every `i' in 1..`count', `item' (`i') = old `item' (`count'+1-`i')
		end

feature -- Duplication

	substring (start_index, end_index: INTEGER): like Current
			-- Copy of substring containing all characters at indices
			-- between `start_index' and `end_index'
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				Result := new_string (end_index - start_index + 1)
				Result.area.copy_data (area, start_index - 1, 0, end_index - start_index + 1)
				Result.set_count (end_index - start_index + 1)
			else
				Result := new_string (0)
			end
		end

	multiply (n: INTEGER)
			-- Duplicate a string within itself
			-- ("hello").multiply(3) => "hellohellohello"
		require
			meaningful_multiplier: n >= 1
		local
			s: like Current
			i: INTEGER
		do
			s := twin
			grow (n * count)
			from
				i := n
			until
				i = 1
			loop
				append (s)
				i := i - 1
			end
		end

feature {STRING_HANDLER} -- Implementation

	frozen set_count (number: INTEGER)
			-- Set `count' to `number' of characters.
		do
			count := number
			internal_hash_code := 0
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current
			-- New instance of current with space for at least `n' characters.
		do
			create Result.make (n)
		end

feature -- Transformation

	correct_mismatch
			-- Attempt to correct object mismatch during retrieve using `mismatch_information'.
		do
				-- Nothing to be done because we only added `internal_hash_code' that will
				-- be recomputed next time we query `hash_code'.

				-- In .NET, we have a mismatch that is triggered due to the implementation of
				-- SPECIAL [CHARACTER_32] as a .NET array of UInt16.
			if area = Void and then attached {like area} mismatch_information.item ("area") as l_area then
				area := l_area
			end
		end

invariant
	extendible: extendible
	compare_character: not object_comparison

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
