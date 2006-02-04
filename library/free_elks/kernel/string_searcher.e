indexing
	description: "[
		Helper to perform efficient search of a string in another one.
		Note: The algorithm used is the one described in Communications of the ACM,
			volume 33, number 8, August 1990, by Daniel M. Sunday. The fuzzy
			version was presented by Peter R. Sibbald in Communications of the
			ACM, volume 35, number 4, April 1992 (Technical Correspondance).
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_SEARCHER

create
	make

feature {NONE} -- Initialization

	make is
			-- Initialize current
		do
			create deltas.make (max_ascii_character_value + 1)
		end

feature -- Initialization

	initialize_deltas (a_pattern: STRING) is
			-- Initialize `deltas' with `a_pattern'.
			-- Optimized for ASCII characters only.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			internal_initialize_deltas (a_pattern, a_pattern.count, deltas)
		end

feature -- Access

	max_ascii_character_value: INTEGER is 255
			-- Number of characters in the extended ASCII character set.

feature -- Search

	substring_index (a_string, a_pattern: STRING; start_pos, end_pos: INTEGER): INTEGER is
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

	substring_index_with_deltas (a_string, a_pattern: STRING; start_pos, end_pos: INTEGER): INTEGER is
			-- Position of first occurrence of `a_pattern' at or after `start_pos' in `a_string'.
			-- 0 if there are no matches.
		require
			a_string_not_void: a_string /= Void
			a_pattern_not_void: a_pattern /= Void
			a_pattern_not_empty: not a_pattern.is_empty
			start_large_enough: start_pos >= 1
			end_pos_large_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= a_string.count
		local
			i, j: INTEGER
			l_pattern_count: INTEGER
			l_matched: BOOLEAN
			l_area, l_pattern_area: SPECIAL [CHARACTER]
			l_char_code: INTEGER
			l_deltas: like deltas
		do
			if a_string = a_pattern then
				if start_pos = 1 then
					Result := 1
				end
			else
				l_pattern_count := a_pattern.count
				if l_pattern_count = 0 then
					Result := start_pos
				else
					from
						l_area := a_string.area
						l_pattern_area := a_pattern.area
						l_deltas := deltas
						i := start_pos - 1
					until
						i + l_pattern_count > end_pos
					loop
						from
							j := 0
							l_matched := True
						until
							j = l_pattern_count
						loop
							if l_area.item (i + j) /= l_pattern_area.item (j) then
									-- Mismatch, so we stop
								j := l_pattern_count - 1	-- Jump out of loop
								l_matched := False
							end
							j := j + 1
						end

						if l_matched then
								-- We got the substring
							Result := i + 1
							i := end_pos + 1	-- Jump out of loop
						else
								-- Pattern was not found, shift to next location
							l_char_code := l_area.item (i + l_pattern_count).code
							if l_char_code > max_ascii_character_value then
								i := i + 1
							else
								i := i + l_deltas.item (l_char_code)
							end
						end
					end
				end
			end
		end

	fuzzy_index (a_string, a_pattern: STRING; start_pos, end_pos, fuzzy: INTEGER): INTEGER is
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
		local
			i, j, l_min_offset: INTEGER
			l_pattern_count, l_nb_mismatched: INTEGER
			l_matched: BOOLEAN
			l_area, l_pattern_area: SPECIAL [CHARACTER]
			l_char_code: INTEGER
			l_deltas_array: like deltas_array
		do
			if fuzzy = a_pattern.count then
					-- More mismatches than the pattern length.
				Result := start_pos
			else
				if fuzzy = 0 then
					Result := substring_index (a_string, a_pattern, start_pos, end_pos)
				else
					initialize_fuzzy_deltas (a_pattern, fuzzy)
					from
						l_area := a_string.area
						l_pattern_area := a_pattern.area
						l_pattern_count := a_pattern.count
						l_deltas_array := deltas_array
						i := start_pos - 1
					until
						i + l_pattern_count > end_pos
					loop
						from
							j := 0
							l_nb_mismatched := 0
							l_matched := True
						until
							j = l_pattern_count
						loop
							if l_area.item (i + j) /= l_pattern_area.item (j) then
								l_nb_mismatched := l_nb_mismatched + 1;
								if l_nb_mismatched > fuzzy then
										-- Too manu mismatched, so we stop
									j := l_pattern_count - 1	-- Jump out of loop
									l_matched := False
								end
							end
							j := j + 1
						end

						if l_matched then
								-- We got the substring
							Result := i + 1
							i := end_pos + 1	-- Jump out of loop
						else
								-- Pattern was not found, compute shift to next location
							from
								j := 0
								l_min_offset := l_pattern_count + 1
							until
								j > fuzzy
							loop
								l_char_code := l_area.item (i + l_pattern_count - j).code
								if l_char_code > max_ascii_character_value then
										-- No optimization for a non-extended ASCII character.
									l_min_offset := 1
									j := fuzzy + 1 -- Jump out of loop
								else
									l_min_offset := l_min_offset.min (l_deltas_array.item (j).item (l_char_code))
								end
								j := j + 1
							end
							i := i + l_min_offset
						end
					end
					deltas_array := Void
				end
			end
		end

