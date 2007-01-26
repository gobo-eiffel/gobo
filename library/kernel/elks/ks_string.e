indexing

	description:

		"Portable interface for class STRING"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KS_STRING

inherit

	KS_HASHABLE
		undefine
			is_equal, copy, out
		redefine
				-- Note: VE 4.0 wants `is_equal', `copy' and `out' to be listed
				-- here, but this is a bug since this deferred version should be
				-- merged with the version inherited from KS_COMPARABLE:
			is_equal, copy, out
		end

	KS_COMPARABLE
		undefine
			copy, out
		redefine
			is_equal, copy, out,
			infix "<"
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal, copy, out
		redefine
				-- Note: VE 4.0 wants `is_equal', `copy' and `out' to be listed
				-- here, but this is a bug since this deferred version should be
				-- merged with the version inherited from KS_COMPARABLE:
			is_equal, copy, out
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal, copy, out
		redefine
				-- Note: VE 4.0 wants `is_equal', `copy' and `out' to be listed
				-- here, but this is a bug since this deferred version should be
				-- merged with the version inherited from KS_COMPARABLE:
			is_equal, copy, out
		end

	KL_IMPORTED_CHARACTER_ROUTINES
		undefine
			is_equal, copy, out
		redefine
				-- Note: VE 4.0 wants `is_equal', `copy' and `out' to be listed
				-- here, but this is a bug since this deferred version should be
				-- merged with the version inherited from KS_COMPARABLE:
			is_equal, copy, out
		end

	KL_SHARED_PLATFORM
		undefine
			is_equal, copy, out
		redefine
				-- Note: VE 4.0 wants `is_equal', `copy' and `out' to be listed
				-- here, but this is a bug since this deferred version should be
				-- merged with the version inherited from KS_COMPARABLE:
			is_equal, copy, out
		end

feature -- Initialization

	make (suggested_capacity: INTEGER) is
			-- Create empty string, or remove all characters from
			-- existing string.
			-- (ELKS 2001 STRING)
		require
			non_negative_suggested_capacity: suggested_capacity >= 0
		deferred
		ensure
			empty_string: count = 0
		end

	make_from_string (s: STRING) is
			-- Initialize from the character sequence of `s'.
			-- (ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.make_from_string instead of this
			-- routine when `Current' can be of dynamic type STRING and `s'
			-- of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
		require
			s_not_void: s /= Void
		deferred
		ensure
			initialized: same_string (s)
		end

-- TODO: Not tested yet.
--    from_c (c_string: POINTER)
--       -- Set the current STRING from a copy of the
--       -- zero-byte-terminated memory starting at `c_string'.
--       require
--          c_string_exists: c_string /= default_pointer
--       ensure
--          no_zero_byte: not has('%/0/')
--          characters: -- for all i in 1..count, item(i) equals the
--                      -- ASCII character at address c_string+i-1
--          correct_count: -- the ASCII character at address
--                         -- c_string+count is NUL

feature {NONE} -- Initialization

	make_empty is
			-- Create empty string.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			empty: count = 0
		end

	make_filled (c: CHARACTER; n: INTEGER) is
			-- Create string of length `n' filled with `c'.
			-- (ELKS 2001 STRING)
		require
			valid_count: n >= 0
		deferred
		ensure
			count_set: count = n
			filled: occurrences (c) = count
		end

