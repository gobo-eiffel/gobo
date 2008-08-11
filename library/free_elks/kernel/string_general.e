indexing
	description: "Common ancestors to all STRING classes."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

feature -- Settings

	put_code (v: like code; i: INTEGER) is
			-- Put code `v' at position `i'.
		require
			valid_code: valid_code (v)
			valid_index: valid_index (i)
		deferred
		ensure
			inserted: code (i) = v
			stable_count: count = old count
			stable_before_i: elks_checking implies substring (1, i - 1).is_equal (old substring (1, i - 1))
			stable_after_i: elks_checking implies substring (i + 1, count).is_equal (old substring (i + 1, count))
		end

feature {STRING_HANDLER} -- Settings

	set_count (number: INTEGER) is
			-- Set `count' to `number' of characters.
		require
			valid_count: 0 <= number and number <= capacity
		deferred
		ensure
			new_count: count = number
		end

	set_internal_hash_code (v: like internal_hash_code) is
			-- Set `internal_hash_code' with `v'.
		require
			v_nonnegative: v >= 0
		do
			internal_hash_code := v
		ensure
			internal_hash_code_set: internal_hash_code = v
		end

feature -- Element change

	append_code (c: like code) is
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
			stable_before: elks_checking implies substring (1, count - 1).is_equal (old twin)
		end

	append (s: READABLE_STRING_GENERAL) is
			-- Append a copy of `s' at end.
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
			appended: elks_checking implies to_string_32.is_equal (old to_string_32.twin + old s.to_string_32.twin)
		end

feature -- Removal

	remove (i: INTEGER) is
			-- Remove `i'-th character.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			new_count: count = old count - 1
			removed: elks_checking implies
				to_string_32.is_equal (old substring (1, i - 1).to_string_32 + old substring (i + 1, count).to_string_32)
		end

feature -- Resizing

	resize (newsize: INTEGER) is
			-- Rearrange string so that it can accommodate
			-- at least `newsize' characters.
			-- Do not lose any previously entered character.
		require
			new_size_non_negative: newsize >= 0
		deferred
		end

invariant
	mutable: not is_immutable

end
