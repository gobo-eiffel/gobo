indexing
	description: "[
		Sequences of 8-bit characters, accessible through integer indices
		in a contiguous range. Read-only interface.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READABLE_STRING_8

inherit
	READABLE_STRING_GENERAL
		rename
			same_string as same_string_general
		redefine
			copy, is_equal, out
		end

convert
	to_cil: {SYSTEM_STRING},
	as_string_8: {STRING_8},
	as_string_32: {READABLE_STRING_32, STRING_32}

feature {NONE} -- Initialization

	make (n: INTEGER)
			-- Allocate space for at least `n' characters.
		require
			non_negative_size: n >= 0
		do
			count := 0
			internal_hash_code := 0
			create area.make (n + 1)
		ensure
			empty_string: count = 0
			area_allocated: capacity >= n
		end

	make_empty
			-- Create empty string.
		do
			make (0)
		ensure
			empty: count = 0
			area_allocated: capacity >= 0
		end

	make_filled (c: CHARACTER_8; n: INTEGER)
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

	make_from_string (s: READABLE_STRING_8)
			-- Initialize from the characters of `s'.
		require
			string_exists: s /= Void
		do
			if Current /= s then
				area := s.area.twin
				count := s.count
				internal_hash_code := 0
			end
		ensure
			not_shared_implementation: Current /= s implies not shared_with (s)
			initialized: same_string (s)
		end

	make_from_c (c_string: POINTER)
			-- Initialize from contents of `c_string',
			-- a string created by some C function
		require
			c_string_exists: c_string /= default_pointer
		local
			l_count: INTEGER
		do
			c_string_provider.share_from_pointer (c_string)
			l_count := c_string_provider.count
			if area = Void then
				create area.make (l_count + 1)
			elseif l_count >= area.count then
				area := area.aliased_resized_area (l_count + 1)
			end
			count := l_count
			internal_hash_code := 0
			c_string_provider.read_substring_into_character_8_area (area, 1, l_count)
		end

	make_from_cil (a_system_string: SYSTEM_STRING)
			-- Initialize Current with `a_system_string'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		deferred
		end

