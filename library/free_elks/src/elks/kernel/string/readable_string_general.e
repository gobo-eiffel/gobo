note
	description: "Common ancestors to all STRING classes. Read-only interface."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READABLE_STRING_GENERAL

inherit
	COMPARABLE
		export
			{READABLE_STRING_GENERAL} copy, standard_copy, deep_copy
		end

	HASHABLE
		export
			{READABLE_STRING_GENERAL} copy, standard_copy, deep_copy
		undefine
			is_equal
		end

	STRING_HANDLER
		export
			{READABLE_STRING_GENERAL} copy, standard_copy, deep_copy
		undefine
			is_equal
		end

convert
	as_string_32: {READABLE_STRING_32, STRING_32}

feature {NONE} -- Initialization

	make (n: INTEGER)
		require
			non_negative_size: n >= 0
		deferred
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

feature -- Access

	code (i: INTEGER): NATURAL_32
			-- Code at position `i'
		require
			valid_index: valid_index (i)
		deferred
		end

	item alias "[]" (i: INTEGER): CHARACTER_32
			-- Character at position `i'.
		require
			valid_index: valid_index (i)
		deferred
		end

	index_of (c: like item; start_index: INTEGER): INTEGER
			-- Position of first occurrence of `c' at or after `start_index';
			-- 0 if none.
		require
			start_large_enough: start_index >= 1
			start_small_enough: start_index <= count + 1
		local
			i, nb: INTEGER
		do
			nb := count
			if start_index <= nb then
				from
					i := start_index
				until
					i > nb or else item (i) = c
				loop
					i := i + 1
				end
				if i <= nb then
					Result := i
				end
			end
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has (c)
			found_if_present: substring (start_index, count).has (c) implies item (Result) = c
			none_before: substring (start_index, count).has (c) implies
				not substring (start_index, Result - 1).has (c)
		end

	last_index_of (c: like item; start_index_from_end: INTEGER): INTEGER
			-- Position of last occurrence of `c'.
			-- 0 if none.
		require
			start_index_small_enough: start_index_from_end <= count
			start_index_large_enough: start_index_from_end >= 1
		do
			from
				Result := start_index_from_end
			until
				Result <= 0 or else item (Result) = c
			loop
				Result := Result - 1
			end
		ensure
			valid_result: 0 <= Result and Result <= start_index_from_end
			zero_if_absent: (Result = 0) = not substring (1, start_index_from_end).has (c)
			found_if_present: substring (1, start_index_from_end).has (c) implies item (Result) = c
			none_after: substring (1, start_index_from_end).has (c) implies
				not substring (Result + 1, start_index_from_end).has (c)
		end

	index_of_code (c: like code; start_index: INTEGER): INTEGER
			-- Position of first occurrence of `c' at or after `start_index';
			-- 0 if none.
		require
			start_large_enough: start_index >= 1
			start_small_enough: start_index <= count + 1
		local
			i, nb: INTEGER
		do
			nb := count
			if start_index <= nb then
				from
					i := start_index
				until
					i > nb or else code (i) = c
				loop
					i := i + 1
				end
				if i <= nb then
					Result := i
				end
			end
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has_code (c)
			found_if_present: substring (start_index, count).has_code (c) implies code (Result) = c
			none_before: substring (start_index, count).has_code (c) implies
				not substring (start_index, Result - 1).has_code (c)
		end

	last_index_of_code (c: like code; start_index_from_end: INTEGER): INTEGER
			-- Position of last occurrence of `c'.
			-- 0 if none.
		require
			start_index_small_enough: start_index_from_end <= count
			start_index_large_enough: start_index_from_end >= 1
		do
			from
				Result := start_index_from_end
			until
				Result <= 0 or else code (Result) = c
			loop
				Result := Result - 1
			end
		ensure
			valid_result: 0 <= Result and Result <= start_index_from_end
			zero_if_absent: (Result = 0) = not substring (1, start_index_from_end).has_code (c)
			found_if_present: substring (1, start_index_from_end).has_code (c) implies code (Result) = c
			none_after: substring (1, start_index_from_end).has_code (c) implies
				not substring (Result + 1, start_index_from_end).has_code (c)
		end

	false_constant: STRING_8 = "false"
			-- Constant string "false"

	true_constant: STRING_8 = "true"
			-- Constant string "true"

	hash_code: INTEGER
			-- Hash code value
		local
			i, nb: INTEGER
		do
			Result := internal_hash_code
			if Result = 0 then
					-- The magic number `8388593' below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				from
					i := 1
					nb := count
				until
					i > nb
				loop
					Result := ((Result \\ 8388593) |<< 8) + item (i).code
					i := i + 1
				end
				internal_hash_code := Result
			end
		end

	case_insensitive_hash_code: INTEGER
			-- Hash code value of the lower case version of `Current'.
		local
			l_props: like character_properties
			i, nb: INTEGER
		do
			Result := internal_case_insensitive_hash_code
			if Result = 0 then
					-- The magic number `8388593' below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				from
					i := 1
					nb := count
					l_props := character_properties
				until
					i > nb
				loop
					Result := ((Result \\ 8388593) |<< 8) + l_props.to_lower (item (i)).code
					i := i + 1
				end
				internal_case_insensitive_hash_code := Result
			end
		ensure
			consistent: Result = as_lower.case_insensitive_hash_code
		end

