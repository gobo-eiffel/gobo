note

	description:

		"Delete commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DELETE_COMMAND

inherit

	GEANT_COMMAND

	KL_IMPORTED_BOOLEAN_ROUTINES
		export {NONE} all end

create

	make

feature -- Status report

	is_file_executable: BOOLEAN
			-- Can command be executed on a file?
		do
			Result := file /= Void and then file.count > 0
		ensure
			file_not_void: Result implies file /= Void
			file_not_empty: Result implies file.count > 0
		end

	is_directory_executable: BOOLEAN
			-- Can command be executed on a directory?
		do
			Result := directory /= Void and then directory.count > 0
		ensure
			directory_not_void: Result implies directory /= Void
			directory_not_empty: Result implies directory.count > 0
		end

	is_fileset_executable: BOOLEAN
			-- Can command be executed on a fileset?
		do
			Result := fileset /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
		end

	is_directoryset_executable: BOOLEAN
			-- Can command be executed on a directoryset?
		do
			Result := directoryset /= Void
		ensure
			directoryset_not_void: Result implies directoryset /= Void
		end

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := BOOLEAN_.nxor (<<is_file_executable,
				is_directory_executable, (is_fileset_executable or is_directoryset_executable)>>)
		ensure then
			exclusive: Result implies BOOLEAN_.nxor (<<is_file_executable,
				is_directory_executable, (is_fileset_executable or is_directoryset_executable)>>)
		end

feature -- Access

	directory: STRING
			-- Directory to delete

	file: STRING
			-- File to delete

	fileset: GEANT_FILESET
		-- Fileset for current command

	directoryset: GEANT_DIRECTORYSET
		-- Directoryset for current command

feature -- Setting

	set_directory (a_directory: like directory)
			-- Set `directory' to `a_directory'.
		require
			a_directory_not_void: a_directory /= Void
			a_directory_not_empty: a_directory.count > 0
		do
			directory := a_directory
		ensure
			directory_set: directory = a_directory
		end

	set_file (a_file: like file)
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_not_empty: a_file.count > 0
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_fileset (a_fileset: like fileset)
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

	set_directoryset (a_directoryset: like directoryset)
			-- Set `directoryset' to `a_directoryset'.
		require
			a_directoryset_not_void: a_directoryset /= Void
		do
			directoryset := a_directoryset
		ensure
			directoryset_set: directoryset = a_directoryset
		end

feature -- Execution

	execute
			-- Execute command.
		local
			a_name: STRING
			i: INTEGER
		do
			exit_code := 0
			if is_directory_executable then
				a_name := file_system.pathname_from_file_system (directory, unix_file_system)
				project.trace (<<"  [delete] ", a_name>>)
				if not project.options.no_exec then
					file_system.recursive_delete_directory (a_name)
					if file_system.directory_exists (a_name) then
							-- On Windows 7, there seems to be a delay between the time the
							-- file or directory is deleted and the time it is shown as deleted.
						from
							i := 1
							file_system.recursive_delete_directory (a_name)
						until
							i > 1000 or else not file_system.directory_exists (a_name)
						loop
							file_system.recursive_delete_directory (a_name)
							i := i + 1
						end
						if file_system.directory_exists (a_name) then
							project.log (<<"  [delete] error: cannot delete directory '", a_name, "%'">>)
							exit_code := 1
						end
					end
				end
			elseif is_file_executable then
				a_name := file_system.pathname_from_file_system (file, unix_file_system)
				project.trace (<<"  [delete] ", a_name>>)
				if not project.options.no_exec then
					file_system.delete_file (a_name)
					if file_system.file_exists (a_name) then
							-- On Windows 7, there seems to be a delay between the time the
							-- file or directory is deleted and the time it is shown as deleted.
						from
							i := 1
							file_system.delete_file (a_name)
						until
							i > 1000 or else not file_system.file_exists (a_name)
						loop
							file_system.delete_file (a_name)
							i := i + 1
						end
						if file_system.file_exists (a_name) then
							project.log (<<"geant error: cannot delete file '", a_name, "%'">>)
							exit_code := 1
						end
					end
				end
			else
				check is_fileset_executable_or_is_directoryset_executable:
					is_fileset_executable or is_directoryset_executable
				end
				if is_fileset_executable then
					if not fileset.is_executable then
						project.log (<<"  [delete] error: fileset definition wrong">>)
						exit_code := 1
					end
					if exit_code = 0 then
							-- This command always works on one file and not on two files like copy or move.
							-- Therefore the force flag of `fileset` is set to 'True' so that files are included
							-- although `fileset.item_filename' and `fileset.item_mapped_filename' are not
							-- out of date.
							-- A value of 'False' for `fileset.force' does not make sense here since the delete
							-- command does not compare files.
						fileset.set_force (True)
						fileset.execute
						from
							fileset.start
						until
							fileset.after or else exit_code /= 0
						loop
							a_name := file_system.pathname_from_file_system (fileset.item_mapped_filename, unix_file_system)
							project.trace (<<"  [delete] ", a_name>>)
							if not project.options.no_exec then
								file_system.delete_file (a_name)
								if file_system.file_exists (a_name) then
										-- On Windows 7, there seems to be a delay between the time the
										-- file or directory is deleted and the time it is shown as deleted.
									from
										i := 1
										file_system.delete_file (a_name)
									until
										i > 1000 or else not file_system.file_exists (a_name)
									loop
										file_system.delete_file (a_name)
										i := i + 1
									end
									if file_system.file_exists (a_name) then
										project.log (<<"geant error: cannot delete file '", a_name, "%'">>)
										exit_code := 1
									end
								end
							end
							fileset.forth
						end
					end
				end
				if is_directoryset_executable then
					if not directoryset.is_executable then
						project.log (<<"  [delete] error: directoryset definition wrong">>)
						exit_code := 1
					end
					if exit_code = 0 then
						directoryset.execute
						from
							directoryset.start
						until
							directoryset.after or else exit_code /= 0
						loop
							a_name := file_system.pathname_from_file_system (
								directoryset.item_directory_name, unix_file_system)
							project.trace (<<"  [delete] ", a_name>>)
							if not project.options.no_exec then
								file_system.recursive_delete_directory (a_name)
								if file_system.directory_exists (a_name) then
										-- On Windows 7, there seems to be a delay between the time the
										-- file or directory is deleted and the time it is shown as deleted.
									from
										i := 1
										file_system.recursive_delete_directory (a_name)
									until
										i > 1000 or else not file_system.directory_exists (a_name)
									loop
										file_system.recursive_delete_directory (a_name)
										i := i + 1
									end
									if file_system.directory_exists (a_name) then
										project.log (<<"  [delete] error: cannot delete directory '", a_name, "%'">>)
										exit_code := 1
									end
								end
							end
							directoryset.forth
						end
					end
				end
			end
		end

end