feature -- Access

	item, infix "@" (i: INTEGER): CHARACTER_8
			-- Character at position `i'
		do
			Result := area.item (i - 1)
		end

	code (i: INTEGER): NATURAL_32
			-- Numeric code of character at position `i'
		do
			Result := area.item (i - 1).code.to_natural_32
		end

	item_code (i: INTEGER): INTEGER
			-- Numeric code of character at position `i'
		require
			index_small_enough: i <= count
			index_large_enough: i > 0
		do
			Result := area.item (i - 1).code
		end

	hash_code: INTEGER
			-- Hash code value
		local
			i, nb: INTEGER
			l_area: like area
		do
			Result := internal_hash_code
			if Result = 0 then
					-- The magic number `8388593' below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				from
					i := 0
					nb := count
					l_area := area
				until
					i = nb
				loop
					Result := ((Result \\ 8388593) |<< 8) + l_area.item (i).code
					i := i + 1
				end
				internal_hash_code := Result
			end
		end

	false_constant: STRING_8 = "false"
			-- Constant string "false"

	true_constant: STRING_8 = "true"
			-- Constant string "true"

	shared_with (other: READABLE_STRING_8): BOOLEAN
			-- Does string share the text of `other'?
		do
			Result := (other /= Void) and then (area = other.area)
		end

	index_of (c: CHARACTER_8; start_index: INTEGER): INTEGER
			-- Position of first occurrence of `c' at or after `start_index';
			-- 0 if none.
		require
			start_large_enough: start_index >= 1
			start_small_enough: start_index <= count + 1
		local
			a: like area
			i, nb: INTEGER
		do
			nb := count
			if start_index <= nb then
				from
					i := start_index - 1
					a := area
				until
					i = nb or else a.item (i) = c
				loop
					i := i + 1
				end
				if i < nb then
						-- We add +1 due to the area starting at 0 and not at 1.
					Result := i + 1
				end
			end
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has (c)
			found_if_present: substring (start_index, count).has (c) implies item (Result) = c
			none_before: substring (start_index, count).has (c) implies
				not substring (start_index, Result - 1).has (c)
		end

	last_index_of (c: CHARACTER_8; start_index_from_end: INTEGER): INTEGER
			-- Position of last occurrence of `c'.
			-- 0 if none
		require
			start_index_small_enough: start_index_from_end <= count
			start_index_large_enough: start_index_from_end >= 1
		local
			a: like area
			i: INTEGER
		do
			from
				i := start_index_from_end - 1
				a := area
			until
				i < 0 or else a.item (i) = c
			loop
				i := i - 1
			end
				-- We add +1 due to the area starting at 0 and not at 1.
			Result := i + 1
		ensure
			last_index_of_non_negative: Result >= 0
			correct_place: Result > 0 implies item (Result) = c
			-- forall x : Result..last, item (x) /= c
		end

	substring_index_in_bounds (other: READABLE_STRING_8; start_pos, end_pos: INTEGER): INTEGER
			-- Position of first occurrence of `other' at or after `start_pos'
			-- and to or before `end_pos';
			-- 0 if none.
		require
			other_nonvoid: other /= Void
			other_notempty: not other.is_empty
			start_pos_large_enough: start_pos >= 1
			start_pos_small_enough: start_pos <= count
			end_pos_large_enough: end_pos >= start_pos
			end_pos_small_enough: end_pos <= count
		do
			Result := string_searcher.substring_index (Current, other, start_pos, end_pos)
		ensure
			correct_place: Result > 0 implies
				other.is_equal (substring (Result, Result + other.count - 1))
			-- forall x : start_pos..Result
			--	not substring (x, x+other.count -1).is_equal (other)
		end

	string: STRING_8
			-- New STRING_8 having same character sequence as `Current'.
		do
			create Result.make_from_string (Current)
		ensure
			string_not_void: Result /= Void
			string_type: Result.same_type (create {STRING_8}.make_empty)
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count).is_equal (
				substring (2, count).string)
		end

	string_representation: STRING_8
			-- Similar to `string' but only create a new object if `Current' is not of dynamic type {STRING_8}
		do
			if same_type (create {STRING_8}.make_empty) and then {l_s8: STRING_8} Current then
				Result := l_s8
			else
				Result := string
			end
		ensure
			Result_not_void: Result /= Void
			correct_type: Result.same_type (create {STRING_8}.make_empty)
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count).is_equal (
				substring (2, count).string)
		end

	substring_index (other: READABLE_STRING_8; start_index: INTEGER): INTEGER
			-- Index of first occurrence of other at or after start_index;
			-- 0 if none
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		do
			Result := string_searcher.substring_index (Current, other, start_index, count)
		ensure
			valid_result: Result = 0 or else
				(start_index <= Result and Result <= count - other.count + 1)
			zero_if_absent: (Result = 0) =
				not substring (start_index, count).has_substring (other)
			at_this_index: Result >= start_index implies
				other.same_string (substring (Result, Result + other.count - 1))
			none_before: Result > start_index implies
				not substring (start_index, Result + other.count - 2).has_substring (other)
		end

	fuzzy_index (other: READABLE_STRING_8; start: INTEGER; fuzz: INTEGER): INTEGER
			-- Position of first occurrence of `other' at or after `start'
			-- with 0..`fuzz' mismatches between the string and `other'.
			-- 0 if there are no fuzzy matches
		require
			other_exists: other /= Void
			other_not_empty: not other.is_empty
			start_large_enough: start >= 1
			start_small_enough: start <= count
			acceptable_fuzzy: fuzz <= other.count
		do
			Result := string_searcher.fuzzy_index (Current, other, start, count, fuzz)
		end

