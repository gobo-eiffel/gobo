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
		ensure then
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
			old_name, new_name: STRING
		do
			cmd := clone ("ec -batch")
			if ace_filename /= Void and then ace_filename.count > 0 then
				cmd.append_string (" -ace ")
				cmd.append_string (ace_filename)
			end
			if finalize then
				cmd.append_string (" -finalize")
			end
			log ("  [ise] " + cmd + "%N")
			execute_shell (cmd)

			if finish_freezing then
				old_pwd := file_system.pwd
				file_system.cd ("EIFGEN")
				if finalize then
					log ("  [ise] cd EIFGEN/F_code%N")
					file_system.cd ("F_code")
				else
					log ("  [ise] cd EIFGEN/W_code%N")
					file_system.cd ("W_code")
				end
				cmd := clone ("finish_freezing -silent")
				log ("  [ise] " + cmd + "%N")
				execute_shell (cmd)
				old_name := clone (system_name)
				old_name.append_string (file_system.exe_file_extension)
				new_name := clone ("../../")
				new_name.append_string (old_name)
				log ("  [ise] cp " + old_name + " " + new_name + "%N")
				file_system.copy_file (old_name, new_name)
				if not finalize then
					old_name := clone (system_name)
					old_name.append_string (".melted")
					new_name := clone ("../../")
					new_name.append_string (old_name)
					log ("  [ise] cp " + old_name + " " + new_name + "%N")
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
			a_name.append_string (".epr")
			if file_system.is_file_readable (a_name) then
					-- Execute the command only if the ISE Eiffel
					-- compiler has been used to compile this system.
				log ("  [ise] delete " + a_name + "%N")
				file_system.delete_file (a_name)
				a_name := clone (clean)
				a_name.append_string (".rc")
				log ("  [ise] delete " + a_name + "%N")
				file_system.delete_file (a_name)
				!! a_dir.make ("EIFGEN")
				log ("  [ise] delete EIFGEN%N")
				a_dir.recursive_delete
			end
		end

end -- class GEANT_ISE_COMMAND
