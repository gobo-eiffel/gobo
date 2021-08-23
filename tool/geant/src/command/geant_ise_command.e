note

	description:

		"Compilation commands for ISE Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ISE_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command by setting `project' to `a_project'.
		do
			executable_filename := "ec"
			precursor (a_project)
		end

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := is_compilable xor is_cleanable
			Result := Result and then (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		ensure then
			compilable_xor_cleanable: Result implies (is_compilable xor is_cleanable)
			exit_code_variable_name_void_or_not_empty: Result implies (not attached exit_code_variable_name as l_exit_code_variable_name or else l_exit_code_variable_name.count > 0)
		end

	is_compilable: BOOLEAN
			-- Can system be compiled?
		do
			Result := attached system_name as l_system_name and then l_system_name.count > 0
		ensure
			system_name_not_void_and_not_empty: Result implies attached system_name as l_system_name and then l_system_name.count > 0
		end

	is_cleanable: BOOLEAN
			-- Can system be cleaned?
		do
			Result := attached clean as l_clean and then l_clean.count > 0
		ensure
			clean_not_void_and_not_empty: Result implies attached clean as l_clean and then l_clean.count > 0
		end

feature -- Access

	executable_filename: STRING
			-- Filename of ISE's compiler executable

	ecf_filename: detachable STRING
			-- ECF filename

	target_name: detachable STRING
			-- Name of target in ECF file

	system_name: detachable STRING
			-- System name

	compatible_mode: BOOLEAN
			-- Compatible mode

	finalize_mode: BOOLEAN
			-- Finalize mode

	finish_freezing: BOOLEAN
			-- Should 'finish_freezing' be executed?

	clean: detachable STRING
			-- Name of system to be cleaned

	exit_code_variable_name: detachable STRING
			-- Name of variable holding exit code of se compilation process

	project_path: detachable STRING
			-- Default is the current path

	eifgen_directory: STRING
			-- Directory where created and compiled files are saved
		do
			if not attached project_path as l_project_path or else l_project_path.is_empty then
				Result := "EIFGENs"
			else
				Result := l_project_path + "/EIFGENs"
			end
		ensure
			not_empty: Result /= Void and then not Result.is_empty
		end


feature -- Setting

	set_executable_filename (a_filename: like executable_filename)
			-- Set `executable_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			executable_filename := a_filename
		ensure
			executable_filename_set: executable_filename = a_filename
		end

	set_ecf_filename (a_filename: like ecf_filename)
			-- Set `ecf_filename' to `a_filename'.
		do
			ecf_filename := a_filename
		ensure
			ecf_filename_set: ecf_filename = a_filename
		end

	set_target_name (a_target_name: like target_name)
			-- Set `target_name' to `a_target_name'.
		do
			target_name := a_target_name
		ensure
			target_name_set: target_name = a_target_name
		end

	set_system_name (a_name: like system_name)
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_compatible_mode (b: BOOLEAN)
			-- Set  `compatible_mode' to `b'.
		do
			compatible_mode := b
		ensure
			compatible_mode_set: compatible_mode = b
		end

	set_finalize_mode (b: BOOLEAN)
			-- Set  `finalize_mode' to `b'.
		do
			finalize_mode := b
		ensure
			finalize_mode_set: finalize_mode = b
		end

	set_finish_freezing (b: BOOLEAN)
			-- Set `finish_freezing' to `b'.
		do
			finish_freezing := b
		ensure
			finish_freezing_set: finish_freezing = b
		end

	set_clean (a_clean: like clean)
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
		end

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name)
			-- Set `exit_code_variable_name' to `a_exit_code_variable_name'.
		require
			a_exit_code_variable_name_not_void: a_exit_code_variable_name /= Void
			a_exit_code_variable_name_not_empty: a_exit_code_variable_name.count > 0
		do
			exit_code_variable_name := a_exit_code_variable_name
		ensure
			exit_code_variable_name_set: exit_code_variable_name = a_exit_code_variable_name
		end

	set_project_path (a_directory: like project_path)
			-- Set `project_path' to `a_directory'.
		require
			a_directory_not_void: a_directory /= Void
		do
			project_path := a_directory
		ensure
			project_path_set: project_path = a_directory
		end