feature -- Measurement

	capacity: INTEGER
			-- Allocated space
		do
			Result := area.count - 1
		end

	count: INTEGER
			-- Actual number of characters making up the string

	occurrences (c: CHARACTER_8): INTEGER
			-- Number of times `c' appears in the string
		local
			i, nb: INTEGER
			a: SPECIAL [CHARACTER_8]
		do
			from
				nb := count
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

	index_set: INTEGER_INTERVAL
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure
			index_set_not_void: Result /= Void
			index_set_count: Result.count = count
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
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

	is_case_insensitive_equal (other: like Current): BOOLEAN
			-- Is string made of same character sequence as `other' regardless of casing
			-- (possibly with a different capacity)?
		require
			other_not_void: other /= Void
		local
			l_area, l_other_area: like area
			i, nb: INTEGER
		do
			if other = Current then
				Result := True
			else
				nb := count
				if nb = other.count then
					from
						l_area := area
						l_other_area := other.area
						Result := True
					until
						i = nb
					loop
						if l_area.item (i).as_lower /= l_other_area.item (i).as_lower then
							Result := False
							i := nb - 1 -- Jump out of loop
						end
						i := i + 1
					end
				end
			end
		ensure
			symmetric: Result implies other.is_case_insensitive_equal (Current)
			consistent: standard_is_equal (other) implies Result
			valid_result: as_lower.is_equal (other.as_lower) implies Result
		end

	same_string (other: READABLE_STRING_8): BOOLEAN is
			-- Do `Current' and `other' have same character sequence?
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif other.count = count then
				if same_type (other) then
					Result := area.same_items (other.area, 0, 0, count)
				else
					Result := same_string_general (other)
				end
			end
		ensure
			definition: Result = string.is_equal (other.string)
		end

	infix "<" (other: like Current): BOOLEAN
			-- Is string lexicographically lower than `other'?
		local
			other_count: INTEGER
			current_count: INTEGER
		do
			if other /= Current then
				other_count := other.count
				current_count := count
				if other_count = current_count then
					Result := str_strict_cmp (other.area, area, other_count) > 0
				else
					if current_count < other_count then
						Result := str_strict_cmp (other.area, area, current_count) >= 0
					else
						Result := str_strict_cmp (other.area, area, other_count) > 0
					end
				end
			end
		end

feature -- Status report

	is_string_8: BOOLEAN = True
			-- <Precursor>

	is_string_32: BOOLEAN = False
			-- <Precursor>

	is_valid_as_string_8: BOOLEAN = True
			-- <Precursor>

	has (c: CHARACTER_8): BOOLEAN
			-- Does string include `c'?
		local
			i, nb: INTEGER
			l_area: like area
		do
			nb := count
			if nb > 0 then
				from
					l_area := area
				until
					i = nb or else (l_area.item (i) = c)
				loop
					i := i + 1
				end
				Result := (i < nb)
			end
		ensure then
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item (1) = c implies Result
			recurse: (count > 0 and then item (1) /= c) implies
				(Result = substring (2, count).has (c))
		end

	has_substring (other: READABLE_STRING_8): BOOLEAN
			-- Does `Current' contain `other'?
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif other.count <= count then
				Result := substring_index (other, 1) > 0
			end
		ensure
			false_if_too_small: count < other.count implies not Result
			true_if_initial: (count >= other.count and then
				other.same_string (substring (1, other.count))) implies Result
			recurse: (count >= other.count and then
				not other.same_string (substring (1, other.count))) implies
				(Result = substring (2, count).has_substring (other))
		end

	starts_with (s: READABLE_STRING_8): BOOLEAN
			-- Does string begin with `s'?
		require
			argument_not_void: s /= Void
		local
			i: INTEGER
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
						Result := True
					until
						i = 0 or not Result
					loop
						i := i - 1
						Result := l_area.item (i) = l_s_area.item (i)
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (1, s.count))
		end

	ends_with (s: READABLE_STRING_8): BOOLEAN
			-- Does string finish with `s'?
		require
			argument_not_void: s /= Void
		local
			i, j: INTEGER
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
						Result := True
					until
						i = 0 or not Result
					loop
						i := i - 1
						j := j - 1
						Result := l_area.item (j) = l_s_area.item (i)
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (count - s.count + 1, count))
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of the string?
		do
			Result := (i > 0) and (i <= count)
		ensure then
			definition: Result = (1 <= i and i <= count)
		end

	valid_code (v: NATURAL_32): BOOLEAN
			-- Is `v' a valid code for a CHARACTER_32?
		do
			Result := v <= {CHARACTER_8}.max_value.to_natural_32
		end

	is_number_sequence: BOOLEAN
			-- Does `Current' represent a number sequence?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_no_limitation)
		ensure
			syntax_and_range:
				-- Result is true if and only if the following two
				-- conditions are satisfied:
				--
				-- In the following BNF grammar, the value of
				--	Current can be produced by "Integer_literal":
				--
				-- Integer_literal = [Space] [Sign] Integer [Space]
				-- Space 	= " " | " " Space
				-- Sign		= "+" | "-"
				-- Integer	= Digit | Digit Integer
				-- Digit	= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
		end

	is_real_sequence: BOOLEAN
			-- Does `Current' represent a real sequence?
		local
			l_convertor: like ctor_convertor
		do
			l_convertor := ctor_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.is_integral_double
		ensure
			syntax_and_range:
				-- 'Result' is True if and only if the following condition is satisfied:
				--
				-- In the following BNF grammar, the value of
				--	'Current' can be produced by "Real_literal":
				--
				-- Real_literal	= Mantissa [Exponent_part]
				-- Exponent_part = "E" Exponent
				--				 | "e" Exponent
				-- Exponent		= Integer_literal
				-- Mantissa		= Decimal_literal
				-- Decimal_literal = Integer_literal ["." [Integer]] | "." Integer
				-- Integer_literal = [Sign] Integer
				-- Sign			= "+" | "-"
				-- Integer		= Digit | Digit Integer
				-- Digit		= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
				--
		end

	is_real: BOOLEAN
			-- Does `Current' represent a REAL?
		local
			l_convertor: like ctor_convertor
		do
			l_convertor := ctor_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_real)
			Result := l_convertor.is_integral_real
		ensure
			syntax_and_range:
				-- 'Result' is True if and only if the following two
				-- conditions are satisfied:
				--
				-- 1. In the following BNF grammar, the value of
				--	'Current' can be produced by "Real_literal":
				--
				-- Real_literal	= Mantissa [Exponent_part]
				-- Exponent_part = "E" Exponent
				--				 | "e" Exponent
				-- Exponent		= Integer_literal
				-- Mantissa		= Decimal_literal
				-- Decimal_literal = Integer_literal ["." [Integer]] | "." Integer
				-- Integer_literal = [Sign] Integer
				-- Sign			= "+" | "-"
				-- Integer		= Digit | Digit Integer
				-- Digit		= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
				--
				-- 2. The numerical value represented by 'Current'
				--	is within the range that can be represented
				--	by an instance of type REAL.
		end

	is_double: BOOLEAN
			-- Does `Current' represent a DOUBLE?
		local
			l_convertor: like ctor_convertor
		do
			l_convertor := ctor_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_double)
			Result := l_convertor.is_integral_double
		ensure
			syntax_and_range:
				-- 'Result' is True if and only if the following two
				-- conditions are satisfied:
				--
				-- 1. In the following BNF grammar, the value of
				--	'Current' can be produced by "Real_literal":
				--
				-- Real_literal	= Mantissa [Exponent_part]
				-- Exponent_part = "E" Exponent
				--				 | "e" Exponent
				-- Exponent		= Integer_literal
				-- Mantissa		= Decimal_literal
				-- Decimal_literal = Integer_literal ["." [Integer]] | "." Integer
				-- Integer_literal = [Sign] Integer
				-- Sign			= "+" | "-"
				-- Integer		= Digit | Digit Integer
				-- Digit		= "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
				--
				-- 2. The numerical value represented by 'Current'
				--	is within the range that can be represented
				--	by an instance of type DOUBLE.
		end

	is_boolean: BOOLEAN
			-- Does `Current' represent a BOOLEAN?
		local
			nb: INTEGER
			l_area: like area
		do
			nb := count
			if nb = 4 then
					-- Check if this is `true_constant'
				l_area := area
				Result := l_area.item (0).lower = 't' and then
					l_area.item (1).lower = 'r' and then
					l_area.item (2).lower = 'u' and then
					l_area.item (3).lower = 'e'
			elseif nb = 5 then
					-- Check if this is `false_constant'
				l_area := area
				Result := l_area.item (0).lower = 'f' and then
					l_area.item (1).lower = 'a' and then
					l_area.item (2).lower = 'l' and then
					l_area.item (3).lower = 's' and then
					l_area.item (4).lower = 'e'
			end
		ensure
			is_boolean: Result = (true_constant.same_string (as_lower) or false_constant.same_string (as_lower))
		end

	is_integer_8: BOOLEAN
			-- Does `Current' represent an INTEGER_8?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_8)
		end

	is_integer_16: BOOLEAN
			-- Does `Current' represent an INTEGER_16?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_16)
		end

	is_integer, is_integer_32: BOOLEAN
			-- Does `Current' represent an INTEGER_32?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_32)
		end

	is_integer_64: BOOLEAN
			-- Does `Current' represent an INTEGER_64?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_64)
		end

	is_natural_8: BOOLEAN
			-- Does `Current' represent a NATURAL_8?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_8)
		end

	is_natural_16: BOOLEAN
			-- Does `Current' represent a NATURAL_16?

		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_16)
		end

	is_natural, is_natural_32: BOOLEAN
			-- Does `Current' represent a NATURAL_32?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_32)
		end

	is_natural_64: BOOLEAN
			-- Does `Current' represent a NATURAL_64?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_64)
		end

