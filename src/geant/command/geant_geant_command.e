indexing

	description:

		"Geant commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GEANT_COMMAND

inherit

	GEANT_COMMAND
	KL_SHARED_EXCEPTIONS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new 'geant' command.
		do
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := filename /= Void and then filename.count > 0
		ensure then
			filename_not_void: Result implies filename /= Void
			filename_not_empty: Result implies filename.count > 0
		end

feature -- Access

	filename: STRING
			-- Geant build file to invoke.

	fork: BOOLEAN
			-- Start command in a new process?

	start_target_name: STRING
			-- Name of the target the build process starts with

feature -- Setting

	set_filename (a_filename: like filename) is
			-- Set `filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
			-- file_exists:
		do
			filename := a_filename
		ensure
			filename_set: filename = a_filename
		end

	set_fork(a_fork: BOOLEAN) is
			-- Set `fork' to a_fork
		do
			fork := a_fork
		ensure
			fork_set: fork = a_fork
		end

	set_start_target_name (a_start_target_name: like start_target_name) is
			-- Set `start_target_name' to `a_start_target_name'.
		require
			a_start_target_name_not_void: a_start_target_name /= Void
			a_start_target_name_not_empty: a_start_target_name.count > 0
			-- file_exists:
		do
			start_target_name := a_start_target_name
		ensure
			start_target_name_set: start_target_name = a_start_target_name
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_project: GEANT_PROJECT
			ucs: UC_STRING
		do
			if fork then
					-- Launch a new geant process:
				cmd := clone ("geant ")
				cmd.append_string ("-b ")
				cmd.append_string (filename)
				if start_target_name /= Void then
					cmd.append_string (" ")
					cmd.append_string (start_target_name)
				end
				log ("  [geant] " + cmd + "%N")
				execute_shell (cmd)
			else
					-- Create a new project and run it's build process:
				if filename /= Void and then filename.count > 0 then
					!! ucs.make_from_string (filename)
					!! a_project.make_with_filename (ucs)
				else
					!! a_project.make
				end

					-- Load build configuration:
				a_project.load (start_target_name)

					-- Start build process:
				if a_project.targets /= Void then
					a_project.build
					if not a_project.build_successful then
							--!! TODO: Report this to parent project
						print ("Build FAILED!%N")
						Exceptions.die (1)
					end
				end

			end
		end

end -- class GEANT_GEANT_COMMAND
