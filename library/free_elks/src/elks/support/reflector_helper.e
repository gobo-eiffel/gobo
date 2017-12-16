note
	description: "Helper for routines in INTERNAL class."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-03-04 15:01:25 -0800 (Mon, 04 Mar 2013) $"
	revision: "$Revision: 92178 $"

class
	REFLECTOR_HELPER

feature -- Status report

	is_pre_ecma_mapping_disabled: BOOLEAN
			-- Are we mapping old names to new ECMA names?
			-- False means mapping STRING to STRING_8, INTEGER to INTEGER_32,...
			-- Redefine in descendants of REFLECTOR to modify the behavior of inspection queries of REFLECTOR.
		do
			Result := False
		end

	is_valid_type_string (s: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `s' a valid string representation for a TYPE.
		local
			l_type_name: STRING_32
			l_start_pos, l_end_pos: INTEGER
			l_class_type_name: STRING_32
			l_parameters: like parameters_decomposition
		do
			if s /= Void and then not s.is_empty then
				create l_class_type_name.make_from_string_general (s)
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

						if is_valid_identifier (l_type_name) then
							l_parameters := parameters_decomposition (
								l_class_type_name.substring (l_start_pos + 1, l_end_pos - 1))
							if l_parameters /= Void then
								from
									Result := True
									l_parameters.start
								until
									l_parameters.after or not Result
								loop
									Result := is_valid_type_string (l_parameters.item)
									l_parameters.forth
								end
							end
						end
					end
				else
						-- Ensures that it is a valid type name.
					Result := is_valid_identifier (l_class_type_name)
				end
			end
		end

	mapped_type (a_type: READABLE_STRING_GENERAL): READABLE_STRING_GENERAL
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
				end
			end
			if Result = Void then
				Result := a_type
			end
		ensure
			mapped_type_not_void: Result /= Void
		end

feature {NONE} -- Implementation: status report

	is_valid_identifier (s: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `s' a valid Eiffel identifier?
		require
			name_not_void: s /= Void
		local
			i, nb: INTEGER
			cc: CHARACTER_32
		do
			if not s.is_empty then
				cc := s.item (1)
				nb := s.count + 1
				if cc = attached_mark or cc = detachable_mark then
					i := 2
				elseif s.substring_index (attached_keyword, 1) = 1 then
					i := attached_keyword.count + 1
				elseif s.substring_index (detachable_keyword, 1) = 1 then
					i := detachable_keyword.count + 1
				elseif s.substring_index (expanded_keyword, 1) = 1 then
					i := expanded_keyword.count + 1
				else
					i := 1
				end
				if i > 1 then
						-- Remove any whitespace between the attachment mark and the type name.
					from
					until
						i = nb or not s.item (i).is_space
					loop
						i := i + 1
					end
				end
				if s.item (i).is_alpha then
					from
						Result := True
					until
						i = nb
					loop
						cc := s.item (i)
						if not (cc.is_alpha or cc.is_digit or cc = '_') then
							Result := False
							i := nb - 1
						end
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Decompose string type

	parameters_decomposition (a_str: READABLE_STRING_32): detachable ARRAYED_LIST [READABLE_STRING_32]
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
			if not l_invalid and then l_nesting = 0 then
				Result.extend (a_str.substring (l_first_pos, i - 1))
			else
				Result := Void
			end
		end

feature {NONE} -- ECMA mapping helper

	pre_ecma_type_mapping: STRING_TABLE [STRING]
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

	attached_mark: CHARACTER_32 = '!'
	detachable_mark: CHARACTER_32 = '?'
	attached_keyword: STRING = "attached"
	detachable_keyword: STRING = "detachable"
	expanded_keyword: STRING = "expanded"
			-- Symbols use for attachment marks.

feature {NONE} -- Type creation

	type_keyword: STRING = "TYPE";
			-- Used for creating type objects.
note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
