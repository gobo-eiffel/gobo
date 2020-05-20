note
	description: "[
		Sequences of 32-bit characters, accessible through integer indices
		in a contiguous range. Read-only interface.
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READABLE_STRING_32

inherit
	READABLE_STRING_GENERAL
		rename
			ends_with as ends_with_general,
			is_case_insensitive_equal as is_case_insensitive_equal_general,
			plus as plus_general,
			same_caseless_characters as same_caseless_characters_general,
			same_characters as same_characters_general,
			same_string as same_string_general,
			starts_with as starts_with_general
		redefine
			copy, is_equal, out, has, index_of, last_index_of, occurrences
		end

	READABLE_INDEXABLE [CHARACTER_32]
		rename
			upper as count
		redefine
			copy,
			is_equal,
			new_cursor,
			out
		end

convert
	to_cil: {SYSTEM_STRING},
	as_string_8: {READABLE_STRING_8, STRING_8},
	as_string_32: {STRING_32}

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Allocate space for at least `n' characters.
		do
			count := 0
			internal_hash_code := 0
			create area.make_filled ('%/000/', n + 1)
		end

	make_filled (c: CHARACTER_32; n: INTEGER)
			-- Create string of length `n' filled with `c'.
		require
			valid_count: n >= 0
		do
			make (n)
			fill_character (c)
		ensure
			count_set: count = n
			area_allocated: capacity >= n
			filled: occurrences (c) = count
		end

	make_from_string (s: READABLE_STRING_32)
			-- Initialize from the characters of `s'.
		require
			string_exists: s /= Void
		do
			area := s.area
			count := s.count
			internal_hash_code := 0
			if Current /= s then
				create area.make_empty (count + 1)
				area.copy_data (s.area, s.area_lower, 0, count + 1)
			end
		ensure
			not_shared_implementation: Current /= s implies not shared_with (s)
			initialized: same_string (s)
		end

	make_from_string_general (s: READABLE_STRING_GENERAL)
			-- Initialize from the characters of `s'.
		require
			string_exists: s /= Void
		deferred
		ensure
			not_shared_implementation: Current /= s
			initialized: same_string_general (s)
		end

	make_from_c (c_string: POINTER)
			-- Initialize from contents of `c_string',
			-- a string created by some C function.
		require
			c_string_exists: c_string /= default_pointer
		local
			l_count: INTEGER
		do
			c_string_provider.set_shared_from_pointer (c_string)
			l_count := c_string_provider.count
			create area.make_filled ('%/000/', l_count + 1)
			count := l_count
			internal_hash_code := 0
			c_string_provider.read_substring_into_character_32_area (area, 1, l_count)
		end

	make_from_c_byte_array (a_byte_array: POINTER; a_character_count: INTEGER)
			-- Initialize from contents of `a_byte_array' for a length of `a_character_count`,
			-- given that each character is encoded in 4 bytes (little endian).
			-- ex: (char*) "a\000\000\000b\000\000\000c\000\000\000" for unicode STRING_32 "abc"
		require
			a_byte_array_exists: not a_byte_array.is_default_pointer
		do
			c_string_provider.set_shared_from_pointer_and_count (a_byte_array, 4 * a_character_count)
			create area.make_filled ('%/000/', 4 * a_character_count + 1)
			count := a_character_count
			internal_hash_code := 0
			c_string_provider.read_unicode_substring_into_character_32_area (area, 1, 4 * a_character_count)
		end

	make_from_c_pointer (c_string: POINTER)
			-- Create new instance from contents of `c_string',
			-- a string created by some C function.
		obsolete
			"Use `make_from_c'. [2017-05-31]"
		require
			c_string_exists: c_string /= default_pointer
		do
			make_from_c (c_string)
		end

	make_from_cil (a_system_string: detachable SYSTEM_STRING)
			-- Initialize Current with `a_system_string'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		deferred
		end

	make_from_separate (other: separate READABLE_STRING_GENERAL)
			-- Initialize current string from `other'.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			l_area: like area
		do
			nb := other.count
			make (nb)
			from
				l_area := area
				i := 0
			until
				i = nb
			loop
				l_area.put (other.item (i + 1), i)
				i := i + 1
			end
			count := nb
		ensure
			same_string: -- `other' and `Current' have the same content.
		end

