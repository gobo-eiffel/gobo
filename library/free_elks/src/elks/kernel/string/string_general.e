note
	description: "Common ancestors to all STRING classes."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	STRING_GENERAL

inherit
	READABLE_STRING_GENERAL
		export
			{ANY} copy, standard_copy, deep_copy
		end

convert
	as_string_32: {READABLE_STRING_32, STRING_32},
	to_cil: {SYSTEM_STRING}

feature {STRING_HANDLER} -- Settings

	set_count (number: INTEGER)
			-- Set `count' to `number' of characters.
		require
			valid_count: 0 <= number and number <= capacity
		deferred
		ensure
			new_count: count = number
		end

	set_internal_hash_code (v: like internal_hash_code)
			-- Set `internal_hash_code' with `v'.
		obsolete
			"Use `reset_hash_codes` instead. [2017-05-31]"
		require
			v_nonnegative: v >= 0
		do
			internal_hash_code := v
		ensure
			internal_hash_code_set: internal_hash_code = v
		end

	reset_hash_codes
			-- Reset all hash codes of `Current' string.
		do
			internal_hash_code := 0
			internal_case_insensitive_hash_code := 0
		end

feature -- Element change

	put_code (v: like code; i: INTEGER)
			-- Put code `v' at position `i'.
		require
			valid_code: valid_code (v)
			valid_index: valid_index (i)
		deferred
		ensure
			inserted: code (i) = v
			stable_count: count = old count
			stable_before_i: elks_checking implies substring (1, i - 1) ~ (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count) ~ (old substring (i + 1, count))
		end

	append_code (c: like code)
			-- Append `c' at end.
		require
			valid_code: valid_code (c)
		local
			current_count: INTEGER
		do
			current_count := count + 1
			if current_count > capacity then
				resize (current_count)
			end
			set_count (current_count)
			put_code (c, current_count)
		ensure then
			item_inserted: code (count) = c
			new_count: count = old count + 1
			stable_before: elks_checking implies substring (1, count - 1) ~ (old twin)
		end

	append_integer_8 (i: INTEGER_8)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_integer_16 (i: INTEGER_16)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_integer (i: INTEGER)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_integer_64 (i: INTEGER_64)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_natural_8 (i: NATURAL_8)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_natural_16 (i: NATURAL_16)
			-- Append the string representation of `i' at end.
		deferred
		end

	append_natural_32 (i: NATURAL_32)
			-- Append the string representation of `i' at end.	
		deferred
		end

	append_real (r: REAL_32)
			-- Append the string representation of `r' at end.
		deferred
		end

	append_double (d: REAL_64)
			-- Append the string representation of `d' at end.
		deferred
		end

	append_boolean (b: BOOLEAN)
			-- Append the string representation of `b' at end.
		deferred
		end

	append (s: READABLE_STRING_GENERAL)
			-- Append characters of `s' at end.
		require
			argument_not_void: s /= Void
			compatible_strings: is_string_8 implies s.is_valid_as_string_8
		local
			l_s_count, l_new_size: INTEGER
			i: INTEGER
		do
			l_s_count := s.count
			if l_s_count > 0 then
				l_new_size := l_s_count + count
				if l_new_size > capacity then
					resize (l_new_size)
				end
				from
					i := 1
				until
					i > l_s_count
				loop
					append_code (s.code (i))
					i := i + 1
				end
				set_count (l_new_size)
				reset_hash_codes
			end
		ensure
			new_count: count = old count + old s.count
			appended: elks_checking implies same_string (old (to_string_32 + s))
		end

	append_substring (s: READABLE_STRING_GENERAL; start_index, end_index: INTEGER)
			-- Append characters of `s.substring (start_index, end_index)' at end.
		require
			argument_not_void: s /= Void
			compatible_strings: is_string_8 implies s.is_valid_as_string_8
			start_index_valid: start_index >= 1
			end_index_valid: end_index <= s.count
			valid_bounds: start_index <= end_index + 1
		local
			l_s_count, l_new_size: INTEGER
			i: INTEGER
		do
			l_s_count := end_index - start_index + 1
			if l_s_count > 0 then
				l_new_size := l_s_count + count
				if l_new_size > capacity then
					resize (l_new_size)
				end
				from
					i := start_index
				until
					i > end_index
				loop
					append_code (s.code (i))
					i := i + 1
				end
				set_count (l_new_size)
				reset_hash_codes
			end
		ensure
			new_count: count = old count + end_index - start_index + 1
			appended: elks_checking implies same_string (old (to_string_32 + s.substring (start_index, end_index)))
		end

	prepend (s: READABLE_STRING_GENERAL)
			-- Prepend characters of `s' at front.
		require
			argument_not_void: s /= Void
			compatible_strings: is_string_8 implies s.is_valid_as_string_8
		local
			l_count, l_s_count, l_new_size: INTEGER
			i: INTEGER
		do
			l_s_count := s.count
			if l_s_count > 0 then
				l_count := count
				l_new_size := l_s_count + l_count
				if l_new_size > capacity then
					resize (l_new_size)
				end
					-- Copy `Current' at the end starting from the end since it will probably overlap.
				set_count (l_new_size)
				from
					i := l_count
				until
					i = 0
				loop
					put_code (code (i), i + l_s_count)
					i := i - 1
				end
					-- Copy `s' at the beginning of Current.
				from
					i := 1
				until
					i > l_s_count
				loop
					put_code (s.code (i), i)
					i := i + 1
				end
				reset_hash_codes
			end
		ensure
			new_count: count = old (count + s.count)
			inserted: elks_checking implies same_string (old (s.to_string_32 + Current))
		end

	prepend_substring (s: READABLE_STRING_GENERAL; start_index, end_index: INTEGER)
			-- Prepend characters of `s.substring (start_index, end_index)' at front.
		require
			argument_not_void: s /= Void
			compatible_strings: is_string_8 implies s.is_valid_as_string_8
			start_index_valid: start_index >= 1
			end_index_valid: end_index <= s.count
			valid_bounds: start_index <= end_index + 1
		local
			l_count, l_s_count, l_new_size: INTEGER
			i, j: INTEGER
		do
			l_s_count := end_index - start_index + 1
			if l_s_count > 0 then
				l_count := count
				l_new_size := l_s_count + l_count
				if l_new_size > capacity then
					resize (l_new_size)
				end
					-- Copy `Current' at the end starting from the end since it will probably overlap.
				set_count (l_new_size)
				from
					i := l_count
				until
					i = 0
				loop
					put_code (code (i), i + l_s_count)
					i := i - 1
				end
					-- Copy `s' at the beginning of Current.
				from
					i := start_index
					j := 1
				until
					i > end_index
				loop
					put_code (s.code (i), j)
					i := i + 1
					j := j + 1
				end
				reset_hash_codes
			end
		ensure
			new_count: count = old count + end_index - start_index + 1
			inserted: elks_checking implies same_string (old (s.substring (start_index, end_index).to_string_32 + Current))
		end

	prepend_integer (i: INTEGER)
			-- Prepend the string representation of `i' at front.
		deferred
		end

	prepend_double (d: REAL_64)
			-- Prepend the string representation of `d' at front.
		deferred
		end

	prepend_real (r: REAL_32)
			-- Prepend the string representation of `r' at front.
		deferred
		end

	prepend_boolean (b: BOOLEAN)
			-- Prepend the string representation of `b' at front.
		deferred
		end

	keep_head (n: INTEGER)
			-- Remove all characters except for the first `n';
			-- do nothing if `n' >= `count'.
		require
			non_negative_argument: n >= 0
		deferred
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies Current ~ (old substring (1, n.min (count)))
		end

	keep_tail (n: INTEGER)
			-- Remove all characters except for the last `n';
			-- do nothing if `n' >= `count'.
		require
			non_negative_argument: n >= 0
		deferred
		ensure
			new_count: count = n.min (old count)
			kept: elks_checking implies Current ~ (old substring (count - n.min(count) + 1, count))
		end

	left_adjust
			-- Remove leading whitespace.
		deferred
		ensure
			valid_count: count <= old count
			new_count: not is_empty implies not item (1).is_space
			kept: elks_checking implies Current ~ (old twin).substring (old count - count + 1, old count)
			only_spaces_removed_before: elks_checking implies (old twin).is_substring_whitespace (1, (old twin).substring_index (Current, 1) - 1)
		end

	right_adjust
			-- Remove trailing whitespace.
		deferred
		ensure
			valid_count: count <= old count
			new_count: not is_empty implies not item (count).is_space
			kept: elks_checking implies Current ~ (old twin).substring (1, count)
			only_spaces_removed_after: elks_checking implies (old twin).is_substring_whitespace ((old twin).substring_index (Current, 1) + count, old count)
		end

	adjust
			-- Remove leading and/or trailing whitespace.
		do
			left_adjust
			right_adjust
		ensure
			valid_count: count <= old count
			new_count_left: not is_empty implies not item (1).is_space
			new_count_right: not is_empty implies not item (count).is_space
			kept: elks_checking implies (old twin).has_substring (Current)
			only_spaces_removed_before: elks_checking implies (old twin).is_substring_whitespace (1, (old twin).substring_index (Current, 1) - 1)
			only_spaces_removed_after: elks_checking implies (old twin).is_substring_whitespace ((old twin).substring_index (Current, 1) + count, old count)
		end

