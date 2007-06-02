indexing
	description: "[
		Sequences of characters, accessible through integer indices
		in a contiguous range.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_8

inherit
	STRING_GENERAL
		rename
			append as append_string_general
		redefine
			copy, is_equal, out, append_string_general
		end

	INDEXABLE [CHARACTER, INTEGER]
		rename
			item as item
		redefine
			copy, is_equal, out, prune_all,
			changeable_comparison_criterion
		end

	RESIZABLE [CHARACTER]
		redefine
			copy, is_equal, out,
			changeable_comparison_criterion
		end

	TO_SPECIAL [CHARACTER]
		rename
			item as item
		redefine
			copy, is_equal, out,
			item, infix "@", put, valid_index
		end

	MISMATCH_CORRECTOR
		redefine
			copy, is_equal, out, correct_mismatch
		end

create
	make,
	make_empty,
	make_filled,
	make_from_string,
	make_from_c,
	make_from_cil

convert
	to_cil: {SYSTEM_STRING},
	as_string_32: {STRING_32},
	make_from_cil ({SYSTEM_STRING})

feature -- Initialization

	make (n: INTEGER) is
			-- Allocate space for at least `n' characters.
		require
			non_negative_size: n >= 0
		do
			count := 0
			internal_hash_code := 0
			make_area (n + 1)
		ensure
			empty_string: count = 0
			area_allocated: capacity >= n
		end

	make_empty is
			-- Create empty string.
		do
			make (0)
		ensure
			empty: count = 0
			area_allocated: capacity >= 0
		end

	make_filled (c: CHARACTER; n: INTEGER) is
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

	make_from_string (s: STRING) is
			-- Initialize from the characters of `s'.
			-- (Useful in proper descendants of class STRING,
			-- to initialize a string-like object from a manifest string.)
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

	make_from_c (c_string: POINTER) is
			-- Initialize from contents of `c_string',
			-- a string created by some C function
		require
			c_string_exists: c_string /= default_pointer
		local
			l_count: INTEGER
		do
			if area = Void then
				c_string_provider.share_from_pointer (c_string)
				l_count := c_string_provider.count
				make_area (l_count + 1)
				count := l_count
				internal_hash_code := 0
				c_string_provider.read_string_into (Current)
			else
				from_c (c_string)
			end
		end

	make_from_cil (a_system_string: SYSTEM_STRING) is
			-- Initialize Current with `a_system_string'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		local
			l_count: INTEGER
		do
			if a_system_string /= Void then
				l_count := a_system_string.length
				make_area (l_count + 1)
				count := l_count
				internal_hash_code := 0
				dotnet_convertor.read_system_string_into (a_system_string, Current)
			else
				make (0)
			end
		end

	from_c (c_string: POINTER) is
			-- Reset contents of string from contents of `c_string',
			-- a string created by some C function.
		require
			c_string_exists: c_string /= default_pointer
		local
			l_count: INTEGER
		do
			c_string_provider.share_from_pointer (c_string)
				-- Resize string in case it is not big enough
			l_count := c_string_provider.count
			resize (l_count + 1)
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

	from_c_substring (c_string: POINTER; start_pos, end_pos: INTEGER) is
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
			c_string_provider.share_from_pointer_and_count (c_string + (start_pos - 1), l_count)
				-- Resize string in case it is not big enough
			resize (l_count + 1)
			count := l_count
			internal_hash_code := 0
			c_string_provider.read_substring_into (Current, 1, l_count)
		ensure
			valid_count: count = end_pos - start_pos + 1
			-- characters: for all i in 1..count, item (i) equals
			--			 ASCII character at address c_string + (i - 1)
		end

	adapt (s: STRING): like Current is
			-- Object of a type conforming to the type of `s',
			-- initialized with attributes from `s'
		do
			Result := new_string (0)
			Result.share (s)
		ensure
			adapt_not_void: Result /= Void
			shared_implementation: Result.shared_with (s)
		end

	remake (n: INTEGER) is
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

	item, infix "@" (i: INTEGER): CHARACTER assign put is
			-- Character at position `i'
		do
			Result := area.item (i - 1)
		end


	code (i: INTEGER): NATURAL_32 is
			-- Numeric code of character at position `i'
		do
			Result := area.item (i - 1).code.to_natural_32
		end

	item_code (i: INTEGER): INTEGER is
			-- Numeric code of character at position `i'
		require
			index_small_enough: i <= count
			index_large_enough: i > 0
		do
			Result := area.item (i - 1).code
		end

	hash_code: INTEGER is
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

	false_constant: STRING is "false"
			-- Constant string "false"

	true_constant: STRING is "true"
			-- Constant string "true"

	shared_with (other: STRING): BOOLEAN is
			-- Does string share the text of `other'?
		do
			Result := (other /= Void) and then (area = other.area)
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
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

	last_index_of (c: CHARACTER; start_index_from_end: INTEGER): INTEGER is
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

	substring_index_in_bounds (other: STRING; start_pos, end_pos: INTEGER): INTEGER is
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

	string: STRING_8 is
			-- New STRING having same character sequence as `Current'.
		do
			create Result.make (count)
			Result.append (Current)
		ensure
			string_not_void: Result /= Void
			string_type: Result.same_type (create {STRING_8}.make_empty)
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count).is_equal (
				substring (2, count).string)
		end

	string_representation: STRING_8 is
			-- Similar to `string' but only create a new object if `Current' is not of dynamic type {STRING_8}
		do
			if same_type (create {STRING_8}.make_empty) then
				Result := Current
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

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
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

	fuzzy_index (other: STRING; start: INTEGER; fuzz: INTEGER): INTEGER is
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

	capacity: INTEGER is
			-- Allocated space
		do
			Result := area.count - 1
		end

	count: INTEGER
			-- Actual number of characters making up the string

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times `c' appears in the string
		local
			i, nb: INTEGER
			a: SPECIAL [CHARACTER]
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

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure then
			Result.count = count
		end

feature -- Comparison

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

	is_case_insensitive_equal (other: like Current): BOOLEAN is
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

	same_string (other: STRING): BOOLEAN is
			-- Do `Current' and `other' have same character sequence?
		require
			other_not_void: other /= Void
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
		ensure
			definition: Result = string.is_equal (other.string)
		end

	infix "<" (other: like Current): BOOLEAN is
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

	is_string_8: BOOLEAN is True
			-- Current is a STRING_8 instance

	is_string_32: BOOLEAN is False
			-- Current is a not STRING_32 instance

	is_valid_as_string_8: BOOLEAN is True
			-- Is `Current' convertible to STRING_8 without information loss?

	has (c: CHARACTER): BOOLEAN is
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

	has_substring (other: STRING): BOOLEAN is
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

	extendible: BOOLEAN is True
			-- May new items be added? (Answer: yes.)

	prunable: BOOLEAN is
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of the string?
		do
			Result := (i > 0) and (i <= count)
		end

	valid_code (v: NATURAL_32): BOOLEAN is
			-- Is `v' a valid code for a CHARACTER_32?
		do
			Result := v <= {CHARACTER}.max_value.to_natural_32
		end

	changeable_comparison_criterion: BOOLEAN is False

	is_number_sequence: BOOLEAN is
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

	is_real: BOOLEAN is
			-- Does `Current' represent a REAL?
		do
			Result := is_double
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

	is_double: BOOLEAN is
			-- Does `Current' represent a DOUBLE?
		do
			ctor_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_double)
			Result := ctor_convertor.is_integral_double
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

	is_boolean: BOOLEAN is
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

	is_integer_8: BOOLEAN is
			-- Does `Current' represent an INTEGER_8?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_8)
		end

	is_integer_16: BOOLEAN is
			-- Does `Current' represent an INTEGER_16?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_16)
		end

	is_integer, is_integer_32: BOOLEAN is
			-- Does `Current' represent an INTEGER?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_32)
		end

	is_integer_64: BOOLEAN is
			-- Does `Current' represent an INTEGER_64?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_integer_64)
		end

	is_natural_8: BOOLEAN is
			-- Does `Current' represent a NATURAL_8?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_8)
		end

	is_natural_16: BOOLEAN is
			-- Does `Current' represent a NATURAL_16?

		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_16)
		end

	is_natural, is_natural_32: BOOLEAN is
			-- Does `Current' represent a NATURAL_32?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_32)
		end

	is_natural_64: BOOLEAN is
			-- Does `Current' represent a NATURAL_64?
		do
			Result := is_valid_integer_or_natural ({NUMERIC_INFORMATION}.type_natural_64)
		end

