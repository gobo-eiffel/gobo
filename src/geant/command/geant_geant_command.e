indexing

	description:

		"Geant commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEANT_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Initialize command by setting `project' to `a_project'.
		do
			precursor (a_project)
				-- Create actual arguments:
			create arguments.make
		ensure then
			arguments_not_void: arguments /= Void
		end

feature -- Access

	filename: STRING
			-- Geant build file to invoke

	fileset: GEANT_FILESET
			-- Fileset for current command

	reuse_variables: BOOLEAN
			-- Are variables reused in new project?

	start_target_name: STRING
			-- Name of target the build process starts with

	arguments: GEANT_ARGUMENT_VARIABLES
			-- Actual arguments

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

	is_fileset_executable: BOOLEAN is
			-- Can command be executed on fileset `fileset'?
		do
			Result := fileset /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
		end

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := is_filename_executable or is_target_executable
		ensure then
			project_or_target: Result implies is_filename_executable or is_target_executable
		end

	fork: BOOLEAN
			-- Should a new process be spawned to execute command?

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

	set_fileset (a_fileset: like fileset) is
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

	set_reuse_variables(a_reuse_variables: BOOLEAN) is
			-- Set `reuse_variables' to `a_reuse_variables'
		do
			reuse_variables := a_reuse_variables
		ensure
			reuse_variables_set: reuse_variables = a_reuse_variables
		end

	set_fork (a_fork: BOOLEAN) is
			-- Set `fork' to `a_fork'
		do
			fork := a_fork
			has_fork_been_set := True
		ensure
			fork_set: fork = a_fork and has_fork_been_set
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
			a_filename: STRING
			a_fork: BOOLEAN
		do
			exit_code := 0
			if is_filename_executable then
				if has_fork_been_set then
					a_fork := fork
				else
						-- Set default value for fork:
					a_fork := True
				end
					-- Create a new project and run it's build process:
				a_filename := file_system.pathname_from_file_system (filename, unix_file_system)
				if a_fork then
					execute_forked_with_filename_and_target (a_filename, start_target_name)
				else
					execute_with_filename (a_filename)
				end
			else
				check target_executable: is_target_executable end
				if has_fork_been_set then
					a_fork := fork
				else
						-- Set default value for fork:
					a_fork := False
				end
					-- Call target of current project:
				if a_fork then
					execute_forked_with_target (start_target_name)
				else
					execute_with_target (start_target_name)
				end
			end
		end