feature -- Status report

	is_immutable: BOOLEAN
			-- Can the character sequence of `Current' be not changed?
		do
			Result := False
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of the string?
		do
			Result := (i > 0) and (i <= count)
		ensure
			definition: Result = (1 <= i and i <= count)
		end

	valid_code (v: like code): BOOLEAN
			-- Is `v' a valid code for Current?
		deferred
		end

	is_string_8: BOOLEAN
			-- Is `Current' a sequence of CHARACTER_8?
		deferred
		end

	is_string_32: BOOLEAN
			-- Is `Current' a sequence of CHARACTER_32?
		deferred
		end

	is_valid_as_string_8: BOOLEAN
			-- Is `Current' convertible to a sequence of CHARACTER_8 without information loss?
		deferred
		end

	is_empty: BOOLEAN
			-- Is structure empty?
		deferred
		end

	is_whitespace: BOOLEAN
			-- Is structure containing only whitespace characters?
		do
			Result := is_substring_whitespace (1, count)
		end

	is_substring_whitespace (start_index, end_index: INTEGER): BOOLEAN
			-- Is substring between `start_index' and `end_index' containing only whitespace characters?
		require
			start_index_big_enough: 1 <= start_index
			end_index_small_enough: end_index <= count
			consistent_indexes: start_index - 1 <= end_index
		deferred
		end

	has (c: like item): BOOLEAN
			-- Does string include `c'?
		local
			i, nb: INTEGER
		do
			nb := count
			if nb > 0 then
				from
					i := 1
				until
					i > nb or else (item (i) = c)
				loop
					i := i + 1
				end
				Result := i <= nb
			end
		ensure then
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item (1) = c implies Result
			recurse: (count > 0 and then item (1) /= c) implies
				(Result = substring (2, count).has (c))
		end

	has_code (c: like code): BOOLEAN
			-- Does string include `c'?
		local
			i, nb: INTEGER
		do
			nb := count
			if nb > 0 then
				from
					i := 1
				until
					i > nb or else (code (i) = c)
				loop
					i := i + 1
				end
				Result := i <= nb
			end
		ensure then
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then code (1) = c implies Result
			recurse: (count > 0 and then code (1) /= c) implies
				(Result = substring (2, count).has_code (c))
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

	is_real, is_real_32: BOOLEAN
			-- Does `Current' represent a REAL_32?
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
				--	by an instance of type REAL_32.
		end

	is_double, is_real_64: BOOLEAN
			-- Does `Current' represent a REAL_64?
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
				--	by an instance of type REAL_64.
		end

	is_boolean: BOOLEAN
			-- Does `Current' represent a BOOLEAN?
		deferred
		ensure
			is_boolean: Result = (true_constant.same_string_general (as_lower) or
				false_constant.same_string_general (as_lower))
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

feature -- Measurement

	count: INTEGER
			-- Number of characters in Current
		deferred
		ensure
			count_non_negative: Result >= 0
		end

	capacity: INTEGER
			-- Number of characters allocated in Current
		deferred
		ensure
			capacity_non_negative: Result >= 0
		end

	occurrences (c: CHARACTER_32): INTEGER
			-- Number of times `c' appears in the string
		local
			i, nb: INTEGER
		do
			nb := count
			if nb > 0 then
				from
					i := 1
				until
					i > nb
				loop
					if item (i) = c then
						Result := Result + 1
					end
					i := i + 1
				end
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