feature -- Element change

	set (t: like Current; n1, n2: INTEGER) is
			-- Set current string to substring of `t' from indices `n1'
			-- to `n2', or to empty string if no such substring.
		require
			argument_not_void: t /= Void
		local
			s: STRING
		do
			s := t.substring (n1, n2)
			area := s.area
			count := s.count
			internal_hash_code := 0
		ensure
			is_substring: is_equal (t.substring (n1, n2))
		end

	copy (other: like Current) is
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

	subcopy (other: like Current; start_pos, end_pos, index_pos: INTEGER) is
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
				internal_hash_code := 0
			end
		ensure
			same_count: count = old count
			copied: elks_checking implies
				(is_equal (old substring (1, index_pos - 1) +
				old other.substring (start_pos, end_pos) +
				old substring (index_pos + (end_pos - start_pos + 1), count)))
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER) is
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
			l_area.copy_data (s.area, 0, start_index - 1, s_count)
		ensure
			new_count: count = old count + old s.count - end_index + start_index - 1
			replaced: elks_checking implies
				(is_equal (old (substring (1, start_index - 1) +
					s + substring (end_index + 1, count))))
		end

	replace_substring_all (original, new: like Current) is
			-- Replace every occurrence of `original' with `new'.
		require
			original_exists: original /= Void
			new_exists: new /= Void
			original_not_empty: not original.is_empty
		local
			l_first_pos, l_next_pos: INTEGER
			l_orig_count, l_new_count, l_count: INTEGER
			l_area, l_new_area: like area
			l_offset: INTEGER
			l_string_searcher: like string_searcher
		do
			if not is_empty then
				l_count := count
				l_string_searcher := string_searcher
				l_string_searcher.initialize_deltas (original)
				l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, 1, l_count)
				if l_first_pos > 0 then
					l_orig_count := original.count
					l_new_count := new.count
					if l_orig_count = l_new_count then
							-- String will not be resized, simply perform character substitution
						from
							l_area := area
							l_new_area := new.area
						until
							l_first_pos = 0
						loop
							l_area.copy_data (l_new_area, 0, l_first_pos - 1, l_new_count)
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
						until
							l_next_pos = 0
						loop
								-- Copy new string into Current
							l_area.copy_data (l_new_area, 0, l_first_pos - 1 - l_offset, l_new_count)
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
						l_area.copy_data (l_new_area, 0, l_first_pos - 1 - l_offset, l_new_count)
							-- Shift characters between `l_first_pos' and the end of the string
						l_area.overlapping_move (l_first_pos + l_orig_count - 1,
							l_first_pos + l_new_count - 1 - l_offset, l_count + 1 - l_first_pos - l_orig_count)
								-- Perform last substitution
						l_offset := l_offset + (l_orig_count - l_new_count)

							-- Update `count'
						set_count (l_count - l_offset)
					else
							-- Optimization is harder as we don't know how many times we need to resize
							-- the string. For now, we do like we did in our previous implementation
						from
						until
							l_first_pos = 0
						loop
							replace_substring (new, l_first_pos, l_first_pos + l_orig_count - 1)
							l_count := count
							if l_first_pos + l_new_count <= l_count then
								l_first_pos := l_string_searcher.substring_index_with_deltas (Current, original, l_first_pos + l_new_count, l_count)
							else
								l_first_pos := 0
							end
						end
					end
					internal_hash_code := 0
				end
			end
		end

	replace_blank is
			-- Replace all current characters with blanks.
		do
			fill_with (' ')
		ensure
			same_size: (count = old count) and (capacity >= old capacity)
			all_blank: elks_checking implies occurrences (' ') = count
		end

	fill_blank is
			-- Fill with `capacity' blank characters.
		do
			fill_character (' ')
		ensure
			filled: full
			same_size: (count = capacity) and (capacity = old capacity)
			-- all_blank: For every `i' in `count'..`capacity', `item' (`i') = `Blank'
		end

	fill_with (c: CHARACTER) is
			-- Replace every character with `c'.
		local
			l_count: INTEGER
		do
			l_count := count
			if l_count /= 0 then
				area.fill_with (c, 0, count - 1)
				internal_hash_code := 0
			end
		ensure
			same_count: (count = old count) and (capacity >= old capacity)
			filled: elks_checking implies occurrences (c) = count
		end

	replace_character (c: CHARACTER) is
			-- Replace every character with `c'.
		obsolete
			"ELKS 2001: use `fill_with' instead'"
		do
			fill_with (c)
		ensure
			same_count: (count = old count) and (capacity >= old capacity)
			filled: elks_checking implies occurrences (c) = count
		end

	fill_character (c: CHARACTER) is
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
			filled: full
			same_size: (count = capacity) and (capacity = old capacity)
			-- all_char: For every `i' in 1..`capacity', `item' (`i') = `c'
		end

	head (n: INTEGER) is
			-- Remove all characters except for the first `n';
			-- do nothing if `n' >= `count'.
		obsolete
			"ELKS 2001: use `keep_head' instead'"
		require
			non_negative_argument: n >= 0
		do
			keep_head (n)
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies is_equal (old substring (1, n.min (count)))
		end

	keep_head (n: INTEGER) is
			-- Remove all characters except for the first `n';
			-- do nothing if `n' >= `count'.
		require
			non_negative_argument: n >= 0
		do
			if n < count then
				count := n
				internal_hash_code := 0
			end
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies is_equal (old substring (1, n.min (count)))
		end

	tail (n: INTEGER) is
			-- Remove all characters except for the last `n';
			-- do nothing if `n' >= `count'.
		obsolete
			"ELKS 2001: use `keep_tail' instead'"
		require
			non_negative_argument: n >= 0
		do
			keep_tail (n)
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies is_equal (old substring (count - n.min(count) + 1, count))
		end

	keep_tail (n: INTEGER) is
			-- Remove all characters except for the last `n';
			-- do nothing if `n' >= `count'.
		require
			non_negative_argument: n >= 0
		local
			nb: like count
		do
			nb := count
			if n < nb then
				area.overlapping_move (nb - n, 0, n)
				count := n
				internal_hash_code := 0
			end
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies is_equal (old substring (count - n.min(count) + 1, count))
		end

	left_adjust is
			-- Remove leading whitespace.
		local
			nb, nb_space: INTEGER
			l_area: like area
		do
				-- Compute number of spaces at the left of current string.
			from
				nb := count - 1
				l_area := area
			until
				nb_space > nb or else not l_area.item (nb_space).is_space
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
		ensure
			valid_count: count <= old count
			new_count: not is_empty implies not item (1).is_space
			kept: elks_checking implies is_equal ((old twin).substring (old count - count + 1, old count))
		end

	right_adjust is
			-- Remove trailing whitespace.
		local
			i, nb: INTEGER
			nb_space: INTEGER
			l_area: like area
		do
				-- Compute number of spaces at the right of current string.
			from
				nb := count - 1
				i := nb
				l_area := area
			until
				i < 0 or else not l_area.item (i).is_space
			loop
				nb_space := nb_space + 1
				i := i - 1
			end

			if nb_space > 0 then
					-- Set new count.
				count := nb + 1 - nb_space
				internal_hash_code := 0
			end
		ensure
			valid_count: count <= old count
			new_count: (count /= 0) implies
				((item (count) /= ' ') and
				 (item (count) /= '%T') and
				 (item (count) /= '%R') and
				 (item (count) /= '%N'))
			kept: elks_checking implies is_equal ((old twin).substring (1, count))
		end

	share (other: STRING) is
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

	put (c: CHARACTER; i: INTEGER) is
			-- Replace character at position `i' by `c'.
		do
			area.put (c, i - 1)
			internal_hash_code := 0
		ensure then
			stable_count: count = old count
			stable_before_i: elks_checking implies substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

	put_code (v: NATURAL_32; i: INTEGER) is
			-- Replace character at position `i' by character of code `v'.
		do
			area.put (v.to_character_8, i - 1)
			internal_hash_code := 0
		end

	precede, prepend_character (c: CHARACTER) is
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

	prepend (s: STRING) is
			-- Prepend a copy of `s' at front.
		require
			argument_not_void: s /= Void
		do
			insert_string (s, 1)
		ensure
			new_count: count = old (count + s.count)
			inserted: elks_checking implies string.is_equal (old (s.twin) + old substring (1, count))
		end

	prepend_boolean (b: BOOLEAN) is
			-- Prepend the string representation of `b' at front.
		do
			prepend (b.out)
		end

	prepend_double (d: DOUBLE) is
			-- Prepend the string representation of `d' at front.
		do
			prepend (d.out)
		end

	prepend_integer (i: INTEGER) is
			-- Prepend the string representation of `i' at front.
		do
			prepend (i.out)
		end

	prepend_real (r: REAL) is
			-- Prepend the string representation of `r' at front.
		do
			prepend (r.out)
		end

	prepend_string (s: STRING) is
			-- Prepend a copy of `s', if not void, at front.
		do
			if s /= Void then
				prepend (s)
			end
		end

	append_string_general (s: STRING_GENERAL) is
			-- Append a copy of `s' at end.
		local
			l_s8: STRING
		do
			if same_type (s) then
				l_s8 ?= s
				append (l_s8)
			else
				Precursor {STRING_GENERAL} (s)
			end
		end

	append (s: STRING) is
			-- Append a copy of `s' at end.
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
				area.copy_data (s.area, 0, l_count, l_s_count)
				count := l_new_size
				internal_hash_code := 0
			end
		ensure
			new_count: count = old count + old s.count
			appended: elks_checking implies is_equal (old twin + old s.twin)
		end

	infix "+" (s: STRING): like Current is
			-- Append a copy of 's' at the end of a copy of Current,
			-- Then return the Result.
		require
			argument_not_void: s /= Void
		do
			Result := new_string (count + s.count)
			Result.append (Current)
			Result.append (s)
		ensure
			Result_exists: Result /= Void
			new_count: Result.count = count + s.count
			initial: elks_checking implies Result.substring (1, count).is_equal (Current)
			final: elks_checking implies Result.substring (count + 1, count + s.count).same_string (s)
		end

	append_string (s: STRING) is
			-- Append a copy of `s', if not void, at end.
		do
			if s /= Void then
				append (s)
			end
		ensure
			appended: s /= Void implies
				(elks_checking implies is_equal (old twin + old s.twin))
		end

	append_integer (i: INTEGER) is
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_integer_8 (i: INTEGER_8) is
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_8
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_integer_16 (i: INTEGER_16) is
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_16
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_integer_64 (i: INTEGER_64) is
			-- Append the string representation of `i' at end.
		local
			l_value: INTEGER_64
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_natural_8 (i: NATURAL_8) is
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_8
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_natural_16 (i: NATURAL_16) is
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_16
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_natural_32 (i: NATURAL_32) is
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_32
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_natural_64 (i: NATURAL_64) is
			-- Append the string representation of `i' at end.
		local
			l_value: NATURAL_64
			l_starting_index, l_ending_index: INTEGER
			l_temp: CHARACTER
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
					append_character (((l_value \\ 10)+ 48).to_character_8)
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

	append_real (r: REAL) is
			-- Append the string representation of `r' at end.
		do
			append (r.out)
		end

	append_double (d: DOUBLE) is
			-- Append the string representation of `d' at end.
		do
			append (d.out)
		end

	append_character, extend (c: CHARACTER) is
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
			stable_before: elks_checking implies substring (1, count - 1).is_equal (old twin)
		end

	append_boolean (b: BOOLEAN) is
			-- Append the string representation of `b' at end.
		do
			append (b.out)
		end

	insert (s: STRING; i: INTEGER) is
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
				(is_equal (old substring (1, i - 1) + old (s.twin) + old substring (i, count)))
		end

	insert_string (s: STRING; i: INTEGER) is
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
				l_area.copy_data (s.area, 0, pos, l_s_count)

				count := new_size
				internal_hash_code := 0
			end
		ensure
			inserted: elks_checking implies
				(is_equal (old substring (1, i - 1) + old (s.twin) + old substring (i, count)))
		end

	insert_character (c: CHARACTER; i: INTEGER) is
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
			stable_before_i: elks_checking implies substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count).is_equal (old substring (i, count))
		end