feature {READABLE_STRING_8} -- Duplication

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
				if old_area = Void or else old_area.count <= count then
					area := area.twin
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

feature {NONE} -- Element change

	fill_character (c: CHARACTER_8)
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

feature -- Element change

	infix "+" (s: READABLE_STRING_8): like Current
			-- Append a copy of 's' at the end of a copy of Current,
			-- Then return the Result.
		require
			argument_not_void: s /= Void
		deferred
		ensure
			Result_exists: Result /= Void
			new_count: Result.count = count + s.count
			initial: elks_checking implies Result.substring (1, count).is_equal (Current)
			final: elks_checking implies Result.substring (count + 1, count + s.count).same_string (s)
		end

feature -- Conversion

	as_lower: like Current
			-- New object with all letters in lower case.
		deferred
		ensure
			as_lower_attached: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_lower
			recurse: count > 1 implies Result.substring (2, count).
				is_equal (substring (2, count).as_lower)
		end

	as_upper: like Current
			-- New object with all letters in upper case
		deferred
		ensure
			as_upper_attached: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_upper
			recurse: count > 1 implies Result.substring (2, count).
				is_equal (substring (2, count).as_upper)
		end

	to_integer_8: INTEGER_8
			-- 8-bit integer value
		require
			is_integer_8: is_integer_8
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_integer_8
		end

	to_integer_16: INTEGER_16
			-- 16-bit integer value
		require
			is_integer_16: is_integer_16
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_integer_16
		end

	to_integer, to_integer_32: INTEGER_32
			-- 32-bit integer value
		require
			is_integer: is_integer_32
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_integer
		end

	to_integer_64: INTEGER_64
			-- 64-bit integer value
		require
			is_integer_64: is_integer_64
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_integer_64
		end

	to_natural_8: NATURAL_8
			-- 8-bit natural value
		require
			is_natural_8: is_natural_8
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_natural_8
		end

	to_natural_16: NATURAL_16
			-- 16-bit natural value
		require
			is_natural_16: is_natural_16
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_natural_16
		end

	to_natural, to_natural_32: NATURAL_32
			-- 32-bit natural value
		require
			is_natural: is_natural_32
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_natural_32
		end

	to_natural_64: NATURAL_64
			-- 64-bit natural value
		require
			is_natural_64: is_natural_64
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_natural_64
		end

	to_real: REAL
			-- Real value;
			-- for example, when applied to "123.0", will yield 123.0
		require
			represents_a_real: is_real
		do
			Result := to_double
		end

	to_double: DOUBLE
			-- "Double" value;
			-- for example, when applied to "123.0", will yield 123.0 (double)
		require
			represents_a_double: is_double
		local
			l_convertor: like ctor_convertor
		do
			l_convertor := ctor_convertor
			l_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_double
		end

	to_boolean: BOOLEAN
			-- Boolean value;
			-- "True" yields `True', "False" yields `False'
			-- (case-insensitive)
		require
			is_boolean: is_boolean
		do
			check true_constant.count = 4 end
			if count = 4 then
				Result := True
			end
		ensure
			to_boolean: (Result = true_constant.same_string (as_lower)) or
				(not Result = false_constant.same_string (as_lower))
		end

	split (a_separator: CHARACTER_8): LIST [like Current]
			-- Split on `a_separator'.
		local
			l_list: ARRAYED_LIST [like Current]
			part: like Current
			i, j, c: INTEGER
		do
			c := count
				-- Worse case allocation: every character is a separator
			create l_list.make (c + 1)
			if c > 0 then
				from
					i := 1
				until
					i > c
				loop
					j := index_of (a_separator, i)
					if j = 0 then
							-- No separator was found, we will
							-- simply create a list with a copy of
							-- Current in it.
						j := c + 1
					end
					part := substring (i, j - 1)
					l_list.extend (part)
					i := j + 1
				end
				if j = c then
					check
						last_character_is_a_separator: item (j) = a_separator
					end
						-- A separator was found at the end of the string
					l_list.extend (new_string (0))
				end
			else
					-- Extend empty string, since Current is empty.
				l_list.extend (new_string (0))
			end
			Result := l_list
			check
				l_list.count = occurrences (a_separator) + 1
			end
		ensure
			Result /= Void
		end

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
			-- Copy of substring containing all characters at indices
			-- between `start_index' and `end_index'
		deferred
		end

