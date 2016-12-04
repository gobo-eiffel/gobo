note

	description:

		"Scanner skeletons for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2013/09/19 $"
	revision: "$Revision: #1 $"

deferred class ET_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			text as skeleton_text,
			text_substring as skeleton_text_substring
		redefine
			reset, fatal_error
		end

	ET_EIFFEL_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EIFFEL_COMPILER
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_FILE_SYSTEM
	ET_SHARED_TOKEN_CONSTANTS
	KL_SHARED_STRING_EQUALITY_TESTER

feature {NONE} -- Initialization

	make (a_filename: STRING)
			-- Create a new Eiffel scanner.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			make_with_buffer (Empty_buffer)
			last_text_count := 1
			last_literal_start := 1
			filename := a_filename
			group := tokens.unknown_group
			verbatim_marker := no_verbatim_marker
			verbatim_open_white_characters := no_verbatim_marker
			verbatim_close_white_characters := no_verbatim_marker
		ensure
			filename_set: filename = a_filename
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			last_literal_start := 1
			last_literal_end := 0
			verbatim_marker := no_verbatim_marker
			verbatim_open_white_characters := no_verbatim_marker
			verbatim_close_white_characters := no_verbatim_marker
			precursor
		end

feature -- Access

	filename: STRING
			-- Name of file being parsed

	group: ET_PRIMARY_GROUP
			-- Group to which the class being parsed belongs

	current_universe: ET_UNIVERSE
			-- Universe to which the class being parsed belongs
		do
			Result := group.universe
		ensure
			current_universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
		do
			Result := group.current_system
		ensure
			current_system_not_void: Result /= Void
		end

	current_position: ET_POSITION
			-- Current position
			-- (Create a new object at each call.)
		do
			create {ET_FILE_POSITION} Result.make (filename, line, column)
		ensure
			current_position_not_void: Result /= Void
		end

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory
		do
			Result := current_system.ast_factory
		ensure
			ast_factory_not_void: Result /= Void
		end

feature -- Status report

	use_attached_keyword: BOOLEAN
			-- Should 'attached' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := current_system.use_attached_keyword
		end

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?
		do
			if group.use_obsolete_syntax then
				Result := False
			else
				Result := current_system.use_attribute_keyword
			end
		end

	use_detachable_keyword: BOOLEAN
			-- Should 'detachable' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := current_system.use_detachable_keyword
		end

	use_note_keyword: BOOLEAN
			-- Should 'note' be considered as
			-- a keyword (otherwise identifier)?
		do
			if group.use_obsolete_syntax then
				Result := False
			else
				Result := current_system.use_note_keyword
			end
		end

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := current_system.use_reference_keyword
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := current_system.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

	fatal_error (a_message: STRING)
			-- A fatal error occurred.
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	report_syntax_error (a_position: ET_POSITION)
			-- Report a syntax error at position `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			set_syntax_error
			error_handler.report_syntax_error (filename, a_position)
		end

	set_syntax_error
			-- Set syntax error flag in class being parsed, if already known.
		do
		end

feature -- Cluster dependences

	build_provider_constraint (a_cluster: ET_CLUSTER)
			-- Build `provider_constraint' of `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_string: STRING
			l_splitter: ST_SPLITTER
			l_names: DS_LIST [STRING]
			l_cluster_names: DS_ARRAYED_LIST [STRING]
			l_provider_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
			old_group: ET_PRIMARY_GROUP
			i: INTEGER
		do
			old_group := group
			group := a_cluster
			if current_system.cluster_dependence_enabled then
				l_filename := Execution_environment.interpreted_string (file_system.pathname (a_cluster.full_pathname, "providers.txt"))
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					create l_string.make (512)
					from
						l_file.read_string (512)
					until
						l_file.end_of_file
					loop
						l_string.append_string (l_file.last_string)
						l_file.read_string (512)
					end
					l_file.close
					create l_splitter.make
					l_splitter.set_separators (" %T%R%N")
					l_names := l_splitter.split (l_string)
					create l_cluster_names.make_from_linear (l_names)
					if current_system.use_cluster_dependence_pathnames then
						if not current_system.is_dotnet then
								-- Remove assembly dlls from the list.
							from
								i := l_cluster_names.count
							until
								i < 1
							loop
								if l_cluster_names.item (i).as_lower.ends_with (".dll") then
									l_cluster_names.remove (i)
								end
								i := i - 1
							end
						end
						create l_provider_constraint.make_with_pathnames (a_cluster, l_cluster_names)
					else
						create l_provider_constraint.make (a_cluster, l_cluster_names)
					end
				elseif attached a_cluster.parent as l_cluster_parent then
					l_provider_constraint := l_cluster_parent.provider_constraint
				elseif not attached {ET_SYSTEM} a_cluster.universe then
					create l_cluster_names.make (50)
					add_universe_full_name (a_cluster.universe, l_cluster_names)
					a_cluster.universe.universes_do_all (agent add_universe_full_name (?, l_cluster_names))
					create l_provider_constraint.make (a_cluster, l_cluster_names)
				end
				a_cluster.set_provider_constraint (l_provider_constraint)
			end
			group := old_group
		end

	build_dependant_constraint (a_cluster: ET_CLUSTER)
			-- Build `dependant_constraint' of `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_string: STRING
			l_splitter: ST_SPLITTER
			l_names: DS_LIST [STRING]
			l_cluster_names: DS_ARRAYED_LIST [STRING]
			l_dependant_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
			old_group: ET_PRIMARY_GROUP
			i: INTEGER
		do
			old_group := group
			group := a_cluster
			if current_system.cluster_dependence_enabled then
				l_filename := Execution_environment.interpreted_string (file_system.pathname (a_cluster.full_pathname, "dependants.txt"))
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					create l_string.make (512)
					from
						l_file.read_string (512)
					until
						l_file.end_of_file
					loop
						l_string.append_string (l_file.last_string)
						l_file.read_string (512)
					end
					l_file.close
					create l_splitter.make
					l_splitter.set_separators (" %T%R%N")
					l_names := l_splitter.split (l_string)
					create l_cluster_names.make_from_linear (l_names)
					if current_system.use_cluster_dependence_pathnames then
						if not current_system.is_dotnet then
								-- Remove assembly dlls from the list.
							from
								i := l_cluster_names.count
							until
								i < 1
							loop
								if l_cluster_names.item (i).as_lower.ends_with (".dll") then
									l_cluster_names.remove (i)
								end
								i := i - 1
							end
						end
						create l_dependant_constraint.make_with_pathnames (a_cluster, l_cluster_names)
					else
						create l_dependant_constraint.make (a_cluster, l_cluster_names)
					end
				elseif attached a_cluster.parent as l_cluster_parent then
					l_dependant_constraint := l_cluster_parent.dependant_constraint
				end
				a_cluster.set_dependant_constraint (l_dependant_constraint)
			end
			group := old_group
		end