feature -- Removal

	remove (i: INTEGER) is
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

	remove_head (n: INTEGER) is
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
			removed: elks_checking implies is_equal (old substring (n.min (count) + 1, count))
		end

	remove_substring (start_index, end_index: INTEGER) is
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
			end
		ensure
			removed: elks_checking implies
				is_equal (old substring (1, start_index - 1) + old substring (end_index + 1, count))
		end

	remove_tail (n: INTEGER) is
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
			removed: elks_checking implies is_equal (old substring (1, count - n.min (count)))
		end

	prune (c: CHARACTER) is
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

	prune_all (c: CHARACTER) is
			-- Remove all occurrences of `c'.
		require else
			True
		local
			i, j, nb: INTEGER
			l_area: like area
			l_char: CHARACTER
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

	prune_all_leading (c: CHARACTER) is
			-- Remove all leading occurrences of `c'.
		do
			from
			until
				is_empty or else item (1) /= c
			loop
				remove (1)
			end
		end

	prune_all_trailing (c: CHARACTER) is
			-- Remove all trailing occurrences of `c'.
		do
			from
			until
				is_empty or else item (count) /= c
			loop
				remove (count)
			end
		end

	wipe_out is
			-- Remove all characters.
		do
			create area.make (1)
			count := 0
			internal_hash_code := 0
		ensure then
			is_empty: count = 0
			empty_capacity: capacity = 0
		end

	clear_all is
			-- Reset all characters.
		do
			count := 0
			internal_hash_code := 0
		ensure
			is_empty: count = 0
			same_capacity: capacity = old capacity
		end

feature -- Resizing

	adapt_size is
			-- Adapt the size to accommodate `count' characters.
		do
			resize (count)
		end

	resize (newsize: INTEGER) is
			-- Rearrange string so that it can accommodate
			-- at least `newsize' characters.
			-- Do not lose any previously entered character.
		local
			area_count: INTEGER
		do
			area_count := area.count
			if newsize >= area_count then
				area := area.aliased_resized_area (newsize + 1)
			end
		end

	grow (newsize: INTEGER) is
			-- Ensure that the capacity is at least `newsize'.
		do
			if newsize > capacity then
				resize (newsize)
			end
		end

