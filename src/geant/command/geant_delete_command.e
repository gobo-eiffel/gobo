indexing

	description:

		"Delete commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_DELETE_COMMAND

inherit

	GEANT_COMMAND
	KL_SHARED_FILE_SYSTEM

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'mkdir' command.
		do
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		local
			a_has_directory: BOOLEAN
			a_has_file: BOOLEAN
		do
			a_has_directory := directory /= Void and then directory.count > 0
			a_has_file := file /= Void and then file.count > 0
			Result := (a_has_directory and not a_has_file) or (not a_has_directory and a_has_file)
		ensure then
			directory_xor_file_based: Result implies (
				(
					(directory /= Void and directory.count > 0) and
					(file = Void or else file.count = 0)
				)
				or
				(
					(file /= Void and file.count > 0) and
					(directory = Void or else directory.count = 0)
				)
			)
		end

feature -- Access

	directory: STRING
			-- Directory to delete

	file: STRING
			-- File to delete

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

feature -- Execution

	execute is
			-- Execute command.
		do
			log ("  [delete] " + directory + "%N")
			if directory /= Void then
				file_system.delete_directory (directory)
			else
				file_system.delete_file (file)
			end
		end

end -- class GEANT_DELETE_COMMAND
