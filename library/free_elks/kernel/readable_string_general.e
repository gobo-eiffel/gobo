note
	description: "Common ancestors to all STRING classes. Read-only interface."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

feature -- Access

	code (i: INTEGER): NATURAL_32
			-- Code at position `i'
		require
			valid_index: valid_index (i)
		deferred
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

feature -- Status report

	is_immutable: BOOLEAN
			-- Can the character sequence of `Current' be changed?
		do
			Result := False
		end

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

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of the string?
		deferred
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
				Result := (i <= nb)
			end
		ensure then
			false_if_empty: count = 0 implies not Result
			true_if_first: count > 0 and then code (1) = c implies Result
			recurse: (count > 0 and then code (1) /= c) implies
				(Result = substring (2, count).has_code (c))
		end

	same_string (a_other: READABLE_STRING_GENERAL): BOOLEAN
			-- Does `a_other' represent the same string as `Current'?
		require
			a_other_not_void: a_other /= Void
		local
			i, l_count: INTEGER
		do
			if a_other = Current then
				Result := True
			else
				l_count := count
				if l_count = a_other.count then
					from
						Result := True
						i := 1
					until
						i > l_count
					loop
						if code (i) /= a_other.code (i) then
							Result := False
							i := l_count -- Jump out of the loop
						end
						i := i + 1
					variant
						increasing_index: l_count - i + 1
					end
				end
			end
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
		do
			Result := as_string_8
		ensure
			as_string_8_not_void: Result /= Void
			identity: (conforms_to ("") and Result = Current) or (not conforms_to ("") and Result /= Current)
		end

	as_string_8: STRING_8
			-- Convert `Current' as a STRING_8. If a code of `Current' is
			-- node a valid code for a STRING_8 it is replaced with the null
			-- character.
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

feature -- Duplication

	substring (start_index, end_index: INTEGER): like Current
			-- Copy of substring containing all characters at indices
			-- between `start_index' and `end_index'
		deferred
		ensure
			substring_not_void: Result /= Void
			substring_count: Result.count = end_index - start_index + 1 or Result.count = 0
			first_code: Result.count > 0 implies Result.code (1) = code (start_index)
			recurse: Result.count > 0 implies
				Result.substring (2, Result.count) ~ substring (start_index + 1, end_index)
		end

feature {NONE} -- Assertion helper

	elks_checking: BOOLEAN = False
			-- Are ELKS checkings verified? Must be True when changing implementation of STRING_GENERAL or descendant.

feature {NONE} -- Implementation

	string_searcher: STRING_SEARCHER
			-- Facilities to search string in another string.
		once
			create Result.make
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

	internal_hash_code: INTEGER
			-- Cache for `hash_code'

end