feature -- Tokens

	has_break: BOOLEAN
			-- Has a break been scanned?
		do
			Result := last_break_end > last_text_count
		ensure
			definition: Result = (last_break_end > last_text_count)
		end

	has_comment: BOOLEAN
			-- Has a comment been scanned?
		do
			Result := last_comment_end > last_text_count
		ensure
			definition: Result = (last_comment_end > last_text_count)
		end

	last_literal_count: INTEGER
			-- Number of characters in `last_literal'
		do
			Result := last_literal_end - last_literal_start + 1
		ensure
			last_literal_count_positive: Result >= 0
			definition: Result = last_literal.count
		end

	last_literal: STRING
			-- Last literal scanned
		do
			Result := text_substring (last_literal_start, last_literal_end)
		ensure
			last_literal_not_void: Result /= Void
		end

	last_identifier: ET_IDENTIFIER
			-- Last identifier scanned
		require
			last_literal_not_empty: last_literal_count > 0
		local
			a_string: STRING
			a_name: STRING
			a_code: INTEGER
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_substring_to_string (last_literal_start, last_literal_end, a_string)
			strings.search (a_string)
			if strings.found then
				a_name := strings.found_key
				a_code := strings.found_item
				if a_code >= 0 then
					create Result.make_with_hash_code (a_name, a_code)
				else
					create Result.make (a_name)
					strings.replace_found_item (Result.hash_code)
				end
			else
				create a_name.make (a_string.count)
				a_name.append_string (a_string)
				create Result.make (a_name)
				strings.force_new (Result.hash_code, a_name)
			end
		ensure
			last_identifier_not_void: Result /= Void
		end

	last_c3_character_constant: ET_C3_CHARACTER_CONSTANT
			-- Last character constant scanned of the form '%/code/'
		require
			-- valid_literal: ((0*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))|(0x[0-9a-fA-F]{1,4})).recognizes (last_literal)
		local
			l_literal: STRING
			l_value: CHARACTER_32
			i, nb: INTEGER
			c: CHARACTER
			l_code: NATURAL_32
		do
			l_literal := last_literal
			if l_literal.starts_with ("0x") then
				nb := l_literal.count
				from i := 3 until i > nb loop
					c := l_literal.item (i)
					l_code := l_code * 16
					inspect c
					when '0' then
							-- Do nothing.
					when '1' then
						l_code := l_code + 1
					when '2' then
						l_code := l_code + 2
					when '3' then
						l_code := l_code + 3
					when '4' then
						l_code := l_code + 4
					when '5' then
						l_code := l_code + 5
					when '6' then
						l_code := l_code + 6
					when '7' then
						l_code := l_code + 7
					when '8' then
						l_code := l_code + 8
					when '9' then
						l_code := l_code + 9
					when 'a', 'A' then
						l_code := l_code + 10
					when 'b', 'B' then
						l_code := l_code + 11
					when 'c', 'C' then
						l_code := l_code + 12
					when 'd', 'D' then
						l_code := l_code + 13
					when 'e', 'E' then
						l_code := l_code + 14
					when 'f', 'F' then
						l_code := l_code + 15
					end
					i := i + 1
				end
			else
				nb := l_literal.count
				from i := 1 until i > nb loop
					c := l_literal.item (i)
					l_code := l_code * 10 + c.natural_32_code - Zero_code.to_natural_32
					i := i + 1
				end
				l_value := l_code.to_character_32
			end
			l_value := l_code.to_character_32
			create Result.make (l_literal, l_value)
		ensure
			last_c3_character_constant_not_void: Result /= Void
		end

	last_special_manifest_string: ET_SPECIAL_MANIFEST_STRING
			-- Last special manifest string scanned
		require
			-- valid_literal: (([^"%\n]|%([^\n]|\/([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (last_literal)
		local
			l_literal, l_value: STRING
			i, nb: INTEGER
			c: CHARACTER
			l_code: INTEGER
		do
			l_literal := last_literal
			nb := l_literal.count
			create l_value.make (nb)
			from i := 1 until i > nb loop
				c := l_literal.item (i)
				if c = '%%' then
					i := i + 1
					c := l_literal.item (i)
					inspect c
					when 'N' then
						l_value.append_character ('%N')
					when 'T' then
						l_value.append_character ('%T')
					when 'U' then
						l_value.append_character ('%U')
					when 'R' then
						l_value.append_character ('%R')
					when 'A' then
						l_value.append_character ('%A')
					when 'B' then
						l_value.append_character ('%B')
					when 'C' then
						l_value.append_character ('%C')
					when 'D' then
						l_value.append_character ('%D')
					when 'F' then
						l_value.append_character ('%F')
					when 'H' then
						l_value.append_character ('%H')
					when 'L' then
						l_value.append_character ('%L')
					when 'Q' then
						l_value.append_character ('%Q')
					when 'S' then
						l_value.append_character ('%S')
					when 'V' then
						l_value.append_character ('%V')
					when '%%' then
						l_value.append_character ('%%')
					when '%'' then
						l_value.append_character ('%'')
					when '%"' then
						l_value.append_character ('%"')
					when '(' then
						l_value.append_character ('%(')
					when ')' then
						l_value.append_character ('%)')
					when '<' then
						l_value.append_character ('%<')
					when '>' then
						l_value.append_character ('%>')
					when '/' then
						from
							i := i + 1
							c := l_literal.item (i)
							l_code := 0
						until
							c = '/'
						loop
							l_code := l_code * 10 + c.code - Zero_code
							i := i + 1
							c := l_literal.item (i)
						end
						l_value.append_character (INTEGER_.to_character (l_code))
					when '%N', '%R', ' ', '%T'  then
						from
							i := i + 1
						until
							l_literal.item (i) = '%%'
						loop
							i := i + 1
						end
					when 'n' then
						l_value.append_character ('%N')
					when 't' then
						l_value.append_character ('%T')
					when 'u' then
						l_value.append_character ('%U')
					when 'r' then
						l_value.append_character ('%R')
					when 'a' then
						l_value.append_character ('%A')
					when 'b' then
						l_value.append_character ('%B')
					when 'c' then
						l_value.append_character ('%C')
					when 'd' then
						l_value.append_character ('%D')
					when 'f' then
						l_value.append_character ('%F')
					when 'h' then
						l_value.append_character ('%H')
					when 'l' then
						l_value.append_character ('%L')
					when 'q' then
						l_value.append_character ('%Q')
					when 's' then
						l_value.append_character ('%S')
					when 'v' then
						l_value.append_character ('%V')
					else
						l_value.append_character (c)
					end
					i := i + 1
				else
					l_value.append_character (c)
					i := i + 1
				end
			end
			create Result.make (l_literal, l_value)
		ensure
			last_special_manifest_string_not_void: Result /= Void
		end

	last_verbatim_string (a_marker, an_open, a_close: STRING; a_left_aligned: BOOLEAN): ET_VERBATIM_STRING
			-- Last verbatim string scanned
		require
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
		local
			l_literal: STRING
			l_value: STRING
			l_longest_break_prefix: INTEGER
			l_nb_lines: INTEGER
			c: CHARACTER
			i, j, nb: INTEGER
			l_stop: BOOLEAN
		do
			l_literal := last_literal
			if l_literal.is_empty then
				l_value := l_literal
			elseif a_left_aligned then
				nb := l_literal.count
				l_longest_break_prefix := -1
				from i := 1 until i > nb loop
					c := l_literal.item (i)
					if c = ' ' or c = '%T' then
						if l_longest_break_prefix /= -1 then
								-- Break prefix of second and subsequent lines.
							if j <= l_longest_break_prefix and then c = l_literal.item (j) then
									-- Same character as in longest break prefix.
								j := j + 1
							else
									-- Reduce size of longest break prefix.
								l_longest_break_prefix := j - 1
									-- Skip the rest of the line.
								from
								until
									i > nb or else l_literal.item (i) = '%N'
								loop
									i := i + 1
								end
								l_nb_lines := l_nb_lines + 1
								j := 1
							end
						end
					else
						if l_longest_break_prefix = -1 then
								-- Break prefix of first line.
							l_longest_break_prefix := i - 1
						else
								-- Reduce size of longest break prefix.
							l_longest_break_prefix := j - 1
						end
							-- Skip the rest of the line.
						from
						until
							i > nb or else l_literal.item (i) = '%N'
						loop
							i := i + 1
						end
						l_nb_lines := l_nb_lines + 1
						j := 1
					end
					i := i + 1
				end
				if l_longest_break_prefix > 0 then
					create l_value.make (nb - l_nb_lines * l_longest_break_prefix)
					from i := 1 until i > nb loop
						from
								-- Skip the longest break prefix.
							i := i + l_longest_break_prefix
							l_stop := False
						until
							l_stop or i > nb
						loop
							c := l_literal.item (i)
							l_value.append_character (c)
							if c = '%N' then
								l_stop := True
							end
							i := i + 1
						end
					end
				else
					l_value := l_literal
				end
			else
				l_value := l_literal
			end
			create Result.make (l_literal, l_value, a_marker, an_open, a_close, a_left_aligned)
		ensure
			last_verbatim_string_not_void: Result /= Void
		end

	last_break: STRING
			-- Last break scanned
		require
			has_break: has_break
		do
			Result := text_substring (last_text_count + 1, last_break_end)
		ensure
			last_break_not_void: Result /= Void
			last_break_not_empty: Result.count > 0
		end

	last_comment: STRING
			-- Last comment scanned
		require
			has_comment: has_comment
		do
			Result := text_substring (last_text_count + 1, last_comment_end)
		ensure
			last_comment_not_void: Result /= Void
			last_comment_not_empty: Result.count > 0
		end

	text: STRING
			-- Text of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_to_string (a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

	text_substring (s, e: INTEGER): STRING
			-- Substring of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_substring_to_string (s, e, a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

feature {NONE} -- Positions

	last_literal_start: INTEGER
			-- Start position of the last literal read

	last_literal_end: INTEGER
			-- End position of the last literal read

	last_text_count: INTEGER
			-- Number of characters in the last text read

	last_break_end: INTEGER
			-- End position of the last break read

	last_comment_end: INTEGER
			-- End position of the last comment read

feature {NONE} -- String handler

	strings: DS_HASH_TABLE [INTEGER, STRING]
			-- Strings known by the current scanner, and the associated
			-- hash codes when they are used as identifier
		once
			create Result.make_map (100000)
			Result.set_key_equality_tester (string_equality_tester)
				-- Needed for compatibility with 5.6.0610 (to be removed later):
			Result.force_new (-1, tokens.capitalized_boolean_ref_name)
			Result.force_new (-1, tokens.capitalized_character_ref_name)
			Result.force_new (-1, tokens.capitalized_character_8_ref_name)
			Result.force_new (-1, tokens.capitalized_character_32_ref_name)
			Result.force_new (-1, tokens.capitalized_double_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_8_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_16_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_32_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_64_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_8_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_16_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_32_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_64_ref_name)
			Result.force_new (-1, tokens.capitalized_pointer_ref_name)
			Result.force_new (-1, tokens.capitalized_real_ref_name)
			Result.force_new (-1, tokens.capitalized_real_32_ref_name)
			Result.force_new (-1, tokens.capitalized_real_64_ref_name)
			Result.force_new (-1, tokens.capitalized_wide_character_ref_name)
				-- Insert basic strings in `strings'.
			Result.force_new (-1, tokens.builtin_marker)
			Result.force_new (-1, tokens.static_builtin_marker)
			Result.force_new (-1, tokens.builtin_static_marker)
				-- Class names.
			Result.force_new (-1, tokens.capitalized_any_name)
			Result.force_new (-1, tokens.capitalized_arguments_32_name)
			Result.force_new (-1, tokens.capitalized_array_name)
			Result.force_new (-1, tokens.capitalized_boolean_name)
			Result.force_new (-1, tokens.capitalized_character_name)
			Result.force_new (-1, tokens.capitalized_character_8_name)
			Result.force_new (-1, tokens.capitalized_character_32_name)
			Result.force_new (-1, tokens.capitalized_com_failure_name)
			Result.force_new (-1, tokens.capitalized_disposable_name)
			Result.force_new (-1, tokens.capitalized_double_name)
			Result.force_new (-1, tokens.capitalized_exception_name)
			Result.force_new (-1, tokens.capitalized_exception_manager_name)
			Result.force_new (-1, tokens.capitalized_exception_manager_factory_name)
			Result.force_new (-1, tokens.capitalized_function_name)
			Result.force_new (-1, tokens.capitalized_identified_routines_name)
			Result.force_new (-1, tokens.capitalized_immutable_string_32_name)
			Result.force_new (-1, tokens.capitalized_integer_name)
			Result.force_new (-1, tokens.capitalized_integer_8_name)
			Result.force_new (-1, tokens.capitalized_integer_16_name)
			Result.force_new (-1, tokens.capitalized_integer_32_name)
			Result.force_new (-1, tokens.capitalized_integer_64_name)
			Result.force_new (-1, tokens.capitalized_internal_name)
			Result.force_new (-1, tokens.capitalized_ise_exception_manager_name)
			Result.force_new (-1, tokens.capitalized_ise_runtime_name)
			Result.force_new (-1, tokens.capitalized_iterable_name)
			Result.force_new (-1, tokens.capitalized_iteration_cursor_name)
			Result.force_new (-1, tokens.capitalized_memory_name)
			Result.force_new (-1, tokens.capitalized_native_array_name)
			Result.force_new (-1, tokens.capitalized_natural_name)
			Result.force_new (-1, tokens.capitalized_natural_8_name)
			Result.force_new (-1, tokens.capitalized_natural_16_name)
			Result.force_new (-1, tokens.capitalized_natural_32_name)
			Result.force_new (-1, tokens.capitalized_natural_64_name)
			Result.force_new (-1, tokens.capitalized_none_name)
			Result.force_new (-1, tokens.capitalized_platform_name)
			Result.force_new (-1, tokens.capitalized_pointer_name)
			Result.force_new (-1, tokens.capitalized_predicate_name)
			Result.force_new (-1, tokens.capitalized_procedure_name)
			Result.force_new (-1, tokens.capitalized_real_name)
			Result.force_new (-1, tokens.capitalized_real_32_name)
			Result.force_new (-1, tokens.capitalized_real_64_name)
			Result.force_new (-1, tokens.capitalized_routine_name)
			Result.force_new (-1, tokens.capitalized_special_name)
			Result.force_new (-1, tokens.capitalized_string_name)
			Result.force_new (-1, tokens.capitalized_string_8_name)
			Result.force_new (-1, tokens.capitalized_string_32_name)
			Result.force_new (-1, tokens.capitalized_system_object_name)
			Result.force_new (-1, tokens.capitalized_system_string_name)
			Result.force_new (-1, tokens.capitalized_tuple_name)
			Result.force_new (-1, tokens.capitalized_type_name)
			Result.force_new (-1, tokens.capitalized_typed_pointer_name)
			Result.force_new (-1, tokens.capitalized_wide_character_name)
			Result.force_new (-1, tokens.capitalized_unknown_name)
				-- Feature names.
			Result.force_new (-1, tokens.after_name)
			Result.force_new (-1, tokens.aliased_resized_area_name)
			Result.force_new (-1, tokens.area_name)
			Result.force_new (-1, tokens.argument_count_name)
			Result.force_new (-1, tokens.as_integer_8_name)
			Result.force_new (-1, tokens.as_integer_16_name)
			Result.force_new (-1, tokens.as_integer_32_name)
			Result.force_new (-1, tokens.as_integer_64_name)
			Result.force_new (-1, tokens.as_natural_8_name)
			Result.force_new (-1, tokens.as_natural_16_name)
			Result.force_new (-1, tokens.as_natural_32_name)
			Result.force_new (-1, tokens.as_natural_64_name)
			Result.force_new (-1, tokens.attached_type_name)
			Result.force_new (-1, tokens.base_address_name)
			Result.force_new (-1, tokens.base_class_name_name)
			Result.force_new (-1, tokens.bit_and_name)
			Result.force_new (-1, tokens.bit_not_name)
			Result.force_new (-1, tokens.bit_or_name)
			Result.force_new (-1, tokens.bit_shift_left_name)
			Result.force_new (-1, tokens.bit_shift_right_name)
			Result.force_new (-1, tokens.bit_xor_name)
			Result.force_new (-1, tokens.boolean_bytes_name)
			Result.force_new (-1, tokens.boolean_field_name)
			Result.force_new (-1, tokens.boolean_field_at_name)
			Result.force_new (-1, tokens.boolean_item_name)
			Result.force_new (-1, tokens.c_strlen_name)
			Result.force_new (-1, tokens.call_name)
			Result.force_new (-1, tokens.capacity_name)
			Result.force_new (-1, tokens.catch_name)
			Result.force_new (-1, tokens.ccom_hresult_name)
			Result.force_new (-1, tokens.ccom_hresult_code_name)
			Result.force_new (-1, tokens.ccom_hresult_facility_name)
			Result.force_new (-1, tokens.ceiling_real_32_name)
			Result.force_new (-1, tokens.ceiling_real_64_name)
			Result.force_new (-1, tokens.character_8_field_name)
			Result.force_new (-1, tokens.character_8_field_at_name)
			Result.force_new (-1, tokens.character_8_item_name)
			Result.force_new (-1, tokens.character_32_field_name)
			Result.force_new (-1, tokens.character_32_field_at_name)
			Result.force_new (-1, tokens.character_32_item_name)
			Result.force_new (-1, tokens.character_bytes_name)
			Result.force_new (-1, tokens.character_size_name)
			Result.force_new (-1, tokens.check_assert_name)
			Result.force_new (-1, tokens.closed_operands_name)
			Result.force_new (-1, tokens.code_name)
			Result.force_new (-1, tokens.compiler_version_name)
			Result.force_new (-1, tokens.conforms_to_name)
			Result.force_new (-1, tokens.conjuncted_name)
			Result.force_new (-1, tokens.conjuncted_semistrict_name)
			Result.force_new (-1, tokens.copy_name)
			Result.force_new (-1, tokens.count_name)
			Result.force_new (-1, tokens.cwin_error_text_name)
			Result.force_new (-1, tokens.cwin_local_free_name)
			Result.force_new (-1, tokens.deep_twin_name)
			Result.force_new (-1, tokens.default_name)
			Result.force_new (-1, tokens.default_create_name)
			Result.force_new (-1, tokens.detachable_type_name)
			Result.force_new (-1, tokens.developer_raise_name)
			Result.force_new (-1, tokens.disjuncted_name)
			Result.force_new (-1, tokens.disjuncted_exclusive_name)
			Result.force_new (-1, tokens.disjuncted_semistrict_name)
			Result.force_new (-1, tokens.dispose_name)
			Result.force_new (-1, tokens.double_bytes_name)
			Result.force_new (-1, tokens.dynamic_type_name)
			Result.force_new (-1, tokens.dynamic_type_at_offset_name)
			Result.force_new (-1, tokens.eif_gen_param_id_name)
			Result.force_new (-1, tokens.eif_id_object_name)
			Result.force_new (-1, tokens.eif_object_id_name)
			Result.force_new (-1, tokens.eif_object_id_free_name)
			Result.force_new (-1, tokens.element_size_name)
			Result.force_new (-1, tokens.exception_from_code_name)
			Result.force_new (-1, tokens.exception_manager_name)
			Result.force_new (-1, tokens.extend_name)
			Result.force_new (-1, tokens.fast_call_name)
			Result.force_new (-1, tokens.fast_item_name)
			Result.force_new (-1, tokens.field_name)
			Result.force_new (-1, tokens.field_count_name)
			Result.force_new (-1, tokens.field_count_of_type_name)
			Result.force_new (-1, tokens.field_name_name)
			Result.force_new (-1, tokens.field_name_of_type_name)
			Result.force_new (-1, tokens.field_offset_of_type_name)
			Result.force_new (-1, tokens.field_static_type_name)
			Result.force_new (-1, tokens.field_static_type_of_type_name)
			Result.force_new (-1, tokens.field_type_name)
			Result.force_new (-1, tokens.field_type_of_type_name)
			Result.force_new (-1, tokens.find_referers_name)
			Result.force_new (-1, tokens.floor_real_32_name)
			Result.force_new (-1, tokens.floor_real_64_name)
			Result.force_new (-1, tokens.forth_name)
			Result.force_new (-1, tokens.free_name)
			Result.force_new (-1, tokens.generating_type_name)
			Result.force_new (-1, tokens.generating_type_of_type_name)
			Result.force_new (-1, tokens.generator_name)
			Result.force_new (-1, tokens.generator_of_type_name)
			Result.force_new (-1, tokens.generic_parameter_count_name)
			Result.force_new (-1, tokens.generic_parameter_type_name)
			Result.force_new (-1, tokens.has_default_name)
			Result.force_new (-1, tokens.hash_code_name)
			Result.force_new (-1, tokens.i_th_argument_pointer_name)
			Result.force_new (-1, tokens.i_th_argument_string_name)
			Result.force_new (-1, tokens.identity_name)
			Result.force_new (-1, tokens.ignore_name)
			Result.force_new (-1, tokens.implication_name)
			Result.force_new (-1, tokens.in_assertion_name)
			Result.force_new (-1, tokens.init_exception_manager_name)
			Result.force_new (-1, tokens.integer_8_field_name)
			Result.force_new (-1, tokens.integer_8_field_at_name)
			Result.force_new (-1, tokens.integer_8_item_name)
			Result.force_new (-1, tokens.integer_16_field_name)
			Result.force_new (-1, tokens.integer_16_field_at_name)
			Result.force_new (-1, tokens.integer_16_item_name)
			Result.force_new (-1, tokens.integer_32_field_name)
			Result.force_new (-1, tokens.integer_32_field_at_name)
			Result.force_new (-1, tokens.integer_32_item_name)
			Result.force_new (-1, tokens.integer_64_field_name)
			Result.force_new (-1, tokens.integer_64_field_at_name)
			Result.force_new (-1, tokens.integer_64_item_name)
			Result.force_new (-1, tokens.integer_bytes_name)
			Result.force_new (-1, tokens.integer_quotient_name)
			Result.force_new (-1, tokens.integer_remainder_name)
			Result.force_new (-1, tokens.is_attached_name)
			Result.force_new (-1, tokens.is_attached_type_name)
			Result.force_new (-1, tokens.is_caught_name)
			Result.force_new (-1, tokens.is_copy_semantics_field_name)
			Result.force_new (-1, tokens.is_deep_equal_name)
			Result.force_new (-1, tokens.is_default_pointer_name)
			Result.force_new (-1, tokens.is_deferred_name)
			Result.force_new (-1, tokens.is_dotnet_name)
			Result.force_new (-1, tokens.is_equal_name)
			Result.force_new (-1, tokens.is_expanded_name)
			Result.force_new (-1, tokens.is_field_expanded_of_type_name)
			Result.force_new (-1, tokens.is_field_transient_of_type_name)
			Result.force_new (-1, tokens.is_ignorable_name)
			Result.force_new (-1, tokens.is_ignored_name)
			Result.force_new (-1, tokens.is_less_name)
			Result.force_new (-1, tokens.is_mac_name)
			Result.force_new (-1, tokens.is_nan_name)
			Result.force_new (-1, tokens.is_negative_infinity_name)
			Result.force_new (-1, tokens.is_object_marked_name)
			Result.force_new (-1, tokens.is_positive_infinity_name)
			Result.force_new (-1, tokens.is_raisable_name)
			Result.force_new (-1, tokens.is_scoop_capable_name)
			Result.force_new (-1, tokens.is_special_name)
			Result.force_new (-1, tokens.is_special_copy_semantics_item_name)
			Result.force_new (-1, tokens.is_special_of_expanded_name)
			Result.force_new (-1, tokens.is_special_of_reference_name)
			Result.force_new (-1, tokens.is_special_of_reference_or_basic_type_name)
			Result.force_new (-1, tokens.is_special_of_reference_type_name)
			Result.force_new (-1, tokens.is_thread_capable_name)
			Result.force_new (-1, tokens.is_tuple_name)
			Result.force_new (-1, tokens.is_tuple_type_name)
			Result.force_new (-1, tokens.is_unix_name)
			Result.force_new (-1, tokens.is_vms_name)
			Result.force_new (-1, tokens.is_vxworks_name)
			Result.force_new (-1, tokens.is_windows_name)
			Result.force_new (-1, tokens.item_name)
			Result.force_new (-1, tokens.item_code_name)
			Result.force_new (-1, tokens.last_exception_name)
			Result.force_new (-1, tokens.last_result_name)
			Result.force_new (-1, tokens.lock_marking_name)
			Result.force_new (-1, tokens.lower_name)
			Result.force_new (-1, tokens.make_name)
			Result.force_new (-1, tokens.make_empty_name)
			Result.force_new (-1, tokens.mark_object_name)
			Result.force_new (-1, tokens.max_type_id_name)
			Result.force_new (-1, tokens.minus_name)
			Result.force_new (-1, tokens.name_name)
			Result.force_new (-1, tokens.nan_name)
			Result.force_new (-1, tokens.natural_8_field_name)
			Result.force_new (-1, tokens.natural_8_field_at_name)
			Result.force_new (-1, tokens.natural_8_item_name)
			Result.force_new (-1, tokens.natural_16_field_name)
			Result.force_new (-1, tokens.natural_16_field_at_name)
			Result.force_new (-1, tokens.natural_16_item_name)
			Result.force_new (-1, tokens.natural_32_code_name)
			Result.force_new (-1, tokens.natural_32_field_name)
			Result.force_new (-1, tokens.natural_32_field_at_name)
			Result.force_new (-1, tokens.natural_32_item_name)
			Result.force_new (-1, tokens.natural_64_field_name)
			Result.force_new (-1, tokens.natural_64_field_at_name)
			Result.force_new (-1, tokens.natural_64_item_name)
			Result.force_new (-1, tokens.negated_name)
			Result.force_new (-1, tokens.negative_infinity_name)
			Result.force_new (-1, tokens.new_cursor_name)
			Result.force_new (-1, tokens.new_instance_name)
			Result.force_new (-1, tokens.new_instance_of_name)
			Result.force_new (-1, tokens.new_special_any_instance_name)
			Result.force_new (-1, tokens.new_special_of_reference_instance_of_name)
			Result.force_new (-1, tokens.new_tuple_instance_of_name)
			Result.force_new (-1, tokens.new_type_instance_of_name)
			Result.force_new (-1, tokens.object_comparison_name)
			Result.force_new (-1, tokens.object_size_name)
			Result.force_new (-1, tokens.once_objects_name)
			Result.force_new (-1, tokens.opposite_name)
			Result.force_new (-1, tokens.out_name)
			Result.force_new (-1, tokens.persistent_field_count_of_type_name)
			Result.force_new (-1, tokens.plus_name)
			Result.force_new (-1, tokens.pointer_bytes_name)
			Result.force_new (-1, tokens.pointer_field_name)
			Result.force_new (-1, tokens.pointer_field_at_name)
			Result.force_new (-1, tokens.pointer_item_name)
			Result.force_new (-1, tokens.positive_infinity_name)
			Result.force_new (-1, tokens.power_name)
			Result.force_new (-1, tokens.pre_ecma_mapping_status_name)
			Result.force_new (-1, tokens.product_name)
			Result.force_new (-1, tokens.put_name)
			Result.force_new (-1, tokens.put_boolean_name)
			Result.force_new (-1, tokens.put_character_8_name)
			Result.force_new (-1, tokens.put_character_32_name)
			Result.force_new (-1, tokens.put_integer_8_name)
			Result.force_new (-1, tokens.put_integer_16_name)
			Result.force_new (-1, tokens.put_integer_32_name)
			Result.force_new (-1, tokens.put_integer_64_name)
			Result.force_new (-1, tokens.put_natural_8_name)
			Result.force_new (-1, tokens.put_natural_16_name)
			Result.force_new (-1, tokens.put_natural_32_name)
			Result.force_new (-1, tokens.put_natural_64_name)
			Result.force_new (-1, tokens.put_pointer_name)
			Result.force_new (-1, tokens.put_real_32_name)
			Result.force_new (-1, tokens.put_real_64_name)
			Result.force_new (-1, tokens.put_reference_name)
			Result.force_new (-1, tokens.quotient_name)
			Result.force_new (-1, tokens.raise_name)
			Result.force_new (-1, tokens.raw_reference_field_at_name)
			Result.force_new (-1, tokens.raw_reference_field_at_offset_name)
			Result.force_new (-1, tokens.real_32_field_name)
			Result.force_new (-1, tokens.real_32_field_at_name)
			Result.force_new (-1, tokens.real_32_item_name)
			Result.force_new (-1, tokens.real_64_field_name)
			Result.force_new (-1, tokens.real_64_field_at_name)
			Result.force_new (-1, tokens.real_64_item_name)
			Result.force_new (-1, tokens.real_bytes_name)
			Result.force_new (-1, tokens.reference_field_name)
			Result.force_new (-1, tokens.reference_field_at_name)
			Result.force_new (-1, tokens.reference_field_at_offset_name)
			Result.force_new (-1, tokens.reference_item_name)
			Result.force_new (-1, tokens.rout_disp_name)
			Result.force_new (-1, tokens.runtime_name_name)
			Result.force_new (-1, tokens.same_type_name)
			Result.force_new (-1, tokens.set_boolean_field_name)
			Result.force_new (-1, tokens.set_boolean_field_at_name)
			Result.force_new (-1, tokens.set_character_8_field_name)
			Result.force_new (-1, tokens.set_character_8_field_at_name)
			Result.force_new (-1, tokens.set_character_32_field_name)
			Result.force_new (-1, tokens.set_character_32_field_at_name)
			Result.force_new (-1, tokens.set_count_name)
			Result.force_new (-1, tokens.set_exception_data_name)
			Result.force_new (-1, tokens.set_integer_8_field_name)
			Result.force_new (-1, tokens.set_integer_8_field_at_name)
			Result.force_new (-1, tokens.set_integer_16_field_name)
			Result.force_new (-1, tokens.set_integer_16_field_at_name)
			Result.force_new (-1, tokens.set_integer_32_field_name)
			Result.force_new (-1, tokens.set_integer_32_field_at_name)
			Result.force_new (-1, tokens.set_integer_64_field_name)
			Result.force_new (-1, tokens.set_integer_64_field_at_name)
			Result.force_new (-1, tokens.set_is_ignored_name)
			Result.force_new (-1, tokens.set_item_name)
			Result.force_new (-1, tokens.set_natural_8_field_name)
			Result.force_new (-1, tokens.set_natural_8_field_at_name)
			Result.force_new (-1, tokens.set_natural_16_field_name)
			Result.force_new (-1, tokens.set_natural_16_field_at_name)
			Result.force_new (-1, tokens.set_natural_32_field_name)
			Result.force_new (-1, tokens.set_natural_32_field_at_name)
			Result.force_new (-1, tokens.set_natural_64_field_name)
			Result.force_new (-1, tokens.set_natural_64_field_at_name)
			Result.force_new (-1, tokens.set_object_comparison_name)
			Result.force_new (-1, tokens.set_operands_name)
			Result.force_new (-1, tokens.set_pointer_field_name)
			Result.force_new (-1, tokens.set_pointer_field_at_name)
			Result.force_new (-1, tokens.set_pre_ecma_mapping_name)
			Result.force_new (-1, tokens.set_real_32_field_name)
			Result.force_new (-1, tokens.set_real_32_field_at_name)
			Result.force_new (-1, tokens.set_real_64_field_name)
			Result.force_new (-1, tokens.set_real_64_field_at_name)
			Result.force_new (-1, tokens.set_reference_field_name)
			Result.force_new (-1, tokens.set_reference_field_at_name)
			Result.force_new (-1, tokens.set_rout_disp_final_name)
			Result.force_new (-1, tokens.standard_copy_name)
			Result.force_new (-1, tokens.standard_is_equal_name)
			Result.force_new (-1, tokens.standard_twin_name)
			Result.force_new (-1, tokens.storable_version_of_type_name)
			Result.force_new (-1, tokens.tagged_out_name)
			Result.force_new (-1, tokens.to_character_name)
			Result.force_new (-1, tokens.to_character_8_name)
			Result.force_new (-1, tokens.to_character_32_name)
			Result.force_new (-1, tokens.to_double_name)
			Result.force_new (-1, tokens.to_integer_32_name)
			Result.force_new (-1, tokens.to_pointer_name)
			Result.force_new (-1, tokens.to_real_name)
			Result.force_new (-1, tokens.to_real_32_name)
			Result.force_new (-1, tokens.to_real_64_name)
			Result.force_new (-1, tokens.truncated_to_integer_name)
			Result.force_new (-1, tokens.truncated_to_integer_64_name)
			Result.force_new (-1, tokens.truncated_to_real_name)
			Result.force_new (-1, tokens.twin_name)
			Result.force_new (-1, tokens.type_conforms_to_name)
			Result.force_new (-1, tokens.type_id_name)
			Result.force_new (-1, tokens.type_id_from_name_name)
			Result.force_new (-1, tokens.type_of_code_name)
			Result.force_new (-1, tokens.type_of_type_name)
			Result.force_new (-1, tokens.unlock_marking_name)
			Result.force_new (-1, tokens.unmark_object_name)
			Result.force_new (-1, tokens.upper_name)
			Result.force_new (-1, tokens.wide_character_bytes_name)
				-- Keywords.
			Result.force_new (-1, tokens.capitalized_current_keyword_name)
			Result.force_new (-1, tokens.capitalized_false_keyword_name)
			Result.force_new (-1, tokens.capitalized_precursor_keyword_name)
			Result.force_new (-1, tokens.capitalized_result_keyword_name)
			Result.force_new (-1, tokens.capitalized_true_keyword_name)
			Result.force_new (-1, tokens.capitalized_void_keyword_name)
			Result.force_new (-1, tokens.capitalized_unique_keyword_name)
			Result.force_new (-1, tokens.across_keyword_name)
			Result.force_new (-1, tokens.agent_keyword_name)
			Result.force_new (-1, tokens.alias_keyword_name)
			Result.force_new (-1, tokens.all_keyword_name)
			Result.force_new (-1, tokens.and_keyword_name)
			Result.force_new (-1, tokens.as_keyword_name)
			Result.force_new (-1, tokens.assign_keyword_name)
			Result.force_new (-1, tokens.attached_keyword_name)
			Result.force_new (-1, tokens.attribute_keyword_name)
			Result.force_new (-1, tokens.check_keyword_name)
			Result.force_new (-1, tokens.class_keyword_name)
			Result.force_new (-1, tokens.convert_keyword_name)
			Result.force_new (-1, tokens.create_keyword_name)
			Result.force_new (-1, tokens.creation_keyword_name)
			Result.force_new (-1, tokens.current_keyword_name)
			Result.force_new (-1, tokens.debug_keyword_name)
			Result.force_new (-1, tokens.deferred_keyword_name)
			Result.force_new (-1, tokens.detachable_keyword_name)
			Result.force_new (-1, tokens.do_keyword_name)
			Result.force_new (-1, tokens.else_keyword_name)
			Result.force_new (-1, tokens.elseif_keyword_name)
			Result.force_new (-1, tokens.end_keyword_name)
			Result.force_new (-1, tokens.ensure_keyword_name)
			Result.force_new (-1, tokens.expanded_keyword_name)
			Result.force_new (-1, tokens.export_keyword_name)
			Result.force_new (-1, tokens.external_keyword_name)
			Result.force_new (-1, tokens.false_keyword_name)
			Result.force_new (-1, tokens.feature_keyword_name)
			Result.force_new (-1, tokens.from_keyword_name)
			Result.force_new (-1, tokens.frozen_keyword_name)
			Result.force_new (-1, tokens.if_keyword_name)
			Result.force_new (-1, tokens.implies_keyword_name)
			Result.force_new (-1, tokens.indexing_keyword_name)
			Result.force_new (-1, tokens.infix_keyword_name)
			Result.force_new (-1, tokens.inherit_keyword_name)
			Result.force_new (-1, tokens.inspect_keyword_name)
			Result.force_new (-1, tokens.invariant_keyword_name)
			Result.force_new (-1, tokens.is_keyword_name)
			Result.force_new (-1, tokens.like_keyword_name)
			Result.force_new (-1, tokens.local_keyword_name)
			Result.force_new (-1, tokens.loop_keyword_name)
			Result.force_new (-1, tokens.not_keyword_name)
			Result.force_new (-1, tokens.note_keyword_name)
			Result.force_new (-1, tokens.obsolete_keyword_name)
			Result.force_new (-1, tokens.old_keyword_name)
			Result.force_new (-1, tokens.once_keyword_name)
			Result.force_new (-1, tokens.or_keyword_name)
			Result.force_new (-1, tokens.precursor_keyword_name)
			Result.force_new (-1, tokens.prefix_keyword_name)
			Result.force_new (-1, tokens.redefine_keyword_name)
			Result.force_new (-1, tokens.reference_keyword_name)
			Result.force_new (-1, tokens.rename_keyword_name)
			Result.force_new (-1, tokens.require_keyword_name)
			Result.force_new (-1, tokens.rescue_keyword_name)
			Result.force_new (-1, tokens.result_keyword_name)
			Result.force_new (-1, tokens.retry_keyword_name)
			Result.force_new (-1, tokens.select_keyword_name)
			Result.force_new (-1, tokens.separate_keyword_name)
			Result.force_new (-1, tokens.some_keyword_name)
			Result.force_new (-1, tokens.strip_keyword_name)
			Result.force_new (-1, tokens.then_keyword_name)
			Result.force_new (-1, tokens.true_keyword_name)
			Result.force_new (-1, tokens.undefine_keyword_name)
			Result.force_new (-1, tokens.unique_keyword_name)
			Result.force_new (-1, tokens.until_keyword_name)
			Result.force_new (-1, tokens.variant_keyword_name)
			Result.force_new (-1, tokens.void_keyword_name)
			Result.force_new (-1, tokens.when_keyword_name)
			Result.force_new (-1, tokens.xor_keyword_name)
				-- Symbols.
			Result.force_new (-1, tokens.arrow_symbol_name)
			Result.force_new (-1, tokens.assign_symbol_name)
			Result.force_new (-1, tokens.assign_attempt_symbol_name)
			Result.force_new (-1, tokens.at_symbol_name)
			Result.force_new (-1, tokens.bang_symbol_name)
			Result.force_new (-1, tokens.colon_symbol_name)
			Result.force_new (-1, tokens.comma_symbol_name)
			Result.force_new (-1, tokens.div_symbol_name)
			Result.force_new (-1, tokens.divide_symbol_name)
			Result.force_new (-1, tokens.dollar_symbol_name)
			Result.force_new (-1, tokens.dot_symbol_name)
			Result.force_new (-1, tokens.dotdot_symbol_name)
			Result.force_new (-1, tokens.equal_symbol_name)
			Result.force_new (-1, tokens.ge_symbol_name)
			Result.force_new (-1, tokens.gt_symbol_name)
			Result.force_new (-1, tokens.le_symbol_name)
			Result.force_new (-1, tokens.left_array_symbol_name)
			Result.force_new (-1, tokens.left_brace_symbol_name)
			Result.force_new (-1, tokens.left_bracket_symbol_name)
			Result.force_new (-1, tokens.left_parenthesis_symbol_name)
			Result.force_new (-1, tokens.lt_symbol_name)
			Result.force_new (-1, tokens.minus_symbol_name)
			Result.force_new (-1, tokens.mod_symbol_name)
			Result.force_new (-1, tokens.not_equal_symbol_name)
			Result.force_new (-1, tokens.plus_symbol_name)
			Result.force_new (-1, tokens.power_symbol_name)
			Result.force_new (-1, tokens.question_mark_symbol_name)
			Result.force_new (-1, tokens.right_array_symbol_name)
			Result.force_new (-1, tokens.right_brace_symbol_name)
			Result.force_new (-1, tokens.right_bracket_symbol_name)
			Result.force_new (-1, tokens.right_parenthesis_symbol_name)
			Result.force_new (-1, tokens.semicolon_symbol_name)
			Result.force_new (-1, tokens.tilde_symbol_name)
			Result.force_new (-1, tokens.times_symbol_name)
		ensure
			strings_not_void: Result /= Void
			no_void_string: not Result.has_void
		end

	string_buffer: STRING
			-- String buffer
		once
			create Result.make (30)
		ensure
			string_buffer_not_void: Result /= Void
		end