feature -- Access

	item (i: INTEGER): CHARACTER is
			-- Character at index `i';
			-- '%U' if the character at index `i' cannot fit into a CHARACTER
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use `item_code' instead of this routine when `Current'
			-- can be of dynamic type other than STRING (e.g. UC_STRING) and
			-- its characters may not fit into a CHARACTER.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			code_small_enough: item_code (i) <= Platform.Maximum_character_code implies Result.code = item_code (i)
			overflow: item_code (i) > Platform.Maximum_character_code implies Result = '%U'
		end

	item_code (i: INTEGER): INTEGER is
			-- Code of character at index `i'
		require
			valid_index: valid_index (i)
		deferred
		ensure
			item_code_positive: Result >= 0
		end

	infix "@" (i: INTEGER): CHARACTER is
			-- Character at index `i'
			-- (ELKS 2001 STRING)
		require
			valid_index: valid_index (i)
		deferred
		ensure
			definition: Result = item (i)
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or after `start_index';
			-- 0 if none
			-- (ELKS 2001 STRING)
		require
			valid_start_index: start_index >= 1 and start_index <= count + 1
		deferred
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has (c)
			found_if_present: substring (start_index, count).has (c) implies item (Result) = c
			none_before: substring (start_index, count).has (c) implies not substring (start_index, Result - 1).has (c)
		end

	string: STRING is
			-- New STRING having the same character sequence as `Current'
			-- where characters which do not fit in a CHARACTER are
			-- replaced by a '%U'
			-- (Extended from ELKS 2001 STRING)
		deferred
		ensure
			string_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
			first_item: count > 0 implies Result.item (1) = item (1)
			recurse: count > 1 implies Result.substring (2, count).is_equal (substring (2, count).string)
		end

	substring (start_index, end_index: INTEGER): like Current is
			-- New object containing all characters from `start_index'
			-- to `end_index' inclusive
			-- (ELKS 2001 STRING)
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		deferred
		ensure
			substring_not_void: Result /= Void
			substring_count: Result.count = end_index - start_index + 1
			first_item: Result.count > 0 implies Result.item (1) = item (start_index)
			-- Note: Too time and memory consuming with SE -0.74:
			-- recurse: Result.count > 0 implies Result.substring (2, Result.count).is_equal (substring (start_index + 1, end_index))
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `other' at or after `start_index' in
			-- `a_string'; 0 if none. `a_string' and `other' are considered with
			-- their characters which do not fit in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.substring_index instead of this
			-- routine when `Current' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		deferred
		ensure
			valid_result: Result = 0 or else (start_index <= Result and Result <= count - other.count + 1)
			zero_if_absent: (Result = 0) = not substring (start_index, count).has_substring (other)
			at_this_index: Result >= start_index implies other.same_string (substring (Result, Result + other.count - 1).current_string)
			none_before: Result > start_index implies not substring (start_index, Result + other.count - 2).has_substring (other)
		end

	infix "+" (other: STRING): like Current is
			-- New object which is a clone of `Current' extended
			-- by the characters of `other'
			-- (ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.concat instead of this routine when
			-- `Current' can be of dynamic type STRING and `other' of dynamic
			-- type other than STRING such as UC_STRING, because class STRING
			-- provided by the Eiffel compilers is not necessarily aware of
			-- the implementation of UC_STRING and this may lead to run-time
			-- errors or crashes.
		require
			other_not_void: other /= Void
		deferred
		ensure
			result_not_void: Result /= Void
			result_count: Result.count = count + other.count
			initial: Result.substring (1, count).is_equal (Current)
			final: Result.substring (count + 1, count + other.count).same_string (other)
		end

feature -- Measurement

	count: INTEGER is
			-- Number of characters
			-- (ELKS 2001 STRING)
		deferred
		end

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times `c' appears in the string
			-- (ELKS 2001 STRING)
		deferred
		ensure
			zero_if_empty: count = 0 implies Result = 0
			recurse_if_not_found_at_first_position: (count > 0 and then item (1) /= c) implies
				Result = substring (2, count).occurrences (c)
			recurse_if_found_at_first_position: (count > 0 and then item (1) = c) implies
				Result = 1 + substring (2, count).occurrences (c)
		end

feature -- Status report

	has (c: CHARACTER): BOOLEAN is
			-- Does `Current' contain `c'?
			-- (ELKS 2001 STRING)
		deferred
		ensure
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item (1) = c implies Result
			recurse: (count > 0 and then item (1) /= c) implies (Result = substring (2, count).has (c))
		end

	has_substring (other: STRING): BOOLEAN is
			-- Does `Current' contain `other'?
			-- `other' and `Current' are considered with their characters
			-- which do not fit in a CHARACTER replaced by a '%U'.
			-- (Extented from ELKS 2001 STRING)
			-- Note: Use feature KL_STRING_ROUTINES.has_substring instead of
			-- this routine when `Current' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING,
			-- because class STRING provided by the Eiffel compilers is
			-- not necessarily aware of the implementation of UC_STRING
			-- and this may lead to run-time errors or crashes.
		require
			other_not_void: other /= Void
		deferred
		ensure
			false_if_too_small: count < other.count implies not Result
			true_if_initial: (count >= other.count and then other.same_string (substring (1, other.count).current_string)) implies Result
			recurse: (count >= other.count and then not other.same_string (substring (1, other.count).current_string)) implies (Result = substring (2, count).has_substring (other))
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of the string?
			-- (ELKS 2001 STRING)
		deferred
		ensure
			definition: Result = (1 <= i and i <= count)
		end

	is_empty: BOOLEAN is
			-- Is string empty?
			-- (ELKS 2001 STRING)
		deferred
		ensure
			definition: Result = (count = 0)
		end

-- TODO: Not tested yet.
--	is_boolean: BOOLEAN is
--			-- Does `Current' represent a BOOLEAN?
--			-- (ELKS 2001 STRING)
--		deferred
--		ensure
--			is_boolean: Result = (same_string("true") or same_string("false"))
--		end

