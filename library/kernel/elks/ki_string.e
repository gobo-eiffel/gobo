indexing

	description:

		"Portable interface for class STRING"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_STRING

inherit

	HASHABLE
		undefine
			-- Note: HACT 4.0.1 does not support calling `copy' on itself.
			is_equal, copy, out
		redefine
			is_equal, out
		end

feature -- Access

	item (i: INTEGER): CHARACTER is
			-- Character at index `i'
			-- (STRING ELKS 2001)
		require
			valid_index: valid_index (i)
		deferred
		end

	infix "@" (i: INTEGER): CHARACTER is
			-- Character at index `i'
			-- (STRING ELKS 2001)
		require
			valid_index: valid_index (i)
		deferred
		ensure
			definition: Result = item (i)
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or after `start_index';
			-- 0 if none
			-- (STRING ELKS 2001)
		require
			valid_start_index: start_index >= 1 and start_index <= count + 1
		deferred
		ensure
			valid_result: Result = 0 or (start_index <= Result and Result <= count)
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--zero_if_absent: (Result = 0) = not substring (start_index, count).has (c)
			--found_if_present: substring (start_index, count).has (c) implies item (Result) = c
			--none_before: substring (start_index, count).has (c) implies not substring (start_index, Result - 1).has (c)
			zero_if_absent: start_index <= count implies ((Result = 0) = not substring (start_index, count).has (c))
			found_if_present: start_index <= count implies (substring (start_index, count).has (c) implies item (Result) = c)
			none_before: start_index <= count implies (substring (start_index, count).has (c) implies (Result > start_index implies (not substring (start_index, Result - 1).has (c))))
		end

	substring (start_index, end_index: INTEGER): like Current is
			-- New object containing all characters
			-- from `start_index' to `end_index' inclusive
			-- (STRING ELKS 2001)
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- meaningful_interval: start_index <= end_index + 1
			meaningful_interval: start_index <= end_index
		deferred
		ensure
			substring_not_void: Result /= Void
			substring_count: Result.count = end_index - start_index + 1
			first_item: Result.count > 0 implies Result.item (1) = item (start_index)
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- recurse: Result.count > 0 implies
			--	Result.substring (2, Result.count).is_equal (substring (start_index + 1, end_index))
			recurse: Result.count > 1 implies
				Result.substring (2, Result.count).is_equal (substring (start_index + 1, end_index))
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `other' at or after `start_index';
			-- 0 if none
			-- (STRING ELKS 2001)
		require
			other_not_void: other /= Void
			-- Note: ISE Eiffel 5.1 is more constraining than ELKS 2001:
			--valid_start_index: start_index >= 1 and start_index <= count + 1
			other_not_empty: other.count > 0
			start_index_large_enough: start_index >= 1
			start_index_small_enough: start_index <= count
		deferred
		ensure
			valid_result: Result = 0 or else (start_index <= Result and Result <= count - other.count + 1)
			-- Note: ISE Eiffel 5.1 does not support feature `has_substring':
			--zero_if_absent: (Result = 0) = not substring (start_index, count).has_substring (other)
			-- Note: Feature `same_string' (from ELKS 2001) is not supported by all compilers yet:
			--at_this_index: Result >= start_index implies other.same_string (substring (Result, Result + other.count - 1))
			-- Note: ISE Eiffel 5.1 does not support feature `has_substring':
			--none_before: Result > start_index implies not substring (start_index, Result + other.count - 2).has_substring (other)
		end

	infix "+" (other: STRING): like Current is
			-- New object which is a clone of `Current' extended
			-- by the characters of `other'
			-- (STRING ELKS 2001)
		require
			other_not_void: other /= Void
		deferred
		ensure
			result_not_void: Result /= Void
			result_count: Result.count = count + other.count
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--initial: Result.substring (1, count).is_equal (Current)
			initial: count > 0 implies Result.substring (1, count).is_equal (Current)
			-- Note: Feature `same_string' (from ELKS 2001) is not supported by all compilers yet:
			--final: Result.substring (count + 1, count + other.count).same_string (other)
		end

