indexing

	description:

		"Lcc C-compiler commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_LCC_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'lcc' command.
		do
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (executable /= Void and then executable.count > 0) and
				(source_filename /= Void and then source_filename.count > 0)
		ensure then
			executable_not_void: Result implies executable /= Void
			executable_not_empty: Result implies executable.count > 0
			source_filename_not_void: Result implies source_filename /= Void
			source_filename_not_empty: Result implies source_filename.count > 0
		end

feature -- Access

	executable: STRING
			-- Option -Fo

	source_filename: STRING
			-- C source filename

feature -- Setting

	set_executable (an_executable: like executable) is
			-- Set `executable' to `an_executable'.
		require
			an_executable_not_void: an_executable /= Void
			an_executable_not_empty: an_executable.count > 0
		do
			executable := an_executable
		ensure
			executable_set: executable = an_executable
		end

	set_source_filename (a_filename: like source_filename) is
			-- Set `source_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			source_filename := a_filename
		ensure
			source_filename_set: source_filename = a_filename
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
		do
			cmd := clone ("lcc")
			cmd.append_string (" -Fo")
			cmd.append_string (executable)
			cmd.append_string (" ")
			cmd.append_string (source_filename)
			log ("  [lcc] " + cmd + "%N")
			execute_shell (cmd)
		end

end -- class GEANT_LCC_COMMAND
