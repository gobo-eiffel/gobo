indexing

	description:

		"Compilation commands for Hastenbach Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_HACT_COMMAND

inherit

	GEANT_COMMAND

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

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

	fish: BOOLEAN
			-- Should 'fish' be executed?

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

	set_fish (b: BOOLEAN) is
			-- Set `fish' to `b'.
		do
			fish := b
		ensure
			fish_set: fish = b
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
			old_pwd: STRING
			project_dir: STRING
			old_name, new_name: STRING
		do
			cmd := clone ("ibcomp -executable")
			if finalize then
				cmd.append_string (" -finalize")
			end
			cmd.append_string (" -new -stop")
			if ace_filename /= Void and then ace_filename.count > 0 then
				cmd.append_string (" -ace ")
				cmd.append_string (ace_filename)
			end
			cmd.append_string (" -project ")
			cmd.append_string (system_name)
			cmd.append_string (".eif")
			log ("  [hact] " + cmd + "%N")
			execute_shell (cmd)

			if fish then
				old_pwd := file_system.pwd
				project_dir := system_name + "_gen"
				file_system.cd (project_dir)
				if finalize then
					log ("  [hact] cd " + project_dir + "/F_code%N")
					file_system.cd ("F_code")
				else
					log ("  [hact] cd " + project_dir + "/W_code%N")
					file_system.cd ("W_code")
				end
				cmd := clone ("fish")
				log ("  [hact] " + cmd + "%N")
				execute_shell (cmd)
				old_name := clone (system_name)
				old_name.append_string (file_system.exe_file_extension)
				new_name := clone ("../../")
				new_name.append_string (old_name)
				log ("  [hact] cp " + old_name + " " + new_name + "%N")
				file_system.copy_file (old_name, new_name)
				if not finalize then
					old_name := clone (system_name)
					old_name.append_string (".h2o")
					new_name := clone ("../../")
					new_name.append_string (old_name)
					log ("  [hact] cp " + old_name + " " + new_name + "%N")
					file_system.copy_file (old_name, new_name)
				end
				file_system.cd (old_pwd)
			end
		end

	execute_clean is
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			a_name: STRING
			a_dir: KL_DIRECTORY
		do
			a_name := clone (clean)
			a_name.append_string ("_gen")
			if file_system.is_directory_readable (a_name) then
				!! a_dir.make (a_name)
				log ("  [hact] delete " + a_name + "%N")
				a_dir.recursive_delete
				a_name := clone (clean)
				a_name.append_string (".eif")
				log ("  [hact] delete " + a_name + "%N")
				file_system.delete_file (a_name)
			end
		end

end -- class GEANT_HACT_COMMAND
