indexing

	description:

		"Compilation commands for ISE Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ISE_COMMAND

inherit

	GEANT_COMMAND

creation

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_compilable xor is_cleanable
		ensure then
			compilable_xor_cleanable: Result implies (is_compilable xor is_cleanable)
		end

	is_compilable: BOOLEAN is
			-- Can system be compiled?
		do
			Result := system_name /= Void and then system_name.count > 0
		ensure
			system_name_not_void: Result implies system_name /= Void
			system_name_not_empty: Result implies system_name.count > 0
		end

	is_cleanable: BOOLEAN is
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

	finalize: BOOLEAN
			-- Finalize mode

	finish_freezing: BOOLEAN
			-- Should 'finish_freezing' be executed?

	clean: STRING
			-- Name of system to be cleaned

feature -- Setting

	set_ace_filename (a_filename: like ace_filename) is
			-- Set `ace_filename' to `a_filename'.
		do
			ace_filename := a_filename
		ensure
			ace_filename_set: ace_filename = a_filename
		end

	set_system_name (a_name: like system_name) is
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_finalize (b: BOOLEAN) is
			-- Set  `finalize' to `b'.
		do
			finalize := b
		ensure
			finalize_set: finalize = b
		end

	set_finish_freezing (b: BOOLEAN) is
			-- Set `finish_freezing' to `b'.
		do
			finish_freezing := b
		ensure
			finish_freezing_set: finish_freezing = b
		end

	set_clean (a_clean: like clean) is
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
		end

feature -- Execution

	execute is
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

	execute_compile is
			-- Compile system.
		require
			is_compilable: is_compilable
		local
			cmd: STRING
			old_cwd: STRING
			eifgen, project_dir: STRING
			a_filename: STRING
		do
			cmd := clone ("ec -batch")
			if ace_filename /= Void and then ace_filename.count > 0 then
				cmd.append_string (" -ace ")
				a_filename := file_system.pathname_from_file_system (ace_filename, unix_file_system)
				cmd.append_string (a_filename)
			end
			if finalize then
				cmd.append_string (" -finalize")
			end
			project.trace ("  [ise] " + cmd + "%N")
			execute_shell (cmd)
			if exit_code = 0 and then finish_freezing then
				eifgen := "EIFGEN"
				if finalize then
					project_dir := file_system.pathname (eifgen, "F_code")
				else
					project_dir := file_system.pathname (eifgen, "W_code")
				end
				project.trace ("  [ise] cd " + project_dir + "%N")
				old_cwd := file_system.cwd
				file_system.cd (project_dir)
				cmd := clone ("finish_freezing -silent")
				project.trace ("  [ise] " + cmd + "%N")
				execute_shell (cmd)
				if not project.no_exec then
					if exit_code = 0 then
						a_filename := system_name + file_system.exe_extension
						if not file_system.file_exists (a_filename) then
							exit_code := -1
						elseif not finalize then
							a_filename := system_name + ".melted"
							if not file_system.file_exists (a_filename) then
								exit_code := -2
							end
						end
					end
				end
				file_system.cd (old_cwd)
			end
		end

	execute_clean is
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			a_name: STRING
		do
			a_name := clean + ".epr"
			if file_system.file_exists (a_name) then
				project.trace ("  [ise] delete " + a_name + "%N")
				if not project.no_exec then
					file_system.delete_file (a_name)
				end
			end
			a_name := clean + ".rc"
			if file_system.file_exists (a_name) then
				project.trace ("  [ise] delete " + a_name + "%N")
				if not project.no_exec then
					file_system.delete_file (a_name)
				end
			end
			a_name := "exception_trace.log"
			if file_system.file_exists (a_name) then
				project.trace ("  [ise] delete " + a_name + "%N")
				if not project.no_exec then
					file_system.delete_file (a_name)
				end
			end
			a_name := "preferences.wb"
			if file_system.file_exists (a_name) then
				project.trace ("  [ise] delete " + a_name + "%N")
				if not project.no_exec then
					file_system.delete_file (a_name)
				end
			end
			if file_system.directory_exists ("EIFGEN") then
				project.trace ("  [ise] delete EIFGEN%N")
				if not project.no_exec then
					file_system.recursive_delete_directory ("EIFGEN")
				end
			end
		end

end -- class GEANT_ISE_COMMAND
