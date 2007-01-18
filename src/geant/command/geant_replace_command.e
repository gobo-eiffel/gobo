indexing

	description:

		"Replace commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2006, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	is_replace_executable: BOOLEAN is
			-- Can command be executed using `match' xor `token' ?
		do
			Result := (match /= Void and then match.count > 0)
					xor	(token /= Void and then token.count > 0)
					xor (variable_pattern /= Void and then variable_pattern.count > 0)
		ensure
			param_not_void: Result implies (match /= Void or token /= Void or variable_pattern /= Void)
			param_not_empty: Result implies (match /= Void and then match.count > 0) or (token /= Void and then token.count > 0) or
				(variable_pattern /= Void and then variable_pattern.count > 0)
		end

	is_file_to_file_executable: BOOLEAN is
			-- Can command be executed on sourcefile `file' to targetfile `to_file'
			-- with `match' ?
		do
			Result := file /= Void and then file.count > 0 and then
				(to_file = Void or else to_file.count > 0) and then
				is_replace_executable
		ensure
			is_replace_executable: is_replace_executable
			file_not_void: Result implies file /= Void
			file_not_empty: Result implies file.count > 0
			to_file_not_empty: Result implies (to_file = Void or else to_file.count > 0)
		end

	is_fileset_to_directory_executable: BOOLEAN is
			-- Can command be executed on source fileset `fileset' to targetdirectory `to_directory'?
		do
			Result := fileset /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := BOOLEAN_.nxor (<<is_file_to_file_executable, is_fileset_to_directory_executable>>)
		ensure then
			exclusive: Result implies BOOLEAN_.nxor (<<is_file_to_file_executable, is_fileset_to_directory_executable>>)
		end

feature -- Access

	token: STRING
			-- Token to be replaced by `replace'

	variable_pattern: STRING
			-- Pattern for variables to be replaced by their values, '_' as a placeholder for the name

	match: STRING
			-- Pattern to be replaced by `replace'

	replace: STRING
			-- Text to replace `token' or `match' entities.
			-- This value can use regexp patterns such as '\1\'.

	flags: STRING

	file: STRING
			-- Name of source file to process

	to_file: STRING
			-- Name of destination file

	to_directory: STRING
			-- Name of destination directory

	fileset: GEANT_FILESET
			-- Fileset for current command

