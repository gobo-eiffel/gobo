indexing

	description:

		"Filesystem commands. Support other filesystem related tasks."

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class GEANT_FILESYSTEM_COMMAND

inherit

	GEANT_COMMAND

feature {NONE} -- Implementation

	create_directory (a_directory: STRING) is
			-- Create possibly nested directory
			-- in `a_directory' if it does not exist yet.
		require
			a_directory_not_void: a_directory /= Void
			a_directory_not_empty: a_directory.count > 0
		local
			al_dirname: STRING
		do
			if not project.options.no_exec then
				al_dirname := file_system.pathname_from_file_system (a_directory, unix_file_system)
				if not file_system.directory_exists (al_dirname) then
					project.trace_debug (<<"  creating directory '", al_dirname, "%'">>)
					file_system.recursive_create_directory (al_dirname)
				end
				if not file_system.directory_exists (al_dirname) then
					project.log (<<"  [copy] error: could not create directory '", al_dirname, "%'">>)
					exit_code := 1
				end
			end
		end

	create_directory_for_pathname (a_pathname: STRING) is
			-- Create directory from `a_pathname'.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_not_empty: a_pathname.count > 0
		local
			al_pathname: STRING
		do
			if not project.options.no_exec then
				al_pathname := unix_file_system.dirname (a_pathname)
				al_pathname := file_system.pathname_from_file_system (al_pathname, unix_file_system)
				if not file_system.directory_exists (al_pathname) then
					project.trace_debug (<<"  creating directory '", al_pathname, "%'">>)
					file_system.recursive_create_directory (al_pathname)
				end
				if not file_system.directory_exists (al_pathname) then
					project.log (<<"  [copy] error: could not create directory '", al_pathname, "%'">>)
					exit_code := 1
				end
			end
		end

	is_file_outofdate (a_first_filename, a_second_filename: STRING): BOOLEAN is
			-- Is timestamp of file named `a_second_filename' older than
			-- timestamp of file named `a_first_filename' or doesn't exist at all?
		require
			a_first_filename_not_void: a_first_filename /= Void
			a_second_filename_not_void: a_second_filename /= Void
			-- first_file_exists: file_system.file_exists (first_filename)
		local
			a_first_time: INTEGER
			a_second_time: INTEGER
		do
			if not file_system.file_exists (a_second_filename) then
				Result := True
			else
				a_first_time := file_system.file_time_stamp (a_first_filename)
				a_second_time := file_system.file_time_stamp (a_second_filename)
				Result := a_second_time < a_first_time
			end
		end

end