feature -- Conversion

	as_lower: like Current is
			-- New object with all letters in lower case.
		do
			Result := twin
			Result.to_lower
		ensure
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_lower
			recurse: count > 1 implies Result.substring (2, count).
				is_equal (substring (2, count).as_lower)
		end

	as_upper: like Current is
			-- New object with all letters in upper case
		do
			Result := twin
			Result.to_upper
		ensure
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_upper
			recurse: count > 1 implies Result.substring (2, count).
				is_equal (substring (2, count).as_upper)
		end

	left_justify is
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

	center_justify is
			-- Center justify Current using `count' as width.
		local
			i, nb, l_offset: INTEGER
			left_nb_space, right_nb_space: INTEGER
			l_area: like area
		do
				-- Compute number of spaces at the left of current string.
			from
				nb := count
				l_area := area
			until
				left_nb_space = nb or else not l_area.item (left_nb_space).is_space
			loop
				left_nb_space := left_nb_space + 1
			end

				-- Compute number of spaces at the right of current string.
			from
				i := nb - 1
				l_area := area
			until
				i = -1 or else not l_area.item (i).is_space
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

	right_justify is
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
				variant
					i + 1
				until
					i = 0
				loop
					i := i - 1
					l_area.put (l_area.item (i), i + nb_space)
				end

					-- Fill left part with spaces.
				from
				variant
					nb_space + 1
				until
					nb_space = 0
				loop
					nb_space := nb_space - 1
					l_area.put (' ', nb_space)
				end
					-- Restore `count'
				count := nb
				internal_hash_code := 0
			end
		ensure
			same_count: count = old count
		end

	character_justify (pivot: CHARACTER; position: INTEGER) is
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

	to_lower is
			-- Convert to lower case.
		local
			i: INTEGER
			a: like area
		do
			from
				i := count - 1
				a := area
			until
				i < 0
			loop
				a.put (a.item (i).lower, i)
				i := i - 1
			end
			internal_hash_code := 0
		ensure
			length_end_content: elks_checking implies is_equal (old as_lower)
		end

	to_upper is
			-- Convert to upper case.
		local
			i: INTEGER
			a: like area
		do
			from
				i := count - 1
				a := area
			until
				i < 0
			loop
				a.put (a.item (i).upper, i)
				i := i - 1
			end
			internal_hash_code := 0
		ensure
			length_end_content: elks_checking implies is_equal (old as_upper)
		end

	to_integer_8: INTEGER_8 is
			-- 8-bit integer value
		require
			is_integer_8: is_integer_8
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_integer_8)
			Result := ctoi_convertor.parsed_integer_8
		end

	to_integer_16: INTEGER_16 is
			-- 16-bit integer value
		require
			is_integer_16: is_integer_16
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_integer_16)
			Result := ctoi_convertor.parsed_integer_16
		end

	to_integer, to_integer_32: INTEGER is
			-- 32-bit integer value
		require
			is_integer: is_integer_32
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_integer_32)
			Result := ctoi_convertor.parsed_integer
		end

	to_integer_64: INTEGER_64 is
			-- 64-bit integer value
		require
			is_integer_64: is_integer_64
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_integer_64)
			Result := ctoi_convertor.parsed_integer_64
		end

	to_natural_8: NATURAL_8 is
			-- 8-bit natural value
		require
			is_natural_8: is_natural_8
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_natural_8)
			Result := ctoi_convertor.parsed_natural_8
		end

	to_natural_16: NATURAL_16 is
			-- 16-bit natural value
		require
			is_natural_16: is_natural_16
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_natural_16)
			Result := ctoi_convertor.parsed_natural_16
		end

	to_natural, to_natural_32: NATURAL_32 is
			-- 32-bit natural value
		require
			is_natural: is_natural
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_natural_32)
			Result := ctoi_convertor.parsed_natural_32
		end

	to_natural_64: NATURAL_64 is
			-- 64-bit natural value
		require
			is_natural_64: is_natural_64
		do
			ctoi_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_natural_64)
			Result := ctoi_convertor.parsed_natural_64
		end

	to_real: REAL is
			-- Real value;
			-- for example, when applied to "123.0", will yield 123.0
		require
			represents_a_real: is_real
		do
			Result := to_double
		end

	to_double: DOUBLE is
			-- "Double" value;
			-- for example, when applied to "123.0", will yield 123.0 (double)
		require
			represents_a_double: is_double
		do
			ctor_convertor.parse_string_with_type (Current, {NUMERIC_INFORMATION}.type_double)
			Result := ctor_convertor.parsed_double
		end

	to_boolean: BOOLEAN is
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

	linear_representation: LINEAR [CHARACTER] is
			-- Representation as a linear structure
		local
			temp: ARRAYED_LIST [CHARACTER]
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

	split (a_separator: CHARACTER): LIST [STRING] is
			-- Split on `a_separator'.
		local
			l_list: ARRAYED_LIST [STRING]
			part: STRING
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
					l_list.extend ("")
				end
			else
					-- Extend empty string, since Current is empty.
				l_list.extend ("")
			end
			Result := l_list
			check
				l_list.count = occurrences (a_separator) + 1
			end
		ensure
			Result /= Void
		end

	frozen to_c: ANY is
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

	mirrored: like Current is
			-- Mirror image of string;
			-- Result for "Hello world" is "dlrow olleH".
		do
			Result := twin
			if count > 0 then
				Result.mirror
			end
		ensure
			same_count: Result.count = count
			-- reversed: For every `i' in 1..`count', `Result'.`item' (`i') = `item' (`count'+1-`i')
		end

	mirror is
			-- Reverse the order of characters.
			-- "Hello world" -> "dlrow olleH".
		local
			a: like area
			c: CHARACTER
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

	substring (start_index, end_index: INTEGER): like Current is
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

	multiply (n: INTEGER) is
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