feature -- Measurement

	count: INTEGER is
			-- Number of characters
			-- (STRING ELKS 2001)
		deferred
		end

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times `c' appears in the string
			-- (STRING ELKS 2001)
		deferred
		ensure
			zero_if_empty: count = 0 implies Result = 0
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--recurse_if_not_found_at_first_position: (count > 0 and then item (1) /= c) implies
			--	Result = substring (2, count).occurrences (c)
			--recurse_if_found_at_first_position: (count > 0 and then item (1) = c) implies
			--	Result = 1 + substring (2, count).occurrences (c)
			recurse_if_not_found_at_first_position: (count > 0 and then item (1) /= c) implies
				(count >= 2 implies Result = substring (2, count).occurrences (c))
			recurse_if_found_at_first_position: (count > 0 and then item (1) = c) implies
				(count >= 2 implies Result = 1 + substring (2, count).occurrences (c))
		end

feature -- Status report

	has (c: CHARACTER): BOOLEAN is
			-- Does `Current' contain `c'?
			-- (STRING ELKS 2001)
		deferred
		ensure
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then item (1) = c implies Result
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--recurse: (count > 0 and then item (1) /= c) implies (Result = substring (2, count).has (c))
			recurse: (count > 1 and then item (1) /= c) implies (Result = substring (2, count).has (c))
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of the string?
			-- (STRING ELKS 2001)
		deferred
		ensure
			definition: Result = (1 <= i and i <= count)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered equal
			-- to current object?
			-- (Extended from STRING ELKS 2001)
		deferred
		ensure then
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--definition: Result = (same_type (other) and then
			--	count = other.count and then
			--	(count > 0 implies (item (1) = other.item (1) and 
			--	substring (2, count).is_equal (other.substring (2, count)))))
			definition: same_type ("") implies
				(Result = (same_type (other) and then count = other.count and then
				(count > 0 implies (item (1) = other.item (1) and 
				(count > 1 implies substring (2, count).is_equal (other.substring (2, count)))))))
		end

feature -- Element change

	put (c: CHARACTER; i: INTEGER) is
			-- Replace character at index `i' by `c'.
			-- (STRING ELKS 2001)
		require
			valid_index: valid_index (i)
		deferred
		ensure
			stable_count: count = old count
			replaced: item (i) = c
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- stable_before_i: substring (1, i - 1).is_equal (old substring (1, i - 1))
			-- stable_after_i: substring (i + 1, count).is_equal (old substring (i + 1, count))
			stable_before_i: i > 1 implies substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: i < count implies substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

	append_character (c: CHARACTER) is
			-- Append `c' at end.
			-- (STRING ELKS 2001)
		deferred
		ensure
			new_count: count = old count + 1
			appended: item (count) = c
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- stable_before: substring (1, count - 1).is_equal (old clone (Current))
			stable_before: count > 1 implies substring (1, count - 1).is_equal (old clone (Current))
		end

	append_string (s: STRING) is
			-- Append a copy of `s' at end.
			-- (STRING ELKS 2001)
		require
			s_not_void: s /= Void
		deferred
		ensure
			appended: is_equal (old clone (Current) + old clone (s))
		end

	replace_substring (s: like Current; start_index, end_index: INTEGER) is
	-- Note: VE 4.0, HACT 4.0.1 and ISE 5.1 have 'like Current' in their
	-- signature instead of STRING as specified in ELKS 2001:
	--replace_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
			-- (STRING ELKS 2001)
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			-- Note: HACT 4.0.1 and ISE 5.1 do not support empty interval yet:
			--meaningful_interval: start_index <= end_index + 1
			meaningful_interval: start_index <= end_index
			-- Note: ISE 5.1 and HACT 4.0.1 do not support replacing
			-- a substring by itself:
			not_current: s /= Current
		deferred
		ensure
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--replaced: is_equal (old (substring (1, start_index - 1) + s + substring (end_index + 1, count)))
		end

feature -- Removal

	head (n: INTEGER) is
			-- Remove all the characters except for the first `n';
			-- if `n' > `count', do nothing.
			-- (named `keep_head' in STRING ELKS 2001)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--kept: is_equal (old substring (1, n.min (count)))
			kept1: n.min (old count) = 0 implies count = 0
			kept2: n.min (old count) > 0 implies is_equal (old substring (1, n.min (count)))
		end

	tail (n: INTEGER) is
			-- Remove all the characters except for the last `n';
			-- if `n' > `count', do nothing.
			-- (named `keep_tail' in STRING ELKS 2001)
		require
			n_non_negative: n >= 0
		deferred
		ensure
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--kept: is_equal (old substring (count - n.min (count) + 1, count))
			kept1: n.min (old count) = 0 implies count = 0
			kept2: n.min (old count) > 0 implies is_equal (old substring (count - n.min (count) + 1, count))
		end

	remove (i: INTEGER) is
			-- Remove `i'-th character, shifting characters between
			-- ranks i + 1 and `count' leftwards.
			-- (STRING ELKS 2001)
		require
			valid_removal_index: valid_index (i)
		deferred
		ensure
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			--removed: is_equal (old substring (1, i - 1) + old substring (i + 1, count))
		end

	wipe_out is
			-- Remove all characters.
			-- (STRING ELKS 2001)
		deferred
		ensure
			empty_string: count = 0
		end

feature -- Output

	out: STRING is
			-- New STRING containing terse printable representation
			-- of current object
			-- (STRING ELKS 2001)
		deferred
		ensure then
			out_not_void: Result /= Void
			-- Note: Feature `same_string' (from ELKS 2001) is not supported by all compilers yet:
			-- same_items: same_type ("") implies Result.same_string (Current) end
		end

invariant

	non_negative_count: count >= 0

end -- class KI_STRING
