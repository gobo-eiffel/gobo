note

	description:

		"Full Unicode case mappings"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2007-2022, Colin Adams and others"
	license: "MIT License"

deferred class ST_UNICODE_CASE_MAPPING_INTERFACE

inherit

	UC_UNICODE_CONSTANTS

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Access

	lower_utf8_string (a_string: STRING): UC_UTF8_STRING
			-- New lower-cased version of `a_string'
		require
			a_string_not_void: a_string /= Void
		local
			i, l_count, l_code: INTEGER
			l_codes: detachable DS_ARRAYED_LIST [INTEGER]
		do
			from
				i := 1
				l_count := a_string.count
					-- We don't know in advance how big the result will be.
					-- So this is a best guess:
				create Result.make (l_count)
			until
				i > l_count
			loop
				l_code := a_string.code (i).to_integer_32
				l_codes := lower_codes (l_code)
				if l_codes /= Void then
					l_codes.do_all (agent Result.append_item_code)
				else
					Result.append_item_code (l_code)
				end
				i := i + 1
			variant
				increasing_index: l_count - i + 1
			end
		ensure
			instance_free: class
			lower_unicode_string_not_void: Result /= Void
			new_string: not ANY_.same_objects (Result, a_string)
			length_may_change: True
		end

	upper_utf8_string (a_string: STRING): UC_UTF8_STRING
			-- New upper-cased version of `a_string'
		require
			a_string_not_void: a_string /= Void
		local
			i, l_count, l_code: INTEGER
			l_codes: detachable DS_ARRAYED_LIST [INTEGER]
		do
			from
				i := 1
				l_count := a_string.count
					-- We don't know in advance how big the result will be.
					-- So this is a best guess:
				create Result.make (l_count)
			until
				i > l_count
			loop
				l_code := a_string.code (i).to_integer_32
				l_codes := upper_codes (l_code)
				if l_codes /= Void then
					l_codes.do_all (agent Result.append_item_code)
				else
					Result.append_item_code (l_code)
				end
				i := i + 1
			variant
				increasing_index: l_count - i + 1
			end
		ensure
			instance_free: class
			upper_unicode_string_not_void: Result /= Void
			new_string: not ANY_.same_objects (Result, a_string)
			length_may_change: True
		end

	-- TODO titled_utf8_string - needs text boundaries and parameters to specify which words should be title-cased

feature {NONE} -- Implementation

	lower_codes (a_code: INTEGER): detachable DS_ARRAYED_LIST [INTEGER]
			-- Code points of full lower case mapping of `a_code' as a Unicode code point
		require
			a_code_large_enough: a_code >= minimum_unicode_character_code
			a_code_small_enough: a_code <= maximum_unicode_character_code
		local
			i, j, k, l_rem: INTEGER
		do
			i := a_code // (65536)
			l_rem := a_code \\ (65536)
			j := l_rem // 256
			k := l_rem \\ 256
			Result := lower_case_mappings.item (i).item (j).item (k)
		ensure
			instance_free: class
			non_empty: Result /= Void implies not Result.is_empty
		end

	upper_codes (a_code: INTEGER): detachable DS_ARRAYED_LIST [INTEGER]
			-- Code points of full upper case mapping of `a_code' as a Unicode code point
		require
			a_code_large_enough: a_code >= minimum_unicode_character_code
			a_code_small_enough: a_code <= maximum_unicode_character_code
		local
			i, j, k, l_rem: INTEGER
		do
			i := a_code // (65536)
			l_rem := a_code \\ (65536)
			j := l_rem // 256
			k := l_rem \\ 256
			Result := upper_case_mappings.item (i).item (j).item (k)
		ensure
			instance_free: class
			non_empty: Result /= Void implies not Result.is_empty
		end

	title_codes (a_code: INTEGER): detachable DS_ARRAYED_LIST [INTEGER]
			-- Code points of full title case mapping of `a_code' as a Unicode code point
		require
			a_code_large_enough: a_code >= minimum_unicode_character_code
			a_code_small_enough: a_code <= maximum_unicode_character_code
		local
			i, j, k, l_rem: INTEGER
		do
			i := a_code // (65536)
			l_rem := a_code \\ (65536)
			j := l_rem // 256
			k := l_rem \\ 256
			Result := title_case_mappings.item (i).item (j).item (k)
		ensure
			instance_free: class
			non_empty: Result /= Void implies not Result.is_empty
		end

	lower_case_mappings: SPECIAL [SPECIAL [ARRAY [detachable DS_ARRAYED_LIST [INTEGER]]]]
			-- Full lower case mappings for each code point
		deferred
		ensure
			instance_free: class
			lower_case_mappings_not_void: Result /= Void
		end

	title_case_mappings: SPECIAL [SPECIAL [ARRAY [detachable DS_ARRAYED_LIST [INTEGER]]]]
			-- Full title case mappings for each code point
		deferred
		ensure
			instance_free: class
			title_case_mappings_not_void: Result /= Void
		end

	upper_case_mappings: SPECIAL [SPECIAL [ARRAY [detachable DS_ARRAYED_LIST [INTEGER]]]]
			-- Full upper case mappings for each code point
		deferred
		ensure
			instance_free: class
			upper_case_mappings_not_void: Result /= Void
		end

	new_singleton (i: INTEGER): DS_ARRAYED_LIST [INTEGER]
			-- List of one integer
		do
			create Result.make (1)
			Result.put_last (i)
		ensure
			instance_free: class
			list_not_void: Result /= Void
			one_integer: Result.count = 1
		end

	new_pair (i, j: INTEGER): DS_ARRAYED_LIST [INTEGER]
			-- List of two integers
		do
			create Result.make (2)
			Result.put_last (i)
			Result.put_last (j)
		ensure
			instance_free: class
			list_not_void: Result /= Void
			two_integers: Result.count = 2
		end

	new_triple (i, j, k: INTEGER): DS_ARRAYED_LIST [INTEGER]
			-- List of three integers
		do
			create Result.make (3)
			Result.put_last (i)
			Result.put_last (j)
			Result.put_last (k)
		ensure
			instance_free: class
			list_not_void: Result /= Void
			three_integers: Result.count = 3
		end

end
