indexing
	description: "Common ancestors to all STRING classes."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	STRING_GENERAL

inherit
	COMPARABLE

	HASHABLE
		undefine
			is_equal
		end

	STRING_HANDLER
		undefine
			is_equal
		end

convert
	as_string_32: {STRING_32},
	to_cil: {SYSTEM_STRING}

feature -- Access

	code (i: INTEGER): NATURAL_32 is
			-- Code at position `i'
		require
			valid_index: valid_index (i)
		deferred
		end

	index_of_code (c: like code; start_index: INTEGER): INTEGER is
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
		deferred
		ensure
			internal_hash_code_set: internal_hash_code = v
		end

feature -- Status report

	count: INTEGER is
			-- Number of characters in Current
		deferred
		ensure
			count_non_negative: Result >= 0
		end

	capacity: INTEGER is
			-- Number of characters allocated in Current
		deferred
		ensure
			capacity_non_negative: Result >= 0
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within the bounds of the string?
		deferred
		end

	valid_code (v: like code): BOOLEAN is
			-- Is `v' a valid code for Current?
		deferred
		end

	is_string_8: BOOLEAN is
			-- Is `Current' a STRING_8?
		deferred
		end

	is_string_32: BOOLEAN is
			-- Is `Current' a STRING_32?
		deferred
		end

	is_valid_as_string_8: BOOLEAN is
			-- Is `Current' convertible to STRING_8 without information loss?
		deferred
		end

	is_empty: BOOLEAN is
			-- Is structure empty?
		deferred
		end

	has_code (c: like code): BOOLEAN is
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
				Result := (i <= nb)
			end
		ensure then
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then code (1) = c implies Result
			recurse: (count > 0 and then code (1) /= c) implies
				(Result = substring (2, count).has_code (c))
		end

feature -- Conversion

	frozen to_cil: SYSTEM_STRING is
			-- Create an instance of SYSTEM_STRING using characters
			-- of Current between indices `1' and `count'.
		require
			is_dotnet: {PLATFORM}.is_dotnet
		do
			Result := dotnet_convertor.from_string_to_system_string (Current)
		ensure
			to_cil_not_void: Result /= Void
		end

	to_string_8: STRING is
			-- Convert `Current' as a STRING_8.
		require
			is_valid_as_string_8: is_valid_as_string_8
		do
			Result := as_string_8
		ensure
			as_string_8_not_void: Result /= Void
			identity: (is_string_8 and Result = Current) or (not is_string_8 and Result /= Current)
		end

	as_string_8: STRING is
			-- Convert `Current' as a STRING_8. If a code of `Current' is
			-- node a valid code for a STRING_8 it is replaced with the null
			-- character.
		local
			i, nb: INTEGER
			l_code: like code
		do
			if is_string_8 then
				Result ?= Current
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
			identity: (is_string_8 and Result = Current) or (not is_string_8 and Result /= Current)
		end

	as_string_32, to_string_32: STRING_32 is
			-- Convert `Current' as a STRING_32.
		local
			i, nb: INTEGER
		do
			if is_string_32 then
				Result ?= Current
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
			identity: (is_string_32 and Result = Current) or (not is_string_32 and Result /= Current)
		end

feature -- Duplication

	substring (start_index, end_index: INTEGER): like Current is
			-- Copy of substring containing all characters at indices
			-- between `start_index' and `end_index'
		deferred
		ensure
			substring_not_void: Result /= Void
			substring_count: Result.count = end_index - start_index + 1 or Result.count = 0
			first_code: Result.count > 0 implies Result.code (1) = code (start_index)
			recurse: Result.count > 0 implies
				Result.substring (2, Result.count).is_equal (substring (start_index + 1, end_index))
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

	append (s: STRING_GENERAL) is
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
				set_internal_hash_code (0)
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

feature {NONE} -- Assertion helper

	elks_checking: BOOLEAN is False
			-- Are ELKS checkings verified? Must be True when changing implementation of STRING_GENERAL or descendant.

feature {NONE} -- Implementation

	internal_hash_code: INTEGER is
			--
		deferred
		end

	string_searcher: STRING_SEARCHER is
			-- Facilities to search string in another string.
		once
			create Result.make
		ensure
			string_searcher_not_void: Result /= Void
		end

	c_string_provider: C_STRING is
			-- To create Eiffel strings from C string.
		once
			create Result.make_empty (0)
		ensure
			c_string_provider_not_void: Result /= Void
		end

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR is
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

	ctor_convertor: STRING_TO_REAL_CONVERTOR is
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

	dotnet_convertor: SYSTEM_STRING_FACTORY is
			-- Convertor used to convert from and to SYSTEM_STRING.
		once
			create Result
		ensure
			dotnet_convertor_not_void: Result /= Void
		end

end
