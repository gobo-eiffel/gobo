note
	description: "Helper for routines in INTERNAL class."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	INTERNAL_HELPER

feature -- Status report

	is_pre_ecma_mapping_disabled: BOOLEAN
			-- Are we mapping old names to new ECMA names?
			-- False means mapping STRING to STRING_8, INTEGER to INTEGER_32,...
		do
			Result := False
		end

	is_valid_type_string (s: STRING): BOOLEAN
			-- Is `s' a valid string representation for a TYPE.
		local
			l_type_name: STRING
			l_start_pos, l_end_pos: INTEGER
			l_class_type_name: STRING
			l_parameters: detachable ARRAYED_LIST [STRING]
		do
			if s /= Void and then not s.is_empty then
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

	mapped_type (a_type: STRING): STRING
			-- If `is_pre_ecma_mapping_disabled' `a_type', otherwise
			-- the mapped typed.
		require
			a_type_not_void: a_type /= Void
		local
			l_table: like pre_ecma_type_mapping
			r: detachable STRING
		do
			if not is_pre_ecma_mapping_disabled then
				l_table := pre_ecma_type_mapping
				l_table.search (a_type)
				if l_table.found then
					r := l_table.found_item
				end
			end
			if r = Void then
				r := a_type
			end
			Result := r
		ensure
			mapped_type_not_void: Result /= Void
		end

feature -- Status setting

	enable_pre_ecma_mapping
			-- Set `is_pre_ecma_mapping_disabled' to False.
		obsolete
			"Use an instance of INTERNAL instead."
		do
		end

	disable_pre_ecma_mapping
			-- Set `is_pre_ecma_mapping_disabled' to True.
		obsolete
			"Use an instance of ECMA_INTERNAL instead."
		do
		end

feature {NONE} -- Implementation: status report

	is_valid_identifier (s: STRING): BOOLEAN
			-- Is `s' a valid Eiffel identifier?
		require
			name_not_void: s /= Void
		local
			i, nb: INTEGER
			cc: CHARACTER
		do
			if not s.is_empty then
				cc := s.item (1)
				nb := s.count + 1
				if cc = attached_mark or cc = detachable_mark then
					from
						i := 2
					until
						i = nb or not s.item (i).is_space
					loop
						i := i + 1
					end
				else
					i := 1
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

	parameters_decomposition (a_str: STRING): detachable ARRAYED_LIST [STRING]
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
			r: ARRAYED_LIST [STRING]
		do
			from
				create r.make (5)
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
						r.extend (a_str.substring (l_first_pos, i - 1))
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
				r.extend (a_str.substring (l_first_pos, i - 1))
				Result := r
			end
		end

feature {NONE} -- ECMA mapping helper

	pre_ecma_type_mapping: HASH_TABLE [STRING, STRING]
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

	attached_mark: CHARACTER = '!'
	detachable_mark: CHARACTER = '?'
			-- Symbols use for attachment marks.
end
