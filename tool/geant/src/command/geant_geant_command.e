note

	description:

		"Geant commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"
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

	make (a_project: GEANT_PROJECT)
			-- Initialize command by setting `project' to `a_project'.
		do
			precursor (a_project)
				-- Create actual arguments:
			create arguments.make
		ensure then
			arguments_not_void: arguments /= Void
		end

feature -- Access

	filename: detachable STRING
			-- Geant build file to invoke

	fileset: detachable GEANT_FILESET
			-- Fileset for current command

	reuse_variables: BOOLEAN
			-- Are variables reused in new project?

	start_target_name: detachable STRING
			-- Name of target the build process starts with

	arguments: GEANT_ARGUMENT_VARIABLES
			-- Actual arguments

	exit_code_variable_name: detachable STRING
			-- Name of variable holding exit code of execution

feature -- Status report

	is_filename_executable: BOOLEAN
			-- Can command be executed on a project file?
		do
			Result := attached filename as l_filename and then l_filename.count > 0
		ensure
			filename_not_void_and_not_empty: Result implies attached filename as l_filename and then l_filename.count > 0
		end

	is_target_executable: BOOLEAN
			-- Can command be executed on a target?
		do
			Result := attached start_target_name as l_start_target_name and then l_start_target_name.count > 0
		ensure
			target_not_void_and_not_empty: Result implies attached start_target_name as l_start_target_name and then l_start_target_name.count > 0
		end

	is_fileset_executable: BOOLEAN
			-- Can command be executed on fileset `fileset'?
		do
			Result := fileset /= Void
		ensure
			fileset_not_void: Result implies fileset /= Void
		end

	is_executable: BOOLEAN
			-- Can command be executed?
		do
			Result := is_filename_executable or is_target_executable
		ensure then
			project_or_target: Result implies is_filename_executable or is_target_executable
		end

	fork: BOOLEAN
			-- Should a new process be spawned to execute command?

feature -- Setting

	set_filename (a_filename: like filename)
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

	set_fileset (a_fileset: like fileset)
			-- Set `fileset' to `a_fileset'.
		require
			a_fileset_not_void: a_fileset /= Void
		do
			fileset := a_fileset
		ensure
			fileset_set: fileset = a_fileset
		end

	set_reuse_variables(a_reuse_variables: BOOLEAN)
			-- Set `reuse_variables' to `a_reuse_variables'
		do
			reuse_variables := a_reuse_variables
		ensure
			reuse_variables_set: reuse_variables = a_reuse_variables
		end

	set_fork (a_fork: BOOLEAN)
			-- Set `fork' to `a_fork'
		do
			fork := a_fork
			has_fork_been_set := True
		ensure
			fork_set: fork = a_fork and has_fork_been_set
		end

	set_start_target_name (a_start_target_name: like start_target_name)
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

	set_exit_code_variable_name (a_exit_code_variable_name: like exit_code_variable_name)
			-- Set `exit_code_variable_name' to `a_exit_code_variable_name'.
		require
			a_exit_code_variable_name_not_void: a_exit_code_variable_name /= Void
			a_exit_code_variable_name_not_empty: a_exit_code_variable_name.count > 0
		do
			exit_code_variable_name := a_exit_code_variable_name
		ensure
			exit_code_set: exit_code_variable_name = a_exit_code_variable_name
		end

feature -- Execution

	execute
			-- Execute command.
		local
			a_filename: STRING
			a_fork: BOOLEAN
		do
			exit_code := 0
			if is_filename_executable and then attached filename as l_filename then
				if has_fork_been_set then
					a_fork := fork
				else
						-- Set default value for fork:
					a_fork := True
				end
					-- Create a new project and run it's build process:
				a_filename := file_system.pathname_from_file_system (l_filename, unix_file_system)
				if a_fork then
					execute_forked_with_filename_and_target (a_filename, start_target_name)
				else
					execute_with_filename (a_filename)
				end
			else
				check target_executable: attached start_target_name as l_start_target_name then
					if has_fork_been_set then
						a_fork := fork
					else
							-- Set default value for fork:
						a_fork := False
					end
						-- Call target of current project:
					if a_fork then
						execute_forked_with_target (l_start_target_name)
					else
						execute_with_target (l_start_target_name)
					end
				end
			end

			if attached exit_code_variable_name as l_exit_code_variable_name then
					-- Store return_code of execution:
				project.set_variable_value (l_exit_code_variable_name, exit_code.out)
					-- Reset `exit_code' since return code of execution is available through
					-- variable 'exit_code_variable_name':
				exit_code := 0
			end

		end

feature {NONE} -- Implementation

	execute_forked_with_filename_and_target (a_filename: STRING; a_target_name: detachable STRING)
			-- Spawn new geant process to execute scriptfile named `a_filename';
			-- If `a_target_name' is not Void and not empty pass it as start target name.
			-- TODO: support filesets
		local
			cmd: STRING
			a_level: STRING
		do
			a_level := ""
			if a_target_name /= Void and then a_target_name.count > 0 then
				project.trace_debug (<<"  [*geant] execute_forked_with_filename_and_target: '", a_filename, "', '", a_target_name, "'">>)
			else
				project.trace_debug (<<"  [*geant] execute_forked_with_filename_and_target: '", a_filename, "'">>)
			end
			if project.options.debug_mode then
				if Project_variables_resolver.has ("geant.geant.level") and then attached Project_variables_resolver.value ("geant.geant.level") as l_geant_geant_level then
					a_level := STRING_.concat (l_geant_geant_level, "#")
				else
					project.trace_debug (<<"  [*geant] no variable 'geant.geant.level' found">>)
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
			cmd := STRING_.appended_string (cmd, options_and_arguments_for_cmdline)
			if project.options.debug_mode then
				cmd.append_string (" -Dgeant.geant.level=")
				cmd := STRING_.appended_string (cmd, a_level)
			end
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

	execute_forked_with_target (a_target_name: STRING)
			-- Spawn new geant process for current buildscript and execute target named `a_target_name'.
			-- TODO: support filesets
		local
			a_filename: STRING
			a_key: STRING
		do
			project.trace_debug (<<"  [*geant] execute_forked_with_target: '", a_target_name, "'">>)
			if is_fileset_executable then
				--TODO
			else
					-- Determine name of buildfile of current build script:
--				a_key := STRING_.concat (project.name, ".absdir")
--				a_filename := project.variables.item (a_key)
--TODO:				a_filename := STRING_.concat (a_filename, project.variables.item ("path_separator"))
--				a_filename := STRING_.concat (a_filename, "/")
				a_key := STRING_.concat (project.name, ".filename")
--				a_filename := STRING_.concat (a_filename, project.variables.item (a_key))
				a_filename := project.variables.item (a_key)
				a_filename := file_system.pathname_from_file_system (a_filename, unix_file_system)
				execute_forked_with_filename_and_target (a_filename, a_target_name)
			end
		end

	execute_with_filename (a_filename: STRING)
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
			if attached a_project_loader.project_element as l_project_element then
				a_project := l_project_element.project
				a_project.merge_in_parent_projects

					-- Load build configuration:
				if attached start_target_name as l_start_target_name and then l_start_target_name.count > 0 then
					if not attached a_project.targets as l_project_targets or else not l_project_targets.has (l_start_target_name) then
						exit_application (1, <<"Project '", a_project.name,
							"' does not contain a target named `", l_start_target_name + "%'">>)
					else
							-- Check export status of target to be called:
						a_target := l_project_targets.item (l_start_target_name)
						if not (a_target.is_exported_to_any or else
							a_target.is_exported_to_project (project)) then
							exit_application (1, <<"target: `", a_target.full_name,
								"%' is not exported to project '", project.name, "'">>)
						end

						a_project.set_start_target_name (l_start_target_name)
					end
				end
					-- Start build process:
				if exit_code = 0 then
					if is_fileset_executable and then attached fileset as l_fileset then
						if not l_fileset.is_executable then
							project.log (<<"  [geant] error: fileset definition wrong">>)
							exit_code := 1
						end
						if exit_code = 0 then
							l_fileset.execute
							from l_fileset.start until l_fileset.after or else exit_code /= 0 loop
								a_target := a_project.start_target
								a_project.build (arguments)
								if not a_project.build_successful then
									exit_code := 1
								end

								l_fileset.forth
							end
						end
					else
						a_target := a_project.start_target
						a_project.build (arguments)
						if not a_project.build_successful then
							exit_code := 1
						end
					end
				end
			else
				exit_code := 1
			end
		end

	execute_with_target (a_target_name: STRING)
			-- Call target named `a_target_name' of current project.
		require
			target_executable: is_target_executable
		local
			a_target: GEANT_TARGET
		do
			check precondition: attached start_target_name as l_start_target_name then
				if attached project.targets as l_project_targets and then l_project_targets.has (l_start_target_name) then
					if is_fileset_executable and then attached fileset as l_fileset then
						if not l_fileset.is_executable then
							project.log (<<"  [geant] error: fileset definition wrong">>)
							exit_code := 1
						end
						if exit_code = 0 then
							l_fileset.execute
							a_target := l_project_targets.item (l_start_target_name)
							a_target := a_target.final_target
							from l_fileset.start until l_fileset.after or else exit_code /= 0 loop
								a_target.project.build_target (a_target, arguments)
								l_fileset.forth
							end
						end
					else
						a_target := l_project_targets.item (l_start_target_name)
						a_target := a_target.final_target
						a_target.project.build_target (a_target, arguments)
					end
				else
					project.log (<<"  [geant] error: unknown target: `", l_start_target_name, "%'">>)
					exit_code := 1
				end
			end
		end

	options_and_arguments_for_cmdline: STRING
			-- All options and arguments (without built-in ones) as STRINGs for
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
				-- Pass arguments:
			cs := arguments.new_cursor
			from cs.start until cs.after loop
				project.trace_debug (<<"    [*geant] variable: ", cs.key, "=", cs.item>>)
				Result := STRING_.appended_string (Result, " -A%"")
				Result := STRING_.appended_string (Result, cs.key)
				Result := STRING_.appended_string (Result, "=")
				Result := STRING_.appended_string (Result, cs.item)
				Result := STRING_.appended_string (Result, "%"")
				cs.forth
			end
		ensure
			options_and_arguments_for_cmdline_not_void: options_and_arguments_for_cmdline /= Void
		end

	has_fork_been_set: BOOLEAN
			-- Has attribute `fork' been set?

end