feature -- Comparison

	is_case_insensitive_equal (other: READABLE_STRING_GENERAL): BOOLEAN
			-- Is string made of same character sequence as `other' regardless of casing
			-- (possibly with a different capacity)?
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
			valid_result: as_lower ~ other.as_lower implies Result
		end

 	same_caseless_characters (other: READABLE_STRING_GENERAL; start_pos, end_pos, index_pos: INTEGER): BOOLEAN
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
			c1,c2: like item
		do
			nb := end_pos - start_pos + 1
			if nb <= count - index_pos + 1 then
				from
					l_prop := character_properties
					Result := True
					i := index_pos
					j := start_pos
					nb := nb + i
				until
					i = nb
				loop
					c1 := item (i)
					c2 := other.item (j)
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

	has_substring (other: READABLE_STRING_GENERAL): BOOLEAN
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

	same_string (other: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `other' represent the same string as `Current'?
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
		end

 	same_characters (other: READABLE_STRING_GENERAL; start_pos, end_pos, index_pos: INTEGER): BOOLEAN
			-- Are characters of `other' within bounds `start_pos' and `end_pos'
			-- identical to characters of current string starting at index `index_pos'.
		require
			other_not_void: other /= Void
			valid_start_pos: other.valid_index (start_pos)
			valid_end_pos: other.valid_index (end_pos)
			valid_bounds: (start_pos <= end_pos) or (start_pos = end_pos + 1)
			valid_index_pos: valid_index (index_pos)
		local
			i, j, nb: INTEGER
		do
			nb := end_pos - start_pos + 1
			if nb <= count - index_pos + 1 then
				from
					Result := True
					i := index_pos
					j := start_pos
					nb := nb + i
				until
					i = nb
				loop
					if item (i) /= other.item (j) then
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
			same_characters: Result = substring (index_pos, index_pos + end_pos - start_pos).same_string (other.substring (start_pos, end_pos))
		end

	starts_with (s: READABLE_STRING_GENERAL): BOOLEAN
			-- Does string begin with `s'?
		require
			argument_not_void: s /= Void
		local
			i: INTEGER
		do
			if Current = s then
				Result := True
			else
				i := s.count
				if i <= count then
					from
						Result := True
					until
						i = 0
					loop
						if code (i) /= s.code (i) then
							Result := False
							i := 1 -- Jump out of loop
						end
						i := i - 1
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (1, s.count))
		end

	ends_with (s: READABLE_STRING_GENERAL): BOOLEAN
			-- Does string finish with `s'?
		require
			argument_not_void: s /= Void
		local
			i, j: INTEGER
		do
			if Current = s then
				Result := True
			else
				i := s.count
				j := count
				if i <= j then
					from
						Result := True
					until
						i = 0
					loop
						if code(j) /= s.code (i) then
							Result := False
							i := 1 -- Jump out of loop
						end
						i := i - 1
						j := j - 1
					end
				end
			end
		ensure
			definition: Result = s.same_string (substring (count - s.count + 1, count))
		end

	substring_index_in_bounds (other: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
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
		deferred
		ensure
			correct_place: Result > 0 implies other.same_string (substring (Result, Result + other.count - 1))
			-- forall x : start_pos..Result
			--	not substring (x, x+other.count -1).is_equal (other)
		end

	substring_index (other: READABLE_STRING_GENERAL; start_index: INTEGER): INTEGER
			-- Index of first occurrence of other at or after start_index;
			-- 0 if none
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		deferred
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

	fuzzy_index (other: READABLE_STRING_GENERAL; start: INTEGER; fuzz: INTEGER): INTEGER
			-- Position of first occurrence of `other' at or after `start'
			-- with 0..`fuzz' mismatches between the string and `other'.
			-- 0 if there are no fuzzy matches
		require
			other_exists: other /= Void
			other_not_empty: not other.is_empty
			start_large_enough: start >= 1
			start_small_enough: start <= count
			acceptable_fuzzy: fuzz <= other.count
		deferred
		end