feature -- Setting

	set_file (a_file: like file) is
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_not_empty: a_file.count > 0
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_to_file (a_to_file: like to_file) is
			-- Set `to_file' to `a_to_file'.
		require
			a_to_file_not_void: a_to_file /= Void
			a_to_file_not_empty: a_to_file.count > 0
		do
			to_file := a_to_file
		ensure
			to_file_set: to_file = a_to_file
		end

	set_to_directory (a_to_directory: like to_directory) is
			-- Set `to_directory' to `a_to_directory'.
		require
			a_to_directory_not_void: a_to_directory /= Void
			a_to_directory_not_empty: a_to_directory.count > 0
		do
			to_directory := a_to_directory
		ensure
			to_directory_set: to_directory = a_to_directory
		end

	set_token (a_token: like token) is
			-- Set `token' to `a_token'.
		require
			a_token_not_void: a_token /= Void
			a_token_not_empty: a_token.count > 0
		do
			token := a_token
		ensure
			token_set: token = a_token
		end

	set_variable_pattern (a_variable_pattern: like variable_pattern) is
			-- Set `variable_pattern' to `a_variable_pattern'.
		require
			a_variable_pattern_not_void: a_variable_pattern /= Void
			a_variable_pattern_not_empty: a_variable_pattern.count > 0
		do
			variable_pattern := a_variable_pattern
		ensure
			variable_pattern_set: variable_pattern = a_variable_pattern
		end

	set_match (a_match: like match) is
			-- Set `match' to `a_match'.
		require
			a_match_not_void: a_match /= Void
			a_match_not_empty: a_match.count > 0
		do
			match := a_match
		ensure
			match_set: match = a_match
		end

	set_replace (a_replace: like replace) is
			-- Set `replace' to `a_replace'.
		require
			a_replace_not_void: a_replace /= Void
			a_replace_not_empty: a_replace.count > 0
		do
			replace := a_replace
		ensure
			replace_set: replace = a_replace
		end

	set_flags (a_flags: like flags) is
			-- Set `flags' to `a_flags'.
		require
			a_flags_not_void: a_flags /= Void
			a_flags_not_empty: a_flags.count > 0
		do
			flags := a_flags
		ensure
			flags_set: flags = a_flags
		end

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_from_file: like file
			a_to_file: like to_file
		do
			exit_code := 0
			if is_file_to_file_executable then
				execute_replace (file, to_file)
			else
				check is_fileset_to_directory_executable: is_fileset_to_directory_executable end

				if not fileset.is_executable then
					project.log (<<"  [replace] error: fileset definition wrong">>)
					exit_code := 1
				end

				if exit_code = 0 then
					fileset.execute
					from
						fileset.start
					until
						fileset.after or else exit_code /= 0
					loop
						if fileset.is_in_gobo_31_format then
							a_from_file := unix_file_system.pathname (fileset.directory_name, fileset.item_filename)
						else
							a_from_file := fileset.item_filename
						end
						if to_directory /= Void then
							a_to_file := unix_file_system.pathname (to_directory, fileset.item_mapped_filename)
						end
							-- Create target directory if necessary:
						if a_to_file /= Void and then a_to_file.count > 0 then
							create_directory_for_pathname (a_to_file)
						end
						execute_replace (a_from_file, a_to_file)

						fileset.forth
					end
				end
			end
		end

	execute_replace (a_filename, a_to_filename: like file) is
		require
			a_filename_valid: a_filename /= Void and then a_filename.count > 0
		local
			l_to_filename: like to_file
		do
			l_to_filename := a_to_filename
			if l_to_filename = Void then
				l_to_filename := a_filename
			end
			if variable_pattern /= Void and then variable_pattern.count > 0 then
				execute_replace_variable_pattern (a_filename, l_to_filename)
			elseif match /= Void and then match.count > 0 then
				execute_replace_regexp (a_filename, l_to_filename)
			elseif token /= Void and then token.count > 0 then
				execute_replace_token (a_filename, l_to_filename)
			end
		end

	execute_replace_variable_pattern (a_filename, a_to_filename: like file) is
			-- Replace variables on the basis of the variable pattern
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			variable_pattern_valid: variable_pattern /= Void and then variable_pattern.count > 0
			not_match: match = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			a_prefix: STRING
			a_postfix: STRING
			i,pos,file_count: INTEGER
			s: STRING
		do
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" variable_pattern=", variable_pattern >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				i := variable_pattern.occurrences (placeholder_character)
				if i = 0 then
					project.log (<<"  [replace] error: variable_pattern is missing a %"" + placeholder_character.out + "%" character">>)
					exit_code := 1
				end
				if i > 1 then
					project.log (<<"  [replace] error: variable_pattern has more then one %"" + placeholder_character.out + "%" character">>)
					exit_code := 1
				end
			end
			if exit_code = 0 then
				a_prefix := variable_pattern.substring (1, pos-1)
				a_postfix := variable_pattern.substring (pos+1, variable_pattern.count)

				if not file_system.file_exists (a_filename) then
					project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
					exit_code := 1
				else
					a_from_file := tmp_input_file
					a_from_file.reset (a_filename)
					file_count := a_from_file.count
					a_from_file.open_read
					if not a_from_file.is_open_read then
						project.log (<<"  [replace] error: file %"" + a_filename + "%" is not readable">>)
						exit_code := 1
					else
						a_from_file.read_string (file_count)
						s := a_from_file.last_string
						a_from_file.close
						a_from_file := Void

						a_to_file := tmp_output_file
						a_to_file.reset (a_to_filename)
						a_to_file.open_write
						if not a_to_file.is_open_write then
							project.log (<<"  [replace] error: file %"" + a_to_file.name + "%" is not writable">>)
							exit_code := 1
						else
							from
								project.variables.start
							until project.variables.off loop
								s := STRING_.replaced_all_substrings (s, a_prefix+project.variables.key_for_iteration+a_postfix,project.variables.item_for_iteration)
								project.variables.forth
							end
							a_to_file.put_string (s)
							a_to_file.close
							a_to_file := Void
						end
					end
				end
			end
		end

	execute_replace_token (a_filename, a_to_filename: like file) is
			-- Replace `token' with `replace'
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			token_valid: token /= Void and then token.count > 0
			not_match: match = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			s: STRING
			a_is_global: BOOLEAN
			a_token: STRING
			a_replace: STRING
			a_flags: STRING
			file_count: INTEGER
		do
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" token=", token, " replace=", replace >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				a_token := token
				a_replace := replace
				if a_replace = Void then
					a_replace := ""
				end
				a_flags := flags

				if a_token = Void then
					project.log (<<"  [replace] error: token is empty">>)
					exit_code := 1
				else
					a_from_file := tmp_input_file
					a_from_file.reset (a_filename)
					file_count := a_from_file.count
					a_from_file.open_read
					if a_from_file.is_open_read then
						a_from_file.read_string (file_count)
						s := a_from_file.last_string
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
		end

	execute_replace_regexp (a_filename, a_to_filename: like file) is
			-- Replace `match' with `replace'
		require
			a_filename_nod_void: a_filename /= Void
			a_to_filename_nod_void: a_to_filename /= Void
			match_valid: token /= Void and then match.count > 0
			not_token: token = Void
		local
			a_from_file: KL_TEXT_INPUT_FILE
			a_to_file: KL_TEXT_OUTPUT_FILE

			s: STRING
			a_match: STRING
			a_replace: STRING
			a_flags: STRING
			a_is_global: BOOLEAN
			file_count: INTEGER

			regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			project.trace (<<"  [replace] file=%"", a_filename, "%" to_file=%"", a_to_filename, "%" match=", match, " replace=", replace >>)

			if not file_system.file_exists (a_filename) then
				project.log (<<"  [replace] error: file %"" + a_filename + "%" does not exists">>)
				exit_code := 1
			end

			if exit_code = 0 then
				a_match := match
				a_replace := replace
				if a_replace = Void then
					a_replace := ""
				end
				a_flags := flags

				if a_match = Void or else a_match.count = 0 then
					project.log (<<"  [replace] error: match definition is missing or empty">>)
					exit_code := 1
				else
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
						a_from_file.reset (file)
						file_count := a_from_file.count
						a_from_file.open_read
						if a_from_file.is_open_read then
							a_from_file.read_string (a_from_file.count)
							regexp.match (a_from_file.last_string)
							a_from_file.close
							a_from_file := Void

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
		end

feature {NONE} -- Implementation

	tmp_input_file: KL_TEXT_INPUT_FILE is
			-- Temporary file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	tmp_output_file: KL_TEXT_OUTPUT_FILE is
			-- Temporary file object
		once
			create Result.make (dummy_name)
		ensure
			file_not_void: Result /= Void
			file_closed: Result.is_closed
		end

	dummy_name: STRING is "_dummy_"

	placeholder_character: CHARACTER is '_'

end
