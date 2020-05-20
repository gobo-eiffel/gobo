note
	description: "[
		Sequences of immutable 32-bit characters, accessible through integer indices
		in a contiguous range.
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen class
	IMMUTABLE_STRING_32

inherit
	READABLE_STRING_32
		undefine
			is_immutable
		redefine
			copy, area_lower
		end

	IMMUTABLE_STRING_GENERAL
		rename
			ends_with as ends_with_general,
			is_case_insensitive_equal as is_case_insensitive_equal_general,
			plus as plus_general,
			same_caseless_characters as same_caseless_characters_general,
			same_characters as same_characters_general,
			same_string as same_string_general,
			starts_with as starts_with_general
		undefine
			is_equal, out, copy, has, index_of, last_index_of, occurrences
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
	make_from_string_8,
	make_from_string_32,
	make_from_c,
	make_from_c_byte_array,
	make_from_cil,
	make_from_separate

create {IMMUTABLE_STRING_32}
	make_from_area_and_bounds

convert
	to_cil: {SYSTEM_STRING},
	make_from_cil ({SYSTEM_STRING}),
	make_from_string_8 ({READABLE_STRING_8, IMMUTABLE_STRING_8, STRING_8}),
	make_from_string_32 ({READABLE_STRING_32, STRING_32}),
	make_from_string_general ({READABLE_STRING_GENERAL, STRING_GENERAL, IMMUTABLE_STRING_GENERAL}),
	as_string_32: {STRING_32}

feature {NONE} -- Initialization

	make_from_string_general (s: READABLE_STRING_GENERAL)
			-- Initialize from the characters of `s'.
		do
			if attached {READABLE_STRING_8} s as s8 then
				make_from_string_8 (s8)
			elseif attached {READABLE_STRING_32} s as s32 then
				make_from_string_32 (s32)
			else
				--| Unlikely to happen
				make_from_string_32 (s.to_string_32)
			end
		end

	make_from_string_8 (s: READABLE_STRING_8)
			-- Initialize from the characters of `s'.
		require
			s_attached: s /= Void
		local
			a: like area
			s_area: SPECIAL [CHARACTER_8]
			i, j, nb: INTEGER
		do
			create a.make_empty (s.count + 1)
			from
				i := 0
				j := s.area_lower
				s_area := s.area
				nb := s.count - 1
			until
				i > nb
			loop
				a.extend (s_area [j])
				i := i + 1
				j := j + 1
			end
			a.extend ('%/000/')
			make_from_area_and_bounds (a, 0, s.count)
		end

	make_from_string_32 (s: READABLE_STRING_32)
			-- Initialize from the characters of `s'.
			--| If `s' is already an immutable type, we reuse the same `area'.
		require
			s_attached: s /= Void
		local
			a: like area
		do
			area := s.area
			if same_type (s) then
				area_lower := s.area_lower
			else
				create a.make_empty (s.count + 1)
				a.copy_data (s.area, s.area_lower, 0, s.count + 1)
				area := a
				area_lower := 0
			end
			count := s.count
		end

	make_from_area_and_bounds (a: like area; low, n: like count)
			-- Initialize current with area `a' with lower bounds `low' and count `n'.
		require
			a_not_void: a /= Void
			a_valid_count: (a.count - low) >= count + 1
			low_non_negative: low >= 0
			n_non_negative: n >= 0
		do
			area := a
			area_lower := low
			count := n
		ensure
			area_set: area = a
			area_lower_set: area_lower = low
			count_set: count = n
		end

	make_from_cil (a_system_string: SYSTEM_STRING)
			-- <Precursor>
		local
			l_count: INTEGER
		do
			if a_system_string /= Void then
				l_count := a_system_string.length + dotnet_convertor.escape_count (a_system_string)
			end
			make (l_count)
			if l_count > 0 then
				dotnet_convertor.read_system_string_into_area_32 (a_system_string, area)
				count := l_count
			end
		end