feature {NONE} -- Implementation: Access

	deltas: SPECIAL [INTEGER]
			-- Record shifting deltas.

	deltas_array: SPECIAL [like deltas]
			-- Record shifting deltas for fuzzy search.

feature {NONE} -- Implementation

	internal_initialize_deltas (a_pattern: STRING; a_pattern_count: INTEGER; a_deltas: like deltas) is
			-- Initialize `a_deltas' with `a_pattern'.
			-- Optimized for ASCII characters only.
		require
			a_pattern_not_void: a_pattern /= Void
			a_pattern_count_not_negative: a_pattern_count >= 0
			a_pattern_count_valid: a_pattern_count <= a_pattern.count
			a_deltas_not_void: a_deltas /= Void
			a_deltas_valid: a_deltas.count <= max_ascii_character_value + 1			
		local
			l_area: SPECIAL [CHARACTER]
			i, l_char_code: INTEGER
		do
				-- Initialize the delta table (one more than pattern count).
			a_deltas.fill_with (a_pattern_count + 1, 0, max_ascii_character_value)

				-- Now for each character within the pattern, fill in shifting necessary
				-- to bring the pattern to the character. The rightmost value is kept, as
				-- we scan the pattern from left to right (ie. if there is two 'a', only the
				-- delta associated with the second --rightmost-- will be kept).
			from
				l_area := a_pattern.area
				i := 0
			until
				i = a_pattern_count
			loop
				l_char_code := l_area.item (i).code
				if l_char_code <= max_ascii_character_value then
					a_deltas.put (a_pattern_count - i, l_char_code)
				end
				i := i + 1
			end
		end

	initialize_fuzzy_deltas (a_pattern: STRING; fuzzy: INTEGER) is
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
			l_deltas_array: like deltas_array
			i, l_fuzzy: INTEGER
			l_pattern_count: INTEGER
		do
			from
				l_pattern_count := a_pattern.count
				l_fuzzy := fuzzy + 1
				create l_deltas_array.make (l_fuzzy)
			until
				i = l_fuzzy
			loop
				create l_deltas.make (max_ascii_character_value + 1)
				l_deltas_array.put (l_deltas, i)
				internal_initialize_deltas (a_pattern, l_pattern_count - i, l_deltas)
				i := i + 1
			end

			deltas_array := l_deltas_array
		ensure
			deltas_array_not_void: deltas_array /= Void
			deltas_array_count_set: deltas_array.count = fuzzy + 1
		end

invariant
	deltas_not_void: deltas /= Void
	deltas_valid: deltas.count <= max_ascii_character_value + 1

end
