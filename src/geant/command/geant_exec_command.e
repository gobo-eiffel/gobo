indexing

	description:

		"Exec commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_EXEC_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := command_line /= Void and then command_line.count > 0
		ensure then
			command_line_not_void: Result implies command_line /= Void
			command_line_not_empty: Result implies command_line.count > 0
		end

feature -- Access

	command_line: STRING
			-- Command-line

feature -- Setting

	set_command_line (a_command_line: like command_line) is
			-- Set `command_line' to `a_command_line'.
		require
			a_command_line_not_void: a_command_line /= Void
			a_command_line_not_empty: a_command_line.count > 0
		do
			command_line := a_command_line
		ensure
			command_list_set: command_line = a_command_line
		end

feature -- Execution

	execute is
			-- Execute command.
		do
			log ("  [exec] " + command_line + "%N")
			execute_shell (command_line)
		end

end -- class GEANT_EXEC_COMMAND