feature -- Execution

	execute
			-- Execute command.
		do
			exit_code := 0
			if is_compilable then
				execute_compile
			else
				check is_cleanable: is_cleanable end
				execute_clean
			end
		end

	execute_compile
			-- Compile system.
		require
			is_compilable: is_compilable
		local
			cmd: STRING
			old_cwd: STRING
			eifgen, project_dir: STRING
			a_filename: STRING
		do
			check is_compilable: attached system_name as l_system_name then
				create cmd.make (128)
				cmd.append_string (executable_filename)
				cmd.append_string (" -batch")
				if attached ecf_filename as l_ecf_filename and then l_ecf_filename.count > 0 then
					cmd.append_string (" -config ")
					a_filename := file_system.pathname_from_file_system (l_ecf_filename, unix_file_system)
					cmd := STRING_.appended_string (cmd, a_filename)
				end
				if attached target_name as l_target_name and then l_target_name.count > 0 then
					cmd.append_string (" -target ")
					cmd := STRING_.appended_string (cmd, l_target_name)
				end
				if compatible_mode then
					cmd.append_string (" -compat")
				end
				if finalize_mode then
					cmd.append_string (" -finalize")
				end
				a_filename := l_system_name + ".epr"
				if attached target_name as l_target_name and then l_target_name.count > 0 then
					eifgen := file_system.pathname (eifgen_directory, l_target_name)
				else
					eifgen := file_system.pathname (eifgen_directory, l_system_name)
				end
				if
					file_system.file_exists (a_filename) and
					file_system.directory_exists (eifgen)
				then
					cmd.append_string (" -project ")
					cmd := STRING_.appended_string (cmd, a_filename)
				end
				if attached project_path as l_project_path and then not l_project_path.is_empty then
					cmd.append_string (" -project_path ")
					cmd := STRING_.appended_string (cmd, l_project_path)
				end
				project.trace (<<"  [ise] ", cmd>>)
				execute_shell (cmd)
				if attached exit_code_variable_name as l_exit_code_variable_name then
						-- Store return_code of ise compilation process:
					project.set_variable_value (l_exit_code_variable_name, exit_code.out)
				end
				if exit_code = 0 and then finish_freezing then
					if finalize_mode then
						project_dir := file_system.pathname (eifgen, "F_code")
					else
						project_dir := file_system.pathname (eifgen, "W_code")
					end
					project.trace (<<"  [ise] cd ", project_dir>>)
					old_cwd := file_system.cwd
					file_system.cd (project_dir)
					create cmd.make (128)
					cmd.append_string ("finish_freezing -silent")
					project.trace (<<"  [ise] ", cmd>>)
					execute_shell (cmd)
					if attached exit_code_variable_name as l_exit_code_variable_name then
							-- Store return_code of ise compilation process:
						project.set_variable_value (l_exit_code_variable_name, exit_code.out)
					end
					if not project.options.no_exec then
						if exit_code = 0 then
							a_filename := STRING_.concat (l_system_name, file_system.exe_extension)
							if not file_system.file_exists (a_filename) then
								exit_code := -1
								if attached exit_code_variable_name as l_exit_code_variable_name then
										-- Store return_code of ise compilation process:
									project.set_variable_value (l_exit_code_variable_name, exit_code.out)
								end
							elseif not finalize_mode then
								a_filename := l_system_name + ".melted"
								if not file_system.file_exists (a_filename) then
										-- Eiffel for .NET 5.2.0928 does not
										-- generate .melted files.
									-- exit_code := -2
								end
							end
						end
					end
					file_system.cd (old_cwd)
				end
				if exit_code_variable_name /= Void then
						-- Reset `exit_code' since return_code of process is available through
						-- variable 'exit_code_variable_name':
					exit_code := 0
				end
			end
		end

	execute_clean
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			a_name: STRING
		do
			check is_cleanable: attached clean as l_clean then
				a_name := l_clean + ".epr"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".rc"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := l_clean + ".res"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := "exception_trace.log"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := "preferences.wb"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := "arguments.wb"
				if file_system.file_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.delete_file (a_name)
					end
				end
				a_name := file_system.pathname (eifgen_directory, l_clean)
				if file_system.directory_exists (a_name) then
					project.trace (<<"  [ise] delete ", a_name>>)
					if not project.options.no_exec then
						file_system.recursive_delete_directory (a_name)
					end
				end
				if file_system.is_directory_empty (eifgen_directory) then
					project.trace (<<"  [ise] delete ", eifgen_directory>>)
					if not project.options.no_exec then
						file_system.delete_directory (eifgen_directory)
					end
				end
				if file_system.directory_exists ("EIFGEN") then
					project.trace (<<"  [ise] delete EIFGEN">>)
					if not project.options.no_exec then
						file_system.recursive_delete_directory ("EIFGEN")
					end
				end
			end
		end

invariant

	executable_filename_not_void: executable_filename /= Void
	executable_filename_not_empty: not executable_filename.is_empty

end
