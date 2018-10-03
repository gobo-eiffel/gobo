note
	description: "[
		Helper to perform efficient search of a string in another one.
		Note: The algorithm used is the one described in Communications of the ACM,
			volume 33, number 8, August 1990, by Daniel M. Sunday. The fuzzy
			version was presented by Peter R. Sibbald in Communications of the
			ACM, volume 35, number 4, April 1992 (Technical Correspondance).
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	STRING_SEARCHER

feature {NONE} -- Initialization

	make
			-- Initialize current
		do
			create deltas.make_empty (max_code_point_value + 1)
		end

feature -- Initialization

	initialize_deltas (a_pattern: READABLE_STRING_GENERAL)
			-- Initialize `deltas' with `a_pattern'.
			-- Optimized for the top `max_code_point_value' characters only.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			internal_initialize_deltas (a_pattern, a_pattern.count, deltas)
		end

feature -- Access

	string_type: READABLE_STRING_GENERAL
			-- Type of strings `Current' manipulate to perform searches.
		deferred
		ensure
			for_typing_only: False
		end

	max_code_point_value: INTEGER
			-- Maximum character value for which we optimize the lookup of a pattern.
			-- If any item's code of the searched string is above that limit, search will
			-- not be as efficient.
		deferred
		ensure
			positive: Result > 0
		end