feature -- Access

	at alias "@" (i: INTEGER): CHARACTER_32
			-- Character at position `i'.
		deferred
		end

	item_code (i: INTEGER): INTEGER
			-- Numeric code of character at position `i'.
		obsolete
			"Due to potential truncation it is recommended to use `code (i)' instead. [2017-05-31]"
		require
			index_small_enough: i <= count
			index_large_enough: i > 0
		deferred
		end

	shared_with (other: READABLE_STRING_32): BOOLEAN
			-- Does string share the text of `other'?
		do
			Result := (other /= Void) and then (area = other.area)
		end

	index_of (c: CHARACTER_32; start_index: INTEGER): INTEGER
			-- <Precursor>
		local
			a: like area
			i, nb, l_lower_area: INTEGER
		do
			nb := count
			if start_index <= nb then
				from
					l_lower_area := area_lower
					i := start_index - 1 + l_lower_area
					nb := nb + l_lower_area
					a := area
				until
					i = nb or else a.item (i) = c
				loop
					i := i + 1
				end
				if i < nb then
						-- We add +1 due to the area starting at 0 and not at 1
						-- and substract `area_lower'
					Result := i + 1 - l_lower_area
				end
			end
		end

	last_index_of (c: CHARACTER_32; start_index_from_end: INTEGER): INTEGER
			-- <Precursor>
		local
			a: like area
			i, l_lower_area: INTEGER
		do
			from
				l_lower_area := area_lower
				i := start_index_from_end - 1 + l_lower_area
				a := area
			until
				i < l_lower_area or else a.item (i) = c
			loop
				i := i - 1
			end
				-- We add +1 due to the area starting at 0 and not at 1.
			Result := i + 1 - l_lower_area
		end

	substring_index_in_bounds (other: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
			-- <Precursor>
		do
			Result := string_searcher.substring_index (Current, other, start_pos, end_pos)
		end

	string: STRING_32
			-- New STRING_32 having same character sequence as `Current'.
		do
			create Result.make_from_string (Current)
		ensure
			string_not_void: Result /= Void
			string_type: Result.same_type (create {STRING_32}.make_empty)
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count) ~ substring (2, count).string
		end

	string_representation: STRING_32
			-- Similar to `string' but only create a new object if `Current' is not of dynamic type {STRING_32}.
		do
			if same_type (create {STRING_32}.make_empty) and then attached {STRING_32} Current as l_s32 then
				Result := l_s32
			else
				Result := string
			end
		ensure
			Result_not_void: Result /= Void
			correct_type: Result.same_type (create {STRING_32}.make_empty)
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count) ~ substring (2, count).string
		end

	substring_index (other: READABLE_STRING_GENERAL; start_index: INTEGER): INTEGER
			-- <Precursor>
		do
			Result := string_searcher.substring_index (Current, other, start_index, count)
		end

	fuzzy_index (other: READABLE_STRING_GENERAL; start: INTEGER; fuzz: INTEGER): INTEGER
			-- <Precursor>
		do
			Result := string_searcher.fuzzy_index (Current, other, start, count, fuzz)
		end

	new_cursor: STRING_32_ITERATION_CURSOR
			-- <Precursor>
		do
			create Result.make (Current)
		end

