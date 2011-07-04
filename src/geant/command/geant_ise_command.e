note

	description:

		"Compilation commands for ISE Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ISE_COMMAND

inherit

	GEANT_COMMAND

create

	make

feature -- Status report

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := is_compilable xor is_cleanable
			Result := Result and then (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		ensure then
			compilable_xor_cleanable: Result implies (is_compilable xor is_cleanable)
			exit_code_variable_name_void_or_not_empty: Result implies (exit_code_variable_name = Void or else exit_code_variable_name.count > 0)
		end

	is_compilable: BOOLEAN
			-- Can system be compiled?
		do
			Result := system_name /= Void and then system_name.count > 0
		ensure
			system_name_not_void: Result implies system_name /= Void
			system_name_not_empty: Result implies system_name.count > 0
		end

	is_cleanable: BOOLEAN
			-- Can system be cleaned?
		do
			Result := clean /= Void and then clean.count > 0
		ensure
			clean_not_void: Result implies clean /= Void
			clean_not_empty: Result implies clean.count > 0
		end

feature -- Access

	ace_filename: STRING
			-- Ace filename

	system_name: STRING
			-- System name

	finalize_mode: BOOLEAN
			-- Finalize mode

	finish_freezing: BOOLEAN
			-- Should 'finish_freezing' be executed?

	clean: STRING
			-- Name of system to be cleaned

	exit_code_variable_name: STRING
			-- Name of variable holding exit code of se compilation process

feature -- Setting

	set_ace_filename (a_filename: like ace_filename)
			-- Set `ace_filename' to `a_filename'.
		do
			ace_filename := a_filename
		ensure
			ace_filename_set: ace_filename = a_filename
		end

	set_system_name (a_name: like system_name)
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
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
			eifgen, old_eifgen, project_dir: STRING
			a_filename: STRING
		do
			create cmd.make (128)
			cmd.append_string ("ec -batch")
			if ace_filename /= Void and then ace_filename.count > 0 then
				cmd.append_string (" -config ")
				a_filename := file_system.pathname_from_file_system (ace_filename, unix_file_system)
				cmd := STRING_.appended_string (cmd, a_filename)
			end
			if finalize_mode then
				cmd.append_string (" -finalize")
			end
			a_filename := system_name + ".epr"
			eifgen := file_system.pathname ("EIFGENs", system_name)
			old_eifgen := "EIFGEN"
			if
				file_system.file_exists (a_filename) and
				(file_system.directory_exists (eifgen) or
				file_system.directory_exists (old_eifgen))
			then
				cmd.append_string (" -project ")
				cmd := STRING_.appended_string (cmd, a_filename)
			end
			project.trace (<<"  [ise] ", cmd>>)
			execute_shell (cmd)
			if exit_code_variable_name /= Void then
					-- Store return_code of ise compilation process:
				project.set_variable_value (exit_code_variable_name, exit_code.out)
			end
			if exit_code = 0 and then finish_freezing then
				if finalize_mode then
					project_dir := file_system.pathname (eifgen, "F_code")
					if not file_system.directory_exists (project_dir) then
						project_dir := file_system.pathname (old_eifgen, "F_code")
					end
				else
					project_dir := file_system.pathname (eifgen, "W_code")
					if not file_system.directory_exists (project_dir) then
						project_dir := file_system.pathname (old_eifgen, "W_code")
					end
				end
				project.trace (<<"  [ise] cd ", project_dir>>)
				old_cwd := file_system.cwd
				file_system.cd (project_dir)
				create cmd.make (128)
				cmd.append_string ("finish_freezing -silent")
				project.trace (<<"  [ise] ", cmd>>)
				execute_shell (cmd)
				if exit_code_variable_name /= Void then
						-- Store return_code of ise compilation process:
					project.set_variable_value (exit_code_variable_name, exit_code.out)
				end
				if not project.options.no_exec then
					if exit_code = 0 then
						a_filename := STRING_.concat (system_name, file_system.exe_extension)
						if not file_system.file_exists (a_filename) then
							exit_code := -1
							if exit_code_variable_name /= Void then
									-- Store return_code of ise compilation process:
								project.set_variable_value (exit_code_variable_name, exit_code.out)
							end
						elseif not finalize_mode then
							a_filename := system_name + ".melted"
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

	execute_clean
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			a_name: STRING
		do
			a_name := clean + ".epr"
			if file_system.file_exists (a_name) then
				project.trace (<<"  [ise] delete ", a_name>>)
				if not project.options.no_exec then
					file_system.delete_file (a_name)
				end
			end
			a_name := clean + ".rc"
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
			a_name := file_system.pathname ("EIFGENs", clean)
			if file_system.directory_exists (a_name) then
				project.trace (<<"  [ise] delete ", a_name>>)
				if not project.options.no_exec then
					file_system.recursive_delete_directory (a_name)
					if file_system.is_directory_empty ("EIFGENs") then
						file_system.delete_directory ("EIFGENs")
					end
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
