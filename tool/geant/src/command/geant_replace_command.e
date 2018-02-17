note

	description:

		"Replace commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2006-2018, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_REPLACE_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND

	KL_IMPORTED_BOOLEAN_ROUTINES
		export {NONE} all end

create

	make

feature -- Status report

	is_replace_executable: BOOLEAN
			-- Can command be executed using `match' xor `token' ?
		do
			Result := (attached match as l_match and then l_match.count > 0)
					xor	(attached token as l_token and then l_token.count > 0)
					xor (attached variable_pattern as l_variable_pattern and then l_variable_pattern.count > 0)
		ensure
			param_not_void: Result implies (match /= Void or token /= Void or variable_pattern /= Void)
			param_not_empty: Result implies (attached match as l_match and then l_match.count > 0) or (attached token as l_token and then l_token.count > 0) or
				(attached variable_pattern as l_variable_pattern and then l_variable_pattern.count > 0)
		end

	is_file_to_file_executable: BOOLEAN
			-- Can command be executed on sourcefile `file' to targetfile `to_file'
			-- with `match' ?
		do
			Result := attached file as l_file and then l_file.count > 0 and then
				(not attached to_file as l_to_file or else l_to_file.count > 0) and then
				is_replace_executable
		ensure
			is_replace_executable: is_replace_executable
			file_not_void_and_not_empty: Result implies attached file as l_file and then l_file.count > 0
			to_file_not_empty: Result implies (not attached to_file as l_to_file or else l_to_file.count > 0)
		end

	is_fileset_to_directory_executable: BOOLEAN
			-- Can command be executed on source fileset `fileset' to targetdirectory `to_directory'?
		do
			Result := fileset /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
		end

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := BOOLEAN_.nxor (<<is_file_to_file_executable, is_fileset_to_directory_executable>>)
		ensure then
			exclusive: Result implies BOOLEAN_.nxor (<<is_file_to_file_executable, is_fileset_to_directory_executable>>)
		end

feature -- Access

	token: detachable STRING
			-- Token to be replaced by `replace'

	variable_pattern: detachable STRING
			-- Pattern for variables to be replaced by their values, '_' as a placeholder for the name

	match: detachable STRING
			-- Pattern to be replaced by `replace'

	replace: detachable STRING
			-- Text to replace `token' or `match' entities.
			-- This value can use regexp patterns such as '\1\'.

	flags: detachable STRING

	file: detachable STRING
			-- Name of source file to process

	to_file: detachable STRING
			-- Name of destination file

	to_directory: detachable STRING
			-- Name of destination directory

	fileset: detachable GEANT_FILESET
			-- Fileset for current command

feature -- Setting

	set_file (a_file: like file)
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_not_empty: a_file.count > 0
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_to_file (a_to_file: like to_file)
			-- Set `to_file' to `a_to_file'.
		require
			a_to_file_not_void: a_to_file /= Void
			a_to_file_not_empty: a_to_file.count > 0
		do
			to_file := a_to_file
		ensure
			to_file_set: to_file = a_to_file
		end

	set_to_directory (a_to_directory: like to_directory)
			-- Set `to_directory' to `a_to_directory'.
		require
			a_to_directory_not_void: a_to_directory /= Void
			a_to_directory_not_empty: a_to_directory.count > 0
		do
			to_directory := a_to_directory
		ensure
			to_directory_set: to_directory = a_to_directory
		end

	set_token (a_token: like token)
			-- Set `token' to `a_token'.
		require
			a_token_not_void: a_token /= Void
			a_token_not_empty: a_token.count > 0
		do
			token := a_token
		ensure
			token_set: token = a_token
		end

	set_variable_pattern (a_variable_pattern: like variable_pattern)
			-- Set `variable_pattern' to `a_variable_pattern'.
		require
			a_variable_pattern_not_void: a_variable_pattern /= Void
			a_variable_pattern_not_empty: a_variable_pattern.count > 0
		do
			variable_pattern := a_variable_pattern
		ensure
			variable_pattern_set: variable_pattern = a_variable_pattern
		end

	set_match (a_match: like match)
			-- Set `match' to `a_match'.
		require
			a_match_not_void: a_match /= Void
			a_match_not_empty: a_match.count > 0
		do
			match := a_match
		ensure
			match_set: match = a_match
		end

	set_replace (a_replace: like replace)
			-- Set `replace' to `a_replace'.
		require
			a_replace_not_void: a_replace /= Void
			a_replace_not_empty: a_replace.count > 0
		do
			replace := a_replace
		ensure
			replace_set: replace = a_replace
		end

	set_flags (a_flags: like flags)
			-- Set `flags' to `a_flags'.
		require
			a_flags_not_void: a_flags /= Void
			a_flags_not_empty: a_flags.count > 0
		do
			flags := a_flags
		ensure
			flags_set: flags = a_flags
		end

	set_fileset (a_fileset: like fileset)
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

