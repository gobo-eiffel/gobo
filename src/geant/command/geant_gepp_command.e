note

	description:

		"Gepp commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEPP_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'gepp' command.
		do
			precursor (a_project)
			input_filename := ""
			output_filename := ""
			create defines.make (10)
		end

feature -- Status report

	is_file_executable: BOOLEAN is
			-- Can command be executed on sourcefile `input_filename' to targetfile `output_filename'?
		do
			Result := (input_filename /= Void and then input_filename.count > 0) and
				(output_filename /= Void and then output_filename.count > 0)
		ensure
			input_filename_not_void: Result implies input_filename /= Void
			input_filename_not_empty: Result implies input_filename.count > 0
			output_filename_not_void: Result implies output_filename /= Void
			output_filename_not_empty: Result implies output_filename.count > 0
		end

	is_fileset_executable: BOOLEAN is
			-- Can command be executed on `fileset' as input to target defined by `fileset.map'?
		do
			Result := fileset /= Void and then fileset.map /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
			fileset_has_map: Result implies fileset.has_map
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_file_executable xor is_fileset_executable
		ensure then
			file_xor_fileset: Result implies is_file_executable xor is_fileset_executable
		end

feature -- Access

	input_filename: STRING
			-- Input filename

	output_filename: STRING
			-- Output filename

	empty_lines: BOOLEAN
			-- Should empty lines be generated when lines are
			-- ignored in order to preserve line numbering?

	defines: DS_ARRAYED_LIST [STRING]
			-- Defined values from the command-line (-D options)

	to_directory: STRING
			-- Name of destination directory

	fileset: GEANT_FILESET
			-- Fileset for current command

	force: BOOLEAN
			-- Should target files be regenerated,
			-- provided the target files exist, even when target files
			-- are newer than their corresponding source files?

feature -- Setting

	set_input_filename (a_filename: like input_filename) is
			-- Set `input_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			input_filename := a_filename
		ensure
			input_filename_set: input_filename = a_filename
		end

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

	set_empty_lines (b: BOOLEAN) is
			-- Set `empty_lines' to `b'.
		do
			empty_lines := b
		ensure
			empty_lines_set: empty_lines = b
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

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

	set_force (b: BOOLEAN) is
			-- Set `force' to `b'.
		do
			force := b
		ensure
			force_set: force = b
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_from_file: STRING
			a_to_file: STRING
			cmd_template: STRING
			cmd: STRING
			i, nb: INTEGER
		do
			create cmd_template.make (128)
			cmd_template.append_string ("gepp")
				-- Add defines:
			nb := defines.count
			from i := 1 until i > nb loop
				cmd_template.append_string (" -D")
				cmd_template := STRING_.appended_string (cmd_template, defines.item (i))
				i := i + 1
			end
			if empty_lines then
				cmd_template.append_string (" --lines")
			end
				-- Make sure directory named `to_directory' exists if provided:
			if to_directory /= Void and then to_directory.count > 0 then
				create_directory (to_directory)
			end
			if is_file_executable then
				create cmd.make (128)
				cmd.append_string (cmd_template)
				cmd.append_string (" ")
				a_from_file := file_system.pathname_from_file_system (input_filename, unix_file_system)
				if not file_system.file_exists (a_from_file) then
					project.log (<<"  [gepp] error: cannot find input file '", a_from_file, "%'">>)
					exit_code := 1
				end

				if exit_code = 0 then
					cmd := STRING_.appended_string (cmd, a_from_file)
					cmd.append_string (" ")
					if to_directory /= Void and then to_directory.count > 0 then
						a_to_file := unix_file_system.pathname (to_directory, output_filename)
					else
						a_to_file := output_filename
					end
					a_to_file := file_system.pathname_from_file_system (a_to_file, unix_file_system)
					if force or else is_file_outofdate (a_from_file, a_to_file) then
						cmd := STRING_.appended_string (cmd, a_to_file)
						
						project.trace (<<"  [gepp] ", cmd>>)
						execute_shell (cmd)
					end
				end
			else
				check is_fileset_executable: is_fileset_executable end

				if not fileset.is_executable then
					project.log (<<"  [gepp] error: fileset definition wrong">>)
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
						if fileset.has_map then
							a_to_file := fileset.item_mapped_filename
							if to_directory /= Void and then to_directory.count > 0 then
								a_to_file := unix_file_system.pathname (to_directory, a_to_file)
							end
						end
						a_from_file := file_system.pathname_from_file_system (a_from_file, unix_file_system)
						if not file_system.file_exists (a_from_file) then
							project.log (<<"  [gepp] error: cannot find input file '", a_from_file, "%'">>)
							exit_code := 1
						end
						if exit_code = 0 then
							a_to_file := file_system.pathname_from_file_system (a_to_file, unix_file_system)
							if force or else is_file_outofdate (a_from_file, a_to_file) then
								create cmd.make (128)
								cmd.append_string (cmd_template)
								cmd.append_string (" ")
								cmd := STRING_.appended_string (cmd, a_from_file)
								cmd.append_string (" ")
								cmd := STRING_.appended_string (cmd, a_to_file)
								
								project.trace (<<"  [gepp] ", cmd>>)
								execute_shell (cmd)
							end
						end
						fileset.forth
					end

					if exit_code /= 0 then
						project.log (<<"  [gepp] error: cannot gepp">>)
					end
				end
			end
		end

invariant

	defines_not_void: defines /= Void
	no_void_define: not defines.has (Void)

end
