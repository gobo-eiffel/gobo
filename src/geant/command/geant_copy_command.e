indexing

	description:

		"Copy commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_COPY_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_file_to_file_executable: BOOLEAN is
			-- Can command be executed on sourcefile `file' to targetfile `to_file'?
		do
			Result := file /= Void and then file.count > 0 and then
				to_file /= Void and then to_file.count > 0
		ensure
			file_not_void: Result implies file /= Void
			file_not_empty: Result implies file.count > 0
			to_file_not_void: Result implies to_file /= Void
			to_file_not_empty: Result implies to_file.count > 0
		end

	is_file_to_directory_executable: BOOLEAN is
			-- Can command be executed on sourcefile `file' to targetdirectory `to_directory'?
		do
			Result := file /= Void and then file.count > 0 and then
				to_directory /= Void and then to_directory.count > 0
		ensure
			file_not_void: Result implies file /= Void
			file_not_empty: Result implies file.count > 0
			to_directory_not_void: Result implies to_directory /= Void
			to_directory_not_empty: Result implies to_directory.count > 0
		end

	is_fileset_to_directory_executable: BOOLEAN is
			-- Can command be executed on source fileset `fileset' to targetdirectory `to_directory'?
			-- Can command be executed on a to_directory?
		do
			Result := fileset /= Void and then
				to_directory /= Void and then to_directory.count > 0
		ensure
			fileset_not_void: Result implies fileset /= Void
			to_directory_not_void: Result implies to_directory /= Void
			to_directory_not_empty: Result implies to_directory.count > 0
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result :=
				(is_file_to_file_executable and not is_file_to_directory_executable and not is_fileset_to_directory_executable) or
				(not is_file_to_file_executable and is_file_to_directory_executable and not is_fileset_to_directory_executable) or
				(not is_file_to_file_executable and not is_file_to_directory_executable and is_fileset_to_directory_executable)
		ensure then
			file_xor_directory_xor_fileset: Result implies
				((is_file_to_file_executable and not is_file_to_directory_executable and not is_fileset_to_directory_executable) or
				(not is_file_to_file_executable and is_file_to_directory_executable and not is_fileset_to_directory_executable) or
				(not is_file_to_file_executable and not is_file_to_directory_executable and is_fileset_to_directory_executable))
		end

feature -- Access

	file: STRING
			-- Name of source file to copy

	to_file: STRING
			-- Name of destination file for copy

	to_directory: STRING
			-- Name of destination directory for copy

	fileset: GEANT_FILESET
		-- Fileset for current command

feature -- Setting

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

	set_to_file (a_to_file: like to_file) is
			-- Set `to_file' to `a_to_file'.
		require
			a_to_file_not_void: a_to_file /= Void
			a_to_file_not_empty: a_to_file.count > 0
		do
			to_file := a_to_file
		ensure
			to_file_set: to_file = a_to_file
		end

	set_to_directory (a_to_directory: like to_directory) is
			-- Set `to_directory' to `a_to_directory'.
		require
			a_to_directory_not_void: a_to_directory /= Void
			a_to_directory_not_empty: a_to_directory.count > 0
		do
			to_directory := a_to_directory
		ensure
			to_directory_set: to_directory = a_to_directory
		end

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_to_file: STRING
			a_basename: STRING
			a_pathname: STRING
		do
			exit_code := 0

			if is_file_to_directory_executable then
					-- Check that directory named `to_directory' exists:
				a_pathname := file_system.pathname_from_file_system (to_directory, unix_file_system)
				if not file_system.directory_exists (a_pathname) then
					log ("  [copy] error: directory '" + a_pathname + "' does not exist.%N")
					exit_code := 1
				end
				if exit_code = 0 then
					a_basename := unix_file_system.basename (file)
					a_to_file := unix_file_system.pathname (to_directory, a_basename)
					copy_file (file, a_to_file)
				end
			elseif is_file_to_file_executable then
				copy_file (file, to_file)
			else
				check is_fileset_to_directory_executable: is_fileset_to_directory_executable end

				a_pathname := file_system.pathname_from_file_system (to_directory, unix_file_system)
				if not file_system.directory_exists (a_pathname) then
					log ("  [copy] error: directory '" + a_pathname + "' does not exist.%N")
					exit_code := 1
				end
				if exit_code = 0 then
					fileset.execute
	
					from
						fileset.filenames.start
					until
						fileset.filenames.after or else exit_code /= 0
					loop
							-- Create target directory if necessary:
						a_pathname := unix_file_system.dirname (fileset.filenames.item_for_iteration)
						a_pathname := unix_file_system.pathname(to_directory, a_pathname)
						a_pathname := file_system.pathname_from_file_system (a_pathname, unix_file_system)
						if not file_system.directory_exists (a_pathname) then
							file_system.recursive_create_directory (a_pathname)
						end
						if not file_system.directory_exists (a_pathname) then
							log ("  [copy] error: could not create directory '" + a_pathname + "'%N")
							exit_code := 1
						end
						if exit_code = 0 then
							a_to_file := unix_file_system.pathname(to_directory, fileset.filenames.item_for_iteration)
							copy_file (fileset.filenames.item_for_iteration, a_to_file)
						end
	
						fileset.filenames.forth
					end
				end
			end
		end

feature {NONE} -- Implementation

	copy_file (a_source_file, a_target_file: STRING) is
			-- Copy `a_source_file' to `a_target_file;
			-- Set `exit_code' in case `a_source_file' does
			-- not exist or could not be copied.
		require
			a_source_file_not_void: a_source_file /= Void
			a_source_file_not_empty: a_source_file.count > 0
			a_target_file_not_void: a_target_file /= Void
			a_target_file_not_empty: a_target_file.count > 0
		local
			new_name, old_name: STRING
			a_source_time: INTEGER
			a_target_time: INTEGER
		do
			old_name := file_system.pathname_from_file_system (a_source_file, unix_file_system)
			new_name := file_system.pathname_from_file_system (a_target_file, unix_file_system)
			if not file_system.file_exists (old_name) then
					-- Check that source file exists:
				trace ("  [copy] " + old_name + " to " + new_name + "%N")
				log ("  [copy] error: cannot find file '" + old_name + "'%N")
				exit_code := 1
			else
					-- Copy file if target is out of date:
				a_source_time := file_system.file_time_stamp (old_name)
				a_target_time := file_system.file_time_stamp (new_name)
				if a_target_time < a_source_time then
					trace ("  [copy] " + old_name + " to " + new_name + "%N")
					file_system.copy_file (old_name, new_name)
					if not file_system.file_exists (new_name) then
						log ("  [copy] error: cannot copy file '" + old_name + "' to file '" + new_name + "'%N")
						exit_code := 1
					end
				end
			end
		end

end -- class GEANT_COPY_COMMAND