feature -- Measurement

	capacity: INTEGER
			-- <Precursor>
		do
			Result := area.count - 1
		end

	count: INTEGER
			-- Actual number of characters making up the string.

	occurrences (c: CHARACTER_32): INTEGER
			-- <Precursor>
		local
			i, nb: INTEGER
			a: SPECIAL [CHARACTER_32]
		do
			from
				i := area_lower
				nb := count + i
				a := area
			until
				i = nb
			loop
				if a.item (i) = c then
					Result := Result + 1
				end
				i := i + 1
			end
		ensure then
			zero_if_empty: count = 0 implies Result = 0
			recurse_if_not_found_at_first_position:
				(count > 0 and then item (1) /= c) implies
					Result = substring (2, count).occurrences (c)
			recurse_if_found_at_first_position:
				(count > 0 and then item (1) = c) implies
					Result = 1 + substring (2, count).occurrences (c)
		end

	lower: INTEGER = 1
			-- <Precursor>

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is string made of same character sequence as `other'
			-- (possibly with a different capacity)?
		local
  			nb: INTEGER
			l_hash, l_other_hash: like internal_hash_code
  		do
  			if other = Current then
  				Result := True
  			else
  				nb := count
  				if nb = other.count then
						-- Let's compare the content if and only if the hash_code are the same or not yet computed.
					l_hash := internal_hash_code
					l_other_hash := other.internal_hash_code
					if l_hash = 0 or else l_other_hash = 0 or else l_hash = l_other_hash then
 						Result := area.same_items (other.area, other.area_lower, area_lower, nb)
					end
  				end
  			end

		end

	is_case_insensitive_equal (other: READABLE_STRING_32): BOOLEAN
			-- Is string made of same character sequence as `other' regardless of casing
			-- (possibly with a different capacity)?
		require
			other_not_void: other /= Void
		local
			nb: INTEGER
		do
			if other = Current then
				Result := True
			else
				nb := count
				if nb = other.count then
					Result := nb = 0 or else same_caseless_characters (other, 1, nb, 1)
				end
			end
		ensure
			symmetric: Result implies other.is_case_insensitive_equal (Current)
			consistent: attached {like Current} other as l_other implies (standard_is_equal (l_other) implies Result)
			valid_result: as_lower.same_string (other.as_lower) implies Result
		end

 	same_caseless_characters (other: READABLE_STRING_32; start_pos, end_pos, index_pos: INTEGER): BOOLEAN
			-- Are characters of `other' within bounds `start_pos' and `end_pos'
			-- caseless identical to characters of current string starting at index `index_pos'.
		require
			other_not_void: other /= Void
			valid_start_pos: other.valid_index (start_pos)
			valid_end_pos: other.valid_index (end_pos)
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
			valid_index_pos: valid_index (index_pos)
		local
			i, j, nb: INTEGER
			l_prop: like character_properties
			l_area, l_other_area: like area
			c1,c2: CHARACTER_32
		do
			nb := end_pos - start_pos + 1
			if nb <= count - index_pos + 1 then
				from
					l_prop := character_properties
					l_area := area
					l_other_area := other.area
					Result := True
					i := area_lower + index_pos - 1
					j := other.area_lower + start_pos - 1
					nb := nb + i
				until
					i = nb
				loop
					c1 := l_area.item (i)
					c2 := l_other_area.item (j)
					if c1 /= c2 and then l_prop.to_lower (c1) /= l_prop.to_lower (c2) then
						Result := False
						i := nb - 1 -- Jump out of the loop
					end
					i := i + 1
					j := j + 1
				variant
					increasing_index: nb - i + 1
				end
			end
		ensure
			same_characters: Result = substring (index_pos, index_pos + end_pos - start_pos).is_case_insensitive_equal (other.substring (start_pos, end_pos))
		end

	same_string (other: READABLE_STRING_32): BOOLEAN
			-- Do `Current' and `other' have same character sequence?
		require
			other_not_void: other /= Void
		local
			nb: INTEGER
		do
			if other = Current then
				Result := True
			else
				nb := count
				if nb = other.count then
					Result := nb = 0 or else same_characters (other, 1, nb, 1)
				end
			end
		ensure
			definition: Result = (string ~ other.string)
		end

	same_characters (other: READABLE_STRING_32; start_pos, end_pos, index_pos: INTEGER): BOOLEAN
			-- Are characters of `other' within bounds `start_pos' and `end_pos'
			-- identical to characters of current string starting at index `index_pos'.
		require
			other_not_void: other /= Void
			valid_start_pos: other.valid_index (start_pos)
			valid_end_pos: other.valid_index (end_pos)
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
			valid_index_pos: valid_index (index_pos)
		local
			nb: INTEGER
		do
			nb := end_pos - start_pos + 1
			if nb <= count - index_pos + 1 then
				Result := area.same_items (other.area, other.area_lower + start_pos - 1, area_lower + index_pos - 1, nb)
			end
		ensure
			same_characters: Result = substring (index_pos, index_pos + end_pos - start_pos).same_string (other.substring (start_pos, end_pos))
		end

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is string lexicographically lower than `other'?
		local
			other_count: INTEGER
			current_count: INTEGER
		do
			if other /= Current then
				other_count := other.count
				current_count := count
				if other_count = current_count then
					Result := str_strict_cmp (other.area, area, other.area_lower, area_lower, other_count) > 0
				else
					if current_count < other_count then
						Result := str_strict_cmp (other.area, area, other.area_lower, area_lower, current_count) >= 0
					else
						Result := str_strict_cmp (other.area, area, other.area_lower, area_lower, other_count) > 0
					end
				end
			end
		end

