note
	description: "[
		Sequences of immutable 8-bit characters, accessible through integer indices
		in a contiguous range.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen class
	IMMUTABLE_STRING_8

inherit
	READABLE_STRING_8
		undefine
			is_immutable
		redefine
			copy, area_lower
		end

	IMMUTABLE_STRING_GENERAL
		rename
			ends_with as ends_with_general,
			has as character_32_has,
			index_of as character_32_index_of,
			is_case_insensitive_equal as is_case_insensitive_equal_general,
			item as character_32_item,
			last_index_of as character_32_last_index_of,
			occurrences as character_32_occurrences,
			plus as plus_general,
			same_caseless_characters as same_caseless_characters_general,
			same_characters as same_characters_general,
			same_string as same_string_general,
			starts_with as starts_with_general
		undefine
			is_equal, out, copy
		end

create
	make,
	make_empty,
	make_filled,
	make_from_string,
	make_from_c,
	make_from_c_substring,
	make_from_c_byte_array,
	make_from_cil,
	make_from_separate

create {IMMUTABLE_STRING_8}
	make_from_area_and_bounds

convert
	make_from_string ({READABLE_STRING_8, STRING_8}),
	make_from_cil ({SYSTEM_STRING}),
	to_cil: {SYSTEM_STRING},
	as_readable_string_32: {READABLE_STRING_32},
	as_string_32: {STRING_32},
	as_string_8: {STRING_8}

feature {NONE} -- Initialization

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
				dotnet_convertor.read_system_string_into_area_8 (a_system_string, area)
				count := l_count
			end
		end

feature {IMMUTABLE_STRING_8} -- Duplication

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

	item alias "[]", at alias "@" (i: INTEGER): CHARACTER_8
			-- Character at position `i'.
		do
			Result := area.item (i + area_lower - 1)
		end

	character_32_item (i: INTEGER): CHARACTER_32
			-- Character at position `i'.
		do
			Result := area.item (i + area_lower - 1).to_character_32
		end

	code (i: INTEGER): NATURAL_32
			-- Numeric code of character at position `i'.
		do
			Result := area.item (i + area_lower - 1).natural_32_code
		end

	item_code (i: INTEGER): INTEGER
			-- Numeric code of character at position `i'.
			-- Use `code' instead for consistency with Unicode handling.
			--| Not obsolete because old code using just ASCII is safe.
		do
			Result := area.item (i + area_lower - 1).code
		end

feature -- Basic operations

	plus alias "+" (s: READABLE_STRING_8): like Current
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
			a, a_8: like area
			i, j, nb: INTEGER
			l_s32_area: SPECIAL [CHARACTER_32]
		do
			if attached {READABLE_STRING_8} s as l_s8 then
				Result := plus (l_s8)
			else
				create a.make_empty (count + s.count + 1)
				a.copy_data (area, area_lower, 0, count)
				if attached {READABLE_STRING_32} s as l_s32 then
					create a_8.make_empty (l_s32.count + 1)
					from
						i := 0
						j := l_s32.area_lower
						l_s32_area := l_s32.area
						nb := l_s32.count - 1
					until
						i > nb
					loop
						a_8.extend (l_s32_area [j].to_character_8)
						i := i + 1
						j := j + 1
					end
					a_8.extend ('%/000/')
					a.copy_data (a_8, 0, count, nb + 2)
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

	is_empty: BOOLEAN
			-- Is structure empty?
		do
			Result := count = 0
		end

	linear_representation: LINEAR [CHARACTER_8]
			-- Representation as a linear structure
		local
			temp: ARRAYED_LIST [CHARACTER_8]
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

feature {NONE} -- Implementation

	new_string (n: INTEGER_32): IMMUTABLE_STRING_8
			-- <Precursor>
		do
			create Result.make (n)
		end

	empty_string: IMMUTABLE_STRING_8
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
