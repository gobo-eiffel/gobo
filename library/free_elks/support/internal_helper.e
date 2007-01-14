indexing

	description: "Helper for routines in INTERNAL class."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	INTERNAL_HELPER

feature -- Status report

	is_pre_ecma_mapping_disabled: BOOLEAN
			-- Are we mapping old names to new ECMA names?
			-- False means. mapping STRING to STRING_8, INTEGER to INTEGER_32,...

	is_valid_type_string (s: STRING): BOOLEAN is
			-- Is `s' a valid string representation for a TYPE.
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		local
			l_parameters: ARRAYED_LIST [STRING]
			l_type_name: STRING
			l_start_pos, l_end_pos: INTEGER
			l_class_type_name: STRING
		do
			l_class_type_name := s.twin
			l_class_type_name.left_adjust
			l_class_type_name.right_adjust

				-- Let's see if it is a generic type.
			l_start_pos := l_class_type_name.index_of ('[', 1)

			if l_start_pos > 1 then
					-- Looks like it is a generic class.
				l_end_pos := l_class_type_name.count
				if l_class_type_name.item (l_end_pos) /= ']' then
					l_end_pos := 0
				end
				if
					l_end_pos = l_class_type_name.count and l_start_pos < l_end_pos and
					l_class_type_name.occurrences ('[') = l_class_type_name.occurrences (']')
				then
						-- A well formed generic class.
					l_type_name := l_class_type_name.substring (1, l_start_pos - 1)
					l_type_name.left_adjust
					l_type_name.right_adjust

					Result := is_valid_identifier (l_type_name)

					if Result then
						l_parameters := parameters_decomposition (
							l_class_type_name.substring (l_start_pos + 1, l_end_pos - 1))
						from
							l_parameters.start
						until
							l_parameters.after or not Result
						loop
							Result := is_valid_type_string (l_parameters.item)
							l_parameters.forth
						end
					end
				end
			else
					-- Ensures that it is a valid type name.
				Result := is_valid_identifier (l_class_type_name)
			end
		end

	mapped_type (a_type: STRING): STRING is
			-- If `is_pre_ecma_mapping_disabled' `a_type', otherwise
			-- the mapped typed.
		require
			a_type_not_void: a_type /= Void
		local
			l_table: like pre_ecma_type_mapping
		do
			if not is_pre_ecma_mapping_disabled then
				l_table := pre_ecma_type_mapping
				l_table.search (a_type)
				if l_table.found then
					Result := l_table.found_item
				else
					Result := a_type
				end
			else
				Result := a_type
			end
		ensure
			mapped_type_not_void: Result /= Void
		end

feature -- Status setting

	enable_pre_ecma_mapping is
			-- Set `is_pre_ecma_mapping_disabled' to False.
		do
			is_pre_ecma_mapping_disabled := False
		ensure
			is_pre_ecma_mapping_disabled_set: not is_pre_ecma_mapping_disabled
		end

	disable_pre_ecma_mapping is
			-- Set `is_pre_ecma_mapping_disabled' to True.
		do
			is_pre_ecma_mapping_disabled := True
		ensure
			is_pre_ecma_mapping_disabled_set: is_pre_ecma_mapping_disabled
		end

feature {NONE} -- Implementation: status report

	is_valid_identifier (s: STRING): BOOLEAN is
			-- Is `s' a valid Eiffel identifier?
		require
			name_not_void: s /= Void
		local
			i, nb: INTEGER
			cc: CHARACTER
		do
			Result := not s.is_empty and then s.item (1).is_alpha
			from
				i := 2
				nb := s.count + 1
			until
				i = nb or not Result
			loop
				cc := s.item (i)
				Result := cc.is_alpha or cc.is_digit or cc = '_'
				i := i + 1
			end
		end

feature {NONE} -- Decompose string type

	parameters_decomposition (a_str: STRING): ARRAYED_LIST [STRING] is
			-- Decompose `a_str' which should be of the form "A, B, D [G], H [E ,F]"
			-- into a list of strings "A", "B", "D [G]", "H [E, F]"
			-- If decomposition is not possible, Void.
		require
			a_str_not_void: a_str /= Void
		local
			i, nb: INTEGER
			l_invalid: BOOLEAN
			l_first_pos: INTEGER
			l_nesting: INTEGER
		do
			from
				create Result.make (5)
				i := 1
				l_first_pos := 1
				nb := a_str.count
			until
				i > nb or l_invalid
			loop
				inspect
					a_str.item (i)
				when ',' then
					if l_nesting = 0 then
						Result.extend (a_str.substring (l_first_pos, i - 1))
						l_first_pos := i + 1
					end
				when '[' then
					l_nesting := l_nesting + 1
				when ']' then
					l_nesting := l_nesting - 1
					l_invalid := l_nesting < 0
				else
					-- Do nothing
				end
				i := i + 1
			end
			l_invalid := l_invalid or l_nesting /= 0
			if l_nesting /= 0 then
				Result := Void
			else
				Result.extend (a_str.substring (l_first_pos, i - 1))
			end
		end

feature {NONE} -- ECMA mapping helper

	pre_ecma_type_mapping: HASH_TABLE [STRING, STRING] is
			-- Mapping between pre-ECMA type naming and new names.
		once
			create Result.make (12)
			Result.put ("STRING_8", "STRING")
			Result.put ("INTEGER_32", "INTEGER")
			Result.put ("INTEGER_32_REF", "INTEGER_REF")
			Result.put ("CHARACTER_8", "CHARACTER")
			Result.put ("CHARACTER_8_REF", "CHARACTER_REF")
			Result.put ("CHARACTER_32", "WIDE_CHARACTER")
			Result.put ("CHARACTER_32_REF", "WIDE_CHARACTER_REF")
			Result.put ("REAL_32", "REAL")
			Result.put ("REAL_32_REF", "REAL_REF")
			Result.put ("REAL_64", "DOUBLE")
			Result.put ("REAL_64_REF", "DOUBLE_REF")
		ensure
			pre_ecma_type_mapping_not_void: Result /= Void
		end

end
