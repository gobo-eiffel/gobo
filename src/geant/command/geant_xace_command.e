indexing

	description:

		"Xace commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_XACE_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'xace' command.
		do
			options := ""
			compile := False
		end

feature -- Status report

	is_executable : BOOLEAN is
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
			-- Xace command-line options

	command: STRING

	command_options: STRING

	xace_filename: STRING
			-- Xace filename

	compile: BOOLEAN
			-- Should compilation be started right after generation?
			-- default: false
			-- implementation note: do not use compile as name here, causes conflicts

feature -- Setting

	set_var (a_name, a_value: STRING) is
			-- Set value `a_value' to variable `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		do
			Variables.force (a_name, a_value)
		end

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

	set_compile (b: BOOLEAN) is
			-- Set `compile' to `b'.
		do
			compile := b
		ensure
			compile_set: compile = b
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
		do
			cmd := clone ("xace ")
			cmd.append_string (options)
			cmd.append_string (" --" + command)
			cmd.append_string (" --" + command_options)
			cmd.append_string (" " + xace_filename)
			log ("  [xace] " + cmd + "%N")
			execute_shell (cmd)

			if compile then
				cmd := "compile se.ace"
				log ("  [xace] " + cmd + "%N")
				execute_shell (cmd)
			end
		end

end -- class GEANT_XACE_COMMAND