feature {NONE} -- Multi-line manifest strings

	ms_line, ms_column: INTEGER
			-- Line and column numbers of currently
			-- scanned special manifest string

feature {NONE} -- Verbatim strings

	verbatim_marker: STRING
			-- Marker of verbatim string currently scanned

	verbatim_open_white_characters: STRING
			-- White characters after "xyz[

	verbatim_close_white_characters: STRING
			-- White characters before ]xyz"

	no_verbatim_marker: STRING = ""
			-- No verbatim marker

	is_verbatim_string_closer (a_start, an_end: INTEGER): BOOLEAN
			-- Is string between indexes `a_start' and `an_end' the
			-- end marker of the verbatim string currently scanned?
		require
			verbatim_string_scanned: verbatim_marker /= no_verbatim_marker
			a_start_large_enough: a_start >= 1
			an_end_small_enough: an_end <= text_count
			-- valid_string: (\n?[ \t\r]*[\]\}][^\n"]*).recognizes (text_substring (a_start, an_end))
		local
			i, j, nb: INTEGER
			l_marker_count: INTEGER
			l_text_count: INTEGER
			c: CHARACTER
		do
			l_marker_count := verbatim_marker.count
			l_text_count := an_end - a_start + 1
			if l_text_count > l_marker_count then
				nb := a_start + l_text_count - l_marker_count - 1
				c := text_item (nb)
				if c = ']' or c = '}' then
					Result := True
						-- Compare end marker with start marker.
					j := nb + 1
					from i := 1 until i > l_marker_count loop
						if verbatim_marker.item (i) = text_item (j) then
							i := i + 1
							j := j + 1
						else
							Result := False
							i := l_marker_count + 1 -- Jump out of the loop.
						end
					end
					if Result then
							-- Check that all leading characters are white characters.
						from j := a_start until j = nb loop
							inspect text_item (j)
							when ' ', '%T', '%R', '%N' then
								j := j + 1
							else
								Result := False
								j := nb -- Jump out of the loop.
							end
						end
					end
				end
			end
		end

feature {NONE} -- Breaks

	break_kind: INTEGER
			-- Kind of break being parsed when reading the
			-- following break or comment

	identifier_break: INTEGER = 1
			-- Internal code corresponding to a break that
			-- follows an identifier

	freeop_break: INTEGER = 2
			-- Internal code corresponding to a break that
			-- follows a freeop

	character_break: INTEGER = 3
			-- Internal code corresponding to a break that
			-- follows a character

	integer_break: INTEGER = 4
			-- Internal code corresponding to a break that
			-- follows an integer

	uinteger_break: INTEGER = 5
			-- Internal code corresponding to a break that
			-- follows an integer with underscores

	hinteger_break: INTEGER = 6
			-- Internal code corresponding to a break that
			-- follows an hexadecimal integer

	ointeger_break: INTEGER = 7
			-- Internal code corresponding to a break that
			-- follows an octal integer

	binteger_break: INTEGER = 8
			-- Internal code corresponding to a break that
			-- follows binary integer

	real_break: INTEGER = 9
			-- Internal code corresponding to a break that
			-- follows a real

	ureal_break: INTEGER = 10
			-- Internal code corresponding to a break that
			-- follows a real with underscores

	string_break: INTEGER = 11
			-- Internal code corresponding to a break that
			-- follows a manifest string

	str_freeop_break: INTEGER = 12
			-- Internal code corresponding to a break that
			-- follows a manifest string containing the
			-- name of a freeop

	str_special_break: INTEGER = 13
			-- Internal code corresponding to a break that
			-- follows a manifest string with special characters

	str_verbatim_break: INTEGER = 14
			-- Internal code corresponding to a break that
			-- follows a verbatim manifest string

	str_left_aligned_verbatim_break: INTEGER = 15
			-- Internal code corresponding to a break that
			-- follows a left-aligned verbatim manifest string

feature {NONE} -- Processing

	process_identifier (nb: INTEGER)
			-- Process identifier with `nb' characters.
			-- Detect keywords.
		require
			nb_large_enough: nb >= 1
			nb_small_enough: nb <= text_count
			-- valid_string: ([a-zA-Z][a-zA-Z0-9_]*).recognizes (text_substring (1, nb))
		do
			last_token := E_IDENTIFIER
			last_literal_start := 1
			last_literal_end := nb
			inspect nb
			when 2 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 's', 'S' then
						last_token := E_AS
						last_detachable_et_keyword_value := ast_factory.new_as_keyword (Current)
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'o', 'O' then
						last_token := E_DO
						last_detachable_et_keyword_value := ast_factory.new_do_keyword (Current)
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'f', 'F' then
						last_token := E_IF
						last_detachable_et_keyword_value := ast_factory.new_if_keyword (Current)
					when 's', 'S' then
						last_token := E_IS
						last_detachable_et_keyword_value := ast_factory.new_is_keyword (Current)
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'r', 'R' then
						last_token := E_OR
						last_detachable_et_keyword_operator_value := ast_factory.new_or_keyword (Current)
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 3 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_AND
							last_detachable_et_keyword_operator_value := ast_factory.new_and_keyword (Current)
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'l', 'L' then
							last_token := E_ALL
							last_detachable_et_keyword_value := ast_factory.new_all_keyword (Current)
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_END
							last_detachable_et_keyword_value := ast_factory.new_end_keyword (Current)
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'n', 'N' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 't', 'T' then
							last_token := E_NOT
							last_detachable_et_keyword_operator_value := ast_factory.new_not_keyword (Current)
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_OLD
							last_detachable_et_keyword_value := ast_factory.new_old_keyword (Current)
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'x', 'X' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'r', 'R' then
							last_token := E_XOR
							last_detachable_et_keyword_operator_value := ast_factory.new_xor_keyword (Current)
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 4 then
				inspect text_item (1)
				when 'e', 'E' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_ELSE
								last_detachable_et_keyword_value := ast_factory.new_else_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'm', 'M' then
								last_token := E_FROM
								last_detachable_et_keyword_value := ast_factory.new_from_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'l', 'L' then
					inspect text_item (2)
					when 'i', 'I' then
						inspect text_item (3)
						when 'k', 'K' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_LIKE
								last_detachable_et_keyword_value := ast_factory.new_like_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'o', 'O' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'p', 'P' then
								last_token := E_LOOP
								last_detachable_et_keyword_value := ast_factory.new_loop_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'n', 'N' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_NONE
								last_detachable_et_identifier_value := ast_factory.new_identifier (Current)
							else
								-- Do nothing.
							end
						when 't', 'T' then
							inspect text_item (4)
							when 'e', 'E' then
								if use_note_keyword then
									last_token := E_NOTE
									last_detachable_et_keyword_value := ast_factory.new_note_keyword (Current)
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'c', 'C' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_ONCE
								last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'm', 'M' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_SOME
								last_detachable_et_keyword_value := ast_factory.new_some_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 't', 'T' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								last_token := E_THEN
								last_detachable_et_keyword_value := ast_factory.new_then_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'r', 'R' then
						inspect text_item (3)
						when 'u', 'U' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_TRUE
								last_detachable_et_boolean_constant_value := ast_factory.new_true_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'v', 'V' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'd', 'D' then
								last_token := E_VOID
								last_detachable_et_void_value := ast_factory.new_void_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'w', 'W' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								last_token := E_WHEN
								last_detachable_et_keyword_value := ast_factory.new_when_keyword (Current)
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 5 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'g', 'G' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								inspect text_item (5)
								when 't', 'T' then
									last_token := E_AGENT
									last_detachable_et_agent_keyword_value := ast_factory.new_agent_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 's', 'S' then
									last_token := E_ALIAS
									last_detachable_et_keyword_value := ast_factory.new_alias_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'k', 'K' then
									last_token := E_CHECK
									last_detachable_et_keyword_value := ast_factory.new_check_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'a', 'A' then
							inspect text_item (4)
							when 's', 'S' then
								inspect text_item (5)
								when 's', 'S' then
									last_token := E_CLASS
									last_detachable_et_keyword_value := ast_factory.new_class_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'b', 'B' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'g', 'G' then
									last_token := E_DEBUG
									last_detachable_et_keyword_value := ast_factory.new_debug_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'a', 'A' then
						inspect text_item (3)
						when 'l', 'L' then
							inspect text_item (4)
							when 's', 'S' then
								inspect text_item (5)
								when 'e', 'E' then
									last_token := E_FALSE
									last_detachable_et_boolean_constant_value := ast_factory.new_false_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'f', 'F' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'x', 'X' then
									last_token := E_INFIX
									last_detachable_et_keyword_value := ast_factory.new_infix_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'l', 'L' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'c', 'C' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'l', 'L' then
									last_token := E_LOCAL
									last_detachable_et_keyword_value := ast_factory.new_local_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'y', 'Y' then
									last_token := E_RETRY
									last_detachable_et_retry_instruction_value := ast_factory.new_retry_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'p', 'P' then
									last_token := E_STRIP
									last_detachable_et_keyword_value := ast_factory.new_strip_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 't', 'T' then
					inspect text_item (2)
					when 'u', 'U' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'l', 'L' then
								inspect text_item (5)
								when 'e', 'E' then
									last_token := E_TUPLE
									last_detachable_et_identifier_value := ast_factory.new_identifier (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'l', 'L' then
									last_token := E_UNTIL
									last_detachable_et_keyword_value := ast_factory.new_until_keyword (Current)
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 6 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'c', 'C' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 's', 'S' then
									inspect text_item (6)
									when 's', 'S' then
										last_token := E_ACROSS
										last_detachable_et_keyword_value := ast_factory.new_across_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 's', 'S' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'g', 'G' then
									inspect text_item (6)
									when 'n', 'N' then
										last_token := E_ASSIGN
										last_detachable_et_keyword_value := ast_factory.new_assign_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 't', 'T' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_CREATE
										last_detachable_et_keyword_value := ast_factory.new_create_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'f', 'F' then
										last_token := E_ELSEIF
										last_detachable_et_keyword_value := ast_factory.new_elseif_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'n', 'N' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_ENSURE
										last_detachable_et_keyword_value := ast_factory.new_ensure_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'x', 'X' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_EXPORT
										last_detachable_et_keyword_value := ast_factory.new_export_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'z', 'Z' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'n', 'N' then
										last_token := E_FROZEN
										last_detachable_et_keyword_value := ast_factory.new_frozen_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'p', 'P' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'f', 'F' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'x', 'X' then
										last_token := E_PREFIX
										last_detachable_et_keyword_value := ast_factory.new_prefix_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'm', 'M' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_RENAME
										last_detachable_et_keyword_value := ast_factory.new_rename_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 's', 'S' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_RESCUE
										last_detachable_et_keyword_value := ast_factory.new_rescue_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							when 'u', 'U' then
								inspect text_item (5)
								when 'l', 'L' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_RESULT
										last_detachable_et_result_value := ast_factory.new_result_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'l', 'L' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_SELECT
										last_detachable_et_keyword_value := ast_factory.new_select_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'q', 'Q' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_UNIQUE
										last_detachable_et_keyword_value := ast_factory.new_unique_keyword (Current)
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 7 then
				inspect text_item (1)
				when 'c', 'C' then
					inspect text_item (2)
					when 'u', 'U' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_CURRENT
											last_detachable_et_current_value := ast_factory.new_current_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'o', 'O' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'v', 'V' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_CONVERT
											last_detachable_et_keyword_value := ast_factory.new_convert_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'a', 'A' then
							inspect text_item (4)
							when 't', 'T' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											last_token := E_FEATURE
											last_detachable_et_keyword_value := ast_factory.new_feature_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'm', 'M' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'l', 'L' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 's', 'S' then
											last_token := E_IMPLIES
											last_detachable_et_keyword_operator_value := ast_factory.new_implies_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'n', 'N' then
						inspect text_item (3)
						when 'h', 'H' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_INHERIT
											last_detachable_et_keyword_value := ast_factory.new_inherit_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 's', 'S' then
							inspect text_item (4)
							when 'p', 'P' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'c', 'C' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_INSPECT
											last_detachable_et_keyword_value := ast_factory.new_inspect_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'q', 'Q' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											last_token := E_REQUIRE
											last_detachable_et_keyword_value := ast_factory.new_require_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'v', 'V' then
					inspect text_item (2)
					when 'a', 'A' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'a', 'A' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_VARIANT
											last_detachable_et_keyword_value := ast_factory.new_variant_keyword (Current)
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 8 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 'h', 'H' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												if use_attached_keyword then
													last_token := E_ATTACHED
													last_detachable_et_keyword_value := ast_factory.new_attached_keyword (Current)
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 't', 'T' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'o', 'O' then
											inspect text_item (8)
											when 'n', 'N' then
												last_token := E_CREATION
												last_detachable_et_keyword_value := ast_factory.new_creation_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'f', 'F' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												last_token := E_DEFERRED
												last_detachable_et_keyword_value := ast_factory.new_deferred_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'x', 'X' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'n', 'N' then
									inspect text_item (6)
									when 'd', 'D' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												last_token := E_EXPANDED
												last_detachable_et_keyword_value := ast_factory.new_expanded_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 't', 'T' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'l', 'L' then
												last_token := E_EXTERNAL
												last_detachable_et_keyword_value := ast_factory.new_external_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'x', 'X' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'g', 'G' then
												last_token := E_INDEXING
												last_detachable_et_keyword_value := ast_factory.new_indexing_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'b', 'B' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 'l', 'L' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 't', 'T' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_OBSOLETE
												last_detachable_et_keyword_value := ast_factory.new_obsolete_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'f', 'F' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_REDEFINE
												last_detachable_et_keyword_value := ast_factory.new_redefine_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'a', 'A' then
										inspect text_item (7)
										when 't', 'T' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_SEPARATE
												last_detachable_et_keyword_value := ast_factory.new_separate_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'f', 'F' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_UNDEFINE
												last_detachable_et_keyword_value := ast_factory.new_undefine_keyword (Current)
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 9 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'b', 'B' then
										inspect text_item (7)
										when 'u', 'U' then
											inspect text_item (8)
											when 't', 'T' then
												inspect text_item (9)
												when 'e', 'E' then
													if use_attribute_keyword then
														last_token := E_ATTRIBUTE
														last_detachable_et_keyword_value := ast_factory.new_attribute_keyword (Current)
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'v', 'V' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'n', 'N' then
												inspect text_item (9)
												when 't', 'T' then
													last_token := E_INVARIANT
													last_detachable_et_keyword_value := ast_factory.new_invariant_keyword (Current)
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'p', 'P' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 's', 'S' then
											inspect text_item (8)
											when 'o', 'O' then
												inspect text_item (9)
												when 'r', 'R' then
													last_token := E_PRECURSOR
													last_detachable_et_precursor_keyword_value := ast_factory.new_precursor_keyword (Current)
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'f', 'F' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'c', 'C' then
												inspect text_item (9)
												when 'e', 'E' then
													if use_reference_keyword then
														last_token := E_REFERENCE
														last_detachable_et_keyword_value := ast_factory.new_reference_keyword (Current)
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 10 then
				inspect text_item (1)
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 'h', 'H' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'b', 'B' then
												inspect text_item (9)
												when 'l', 'L' then
													inspect text_item (10)
													when 'e', 'E' then
														if use_detachable_keyword then
															last_token := E_DETACHABLE
															last_detachable_et_keyword_value := ast_factory.new_detachable_keyword (Current)
														end
													else
														-- Do nothing.
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			else
				-- Do nothing.
			end
			if last_token = E_IDENTIFIER then
				last_detachable_et_identifier_value := ast_factory.new_identifier (Current)
			end
		end

	process_one_char_symbol (c: CHARACTER)
			-- Process Eiffel symbol with made up of only
			-- one character `c'.
		require
			one_char: text_count >= 1
			-- valid_string: ([-+*/^=><.;,:!?(){}[\]$]).recognizes (text_substring (1, 1))
			valid_c: text_item (1) = c
		do
			last_literal_start := 1
			last_literal_end := 1
			inspect c
			when '-' then
				last_token := Minus_code
				last_detachable_et_symbol_operator_value := ast_factory.new_minus_symbol (Current)
			when '+' then
				last_token := Plus_code
				last_detachable_et_symbol_operator_value := ast_factory.new_plus_symbol (Current)
			when '*' then
				last_token := Star_code
				last_detachable_et_symbol_operator_value := ast_factory.new_times_symbol (Current)
			when '/' then
				last_token := Slash_code
				last_detachable_et_symbol_operator_value := ast_factory.new_divide_symbol (Current)
			when '^' then
				last_token := Caret_code
				last_detachable_et_symbol_operator_value := ast_factory.new_power_symbol (Current)
			when '=' then
				last_token := Equal_code
				last_detachable_et_symbol_value := ast_factory.new_equal_symbol (Current)
			when '>' then
				last_token := Greater_than_code
				last_detachable_et_symbol_operator_value := ast_factory.new_gt_symbol (Current)
			when '<' then
				last_token := Less_than_code
				last_detachable_et_symbol_operator_value := ast_factory.new_lt_symbol (Current)
			when '.' then
				last_token := Dot_code
				last_detachable_et_symbol_value := ast_factory.new_dot_symbol (Current)
			when ';' then
				last_token := Semicolon_code
				last_detachable_et_semicolon_symbol_value := ast_factory.new_semicolon_symbol (Current)
			when ',' then
				last_token := Comma_code
				last_detachable_et_symbol_value := ast_factory.new_comma_symbol (Current)
			when ':' then
				last_token := Colon_code
				last_detachable_et_symbol_value := ast_factory.new_colon_symbol (Current)
			when '!' then
				last_token := Exclamation_code
				last_detachable_et_symbol_value := ast_factory.new_bang_symbol (Current)
			when '?' then
				last_token := Question_mark_code
				last_detachable_et_question_mark_symbol_value := ast_factory.new_question_mark_symbol (Current)
			when '(' then
				last_token := Left_parenthesis_code
				last_detachable_et_symbol_value := ast_factory.new_left_parenthesis_symbol (Current)
			when ')' then
				last_token := Right_parenthesis_code
				last_detachable_et_symbol_value := ast_factory.new_right_parenthesis_symbol (Current)
			when '{' then
				last_token := Left_brace_code
				last_detachable_et_symbol_value := ast_factory.new_left_brace_symbol (Current)
			when '}' then
				last_token := Right_brace_code
				last_detachable_et_symbol_value := ast_factory.new_right_brace_symbol (Current)
			when '[' then
				last_token := Left_bracket_code
				last_detachable_et_bracket_symbol_value := ast_factory.new_left_bracket_symbol (Current)
			when ']' then
				last_token := Right_bracket_code
				last_detachable_et_symbol_value := ast_factory.new_right_bracket_symbol (Current)
			when '$' then
				last_token := Dollar_code
				last_detachable_et_symbol_value := ast_factory.new_dollar_symbol (Current)
			when '~' then
				last_token := Tilde_code
				last_detachable_et_symbol_value := ast_factory.new_tilde_symbol (Current)
			else
				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			end
		end

	process_two_char_symbol (c1, c2: CHARACTER)
			-- Process Eiffel symbol with made up of exactly
			-- two characters `c1' and `c2'.
		require
			two_chars: text_count >= 2
			-- valid_string: ("//"|"\\\\"|"/="|"/~"|">="|"<="|"!!"|"->"|".."|"<<"|">>"|":="|"?=").recognizes (text_substring (1, 2))
			valid_c1: text_item (1) = c1
			valid_c2: text_item (2) = c2
		do
			last_literal_start := 1
			last_literal_end := 2
			inspect c1
			when '/' then
				inspect c2
				when '/' then
					last_token := E_DIV
					last_detachable_et_symbol_operator_value := ast_factory.new_div_symbol (Current)
				when '=' then
					last_token := E_NE
					last_detachable_et_symbol_value := ast_factory.new_not_equal_symbol (Current)
				when '~' then
					last_token := E_NOT_TILDE
					last_detachable_et_symbol_value := ast_factory.new_not_tilde_symbol (Current)
				else
					last_token := E_UNKNOWN
					last_detachable_et_position_value := current_position
				end
			when '\' then
				check valid_symbol: c2 = '\' end
				last_token := E_MOD
				last_detachable_et_symbol_operator_value := ast_factory.new_mod_symbol (Current)
			when '>' then
				inspect c2
				when '=' then
					last_token := E_GE
					last_detachable_et_symbol_operator_value := ast_factory.new_ge_symbol (Current)
				when '>' then
					last_token := E_RARRAY
					last_detachable_et_symbol_value := ast_factory.new_right_array_symbol (Current)
				else
					last_token := E_UNKNOWN
					last_detachable_et_position_value := current_position
				end
			when '<' then
				inspect c2
				when '=' then
					last_token := E_LE
					last_detachable_et_symbol_operator_value := ast_factory.new_le_symbol (Current)
				when '<' then
					last_token := E_LARRAY
					last_detachable_et_symbol_value := ast_factory.new_left_array_symbol (Current)
				else
					last_token := E_UNKNOWN
					last_detachable_et_position_value := current_position
				end
			when '-' then
				check valid_symbol: c2 = '>' end
				last_token := E_ARROW
				last_detachable_et_symbol_value := ast_factory.new_arrow_symbol (Current)
			when '.' then
				check valid_symbol: c2 = '.' end
				last_token := E_DOTDOT
				last_detachable_et_symbol_value := ast_factory.new_dotdot_symbol (Current)
			when ':' then
				check valid_symbol: c2 = '=' end
				last_token := E_ASSIGN_SYMBOL
				last_detachable_et_symbol_value := ast_factory.new_assign_symbol (Current)
			when '?' then
				check valid_symbol: c2 = '=' end
				last_token := E_REVERSE
				last_detachable_et_symbol_value := ast_factory.new_assign_attempt_symbol (Current)
			else
				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			end
		end

	process_c1_character_constant (c: CHARACTER)
			-- Process character constant of the form 'A'.
		require
			c1_char: text_count >= 3
			-- valid_string: (\'[^%\n]\').recognizes (text_substring (1, 3))
			valid_c: text_item (2) = c
		do
			if c = '%'' then
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				set_syntax_error
				error_handler.report_SCTQ_error (filename, current_position)
				column := column - 1
			end
			last_literal_start := 2
			last_literal_end := 2
			last_token := E_CHARACTER
			last_detachable_et_character_constant_value := ast_factory.new_c1_character_constant (c, Current)
		end

	process_c2_character_constant (c: CHARACTER)
			-- Process character constant of the form '%A'.
		require
			c2_char: text_count >= 4
			-- valid_string: (\'%.\').recognizes (text_substring (1, 4))
			valid_c: text_item (3) = c
		local
			a_value: CHARACTER
		do
			inspect c
			when 'A' then
				a_value := '%A'
			when 'B' then
				a_value := '%B'
			when 'C' then
				a_value := '%C'
			when 'D' then
				a_value := '%D'
			when 'F' then
				a_value := '%F'
			when 'H' then
				a_value := '%H'
			when 'L' then
				a_value := '%L'
			when 'N' then
				a_value := '%N'
			when 'Q' then
				a_value := '%Q'
			when 'R' then
				a_value := '%R'
			when 'S' then
				a_value := '%S'
			when 'T' then
				a_value := '%T'
			when 'U' then
				a_value := '%U'
			when 'V' then
				a_value := '%V'
			when '%%' then
				a_value := '%%'
			when '%'' then
				a_value := '%''
			when '%"' then
				a_value := '%"'
			when '(' then
				a_value := '%('
			when ')' then
				a_value := '%)'
			when '<' then
				a_value := '%<'
			when '>' then
				a_value := '%>'
			when 'a' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%A'
			when 'b' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%B'
			when 'c' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%C'
			when 'd' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%D'
			when 'f' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%F'
			when 'h' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%H'
			when 'l' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%L'
			when 'n' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%N'
			when 'q' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%Q'
			when 'r' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%R'
			when 's' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%S'
			when 't' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%T'
			when 'u' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%U'
			when 'v' then
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCCU_error (filename, current_position)
				column := column - 2
				a_value := '%V'
			else
					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				set_syntax_error
				error_handler.report_SCSC_error (filename, current_position)
				column := column - 2
				a_value := c
			end
			last_literal_start := 3
			last_literal_end := 3
			last_token := E_CHARACTER
			last_detachable_et_character_constant_value := ast_factory.new_c2_character_constant (a_value, Current)
		end

	process_regular_manifest_string (nb: INTEGER)
			-- Process regular manifest string of the form "..."
			-- with length `nb' (including the two quotes).
		require
			nb_large_enough: nb >= 2
			nb_small_enough: nb <= text_count
			-- valid_string: (\"[^%\n"]*\").recognizes (text_substring (1, nb))
		do
			last_token := E_STRING
			inspect nb
			when 3 then
				inspect text_item (2)
				when '+' then
					last_token := E_STRPLUS
				when '-' then
					last_token := E_STRMINUS
				when '*' then
					last_token := E_STRSTAR
				when '/' then
					last_token := E_STRSLASH
				when '^' then
					last_token := E_STRPOWER
				when '<' then
					last_token := E_STRLT
				when '>' then
					last_token := E_STRGT
				else
					-- Do nothing.
				end
			when 4 then
				inspect text_item (2)
				when '[' then
					inspect text_item (3)
					when ']' then
						last_token := E_STRBRACKET
					else
						-- Do nothing.
					end
				when '(' then
					inspect text_item (3)
					when ')' then
						last_token := E_STRPARENTHESIS
					else
						-- Do nothing.
					end
				when '.' then
					inspect text_item (3)
					when '.' then
						last_token := E_STRDOTDOT
					else
						-- Do nothing.
					end
				when '/' then
					inspect text_item (3)
					when '/' then
						last_token := E_STRDIV
					else
						-- Do nothing.
					end
				when '\' then
					inspect text_item (3)
					when '\' then
						last_token := E_STRMOD
					else
						-- Do nothing.
					end
				when '<' then
					inspect text_item (3)
					when '=' then
						last_token := E_STRLE
					else
						-- Do nothing.
					end
				when '>' then
					inspect text_item (3)
					when '=' then
						last_token := E_STRGE
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (3)
					when 'r', 'R' then
						last_token := E_STROR
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 5 then
				inspect text_item (2)
				when 'a', 'A' then
					inspect text_item (3)
					when 'n', 'N' then
						inspect text_item (4)
						when 'd', 'D' then
							last_token := E_STRAND
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'n', 'N' then
					inspect text_item (3)
					when 'o', 'O' then
						inspect text_item (4)
						when 't', 'T' then
							last_token := E_STRNOT
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'x', 'X' then
					inspect text_item (3)
					when 'o', 'O' then
						inspect text_item (4)
						when 'r', 'R' then
							last_token := E_STRXOR
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 9 then
				inspect text_item (2)
				when 'o', 'O' then
					inspect text_item (3)
					when 'r', 'R' then
						inspect text_item (4)
						when ' ' then
							inspect text_item (5)
							when 'e', 'E' then
								inspect text_item (6)
								when 'l', 'L' then
									inspect text_item (7)
									when 's', 'S' then
										inspect text_item (8)
										when 'e', 'E' then
											last_token := E_STRORELSE
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (3)
					when 'm', 'M' then
						inspect text_item (4)
						when 'p', 'P' then
							inspect text_item (5)
							when 'l', 'L' then
								inspect text_item (6)
								when 'i', 'I' then
									inspect text_item (7)
									when 'e', 'E' then
										inspect text_item (8)
										when 's', 'S' then
											last_token := E_STRIMPLIES
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 10 then
				inspect text_item (2)
				when 'a', 'A' then
					inspect text_item (3)
					when 'n', 'N' then
						inspect text_item (4)
						when 'd', 'D' then
							inspect text_item (5)
							when ' ' then
								inspect text_item (6)
								when 't', 'T' then
									inspect text_item (7)
									when 'h', 'H' then
										inspect text_item (8)
										when 'e', 'E' then
											inspect text_item (9)
											when 'n', 'N' then
												last_token := E_STRANDTHEN
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			else
				-- Do nothing.
			end
			last_literal_start := 2
			last_literal_end := nb - 1
			last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
		end

	process_break
			-- Process break.
		do
			inspect break_kind
			when identifier_break then
				process_identifier (last_text_count)
			when freeop_break then
				last_token := E_FREEOP
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			when character_break then
				last_token := E_CHARACTER
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			when integer_break then
				last_token := E_INTEGER
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			when uinteger_break then
				last_token := E_INTEGER
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			when hinteger_break then
				last_token := E_INTEGER
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			when ointeger_break then
				last_token := E_INTEGER
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			when binteger_break then
				last_token := E_INTEGER
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			when real_break then
				last_token := E_REAL
				last_detachable_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			when ureal_break then
				last_token := E_REAL
				last_detachable_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			when string_break then
				process_regular_manifest_string (last_text_count)
			when str_freeop_break then
				last_token := E_STRFREEOP
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			when str_special_break then
				last_token := E_STRING
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			when str_verbatim_break then
				last_token := E_STRING
				last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker,
					verbatim_open_white_characters, verbatim_close_white_characters, False, Current)
				verbatim_marker := no_verbatim_marker
				verbatim_open_white_characters := no_verbatim_marker
				verbatim_close_white_characters := no_verbatim_marker
			when str_left_aligned_verbatim_break then
				last_token := E_STRING
				last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker,
					verbatim_open_white_characters, verbatim_close_white_characters, True, Current)
				verbatim_marker := no_verbatim_marker
				verbatim_open_white_characters := no_verbatim_marker
				verbatim_close_white_characters := no_verbatim_marker
			else
				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			end
		end

feature {NONE} -- Implementation

	add_universe_full_name (a_universe: ET_UNIVERSE; a_names: DS_ARRAYED_LIST [STRING])
			-- Add full name of `a_universe' to `a_names'.
		require
			a_universe_not_void: a_universe /= Void
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has_void
		do
			a_names.force_last (a_universe.full_name ('/'))
		ensure
			no_void_name: not a_names.has_void
		end

	tmp_file: KL_TEXT_INPUT_FILE
			-- Temporary file object
		do
			Result := shared_file
			if not Result.is_closed then
				create Result.make (dummy_name)
			end
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	shared_file: KL_TEXT_INPUT_FILE
			-- Shared file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
		end

	dummy_name: STRING = "dummy"
			-- Dummy name

invariant

	group_not_void: group /= Void
	filename_not_void: filename /= Void
	last_text_count_positive: last_text_count >= 0
	last_literal_start_large_enough: last_literal_start >= 1
	last_literal_start_small_enough: last_literal_start <= last_literal_end + 1
	last_literal_end_small_enough: last_literal_end <= text_count

end
