indexing

	description:

		"Getest commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GETEST_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'getest' command.
		do
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := config_filename /= Void and then config_filename.count > 0
		ensure then
			config_filename_not_void: Result implies config_filename /= Void
			config_filename_not_empty: Result implies config_filename.count > 0
		end

feature -- Access

	config_filename: STRING
			-- Config filename

feature -- Setting

	set_config_filename (a_filename: STRING) is
			-- Set `config_filename' to `a_filename'
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			config_filename := a_filename
		ensure
			config_filename_set: config_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
		do
			cmd := clone ("getest ")
			cmd.append_string (config_filename)
			log("  [getest] " + cmd + "%N")
			execute_shell (cmd)
		end

end -- class GEANT_GETEST_COMMAND
