note

	description:

		"Lcc C-compiler commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_LCC_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := (attached executable as l_executable and then l_executable.count > 0) and
				(attached source_filename as l_source_filename and then l_source_filename.count > 0)
		ensure then
			executable_not_void_and_not_empty: Result implies attached executable as l_executable and then l_executable.count > 0
			source_filename_not_void_and_not_empty: Result implies attached source_filename as l_source_filename and then l_source_filename.count > 0
		end

feature -- Access

	executable: detachable STRING
			-- Option -Fo

	source_filename: detachable STRING
			-- C source filename

feature -- Setting

	set_executable (an_executable: like executable)
			-- Set `executable' to `an_executable'.
		require
			an_executable_not_void: an_executable /= Void
			an_executable_not_empty: an_executable.count > 0
		do
			executable := an_executable
		ensure
			executable_set: executable = an_executable
		end

	set_source_filename (a_filename: like source_filename)
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

	execute
			-- Execute command.
		local
			cmd: STRING
			a_filename: STRING
		do
			check is_executable: attached executable as l_executable and attached source_filename as l_source_filename then
				create cmd.make (128)
				cmd.append_string ("lcc")
				cmd.append_string (" -Fo")
				a_filename := file_system.pathname_from_file_system (l_executable, unix_file_system)
				cmd := STRING_.appended_string (cmd, a_filename)
				cmd.append_string (" ")
				a_filename := file_system.pathname_from_file_system (l_source_filename, unix_file_system)
				cmd := STRING_.appended_string (cmd, a_filename)
				project.trace (<<"  [lcc] ", cmd>>)
				execute_shell (cmd)
			end
		end

end