feature -- Output

	out: STRING
			-- Printable representation
		do
			create Result.make (count)
			Result.append (Current)
		ensure then
			out_not_void: Result /= Void
			same_items: same_type ("") implies Result.same_string (Current)
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current
			-- New instance of current with space for at least `n' characters.
		require
			n_non_negative: n >= 0
		deferred
		ensure
			new_string_not_void: Result /= Void
			new_string_empty: Result.is_empty
			new_string_area_big_enough: Result.capacity >= n
		end

	is_valid_integer_or_natural (type: INTEGER) : BOOLEAN
			-- Is `Current' a valid number according to given `type'?
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.reset (type)
			l_convertor.parse_string_with_type (Current, type)
			Result := l_convertor.is_integral_integer
		end

	str_strict_cmp (this, other: like area; nb: INTEGER): INTEGER
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

	to_lower_area (a: like area; start_index, end_index: INTEGER)
			-- Replace all characters in `a' between `start_index' and `end_index'
			-- with their lower version.
		require
			a_not_void: a /= Void
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < a.count
		local
			i: INTEGER
		do
			from
				i := start_index
			until
				i > end_index
			loop
				a.put (a.item (i).lower, i)
				i := i + 1
			end
		end

	to_upper_area (a: like area; start_index, end_index: INTEGER)
			-- Replace all characters in `a' between `start_index' and `end_index'
			-- with their upper version.
		require
			a_not_void: a /= Void
			start_index_non_negative: start_index >= 0
			start_index_not_too_big: start_index <= end_index + 1
			end_index_valid: end_index < a.count
		local
			i: INTEGER
		do
			from
				i := start_index
			until
				i > end_index
			loop
				a.put (a.item (i).upper, i)
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
			c: CHARACTER_8
			i, j: INTEGER
		do
			from
				i := end_index
			until
				i < start_index
			loop
				c := a.item (i)
				a.put (a.item (j), i)
				a.put (c, j)
				i := i - 1
				j := j + 1
			end
		end

feature {READABLE_STRING_8, READABLE_STRING_32} -- Implementation

	area: SPECIAL [CHARACTER_8]
			-- Storage for characters

invariant
	area_not_void: area /= Void

end
