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

feature -- Status report

	is_filename_executable: BOOLEAN is
			-- Can command be executed on a project file?
		do
			Result := filename /= Void and then filename.count > 0
		ensure
			filename_not_void: Result implies filename /= Void
			filename_not_empty: Result implies filename.count > 0
		end

	is_target_executable: BOOLEAN is
			-- Can command be executed on a target?
		do
			Result := start_target_name /= Void and then start_target_name.count > 0
		ensure
			target_not_void: Result implies start_target_name /= Void
			target_not_empty: Result implies start_target_name.count > 0
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_filename_executable or is_target_executable
		ensure then
			project_or_target: Result implies is_filename_executable or is_target_executable
		end

feature -- Access

	filename: STRING
			-- Geant build file to invoke.

	reuse_variables: BOOLEAN
			-- Are variables reused in new project?

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

	set_reuse_variables(a_reuse_variables: BOOLEAN) is
			-- Set `reuse_variables' to a_reuse_variables
		do
			reuse_variables := a_reuse_variables
		ensure
			reuse_variables_set: reuse_variables = a_reuse_variables
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
			a_project: GEANT_PROJECT
			ucs: UC_STRING
			a_variables: GEANT_VARIABLES
			a_target: GEANT_TARGET
		do
			if is_filename_executable then
					-- Create a new project and run it's build process:
				if reuse_variables then
					a_variables := project.variables
				end
				
				!! ucs.make_from_string (filename)
				!! a_project.make_with_filename (ucs, a_variables)
				a_project.set_verbose (project.verbose)
	
					-- Load build configuration:
				a_project.load (start_target_name)
	
					-- Start build process:
				if a_project.targets /= Void then
					a_project.build
					if not a_project.build_successful then
							--!! TODO: Report this to parent project
						exit_application (1, Void)
					end
				end
			else
				check target_executable: is_target_executable end
					-- call target of current project:
				!! ucs.make_from_string (start_target_name)
				a_target := project.target_with_name (ucs)
				if a_target /= Void then
					project.build_target (a_target)
				else
					exit_application (1, "geant error: unknown target: " + start_target_name + "%N")
				end
			end
		end

end -- class GEANT_GEANT_COMMAND