feature {IMMUTABLE_STRING_32} -- Duplication

	copy (other: like Current)
			-- <Precursor>
		do
			if other /= Current then
					-- Because it is immutable we can simply share the `area' from `other'.
				standard_copy (other)
			end
		ensure then
			new_result_count: count = other.count
			-- same_characters: For every `i' in 1..`count', `item' (`i') = `other'.`item' (`i')
		end

feature -- Access

	item alias "[]", at alias "@" (i: INTEGER): CHARACTER_32
			-- Character at position `i'
		do
			Result := area.item (i + area_lower - 1)
		end

	code (i: INTEGER): NATURAL_32
			-- Numeric code of character at position `i'
		do
			Result := area.item (i + area_lower - 1).natural_32_code
		end

	item_code (i: INTEGER): INTEGER
			-- Numeric code of character at position `i'
		obsolete
			"Due to potential truncation it is recommended to use `code (i)' instead. [2017-05-31]"
		do
			Result := area.item (i + area_lower - 1).natural_32_code.as_integer_32
		end

feature -- Basic operations

	plus alias "+" (s: READABLE_STRING_32): like Current
			-- <Precursor>
		local
			a: like area
			n: like count
		do
			n := s.count
			create a.make_empty (count + n + 1)
			a.copy_data (area, area_lower, 0, count)
			a.copy_data (s.area, s.area_lower, count, n + 1)
			create Result.make_from_area_and_bounds (a, 0, count + n)
		end

	plus_general (s: READABLE_STRING_GENERAL): like Current
			-- <Precursor>
		local
			a, a_32: like area
			l_s8_area: SPECIAL [CHARACTER_8]
			i, j, nb: INTEGER
		do
			if attached {READABLE_STRING_32} s as l_s32 then
				Result := plus (l_s32)
			else
				create a.make_empty (count + s.count + 1)
				a.copy_data (area, area_lower, 0, count)
				if attached {READABLE_STRING_8} s as l_s8 then
					create a_32.make_empty (l_s8.count + 1)
					from
						i := 0
						j := l_s8.area_lower
						l_s8_area := l_s8.area
						nb := l_s8.count - 1
					until
						i > nb
					loop
						a_32.extend (l_s8_area [j])
						i := i + 1
						j := j + 1
					end
					a_32.extend ('%/000/')
					a.copy_data (a_32, 0, count, nb + 2)
				end
				create Result.make_from_area_and_bounds (a, 0, count + s.count)
			end
		end

	mirrored: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make_empty (count + 1)
			a.copy_data (area, area_lower, 0, count + 1)
			mirror_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	as_lower: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make_empty (count + 1)
			a.copy_data (area, area_lower, 0, count + 1)
			to_lower_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	as_upper: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make_empty (count + 1)
			a.copy_data (area, area_lower, 0, count + 1)
			to_upper_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	substring (start_index, end_index: INTEGER_32): like Current
			-- <Precursor>
		local
			a: like area
			nb: INTEGER
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				nb := end_index - start_index + 1
				create a.make_empty (nb + 1)
				a.copy_data (area, area_lower + start_index - 1, 0, nb)
				a.extend ('%/000/')
				create Result.make_from_area_and_bounds (a, 0, nb)
			else
				Result := empty_string
			end
		end

	shared_substring (start_index, end_index: INTEGER_32): like Current
			-- <Precursor>
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				create Result.make_from_area_and_bounds (area, area_lower + start_index - 1, end_index - start_index + 1)
			else
				Result := empty_string
			end
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

	is_empty: BOOLEAN
			-- Is structure empty?
		do
			Result := count = 0
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER_32): IMMUTABLE_STRING_32
			-- <Precursor>
		do
			create Result.make (n)
		end

	empty_string: IMMUTABLE_STRING_32
			-- Shared empty immutable string
		once
			create Result.make (0)
		ensure
			empty_string_not_void: Result /= Void
			empty_string_empty: Result.is_empty
		end

feature {READABLE_STRING_8, READABLE_STRING_32} -- Implementation

	area_lower: INTEGER;
			-- Index where current string starts in `area'

feature -- Transformation

	correct_mismatch
			-- Attempt to correct object mismatch during retrieve using `mismatch_information'.
		do
				-- In .NET, we have a mismatch that is triggered due to the implementation of
				-- SPECIAL [CHARACTER_32] as a .NET array of UInt16.
			if area = Void and then attached {like area} mismatch_information.item ("area") as l_area then
				area := l_area
			end
		end

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
