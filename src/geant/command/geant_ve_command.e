indexing

	description:

		"Compilation commands for Visual Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_VE_COMMAND

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
			Result := esd_filename /= Void and then esd_filename.count > 0
		ensure
			esd_filename_not_void: Result implies esd_filename /= Void
			esd_filename_not_empty: Result implies esd_filename.count > 0
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

	esd_filename: STRING
			-- ESD filename

	clean: STRING
			-- Name of system to be cleaned

	recursive_clean: BOOLEAN
			-- Should clean be run recursively on
			-- subdirectories?

feature -- Setting

	set_esd_filename (a_filename: like esd_filename) is
			-- Set `esd_filename' to `a_filename'.
		do
			esd_filename := a_filename
		ensure
			esd_filename_set: esd_filename = a_filename
		end

	set_clean (a_clean: like clean) is
			-- Set `clean' to `a_clean'.
		do
			clean := a_clean
		ensure
			clean_set: clean = a_clean
		end

	set_recursive_clean (b: BOOLEAN) is
			-- Set `recursive_clean' to `b'.
		do
			recursive_clean := b
		ensure
			recursive_clean_set: recursive_clean = b
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
		do
			if is_compilable then
				cmd := clone ("vec -no -a:")
				cmd.append_string (esd_filename)
				log ("  [ve] " + cmd + "%N")
				execute_shell (cmd)
			else
				check is_cleanable: is_cleanable end
				execute_clean
			end
		end

	execute_clean is
			-- Clean system.
		require
			is_cleanable: is_cleanable
		local
			cmd: STRING
			old_cwd: STRING
			a_name: STRING
			a_dir: KL_DIRECTORY
		do
			old_cwd := file_system.cwd
			if file_system.is_directory_readable ("eCluster") then
					-- Execute the command only if the Visual Eiffel
					-- compiler has been used to compile this system.
				cmd := clone ("vec -dc -y -no")
				if recursive_clean then
					log ("  [ve] [" + old_cwd + "] " + cmd + "%N")
				else
					log ("  [ve] " + cmd + "%N")
				end
				execute_shell (cmd)
			end
			if file_system.is_file_readable ("Result.out") then
				if recursive_clean then
					log ("  [ve] delete " + old_cwd + "/Result.out%N")
				else
					log ("  [ve] delete Result.out%N")
				end
				file_system.delete_file ("Result.out")
			end
			if file_system.is_file_readable ("vec.xcp") then
				if recursive_clean then
					log ("  [ve] delete " + old_cwd + "/vec.xcp%N")
				else
					log ("  [ve] delete vec.xcp%N")
				end
				file_system.delete_file ("vec.xcp")
			end
			if recursive_clean then
				!! a_dir.make (old_cwd)
				a_dir.open_read
				if a_dir.is_open_read then
					from a_dir.read_entry until a_dir.end_of_input loop
						a_name := a_dir.last_entry
						if not a_name.is_equal (".") and not a_name.is_equal ("..") then
							if file_system.is_directory_readable (a_name) then
								file_system.cd (a_name)
								execute_clean
								file_system.cd (old_cwd)
							end
						end
						a_dir.read_entry
					end
					a_dir.close
				end
			end
		end

end -- class GEANT_VE_COMMAND