feature -- Conversion

	frozen to_cil: SYSTEM_STRING
			-- Create an instance of SYSTEM_STRING using characters
			-- of Current between indices `1' and `count'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		do
			Result := dotnet_convertor.from_string_to_system_string (Current)
		ensure
			to_cil_not_void: Result /= Void
		end

	to_string_8: STRING_8
			-- Convert `Current' as a STRING_8.
		require
			is_valid_as_string_8: is_valid_as_string_8
		local
			i, nb: INTEGER
		do
			if attached {STRING_8} Current as s then
				Result := s
			else
				nb := count
				create Result.make (nb)
				Result.set_count (nb)
				from
					i := 1
				until
					i > nb
				loop
					check from_precondition: Result.valid_code (code (i)) end
					Result.put_code (code (i), i)
					i := i + 1
				end
			end
		ensure
			as_string_8_not_void: Result /= Void
			identity: (conforms_to ("") and Result = Current) or (not conforms_to ("") and Result /= Current)
		end

	as_string_8_conversion: STRING_8
			-- Equivalent to `as_string_8' with a different name.
			-- To be used for migrating existing code to Unicode
			-- when you get a compiler error but cannot or do not have
			-- the time yet to address the target recipient of the string to be
			-- a READABLE_STRING_32 or descendants.
		obsolete
			"Update recipient of call to use READABLE_STRING_32 and descendants instead. [2017-05-31]"
		do
			Result := as_string_8
		end

	as_readable_string_8: READABLE_STRING_8
			-- Convert `Current` as a READABLE_STRING_8. If a code of `Current` is
			-- not a valid code for a READABLE_STRING_8 it is replaced with the null
			-- character.
		obsolete
			"Use explicit conversion `to_string_8' with a test that the string is made of ASCII characters only. [2017-05-31]"
		do
			Result := as_string_8
		end

	as_string_8: STRING_8
			-- Convert `Current' as a STRING_8. If a code of `Current' is
			-- not a valid code for a STRING_8 it is replaced with the null
			-- character.
		obsolete
			"[
				For 32-bit strings:
					- use explicit conversion `to_string_8` with a test that the string is made of ASCII characters only.
				For 8-bit strings:
					- consider changing the type of reattachmanet target to READABLE_STRING_8 or
					- use explicit conversion `to_string_8` to avoid implicit performance penalty.
				[2019-11-30]
			]"
		local
			i, nb: INTEGER
			l_code: like code
		do
			if attached {STRING_8} Current as l_result then
				Result := l_result
			else
				nb := count
				create Result.make (nb)
				Result.set_count (nb)
				from
					i := 1
				until
					i > nb
				loop
					l_code := code (i)
					if Result.valid_code (l_code) then
						Result.put_code (l_code, i)
					else
						Result.put_code (0, i)
					end
					i := i + 1
				end
			end
		ensure
			as_string_8_not_void: Result /= Void
			identity: (conforms_to ("") and Result = Current) or (not conforms_to ("") and Result /= Current)
		end

	as_string_32_conversion: STRING_32
			-- Equivalent to `as_string_32' with a different name.
			-- To be used for migrating existing code to Unicode
			-- when you get a compiler error but cannot or do not have
			-- the time yet to address the source of the string to be
			-- a READABLE_STRING_32 or descendants.
		obsolete
			"Update target of call to use READABLE_STRING_32 and descendants instead. [2017-05-31]"
		do
			Result := as_string_32
		end

	as_readable_string_32: READABLE_STRING_32
			-- Equivalent to `as_string_32` with a different name.
		obsolete
			"Use explicit conversion `to_string_32`, or, better use READABLE_STRING_32 and descendants instead. [2017-05-31]"
		do
			Result := as_string_32
		end

	as_string_32, to_string_32: STRING_32
			-- Convert `Current' as a STRING_32.
		local
			i, nb: INTEGER
		do
			if attached {STRING_32} Current as l_result then
				Result := l_result
			else
				nb := count
				create Result.make (nb)
				Result.set_count (nb)
				from
					i := 1
				until
					i > nb
				loop
					Result.put_code (code (i), i)
					i := i + 1
				end
			end
		ensure
			as_string_32_not_void: Result /= Void
			identity: (conforms_to (create {STRING_32}.make_empty) and Result = Current) or (not conforms_to (create {STRING_32}.make_empty) and Result /= Current)
		end

	as_lower: like Current
			-- New object with all letters in lower case.
		deferred
		ensure
			as_lower_attached: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_lower
			recurse: count > 1 implies Result.substring (2, count) ~ substring (2, count).as_lower
		end

	as_upper: like Current
			-- New object with all letters in upper case
		deferred
		ensure
			as_upper_attached: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = item (1).as_upper
			recurse: count > 1 implies Result.substring (2, count) ~ substring (2, count).as_upper
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

	to_real, to_real_32: REAL_32
			-- Real value;
			-- for example, when applied to "123.0", will yield 123.0
		require
			represents_a_real: is_real
		do
			Result := to_double.truncated_to_real
		end

	to_double, to_real_64: REAL_64
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
			to_boolean: (Result = as_lower.same_string (true_constant)) or
				(not Result = as_lower.same_string (false_constant))
		end

	split (a_separator: CHARACTER_32): LIST [like Current]
			-- Split on `a_separator'.
		local
			l_list: ARRAYED_LIST [like Current]
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
					l_list.extend (substring (i, j - 1))
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

feature -- Element change

	plus alias "+" (s: READABLE_STRING_GENERAL): like Current
			-- Concatenation of the current string with `s`.
		obsolete "Use `plus` on sized variants of string classes. [2020-05-31]"
		require
			argument_not_void: s /= Void
			compatible_strings: is_string_8 implies s.is_valid_as_string_8
		deferred
		ensure
			plus_not_void: Result /= Void
			new_count: Result.count = count + s.count
			initial: elks_checking implies Result.substring (1, count) ~ Current
			final: elks_checking implies Result.substring (count + 1, count + s.count).same_string (s)
		end

feature -- Duplication

	substring (start_index, end_index: INTEGER): like Current
			-- Copy of substring containing all characters at indices
			-- between `start_index' and `end_index'
		deferred
		ensure
			substring_not_void: Result /= Void
			substring_count: Result.count = end_index - start_index + 1 or Result.count = 0
			first_code: Result.count > 0 implies Result.item (1) = item (start_index)
			recurse: Result.count > 0 implies
				Result.substring (2, Result.count) ~ substring (start_index + 1, end_index)
		end

	head (n: INTEGER): like Current
			-- Prefix, retaining first `n' characters (or as many as available).
		require
			non_negative_argument: n >= 0
		do
			if n > count then
				Result := twin
			else
				Result := substring (1, n)
			end
		ensure
			same_count: count = old count
			new_count: Result.count = n.min (count)
		end

	tail (n: INTEGER): like Current
			-- Suffix, retaining last `n' characters (or as many as available).
		require
			non_negative_argument: n >= 0
		do
			if n > count then
				Result := twin
			else
				Result := substring (count - n + 1, count)
			end
		ensure
			same_count: count = old count
			new_count: Result.count = n.min (count)
		end

