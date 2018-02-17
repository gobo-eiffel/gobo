note

	description:

		"Delete commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DELETE_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

	KL_IMPORTED_BOOLEAN_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command by setting `project' to `a_project'.
		do
			Precursor (a_project)
			fail_on_error := True
		end

feature -- Status report

	is_file_executable: BOOLEAN
			-- Can command be executed on a file?
		do
			Result := attached file as l_file and then l_file.count > 0
		ensure
			file_not_void_and_not_empty: Result implies attached file as l_file and then l_file.count > 0
		end

	is_directory_executable: BOOLEAN
			-- Can command be executed on a directory?
		do
			Result := attached directory as l_directory and then l_directory.count > 0
		ensure
			directory_not_void_and_not_empty: Result implies attached directory as l_directory and then l_directory.count > 0
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

	fail_on_error: BOOLEAN
			-- Should the exit code be non-zero when the file or directory
			-- still exists after executing the delete command?

feature -- Access

	directory: detachable STRING
			-- Directory to delete

	file: detachable STRING
			-- File to delete

	fileset: detachable GEANT_FILESET
		-- Fileset for current command

	directoryset: detachable GEANT_DIRECTORYSET
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

	set_fail_on_error (b: BOOLEAN)
			-- Set `fail_on_error' to `b'.
		do
			fail_on_error := b
		ensure
			fail_on_error_set: fail_on_error = b
		end

feature -- Execution

	execute
			-- Execute command.
		local
			a_name: STRING
			i: INTEGER
		do
			exit_code := 0
			if is_directory_executable and then attached directory as l_directory then
				a_name := file_system.pathname_from_file_system (l_directory, unix_file_system)
				project.trace (<<"  [delete] ", a_name>>)
				if not project.options.no_exec then
					file_system.recursive_delete_directory (a_name)
					if file_system.directory_exists (a_name) then
							-- On Windows 7, there seems to be a delay between the time the
							-- file or directory is deleted and the time it is shown as deleted.
						from
							i := 1
							Execution_environment.sleep (500_000_000)
							file_system.recursive_delete_directory (a_name)
						until
							i > 20 or else not file_system.directory_exists (a_name)
						loop
							Execution_environment.sleep (500_000_000)
							file_system.recursive_delete_directory (a_name)
							i := i + 1
						end
						if file_system.directory_exists (a_name) then
							project.log (<<"  [delete] error: cannot delete directory '", a_name, "%'">>)
							exit_code := 1
						end
					end
				end
			elseif is_file_executable and then attached file as l_file then
				a_name := file_system.pathname_from_file_system (l_file, unix_file_system)
				project.trace (<<"  [delete] ", a_name>>)
				if not project.options.no_exec then
					file_system.delete_file (a_name)
					if file_system.file_exists (a_name) then
							-- On Windows 7, there seems to be a delay between the time the
							-- file or directory is deleted and the time it is shown as deleted.
						from
							i := 1
							Execution_environment.sleep (500_000_000)
							file_system.delete_file (a_name)
						until
							i > 20 or else not file_system.file_exists (a_name)
						loop
							Execution_environment.sleep (500_000_000)
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
				if is_fileset_executable and then attached fileset as l_fileset then
					if not l_fileset.is_executable then
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
						l_fileset.set_force (True)
						l_fileset.execute
						from
							l_fileset.start
						until
							l_fileset.after or else exit_code /= 0
						loop
							a_name := file_system.pathname_from_file_system (l_fileset.item_mapped_filename, unix_file_system)
							project.trace (<<"  [delete] ", a_name>>)
							if not project.options.no_exec then
								file_system.delete_file (a_name)
								if file_system.file_exists (a_name) then
										-- On Windows 7, there seems to be a delay between the time the
										-- file or directory is deleted and the time it is shown as deleted.
									from
										i := 1
										Execution_environment.sleep (500_000_000)
										file_system.delete_file (a_name)
									until
										i > 20 or else not file_system.file_exists (a_name)
									loop
										Execution_environment.sleep (500_000_000)
										file_system.delete_file (a_name)
										i := i + 1
									end
									if file_system.file_exists (a_name) then
										project.log (<<"geant error: cannot delete file '", a_name, "%'">>)
										exit_code := 1
									end
								end
							end
							l_fileset.forth
						end
					end
				end
				if is_directoryset_executable and then attached directoryset as l_directoryset then
					if not l_directoryset.is_executable then
						project.log (<<"  [delete] error: directoryset definition wrong">>)
						exit_code := 1
					end
					if exit_code = 0 then
						l_directoryset.execute
						from
							l_directoryset.start
						until
							l_directoryset.after or else exit_code /= 0
						loop
							a_name := file_system.pathname_from_file_system (
								l_directoryset.item_directory_name, unix_file_system)
							project.trace (<<"  [delete] ", a_name>>)
							if not project.options.no_exec then
								file_system.recursive_delete_directory (a_name)
								if file_system.directory_exists (a_name) then
										-- On Windows 7, there seems to be a delay between the time the
										-- file or directory is deleted and the time it is shown as deleted.
									from
										i := 1
										Execution_environment.sleep (500_000_000)
										file_system.recursive_delete_directory (a_name)
									until
										i > 20 or else not file_system.directory_exists (a_name)
									loop
										Execution_environment.sleep (500_000_000)
										file_system.recursive_delete_directory (a_name)
										i := i + 1
									end
									if file_system.directory_exists (a_name) then
										project.log (<<"  [delete] error: cannot delete directory '", a_name, "%'">>)
										exit_code := 1
									end
								end
							end
							l_directoryset.forth
						end
					end
				end
			end
			if not fail_on_error then
				exit_code := 0
			end
		end

end