feature -- Removal

	remove (i: INTEGER)
			-- Remove `i'-th character.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			new_count: count = old count - 1
			removed: elks_checking implies
				to_string_32 ~ (old substring (1, i - 1).to_string_32 + old substring (i + 1, count).to_string_32)
		end

	remove_head (n: INTEGER)
			-- Remove first `n' characters;
			-- if `n' > `count', remove all.
		require
			n_non_negative: n >= 0
		deferred
		ensure
			removed: elks_checking implies Current ~ (old substring (n.min (count) + 1, count))
		end

	remove_substring (start_index, end_index: INTEGER)
			-- Remove all characters from `start_index'
			-- to `end_index' inclusive.
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		deferred
		ensure
			removed: elks_checking implies Current.as_string_32 ~ (old substring (1, start_index - 1).as_string_32 + old substring (end_index + 1, count))
		end

	remove_tail (n: INTEGER)
			-- Remove last `n' characters;
			-- if `n' > `count', remove all.
		require
			n_non_negative: n >= 0
		deferred
		ensure
			removed: elks_checking implies Current ~ (old substring (1, count - n.min (count)))
		end

	wipe_out
			-- Remove all characters.
		deferred
		ensure
			is_empty: count = 0
			same_capacity: capacity = old capacity
		end

feature -- Resizing

	resize (newsize: INTEGER)
			-- Rearrange string so that it can accommodate
			-- at least `newsize' characters.
			-- Do not lose any previously entered character.
		require
			new_size_large_enough: newsize >= count
		deferred
		ensure
			same_count: count = old count
			capacity_large_enough: capacity >= newsize
			same_content: elks_checking implies same_string (old twin)
		end

invariant
	mutable: not is_immutable

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
