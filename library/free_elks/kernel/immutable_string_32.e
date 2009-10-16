note
	description: "[
		Sequences of immutable 32-bit characters, accessible through integer indices
		in a contiguous range.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2009-09-29 02:15:54 +0200 (Tue, 29 Sep 2009) $"
	revision: "$Revision: 379 $"

class
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
			same_string as same_string_general,
			plus as plus_string_general
		undefine
			is_equal, out, copy
		end

create
	make,
	make_empty,
	make_filled,
	make_from_string,
	make_from_string_8,
	make_from_string_32,
	make_from_c,
	make_from_cil

create {IMMUTABLE_STRING_32}
	make_from_area_and_bounds

convert
	to_cil: {SYSTEM_STRING},
	make_from_cil ({SYSTEM_STRING}),
	make_from_string_8 ({READABLE_STRING_8, IMMUTABLE_STRING_8, STRING_8}),
	make_from_string_32 ({READABLE_STRING_32, STRING_32}),
	as_string_32: {STRING_32}

feature {NONE} -- Initialization

	make_from_string_8 (s: READABLE_STRING_8)
			-- Initialize from the characters of `s'.
		require
			s_attached: s /= Void
		local
			a: like area
			s_area: SPECIAL [CHARACTER_8]
			i, j, nb: INTEGER
		do
			create a.make (s.count + 1)
			from
				i := 0
				j := s.area_lower
				s_area := s.area
				nb := s.count - 1
			until
				i > nb
			loop
				a [i] := s_area [j]
				i := i + 1
				j := j + 1
			end
			make_from_area_and_bounds (a, 0, s.count)
		end

	make_from_string_32 (s: READABLE_STRING_32)
			-- Initialize from the characters of `s'.
		require
			s_attached: s /= Void
		local
			a: like area
			s_area: SPECIAL [CHARACTER_32]
			i, j, nb: INTEGER
		do
			area := s.area
			if same_type (s) then
				area_lower := s.area_lower
			else
				create a.make (s.count + 1)
				from
					i := 0
					j := s.area_lower
					s_area := s.area
					nb := s.count - 1
				until
					i > nb
				loop
					a [i] := s_area [j]
					i := i + 1
					j := j + 1
				end
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
				l_count := a_system_string.length
			end
			make (l_count)
			if l_count > 0 then
				dotnet_convertor.read_system_string_into_area_32 (a_system_string, area)
			end
		end

feature {IMMUTABLE_STRING_32} -- Duplication

	copy (other: like Current)
			-- <Precursor>
		do
				-- Because it is immutable we can simply share the `area' from `other'.
			standard_copy (other)
		ensure then
			new_result_count: count = other.count
			-- same_characters: For every `i' in 1..`count', `item' (`i') = `other'.`item' (`i')
		end

feature -- Element change

	plus alias "+" (s: READABLE_STRING_32): like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make (count + s.count + 1)
			a.copy_data (area, area_lower, 0, count)
			a.copy_data (s.area, s.area_lower, count, s.count)
			create Result.make_from_area_and_bounds (a, 0, count + s.count)
		end

	plus_string_general (s: READABLE_STRING_GENERAL): like Current
			-- <Precursor>
		local
			a, a_32: like area
			l_s8_area: SPECIAL [CHARACTER_8]
			i, j, nb: INTEGER
		do
			create a.make (count + s.count + 1)
			a.copy_data (area, area_lower, 0, count)
			if attached {READABLE_STRING_32} s as l_s32 then
				a.copy_data (l_s32.area, l_s32.area_lower, count, l_s32.count + 1)
			elseif attached {READABLE_STRING_8} s as l_s8 then
				create a_32.make (l_s8.count + 1)
				from
					i := 0
					j := l_s8.area_lower
					l_s8_area := l_s8.area
					nb := l_s8.count - 1
				until
					i > nb
				loop
					a_32.put (l_s8_area [j], i)
					i := i + 1
					j := j + 1
				end
				a_32.put ('%/000/', i)
				a.copy_data (a_32, 0, count, nb + 2)
			end
			create Result.make_from_area_and_bounds (a, 0, count + s.count)
		end

	mirrored: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make (count + 1)
			a.copy_data (area, area_lower, 0, count)
			mirror_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	as_lower: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make (count + 1)
			a.copy_data (area, area_lower, 0, count)
			to_lower_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	as_upper: like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make (count + 1)
			a.copy_data (area, area_lower, 0, count)
			to_upper_area (a, 0, count - 1)
			create Result.make_from_area_and_bounds (a, 0, count)
		end

	substring (start_index, end_index: INTEGER_32): like Current
			-- <Precursor>
		local
			a: like area
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				create a.make (end_index - start_index + 2)
				a.copy_data (area, area_lower + start_index - 1, 0, end_index - start_index + 1)
				create Result.make_from_area_and_bounds (a, 0, end_index - start_index + 1)
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

	area_lower: INTEGER
			-- Index where current string starts in `area'

end
