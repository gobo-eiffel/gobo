indexing

	description:

		"Gexace commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


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
			options := ""
			!! defines.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (command /= Void and then command.count > 0) and
				(command_options /= Void and then command_options.count > 0)
		ensure then
			command_not_void: Result implies command /= Void
			command_not_empty: Result implies command.count > 0
			command_options_not_void: Result implies command_options /= Void
			command_options_not_empty: Result implies command_options.count > 0
		end

feature -- Access

	options: STRING
			-- Gexace command-line options

	command: STRING

	command_options: STRING

	xace_filename: STRING
			-- xace filename

	output_filename: STRING
			-- Output filename

	defines: DS_HASH_TABLE [STRING, STRING]
			-- Defined values from the commandline (--define option)

feature -- Setting

	set_options (an_options: like options) is
			-- Set `options' to `an_options'.
		require
			an_options_not_void: an_options /= Void
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_command (a_command: like command) is
			-- Set `command' to `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		do
			command := a_command
		ensure
			command_set: command = a_command
		end

	set_command_options (a_command_options: like command_options) is
			-- Set `command_options' to `a_command_options'.
		require
			a_command_options_not_void: a_command_options /= Void
			a_command_options_not_empty: a_command_options.count > 0
		do
			command_options := a_command_options
		ensure
			command_options_set: command_options = a_command_options
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
			nb: INTEGER
		do
			cmd := clone ("gexace ")

				-- Add defines if they exist:
			nb := defines.count
			if nb > 0 then
				cmd.append_string ("--define=%"")
				from
					defines.start
				until
					defines.after
				loop
					cmd.append_string (defines.key_for_iteration)
					cmd.append_string ("=")
					cmd.append_string (defines.item_for_iteration)

					defines.forth
					if not defines.after then
						cmd.append_string (" ")
					end
				end
				cmd.append_string ("%"")
			end

			cmd.append_string (options)
			cmd.append_string (" --" + command)
			cmd.append_string (" --" + command_options)
			if output_filename /= Void then
				cmd.append_string (" --output=%"")
				cmd.append_string (output_filename)
				cmd.append_string ("%"")
			end
			if xace_filename /= Void then
				cmd.append_string (" " + xace_filename)
			end
			trace ("  [gexace] " + cmd + "%N")
			execute_shell (cmd)
		end

invariant

	defines_not_void: defines /= Void
	no_void_define: not defines.has (Void)

end -- class GEANT_GEXACE_COMMAND