feature {NONE} -- Implementation

	execute_forked_with_filename_and_target (a_filename: STRING; a_target_name: STRING) is
			-- Spawn new geant process to execute scriptfile named `a_filename';
			-- If `a_target_name' is not Void and not empty pass it as start target name.
			-- TODO: support arguments
			-- TODO: support filesets
		local
			cmd: STRING
			a_level: STRING
		do
			project.trace (<<"  [geant] ### execute_forked_with_filename_and_target: '", a_filename, "', '", a_target_name, "'">>)
			if Project.options.debug_mode then
				if Project_variables_resolver.has ("geant.geant.level") then
					a_level := STRING_.concat (Project_variables_resolver.value ("geant.geant.level"), "#")
				else
					project.trace (<<"  [geant] no variable 'geant.geant.level' found">>)
					a_level := "#"
				end
				project.trace (<<"  [geant] geant.geant.level=", a_level>>)
				project.variables.put (a_level, "geant.geant.level")
				if a_level.count > 25 then
					exit_application (1, <<"TOO MANY RECURSIVE FORKED GEANT CALLS">>)
				end
			end
			create cmd.make (256)
			cmd.append_string ("geant")
			cmd := STRING_.appended_string (cmd, options_and_variables_for_cmdline)
				-- Pass name of buildscript:
			cmd.append_string (" -b ")
			cmd := STRING_.appended_string (cmd, a_filename)
				-- Pass name of starttarget:
			if a_target_name /= Void and then a_target_name.count > 0 then
				cmd.append_string (" ")
				cmd := STRING_.appended_string (cmd, a_target_name)
			end
			project.trace (<<"  [geant] ", cmd>>)
			execute_shell (cmd)
		end

	execute_forked_with_target (a_target_name: STRING) is
			-- Spawn new geant process for current buildscript and execute target named `a_target_name'.
			-- TODO: support arguments
			-- TODO: support filesets
		local
			a_filename: STRING
			a_key: STRING
			a_level: STRING
		do
			project.trace (<<"  [geant] ### execute_forked_with_target: '", a_target_name, "'">>)
			if is_fileset_executable then
				--TODO
			else
				if Project.options.debug_mode then
					if Project_variables_resolver.has ("geant.geant.level") then
						a_level := Project_variables_resolver.value ("geant.geant.level") + "#"
					else
						a_level := "#"
					end
					project.trace (<<"  [geant] geant.geant.level=", a_level>>)
					project.variables.put (a_level, "geant.geant.level")
					if a_level.count > 15 then
						exit_application (1, <<"TOO MANY RECURSIVE FORKED GEANT CALLS">>)
					end
				end
--				a_key := STRING_.concat (project.name, ".absdir")
--				a_filename := project.variables.item (a_key)
--TODO:				a_filename := STRING_.concat (a_filename, project.variables.item ("path_separator"))
--				a_filename := STRING_.concat (a_filename, "/")
				a_key := STRING_.concat (project.name, ".filename")
--				a_filename := STRING_.concat (a_filename, project.variables.item (a_key))
				a_filename := project.variables.item (a_key)
				a_filename := file_system.pathname_from_file_system (a_filename, unix_file_system)
				execute_forked_with_filename_and_target (a_filename, start_target_name)
			end
		end

	execute_with_filename (a_filename: STRING) is
			-- Create new project for scriptfile named `a_filename' and run it's build process.
		local
			a_project_loader: GEANT_PROJECT_LOADER
			a_project: GEANT_PROJECT
			a_target: GEANT_TARGET
			a_variables: GEANT_PROJECT_VARIABLES
		do
			if reuse_variables then
				a_variables := project.variables
			else
				create a_variables.make
			end
			create a_project_loader.make (a_filename)
			a_project_loader.load (a_variables, project.options)
			a_project := a_project_loader.project_element.project
			a_project.merge_in_parent_projects

				-- Load build configuration:
			if start_target_name /= Void and then start_target_name.count > 0 then
				if not a_project.targets.has (start_target_name) then
					exit_application (1, <<"Project '", a_project.name,
						"' does not contain a target named `", start_target_name + "%'">>)
				end
					-- Check export status of target to be called:
				a_target := a_project.targets.item (start_target_name)
				if not (a_target.is_exported_to_any or else
					a_target.is_exported_to_project (project)) then
					exit_application (1, <<"target: `", a_target.full_name,
						"%' is not exported to project '", project.name, "'">>)
				end

				a_project.set_start_target_name (start_target_name)
			end
				-- Start build process:
			if exit_code = 0 then
				if is_fileset_executable then
					if not fileset.is_executable then
						project.log (<<"  [geant] error: fileset definition wrong">>)
						exit_code := 1
					end
					if exit_code = 0 then
						fileset.execute
						from fileset.start until fileset.after or else exit_code /= 0 loop
							a_target := a_project.start_target
							arguments := a_target.prepared_arguments_from_formal_arguments (arguments)
							a_project.build (arguments)
							if not a_project.build_successful then
								exit_code := 1
							end

							fileset.forth
						end
					end
				else
					a_target := a_project.start_target
					arguments := a_target.prepared_arguments_from_formal_arguments (arguments)
					a_project.build (arguments)
					if not a_project.build_successful then
						exit_code := 1
					end
				end
			end
		end

	execute_with_target (a_target_name: STRING) is
			-- Call target named `a_target_name' of current project.
		require
			target_executable: is_target_executable
		local
			a_target: GEANT_TARGET
		do
			if project.targets.has (start_target_name) then
				if is_fileset_executable then
					if not fileset.is_executable then
						project.log (<<"  [geant] error: fileset definition wrong">>)
						exit_code := 1
					end
					if exit_code = 0 then
						fileset.execute
						a_target := project.targets.item (start_target_name)
						a_target := a_target.final_target
						arguments := a_target.prepared_arguments_from_formal_arguments (arguments)
						from fileset.start until fileset.after or else exit_code /= 0 loop
							a_target.project.build_target (a_target, arguments)

							fileset.forth
						end
					end
				else
					a_target := project.targets.item (start_target_name)
					a_target := a_target.final_target
					arguments := a_target.prepared_arguments_from_formal_arguments (arguments)
					a_target.project.build_target (a_target, arguments)
				end
			else
				project.log (<<"  [geant] error: unknown target: `", start_target_name, "%'">>)
				exit_code := 1
			end
		end

	options_and_variables_for_cmdline: STRING is
			-- All options and variables (without built-in ones) as STRINGs for
			-- geant commandline call
		local
			cs: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			create Result.make (128)
				-- Pass options:
			if project.options.verbose then
				Result.append_string (" -v")
			end
			if project.options.debug_mode then
				Result.append_string (" -d")
			end
			if project.options.no_exec then
				Result.append_string (" -n")
			end
				-- Pass variables:
			cs := project.variables.new_cursor
			from cs.start until cs.after loop
				if not project.is_builtin_variable_name (cs.key) then
					project.trace_debug (<<"    [geant] variable: ", cs.key, "=", cs.item	>>)
					Result := STRING_.appended_string (Result, " -D")
					Result := STRING_.appended_string (Result, cs.key)
					Result := STRING_.appended_string (Result, "=")
					Result := STRING_.appended_string (Result, cs.item)
				else
					project.trace_debug (<<"    [geant] built-in variable: ", cs.key, "=", cs.item	>>)
				end
				cs.forth
			end
		ensure
			options_and_variables_for_cmdline_not_void: options_and_variables_for_cmdline /= Void
		end

	has_fork_been_set: BOOLEAN
			-- Has attribute `fork' been set?

end
