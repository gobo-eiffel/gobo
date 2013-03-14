note
	description: "Common ancestors to all STRING classes."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-30 21:23:58 +0100 (Wed, 30 Jan 2013) $"
	revision: "$Revision: 733 $"

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

feature -- Settings

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
		require
			v_nonnegative: v >= 0
		do
			internal_hash_code := v
		ensure
			internal_hash_code_set: internal_hash_code = v
		end

feature -- Element change

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

	append (s: READABLE_STRING_GENERAL)
			-- Append characters of `s' at end.
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
				from
					i := 1
				until
					i > l_s_count
				loop
					append_code (s.code (i))
					i := i + 1
				end
				set_count (l_new_size)
				internal_hash_code := 0
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
			l_count, l_s_count, l_new_size: INTEGER
			i: INTEGER
		do
			l_s_count := end_index - start_index + 1
			if l_s_count > 0 then
				l_count := count
				l_new_size := l_s_count + l_count
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
				internal_hash_code := 0
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
				internal_hash_code := 0
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
				internal_hash_code := 0
			end
		ensure
			new_count: count = old count + end_index - start_index + 1
			inserted: elks_checking implies same_string (old (s.substring (start_index, end_index).to_string_32 + Current))
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
			kept: elks_checking implies Current ~ ((old twin).substring (old count - count + 1, old count))
		end

	right_adjust
			-- Remove trailing whitespace.
		deferred
		ensure
			valid_count: count <= old count
			new_count: not is_empty implies not item (count).is_space
			kept: elks_checking implies Current ~ ((old twin).substring (1, count))
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
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