feature -- Status report

	is_string_8: BOOLEAN = False
			-- <Precursor>

	is_string_32: BOOLEAN = True
			-- <Precursor>

	is_valid_as_string_8: BOOLEAN
			-- <Precursor>
		local
			i, nb: INTEGER
			l_area: like area
		do
			from
				Result := True
				i := area_lower
				nb := count + i
				l_area := area
			until
				i = nb or not Result
			loop
				Result := l_area.item (i).code <= {CHARACTER_8}.max_value
				i := i + 1
			end
		end

	is_substring_whitespace (start_index, end_index: INTEGER): BOOLEAN
			-- <Precursor>
		local
			i, n: INTEGER
			l_prop: like character_properties
			l_area: like area
		do
			from
				l_area := area
				i := area_lower + start_index - 1
				n := area_lower + end_index - 1
				l_prop := character_properties
			until
				i > n or not l_prop.is_space (l_area.item (i))
			loop
				i := i + 1
			end
			Result := i > n
		end

	has (c: CHARACTER_32): BOOLEAN
			-- <Precursor>
		local
			i, nb: INTEGER
			l_area: like area
		do
			nb := count
			if nb > 0 then
				from
					i := area_lower
					l_area := area
					nb := nb + i
				until
					i = nb or else l_area.item (i) = c
				loop
					i := i + 1
				end
				Result := i < nb
			end
		end

	starts_with (s: READABLE_STRING_32): BOOLEAN
			-- Does string begin with `s'?
		require
			argument_not_void: s /= Void
		local
			i, j, nb: INTEGER
			l_area, l_s_area: like area
		do
			if Current = s then
				Result := True
			else
				i := s.count
				if i <= count then
					from
						l_area := area
						l_s_area := s.area
						j := area_lower + i
						i := s.area_upper + 1
						nb := s.area_lower
						Result := True
					until
						i = nb
					loop
						i := i - 1
						j := j - 1
						if l_area.item (j) /= l_s_area.item (i) then
							Result := False
							i := nb -- Jump out of loop
						end
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (1, s.count))
		end

	ends_with (s: READABLE_STRING_32): BOOLEAN
			-- Does string finish with `s'?
		require
			argument_not_void: s /= Void
		local
			i, j, nb: INTEGER
			l_area, l_s_area: like area
		do
			if Current = s then
				Result := True
			else
				i := s.count
				j := count
				if i <= j then
					from
						l_area := area
						l_s_area := s.area
						j := area_upper + 1
						i := s.area_upper + 1
						nb := s.area_lower
						Result := True
					until
						i = nb
					loop
						i := i - 1
						j := j - 1
						if l_area.item (j) /= l_s_area.item (i) then
							Result := False
							i := nb -- Jump out of loop
						end
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (count - s.count + 1, count))
		end

	valid_code (v: NATURAL_32): BOOLEAN
			-- Is `v' a valid code for a CHARACTER_32?
		do
			Result := True
		end

	is_boolean: BOOLEAN
			-- <Precursor>
		local
			nb: INTEGER
		do
			nb := count
			if nb = 4 then
					-- Check if this is `true_constant'
				Result := is_case_insensitive_equal_general (true_constant)
			elseif nb = 5 then
					-- Check if this is `false_constant'
				Result := is_case_insensitive_equal_general (false_constant)
			end
		end

feature {READABLE_STRING_32} -- Duplication

	copy (other: like Current)
			-- Reinitialize by copying the characters of `other'.
			-- (This is also used by `twin'.)
		local
			old_area: like area
		do
			if other /= Current then
				old_area := area
				standard_copy (other)
					-- Note: <= is needed as all Eiffel string should have an
					-- extra character to insert null character at the end.
				if old_area = Void or else old_area = other.area or else old_area.count <= count then
						-- Prevent copying of large `area' if only a few characters are actually used.
					area := area.resized_area (count + 1)
				else
					old_area.copy_data (area, 0, 0, count)
					area := old_area
				end
				internal_hash_code := 0
			end
		ensure then
			new_result_count: count = other.count
			-- same_characters: For every `i' in 1..`count', `item' (`i') = `other'.`item' (`i')
		end

feature -- Basic operations

	plus alias "+" (s: READABLE_STRING_32): like Current
			-- Concatenation with `s`.
		require
			argument_attached: attached s
		deferred
		ensure
			plus_attached: attached Result
			new_count: Result.count = count + s.count
			initial: elks_checking implies Result.substring (1, count) ~ Current
			final: elks_checking implies Result.substring (count + 1, count + s.count).same_string (s)
		end

feature {NONE} -- Element change

	fill_character (c: CHARACTER_32)
			-- Fill with `capacity' characters all equal to `c'.
		local
			l_cap: like capacity
		do
			l_cap := capacity
			if l_cap /= 0 then
				area.fill_with (c, 0, l_cap - 1)
				count := l_cap
				internal_hash_code := 0
			end
		ensure
			filled: count = capacity
			same_size: capacity = old capacity
			-- all_char: For every `i' in 1..`capacity', `item' (`i') = `c'
		end

feature -- Conversion

	mirrored: like Current
			-- Mirror image of string;
			-- Result for "Hello world" is "dlrow olleH".
		deferred
		ensure
			same_count: Result.count = count
			-- reversed: For every `i' in 1..`count', `Result'.`item' (`i') = `item' (`count'+1-`i')
		end

feature -- Duplication

	substring (start_index, end_index: INTEGER): like Current
			-- <Precursor>
		deferred
		end

feature -- Output

	out: STRING
			-- Printable representation.
		do
			Result := {UTF_CONVERTER}.string_32_to_utf_8_string_8 (Current)
		ensure then
			out_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	string_searcher: STRING_32_SEARCHER
			-- String searcher specialized for READABLE_STRING_32 instances.
		once
			create Result.make
		end

	str_strict_cmp (this, other: like area; this_index, other_index, n: INTEGER): INTEGER
			-- Compare `n' characters from `this' starting at `this_index' with
			-- `n' characters from and `other' starting at `other_index'.
			-- 0 if equal, < 0 if `this' < `other',
			-- > 0 if `this' > `other'
		require
			this_not_void: this /= Void
			other_not_void: other /= Void
			n_non_negative: n >= 0
			n_valid: n <= (this.upper - this_index + 1) and n <= (other.upper - other_index + 1)
		local
			i, j, nb, l_current_code, l_other_code: INTEGER
		do
			from
				i := this_index
				nb := i + n
				j := other_index
			until
				i = nb
			loop
				l_current_code := this.item (i).code
				l_other_code := other.item (j).code
				if l_current_code /= l_other_code then
					Result := l_current_code - l_other_code
					i := nb - 1 -- Jump out of loop
				end
				i := i + 1
				j := j + 1
			end
		end

	to_lower_area (a: like area; start_index, end_index: INTEGER)
			-- Replace all characters in `a' between `start_index' and `end_index'
			-- with their lower version when available.
		require
			a_not_void: a /= Void
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < a.count
		local
			i: INTEGER
			c1, c2: CHARACTER_32
			l_prop: like character_properties
		do
			from
				i := start_index
				l_prop := character_properties
			until
				i > end_index
			loop
				c1 := a.item (i)
				c2 := l_prop.to_lower (c1)
					-- Let's avoid a write access if not needed.
				if c1 /= c2 then
					a.put (c2, i)
				end
				i := i + 1
			end
		end

	to_upper_area (a: like area; start_index, end_index: INTEGER)
			-- Replace all characters in `a' between `start_index' and `end_index'
			-- with their upper version when available.
		require
			a_not_void: a /= Void
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < a.count
		local
			i: INTEGER
			c1, c2: CHARACTER_32
			l_prop: like character_properties
		do
			from
				i := start_index
				l_prop := character_properties
			until
				i > end_index
			loop
				c1 := a.item (i)
				c2 := l_prop.to_upper (c1)
					-- Let's avoid a write access if not needed.
				if c1 /= c2 then
					a.put (c2, i)
				end
				i := i + 1
			end
		end

	mirror_area (a: like area; start_index, end_index: INTEGER)
			-- Mirror all characters in `a' between `start_index' and `end_index'.
		require
			a_not_void: a /= Void
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < a.count
		local
			c: CHARACTER_32
			i, j: INTEGER
		do
			from
				i := end_index
			until
				i <= j
			loop
				c := a.item (i)
				a.put (a.item (j), i)
				a.put (c, j)
				i := i - 1
				j := j + 1
			end
		end

feature
	{READABLE_STRING_8, READABLE_STRING_32,
	STRING_8_SEARCHER, STRING_32_SEARCHER,
	HEXADECIMAL_STRING_TO_INTEGER_CONVERTER,
	STRING_TO_INTEGER_CONVERTOR,
	STRING_TO_REAL_CONVERTOR,
	STRING_32_ITERATION_CURSOR} -- Implementation

	area: SPECIAL [CHARACTER_32]
			-- Storage for characters.

	area_lower: INTEGER
			-- Minimum index.
		do
		ensure
			area_lower_non_negative: Result >= 0
			area_lower_valid: Result <= area.upper
		end

	area_upper: INTEGER
			-- Maximum index.
		do
			Result := area_lower + count - 1
		ensure
			area_upper_valid: Result <= area.upper
			area_upper_in_bound: area_lower <= Result + 1
		end

invariant
	area_not_void: area /= Void

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
