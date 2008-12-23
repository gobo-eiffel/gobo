indexing
	description: "[
		Sequences of immutable 32-bit characters, accessible through integer indices
		in a contiguous range.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	IMMUTABLE_STRING_32

inherit
	READABLE_STRING_32
		undefine
			is_immutable
		end

	IMMUTABLE_STRING_GENERAL
		rename
			same_string as same_string_general
		undefine
			is_equal, out, copy
		end

create
	make,
	make_empty,
	make_filled,
	make_from_string,
	make_from_string_8,
	make_from_c,
	make_from_cil

create {IMMUTABLE_STRING_32}
	make_from_area_and_count

convert
	to_cil: {SYSTEM_STRING},
	make_from_cil ({SYSTEM_STRING}),
	make_from_string_8 ({READABLE_STRING_8, IMMUTABLE_STRING_8, STRING_8})

feature {NONE} -- Initialization

	make_from_string_8 (s: READABLE_STRING_8)
			-- Initialize from the characters of `s'.
		require
			s_attached: s /= Void
		local
			a: like area
			s_area: SPECIAL [CHARACTER_8]
			i: INTEGER
		do
			create a.make (s.count + 1)
			from
				i := s.count - 1
				s_area := s.area
			until
				i < 0
			loop
				a [i] := s_area [i]
				i := i - 1
			end
			area := a
			count := s.count
		end

	make_from_area_and_count (a: like area; n: like count)
			-- Initialize current with area `a' and count `n'.
		require
			a_not_void: a /= Void
			a_valid_count: a.count >= count + 1
			n_non_negative: n >= 0
		do
			area := a
			count := n
		ensure
			area_set: area = a
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

feature -- Elment change

	plus alias "+" (s: READABLE_STRING_32): like Current
			-- <Precursor>
		local
			a: like area
		do
			create a.make (count + s.count + 1)
			a.copy_data (area, 0, 0, count)
			a.copy_data (s.area, 0, count, s.count)
			create Result.make_from_area_and_count (a, count + s.count)
		end

	mirrored: like Current
			-- <Precursor>
		local
			a: like area
		do
			a := area.twin
			mirror_area (a, 0, count - 1)
			create Result.make_from_area_and_count (a, count)
		end

	as_lower: like Current
			-- <Precursor>
		local
			a: like area
		do
			a := area.twin
			to_lower_area (a, 0, count - 1)
			create Result.make_from_area_and_count (a, count)
		end

	as_upper: like Current
			-- <Precursor>
		local
			a: like area
		do
			a := area.twin
			to_upper_area (a, 0, count - 1)
			create Result.make_from_area_and_count (a, count)
		end

	new_string (n: INTEGER_32): like Current
			-- <Precursor>
		do
			create Result.make (n)
		end

	substring (start_index, end_index: INTEGER_32): like Current
			-- <Precursor>
		local
			a: like area
		do
			if (1 <= start_index) and (start_index <= end_index) and (end_index <= count) then
				create a.make (end_index - start_index + 2)
				a.copy_data (area, start_index - 1, 0, end_index - start_index + 1)
				create Result.make_from_area_and_count (a, end_index - start_index + 1)
			else
				Result := new_string (0)
			end
		end

	is_empty: BOOLEAN
			-- Is structure empty?
		do
			Result := count = 0
		end

end
