indexing

	description:

		"Gexace commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEXACE_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'gexace' command.
		do
			precursor (a_project)
			!! defines.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (is_validate_executable and not (is_system_executable or is_cluster_executable)) or
				(is_system_executable and not (is_validate_executable or is_cluster_executable)) or
				(is_cluster_executable and not (is_validate_executable or is_system_executable))
		ensure then
			definition: Result = ((is_validate_executable and not (is_system_executable or is_cluster_executable)) or
				(is_system_executable and not (is_validate_executable or is_cluster_executable)) or
				(is_cluster_executable and not (is_validate_executable or is_system_executable)))
		end

	is_validate_executable: BOOLEAN is
			-- Can 'validate' command be execute?
		do
			Result := (validate_command and output_filename = Void)
		ensure
			validate_command: Result implies validate_command
			output_filename_void: Result implies output_filename = Void
		end

	is_system_executable: BOOLEAN is
			-- Can 'system' command be executed?
		do
			Result := (system_command /= Void and then system_command.count > 0)
		ensure
			system_command_not_void: Result implies system_command /= Void
			system_command_not_empty: Result implies system_command.count > 0
		end

	is_cluster_executable: BOOLEAN is
			-- Can 'cluster' command be executed?
		do
			Result := (cluster_command /= Void and then cluster_command.count > 0)
		ensure
			cluster_command_not_void: Result implies cluster_command /= Void
			cluster_command_not_empty: Result implies cluster_command.count > 0
		end

feature -- Access

	verbose: BOOLEAN
			-- Gexace '--verbose' command-line options

	system_command: STRING
			-- System command compiler name

	cluster_command: STRING
			-- Cluster command compiler name

	validate_command: BOOLEAN
			-- Validate command

	xace_filename: STRING
			-- xace filename

	output_filename: STRING
			-- Output filename

	defines: DS_HASH_TABLE [STRING, STRING]
			-- Defined values from the command-line (--define option)

feature -- Setting

	set_verbose (b: BOOLEAN) is
			-- Set `verbose' to `an_options'.
		do
			verbose := b
		ensure
			verbose_set: verbose = b
		end

	set_validate_command (b: BOOLEAN) is
			-- Set `validate_command' to `b'.
		do
			validate_command := b
		ensure
			validate_command_set: validate_command = b
		end

	set_system_command (a_command: like system_command) is
			-- Set `system_command' to `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		do
			system_command := a_command
		ensure
			system_command_set: system_command = a_command
		end

	set_cluster_command (a_command: like cluster_command) is
			-- Set `cluster_command' to `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		do
			cluster_command := a_command
		ensure
			cluster_command_set: cluster_command = a_command
		end

	set_xace_filename (a_filename: like xace_filename) is
			-- Set `xace_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			xace_filename := a_filename
		ensure
			xace_filename_set: xace_filename = a_filename
		end

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
			a_filename: STRING
		do
			cmd := clone ("gexace ")
				-- Add defines if they exist:
			if defines.count > 0 then
				cmd.append_string ("--define=%"")
				a_cursor := defines.new_cursor
				from a_cursor.start until a_cursor.after loop
					cmd.append_string (a_cursor.key)
					cmd.append_string ("=")
					cmd.append_string (a_cursor.item)
					a_cursor.forth
					if not a_cursor.after then
						cmd.append_string (" ")
					end
				end
				cmd.append_string ("%"")
			end
			if verbose then
				cmd.append_string (" --verbose")
			end
			if is_validate_executable then
				cmd.append_string (" --validate")
			else
				if is_system_executable then
					cmd.append_string (" --system=%"" + system_command + "%"")
				elseif is_cluster_executable then
					cmd.append_string (" --cluster=%"" + cluster_command + "%"")
				end
				if output_filename /= Void then
					cmd.append_string (" --output=%"")
					a_filename := file_system.pathname_from_file_system (output_filename, unix_file_system)
					cmd.append_string (a_filename)
					cmd.append_string ("%"")
				end
			end
			if xace_filename /= Void then
				a_filename := file_system.pathname_from_file_system (xace_filename, unix_file_system)
				cmd.append_string (" " + a_filename)
			end
			project.trace ("  [gexace] " + cmd + "%N")
			execute_shell (cmd)
		end

invariant

	defines_not_void: defines /= Void
	no_void_define_name: not defines.has (Void)
	no_void_define_value: not defines.has_item (Void)

end