feature {NONE} -- Assertion helper

	elks_checking: BOOLEAN = False
			-- Are ELKS checkings verified? Must be True when changing implementation of STRING_GENERAL or descendant.

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

	string_searcher: STRING_SEARCHER
			-- Facilities to search string in another string.
		deferred
		ensure
			string_searcher_not_void: Result /= Void
		end

	c_string_provider: C_STRING
			-- To create Eiffel strings from C string.
		once
			create Result.make_empty (0)
		ensure
			c_string_provider_not_void: Result /= Void
		end

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR
			-- Convertor used to convert string to integer or natural
		once
			create Result.make
			Result.set_leading_separators (" ")
			Result.set_trailing_separators (" ")
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (True)
		ensure
			ctoi_convertor_not_void: Result /= Void
		end

	ctor_convertor: STRING_TO_REAL_CONVERTOR
			-- Convertor used to convert string to real or double
		once
			create Result.make
			Result.set_leading_separators (" ")
			Result.set_trailing_separators (" ")
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (True)
		ensure
			ctor_convertor_not_void: Result /= Void
		end

	dotnet_convertor: SYSTEM_STRING_FACTORY
			-- Convertor used to convert from and to SYSTEM_STRING.
		once
			create Result
		ensure
			dotnet_convertor_not_void: Result /= Void
		end

	character_properties: CHARACTER_PROPERTY
			-- Access to Unicode character properties
		once
			create Result.make
		end

feature {READABLE_STRING_GENERAL} -- Implementation

	internal_hash_code: INTEGER
			-- Cache for `hash_code'.

	internal_case_insensitive_hash_code: INTEGER;
			-- Cash for `case_insensitive_hash_code'.

feature -- Access: Cursor

	new_character_32_cursor: STRING_ITERATION_CURSOR
			-- Fresh cursor for this string that iterates over code points (see `code')
			-- exposed as {CHARACTER_32}.
		do
			create Result.make (Current)
			Result.start
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
