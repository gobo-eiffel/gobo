indexing

	description:

		"Mkdir commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_MKDIR_COMMAND

inherit

	GEANT_COMMAND
	KL_SHARED_FILE_SYSTEM

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := directory /= Void and then directory.count > 0
		ensure then
			directory_not_void: Result implies directory /= Void
			directory_not_empty: Result implies directory.count > 0
		end

feature -- Access

	directory: STRING
			-- Directory to create

feature -- Setting

	set_directory (a_directory: like directory) is
			-- Set `directory' to `a_directory'.
		require
			a_directory_not_void: a_directory /= Void
			a_directory_not_empty: a_directory.count > 0
		do
			directory := a_directory
		ensure
			directory_set: directory = a_directory
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_directory: KI_DIRECTORY
			a_name: STRING
		do
			trace ("  [mkdir] " + directory + "%N")
			a_name := file_system.pathname_from_file_system (directory, unix_file_system)

			! KL_DIRECTORY ! a_directory.make (a_name)
			a_directory.recursive_create_directory
			if not file_system.is_directory_readable (a_name) then
					log ("  [mkdir] error: cannot create directory '" + a_name + "'%N")
				exit_code := 1
			end
		end

end -- class GEANT_MKDIR_COMMAND