feature -- Output

	out: STRING is
			-- Printable representation
		do
			create Result.make (count)
			Result.append (Current)
		ensure then
			out_not_void: Result /= Void
			same_items: same_type ("") implies Result.same_string (Current)
		end

feature {STRING_HANDLER} -- Implementation

	frozen set_count (number: INTEGER) is
			-- Set `count' to `number' of characters.
		do
			count := number
			internal_hash_code := 0
		end

feature {NONE} -- Empty string implementation

	internal_hash_code: INTEGER
			-- Computed hash-code.

	frozen set_internal_hash_code (v: like internal_hash_code) is
			-- Set `internal_hash_code' with `v'.
		do
			internal_hash_code := v
		end

feature {NONE} -- Implementation

	new_string (n: INTEGER): like Current is
			-- New instance of current with space for at least `n' characters.
		require
			n_non_negative: n >= 0
		do
			create Result.make (n)
		ensure
			new_string_not_void: Result /= Void
			new_string_empty: Result.is_empty
			new_string_area_big_enough: Result.capacity >= n
		end

feature -- Transformation

	correct_mismatch is
			-- Attempt to correct object mismatch during retrieve using `mismatch_information'.
		do
			-- Nothing to be done because we only added `internal_hash_code' that will
			-- be recomputed next time we query `hash_code'.
		end

feature {NONE} -- Implementation

	is_valid_integer_or_natural (type: INTEGER) : BOOLEAN is
			-- Is `Current' a valid number according to given `type'?
		do
			ctoi_convertor.reset (type)
			ctoi_convertor.parse_string_with_type (Current, type)
			Result := ctoi_convertor.is_integral_integer
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

	empty_area: SPECIAL [CHARACTER] is
			-- Empty `area' to avoid useless creation of empty areas when wiping out a STRING.
		obsolete
			"Simply create `area' directly."
		do
			create Result.make (1)
		ensure
			empty_area_not_void: Result /= Void
		end

invariant
	extendible: extendible
	compare_character: not object_comparison
	index_set_has_same_count: index_set.count = count
	area_not_void: area /= Void

end