feature -- Execution

	execute
			-- Execute command.
		local
			a_from_file: like file
			a_to_file: like to_file
		do
			exit_code := 0
			if is_file_to_file_executable and then attached file as l_file then
				execute_replace (l_file, to_file)
			else
				check is_fileset_to_directory_executable: is_fileset_to_directory_executable and then attached fileset as l_fileset then

					if not l_fileset.is_executable then
						project.log (<<"  [replace] error: fileset definition wrong">>)
						exit_code := 1
					end

					if exit_code = 0 then
						l_fileset.execute
						from
							l_fileset.start
						until
							l_fileset.after or else exit_code /= 0
						loop
							if l_fileset.is_in_gobo_31_format and then attached l_fileset.directory_name as l_fileset_directory_name then
								a_from_file := unix_file_system.pathname (l_fileset_directory_name, l_fileset.item_filename)
							else
								a_from_file := l_fileset.item_filename
							end
							if attached to_directory as l_to_directory then
								a_to_file := unix_file_system.pathname (l_to_directory, l_fileset.item_mapped_filename)
							end
								-- Create target directory if necessary:
							if a_to_file /= Void and then a_to_file.count > 0 then
								create_directory_for_pathname (a_to_file)
							end
							execute_replace (a_from_file, a_to_file)

							l_fileset.forth
						end
					end
				end
			end
		end

	execute_replace (a_filename: STRING; a_to_filename: like to_file)
			-- Replace command.
		require
			a_filename_valid: a_filename /= Void and then a_filename.count > 0
		local
			l_to_filename: like to_file
		do
			l_to_filename := a_to_filename
			if l_to_filename = Void then
				l_to_filename := a_filename
			end
			if attached variable_pattern as l_variable_pattern and then l_variable_pattern.count > 0 then
				execute_replace_variable_pattern (a_filename, l_to_filename, l_variable_pattern)
			elseif attached match as l_match and then l_match.count > 0 then
				execute_replace_regexp (a_filename, l_to_filename, l_match)
			elseif attached token as l_token and then l_token.count > 0 then
				execute_replace_token (a_filename, l_to_filename, l_token)
			end
		end

	execute_replace_variable_pattern (a_filename, a_to_filename, a_variable_pattern: STRING)
			-- Replace variables on the basis of the variable pattern
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			variable_pattern_valid: a_variable_pattern /= Void and then a_variable_pattern.count > 0
			not_match: match = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			a_prefix: STRING
			a_postfix: STRING
			i,pos: INTEGER
			s: STRING
			j: INTEGER
			l_vars: GEANT_VARIABLES
			l_vars_array: ARRAY [GEANT_VARIABLES]
		do
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" variable_pattern=", a_variable_pattern >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				i := a_variable_pattern.occurrences (placeholder_character)
				if i = 0 then
					project.log (<<"  [replace] error: variable_pattern is missing a %"" + placeholder_character.out + "%" character">>)
					exit_code := 1
				end
				if i > 1 then
					project.log (<<"  [replace] error: variable_pattern has more than one %"" + placeholder_character.out + "%" character">>)
					exit_code := 1
				end
			end
			if exit_code = 0 then
				pos := a_variable_pattern.index_of (placeholder_character, 1)
 				a_prefix := a_variable_pattern.substring (1, pos - 1)
				a_postfix := a_variable_pattern.substring (pos + 1, a_variable_pattern.count)

				if not file_system.file_exists (a_filename) then
					project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
					exit_code := 1
				else
					a_from_file := tmp_input_file
					a_from_file.reset (a_filename)
					a_from_file.open_read
					if not a_from_file.is_open_read then
						project.log (<<"  [replace] error: file %"" + a_filename + "%" is not readable">>)
						exit_code := 1
					else
						from
							create s.make_empty
							a_from_file.read_string (read_chunk_size)
						until
							a_from_file.end_of_file
						loop
							s.append_string (a_from_file.last_string)
							a_from_file.read_string (read_chunk_size)
						end
						a_from_file.close
						a_from_file := Void

						a_to_file := tmp_output_file
						a_to_file.reset (a_to_filename)
						a_to_file.open_write
						if not a_to_file.is_open_write then
							project.log (<<"  [replace] error: file %"" + a_to_file.name + "%" is not writable">>)
							exit_code := 1
						else
							l_vars_array := project.aggregated_variables_array

							from
								j := l_vars_array.lower
							until
								j > l_vars_array.upper
							loop
								l_vars := l_vars_array[j]
									--| This may be improved by replacing all patterns in one pass.
								if l_vars /= Void then
									from
										l_vars.start
									until
										l_vars.after
									loop
										s := STRING_.replaced_all_substrings (s,
												a_prefix + l_vars.key_for_iteration + a_postfix,
												l_vars.item_for_iteration
											)
										l_vars.forth
									end
								end
								j := j + 1
							end
							a_to_file.put_string (s)
							a_to_file.close
							a_to_file := Void
						end
					end
				end
			end
		end

	execute_replace_token (a_filename, a_to_filename, a_token: STRING)
			-- Replace `a_token' with `replace'
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			token_valid: a_token /= Void and then a_token.count > 0
			not_match: match = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			s: STRING
			a_is_global: BOOLEAN
			a_replace: detachable STRING
			a_flags: detachable STRING
		do
			a_replace := replace
			if a_replace = Void then
				a_replace := ""
			end
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" token=", a_token, " replace=", a_replace >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				a_flags := flags

				a_from_file := tmp_input_file
				a_from_file.reset (a_filename)
				a_from_file.open_read
				if a_from_file.is_open_read then
					from
						create s.make_empty
						a_from_file.read_string (read_chunk_size)
					until
						a_from_file.end_of_file
					loop
						s.append_string (a_from_file.last_string)
						a_from_file.read_string (read_chunk_size)
					end
					a_from_file.close
					a_from_file := Void

					a_to_file := tmp_output_file
					a_to_file.reset (a_to_filename)
					a_to_file.open_write
					if a_to_file.is_open_write then
						if a_flags /= Void then
							a_is_global := a_flags.has ('g')
							if
								a_flags.has ('i')
								or a_flags.has ('m')
								or a_flags.has ('s')
							then
								project.log (<<"  [replace] warning: flags i,m,s are ignored for token replacement">>)
							end
						end
						if a_is_global then
							s := STRING_.replaced_all_substrings (s, a_token, a_replace)
						else
							s := STRING_.replaced_first_substring (s, a_token, a_replace)
						end
						a_to_file.put_string (s)
						a_to_file.close
						a_to_file := Void
					else
						project.log (<<"  [replace] error: file %"" + a_to_file.name + "%" is not writable">>)
						exit_code := 1
					end
				else
					project.log (<<"  [replace] error: file %"" + a_from_file.name + "%" is not readable">>)
					exit_code := 1
				end
			end
		end

	execute_replace_regexp (a_filename, a_to_filename, a_match: STRING)
			-- Replace `a_match' with `replace'
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			match_valid: a_match /= Void and then a_match.count > 0
			not_token: token = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			s: STRING
			a_replace: detachable STRING
			a_flags: detachable STRING
			a_is_global: BOOLEAN

			regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			a_replace := replace
			if a_replace = Void then
				a_replace := ""
			end
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" match=", a_match, " replace=", a_replace >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				a_flags := flags

				create regexp.make
				if a_flags /= Void then
					a_is_global := a_flags.has ('g')
					regexp.set_caseless (a_flags.has ('i'))
					if a_flags.has ('m') and a_flags.has ('s') then
						project.log (<<"  [replace] warning: flags 'm' and 's' are both enabled, use default: 's' .">>)
					elseif a_flags.has ('s') then
						regexp.set_multiline (False)
					elseif a_flags.has ('m') then
						regexp.set_multiline (True)
					end
				end

				regexp.compile (a_match)
				if regexp.is_compiled then
					a_from_file := tmp_input_file
					a_from_file.reset (a_filename)
					a_from_file.open_read
					if a_from_file.is_open_read then
						from
							create s.make_empty
							a_from_file.read_string (read_chunk_size)
						until
							a_from_file.end_of_file
						loop
							s.append_string (a_from_file.last_string)
							a_from_file.read_string (read_chunk_size)
						end
						a_from_file.close
						a_from_file := Void

						regexp.match (s)
						if regexp.has_matched then
							project.trace (<<"  [replace] match_count = ", regexp.match_count.out >>)
							a_to_file := tmp_output_file
							a_to_file.reset (a_to_filename)
							a_to_file.open_write
							if a_to_file.is_open_write then
								if a_is_global then
									s := regexp.replace_all (a_replace)
								else
									s := regexp.replace (a_replace)
								end
								a_to_file.put_string (s)
								a_to_file.close
								a_to_file := Void
							else
								project.log (<<"  [replace] error: file %"" + a_to_file.name + "%" is not writable">>)
								exit_code := 1
							end
						end
					else
						project.log (<<"  [replace] error: file %"" + a_from_file.name + "%" is not readable">>)
						exit_code := 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	tmp_input_file: KL_TEXT_INPUT_FILE
			-- Temporary file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	tmp_output_file: KL_TEXT_OUTPUT_FILE
			-- Temporary file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	dummy_name: STRING = "_dummy_"

	placeholder_character: CHARACTER = '_'

	read_chunk_size: INTEGER = 4096

end