feature -- Search

	substring_index (a_string: like string_type; a_pattern: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
			-- Position of first occurrence of `a_pattern' at or after `start_pos'
			-- and before `end_pos' in `a_string'.
			-- 0 if there are no matches.
		require
			a_string_not_void: a_string /= Void
			a_pattern_not_void: a_pattern /= Void
			start_large_enough: start_pos >= 1
			end_pos_large_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
		do
			if a_string = a_pattern then
				if start_pos = 1 then
					Result := 1
				end
			else
				if a_pattern.count = 0 then
					Result := start_pos
				elseif a_pattern.count <= end_pos - start_pos + 1 then
					internal_initialize_deltas (a_pattern, a_pattern.count, deltas)
					Result := substring_index_with_deltas (a_string, a_pattern, start_pos, end_pos)
				end
			end
		end

	substring_index_with_deltas (a_string: like string_type; a_pattern: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
			-- Position of first occurrence of `a_pattern' at or after `start_pos' in `a_string'.
			-- 0 if there are no matches.
		require
			a_string_not_void: a_string /= Void
			a_pattern_not_void: a_pattern /= Void
			a_pattern_not_empty: not a_pattern.is_empty
			start_large_enough: start_pos >= 1
			end_pos_large_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
		deferred
		end

	substring_index_list_with_deltas (a_string: like string_type; a_pattern: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): detachable ARRAYED_LIST [INTEGER]
			-- Index positions of all occurrences of `a_pattern' at or after `start_pos' until `end_pos' in `a_string'.
			-- Result is Void if there are no matches.
		require
			a_string_not_void: a_string /= Void
			a_pattern_not_void: a_pattern /= Void
			a_pattern_not_empty: not a_pattern.is_empty
			start_large_enough: start_pos >= 1
			end_pos_large_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
		local
			l_pattern_count, l_index: INTEGER
		do
			l_index := substring_index_with_deltas (a_string, a_pattern, start_pos, end_pos)
			if l_index > 0 then
				from
						-- Assuming a uniform distribution of the found pattern based on the first
						-- occurrences, we assume there will be a quarter less occurrences.
					l_pattern_count := a_pattern.count
					create Result.make ((((end_pos - start_pos).max (3) // (l_index + l_pattern_count)) // 4).max (2))
				until
					l_index = 0
				loop
					Result.extend (l_index)
					l_index := substring_index_with_deltas (a_string, a_pattern, l_index + l_pattern_count, end_pos)
				end
			end
		ensure
			matches: Result /= Void implies not Result.is_empty
		end

	fuzzy_index (a_string: like string_type; a_pattern: READABLE_STRING_GENERAL; start_pos, end_pos, fuzzy: INTEGER): INTEGER
			-- Position of first occurrence of `a_pattern' at or after `start_pos' in
			-- `a_string' with 0..`fuzzy' mismatches between `a_string' and `a_pattern'.
			-- 0 if there are no fuzzy matches.
		require
			a_string_not_void: a_string /= Void
			a_pattern_not_void: a_pattern /= Void
			a_pattern_not_empty: not a_pattern.is_empty
			start_large_enough: start_pos >= 1
			end_pos_large_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
			fuzzy_non_negative: fuzzy >= 0
			acceptable_fuzzy: fuzzy <= a_pattern.count
		deferred
		end

feature {NONE} -- Implementation: Access

	deltas: SPECIAL [INTEGER]
			-- Record shifting deltas.

	deltas_array: detachable SPECIAL [like deltas]
			-- Record shifting deltas for fuzzy search.

feature {NONE} -- Implementation

	internal_initialize_deltas (a_pattern: READABLE_STRING_GENERAL; a_pattern_count: INTEGER; a_deltas: like deltas)
			-- Initialize `a_deltas' with `a_pattern'.
			-- Optimized for the top `max_code_point_value' characters only.
		require
			a_pattern_not_void: a_pattern /= Void
			a_pattern_count_not_negative: a_pattern_count >= 0
			a_pattern_count_valid: a_pattern_count <= a_pattern.count
			a_deltas_not_void: a_deltas /= Void
			a_deltas_valid: a_deltas.capacity = max_code_point_value + 1
		local
			i, l_char_code: INTEGER
		do
				-- Initialize the delta table (one more than pattern count).
			a_deltas.fill_with (a_pattern_count + 1, 0, max_code_point_value)

				-- Now for each character within the pattern, fill in shifting necessary
				-- to bring the pattern to the character. The rightmost value is kept, as
				-- we scan the pattern from left to right (ie. if there is two 'a', only the
				-- delta associated with the second --rightmost-- will be kept).
			from
				i := 0
			until
				i = a_pattern_count
			loop
				l_char_code := a_pattern.code (i + 1).to_integer_32
				if l_char_code <= max_code_point_value then
					a_deltas.put (a_pattern_count - i, l_char_code)
				end
				i := i + 1
			end
		end

	initialize_fuzzy_deltas (a_pattern: READABLE_STRING_GENERAL; fuzzy: INTEGER)
			-- Compile `a_pattern' by computing the delta shift tables from a pattern
			-- string. This has to be done before searching occurs. The first delta
			-- table is computed with the full pattern, the second one is computed with
			-- the rightmost character removed, and so on. A total of (fuzzy + 1) tables
			-- are computed and stored in `deltas_array'.
		require
			a_pattern_not_void: a_pattern /= Void
			fuzzy_positive: fuzzy > 0
		local
			l_deltas: like deltas
			l_deltas_array: SPECIAL [like deltas]
			i, l_fuzzy: INTEGER
			l_pattern_count: INTEGER
		do
			from
				l_pattern_count := a_pattern.count
				l_fuzzy := fuzzy + 1
				create l_deltas_array.make_empty (l_fuzzy)
			until
				i = l_fuzzy
			loop
				create l_deltas.make_empty (max_code_point_value + 1)
				l_deltas_array.extend (l_deltas)
				internal_initialize_deltas (a_pattern, l_pattern_count - i, l_deltas)
				i := i + 1
			end

			deltas_array := l_deltas_array
		ensure
			deltas_array_not_void: deltas_array /= Void
			deltas_array_count_set:  attached {SPECIAL [like deltas]} deltas_array as delta and then delta.count = fuzzy + 1
		end

invariant
	deltas_not_void: deltas /= Void
	deltas_valid: deltas.capacity = max_code_point_value + 1

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
