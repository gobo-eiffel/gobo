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
			esd_filename_not_void: esd_filename /= Void
			esd_filename_not_empty: esd_filename.count > 0
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
				if file_system.is_directory_readable ("eCluster") then
						-- Execute the command only if the Visual Eiffel
						-- compiler has been used to compile this system.
					cmd := clone ("vec -eu -y -no")
					log ("  [ve] " + cmd + "%N")
					execute_shell (cmd)
					log ("  [ve] delete Result.out%N")
					file_system.delete_file ("Result.out")
				end
			end
		end

end -- class GEANT_VE_COMMAND