-- TODO: Not tested yet.
--	is_integer: BOOLEAN is
--			-- Does `Current' represent an INTEGER?
--			-- (ELKS 2001 STRING)
--		deferred
--		ensure
--			syntax_and_range:
--				-- Result is true if and only if the following two
--				-- conditions are satisfied:
--				--
--				-- 1. In the following BNF grammar, the value of
--				--    `Current' can be produced by "Integer_literal":
--				--
--				-- Integer_literal = [Sign] Integer
--				-- Sign            = "+" | "-"
--				-- Integer         = Digit | Digit Integer
--				-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
--				--
--				-- 2. The integer value represented by `Current'
--				--    is within the (inclusive) range
--				--    minimum_integer..maximum_integer
--				--    where `minimum_integer' and `maximum_integer'
--				--    are the constants defined in class PLATFORM.
--		end

-- TODO: Not tested yet.
--	is_real: BOOLEAN is
--			-- Does `Current' represent a REAL?
--			-- (ELKS 2001 STRING)
--		deferred
--		ensure
--			syntax_and_range:
--				-- Result is true if and only if the following two
--				-- conditions are satisfied:
--				--
--				-- 1. In the following BNF grammar, the value of
--				--    `Current' can be produced by "Real_literal":
--				--
--				-- Real_literal    = Mantissa [Exponent_part]
--				-- Exponent_part   = "E" Exponent
--				--                 | "e" Exponent
--				-- Exponent        = Integer_literal
--				-- Mantissa        = Decimal_literal
--				-- Decimal_literal = Integer_literal ["." Integer]
--				-- Integer_literal = [Sign] Integer
--				-- Sign            = "+" | "-"
--				-- Integer         = Digit | Digit Integer
--				-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
--				--
--				-- 2. The numerical value represented by `Current'
--				--    is within the range that can be represented
--				--    by an instance of type REAL.
--		end

-- TODO: Not tested yet.
--	is_double: BOOLEAN is
--			-- Does `Current' represent a DOUBLE?
--			-- (ELKS 2001 STRING)
--		deferred
--		ensure
--			syntax_and_range:
--				-- Result is true if and only if the following two
--				-- conditions are satisfied:
--				--
--				-- 1. In the following BNF grammar, the value of
--				--    `Current' can be produced by "Real_literal":
--				--
--				-- Real_literal    = Mantissa [Exponent_part]
--				-- Exponent_part   = "E" Exponent
--				--                 | "e" Exponent
--				-- Exponent        = Integer_literal
--				-- Mantissa        = Decimal_literal
--				-- Decimal_literal = Integer_literal ["." Integer]
--				-- Integer_literal = [Sign] Integer
--				-- Sign            = "+" | "-"
--				-- Integer         = Digit | Digit Integer
--				-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
--				--
--				-- 2. The numerical value represented by `Current'
--				--    is within the range that can be represented
--				--    by an instance of type DOUBLE.
--		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered equal
			-- to current object?
			-- (Extended from ELKS 2001 STRING)
		deferred
		ensure then
			-- Note: Definition not necessarily acceptable in proper descendant classes:
			-- definition: Result = (ANY_.same_types (Current, other) and then count = other.count and then
			--   (count > 0 implies (item (1) = other.item (1) and substring (2, count).is_equal (other.substring (2, count)))))
			definition: ANY_.same_types (Current, "") implies
				(Result = (ANY_.same_types (Current, other) and then count = other.count and then
				(count > 0 implies (item (1) = other.item (1) and 
				(count > 1 implies substring (2, count).is_equal (other.substring (2, count)))))))
		end

	same_string (other: STRING): BOOLEAN is
			-- Do `Current' and `other' have the same character sequence?
			-- `Current' is considered with its characters which do not
			-- fit in a CHARACTER replaced by a '%U'.
			-- (Extended from ELKS 2001 STRING)
			-- Note: Use feature KL_STRING_ROUTINES.elks_same_string instead of
			-- this routine when `Current' can be of dynamic type STRING and
			-- `other' of dynamic type other than STRING such as UC_STRING,
			-- because class STRING provided by the Eiffel compilers is
			-- not necessarily aware of the implementation of UC_STRING
			-- and this may lead to run-time errors or crashes.
		require
			other_not_void: other /= Void
		deferred
		ensure
			definition: Result = string.is_equal (other.string)
		end

	infix "<" (other: like Current): BOOLEAN is
	-- Note: ELKS 2001 specifies `other' of type STRING, but this routine
	-- is inherited from COMPARABLE with another signature:
	-- infix "<" (other: STRING): BOOLEAN is
			-- Is string lexicographically lower than `other'?
			-- (Extended from ELKS 2001 STRING)
		deferred
		ensure then
			-- Note: Definition not necessarily acceptable in proper descendant classes:
			-- definition: Result = (count = 0 and other.count > 0 or
			--   count > 0 and then other.count > 0 and then (item (1) < other.item (1) or
			--   item (1) = other.item (1) and substring (2, count) < other.substring (2, other.count)))
			definition: ANY_.same_types (Current, "") implies Result = (count = 0 and other.count > 0 or
				count > 0 and then other.count > 0 and then (item (1) < other.item (1) or
				item (1) = other.item (1) and substring (2, count) < other.substring (2, other.count)))
		end

feature -- Element change

	put (c: CHARACTER; i: INTEGER) is
			-- Replace character at index `i' by `c'.
			-- (ELKS 2001 STRING)
		require
			valid_index: valid_index (i)
		deferred
		ensure
			stable_count: count = old count
			replaced: item (i) = c
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

	append_character (c: CHARACTER) is
			-- Append `c' at end.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			new_count: count = old count + 1
			appended: item (count) = c
			stable_before: substring (1, count - 1).current_string.is_equal (old STRING_.cloned_string (current_string))
		end

	append_string (s: STRING) is
			-- Append a copy of `s' at end.
			-- (ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.appended_string instead of
			-- this routine when `Current' can be of dynamic type STRING and
			-- `s' of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
		require
			s_not_void: s /= Void
		deferred
		ensure
			appended: current_string.is_equal (old STRING_.cloned_string (current_string) + old STRING_.cloned_string (s))
		end

	fill_with (c: CHARACTER) is
			-- Replace every character with `c'.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			same_count: old count = count
			filled: occurrences (c) = count
		end

	insert_character (c: CHARACTER; i: INTEGER) is
			-- Insert `c' at index `i', shifting characters between
			-- ranks `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
		require
			valid_insertion_index: 1 <= i and i <= count + 1
		deferred
		ensure
			one_more_character: count = old count + 1
			inserted: item (i) = c
			stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: substring (i + 1, count).is_equal (old substring (i, count))
		end

	insert_string (s: STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters between ranks
			-- `i' and `count' rightwards.
			-- (ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.appended_string instead of
			-- this routine when `Current' can be of dynamic type STRING and
			-- `s' of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
			-- Note2: There is a bug in ISE 5.4/5.5 when inserting a string 
			-- to itself.
		require
			string_not_void: s /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
				-- Bug in ISE 5.4/5.5.
			not_current: s /= current_string
		deferred
		ensure
			inserted: is_equal (old substring (1, i - 1) + old STRING_.cloned_string (s) + old substring (i, count).current_string)
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
			-- (ELKS 2001 STRING)
			-- Note: Use KL_STRING_ROUTINES.replaced_substring instead of
			-- this routine when `Current' can be of dynamic type STRING and
			-- `s' of dynamic type other than STRING such as UC_STRING, because
			-- class STRING provided by the Eiffel compilers is not necessarily
			-- aware of the implementation of UC_STRING and this may lead to
			-- run-time errors or crashes.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		deferred
		ensure
			replaced: is_equal (old (substring (1, start_index - 1) + s + substring (end_index + 1, count).current_string))
		end

feature -- Removal

	keep_head (n: INTEGER) is
			-- Remove all the characters except for the first `n';
			-- if `n' > `count', do nothing.
			-- (ELKS 2001 STRING)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			kept: is_equal (old substring (1, n.min (count)))
		end

	keep_tail (n: INTEGER) is
			-- Remove all the characters except for the last `n';
			-- if `n' > `count', do nothing.
			-- (ELKS 2001 STRING)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			kept: is_equal (old substring (count - n.min (count) + 1, count))
		end

	remove_head (n: INTEGER) is
			-- Remove the first `n' characters;
			-- if `n' > `count', remove all.
			-- (ELKS 2001 STRING)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			removed: is_equal (old substring (n.min (count) + 1, count))
		end

	remove_tail (n: INTEGER) is
			-- Remove the last `n' characters;
			-- if `n' > `count', remove all.
			-- (ELKS 2001 STRING)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			removed: is_equal (old substring (1, count - n.min (count)))
		end

	remove (i: INTEGER) is
			-- Remove `i'-th character, shifting characters between
			-- ranks i + 1 and `count' leftwards.
			-- (ELKS 2001 STRING)
		require
			valid_removal_index: valid_index (i)
		deferred
		ensure
			removed: is_equal (old substring (1, i - 1) + old substring (i + 1, count).current_string)
		end

	remove_substring (start_index, end_index: INTEGER) is
			-- Remove all characters from `start_index'
			-- to `end_index' inclusive.
			-- (ELKS 2001 STRING)
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		deferred
		ensure
			removed: is_equal (old substring (1, start_index - 1) + old substring (end_index + 1, count).current_string)
		end

	wipe_out is
			-- Remove all characters.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			empty_string: count = 0
		end

feature -- Conversion

	as_lower: like Current is
			-- New object with all letters in lower case
			-- (Extended from ELKS 2001 STRING)
		deferred
		ensure
			as_lower_not_void: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = CHARACTER_.as_lower (item (1))
			recurse: count > 1 implies Result.substring (2, count).is_equal (substring (2, count).as_lower)
		end

	as_upper: like Current is
			-- New object with all letters in upper case
			-- (Extended from ELKS 2001 STRING)
		deferred
		ensure
			as_upper_not_void: Result /= Void
			length: Result.count = count
			anchor: count > 0 implies Result.item (1) = CHARACTER_.as_upper (item (1))
			recurse: count > 1 implies Result.substring (2, count).is_equal (substring (2, count).as_upper)
		end

	to_lower is
			-- Convert all letters to lower case.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			-- Note: There is an infinite loop with SE 1.0 because SE
			-- checks assertions even when execution assertions and `as_lower'
			-- in descendant classes is implemented by calling `to_lower'
			-- on a clone of `Current':
			-- length_and_content: is_equal (old as_lower)
		end

	to_upper is
			-- Convert all letters to upper case.
			-- (ELKS 2001 STRING)
		deferred
		ensure
			-- Note: There is an infinite loop with SE 1.0 because SE
			-- checks assertions even when execution assertions and `as_upper'
			-- in descendant classes is implemented by calling `to_upper'
			-- on a clone of `Current':
			-- length_and_content: is_equal (old as_upper)
		end

-- TODO: Not tested yet.
--	to_boolean: BOOLEAN is
--			-- Boolean value;
--			-- "true" yields true, "false" yields false
--		require
--			represents_a_boolean: is_boolean
--		deferred
--		ensure
--			to_boolean: Result = same_string("true")
--		end

-- TODO: Not tested yet.
--	to_integer: INTEGER is
--			-- Integer value;
--			-- for example, when applied to "123", will yield 123
--		require
--			represents_an_integer: is_integer
--		deferred
--		ensure
--			single_digit: count = 1 implies Result = ("0123456789").index_of (item (1), 1) - 1
--			minus_sign_followed_by_single_digit: count = 2 and item (1) = '-' implies Result = -substring (2, 2).to_integer
--			plus_sign_followed_by_single_digit: count = 2 and item (1) = '+' implies Result = substring (2, 2).to_integer
--			recurse_to_reduce_length: count > 2 or count = 2 and not (("+-").has (item (1))) implies
--				Result // 10 = substring (1, count - 1).to_integer and (Result \\ 10).abs = substring (count, count).to_integer
--		end

-- TODO: Not tested yet.
--	to_real: REAL is
--			-- Real value;
--			-- for example, when applied to "123.0", will yield 123.0
--		require
--			represents_a_real: is_real
--		deferred
--		end

-- TODO: Not tested yet.
--	to_double: DOUBLE is
--			-- "Double" value; for example, when applied to "123.0",
--			-- will yield 123.0 (double)
--		require
--			represents_a_double: is_double
--		deferred
--		end

feature -- Duplication

	copy (other: like Current) is
			-- Reinitialize by copying the characters of other.
			-- (This is also used by clone.)
			-- (ELKS 2001 STRING)
		deferred
		end

feature -- Output

	out: STRING is
			-- New STRING containing terse printable representation
			-- of current object
			-- (ELKS 2001 STRING)
		deferred
		ensure then
			out_not_void: Result /= Void
			same_items: ANY_.same_types (Current, "") implies Result.same_string (current_string)
		end

feature -- Implementation

	current_string: STRING is
			-- Current string
		deferred
		ensure
				-- Need `current_any' instead of just `Current' to
				-- avoid VWEQ validity error:
			definition: Result = current_any
		end

	current_any: ANY is
			-- Current any
		do
			Result := Current
		ensure
			definition: Result = Current
		end

invariant

	non_negative_count: count >= 0

end
