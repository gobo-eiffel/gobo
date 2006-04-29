indexing

	description:

		"Gobo Eiffel Ant: build tool for Eiffel, based on the concepts of Jakarta Ant"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class GEANT

inherit

	GEANT_VERSION

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Execute 'geant'.
		local
			a_project: GEANT_PROJECT
			a_project_loader: GEANT_PROJECT_LOADER
			a_project_options: GEANT_PROJECT_OPTIONS
			a_variables: GEANT_PROJECT_VARIABLES
			a_target: GEANT_TARGET
		do
			Arguments.set_program_name ("geant")
			create error_handler.make_standard
			read_command_line

				-- Verbose:
			if verbose then
				Default_builtin_variables.set_variable_value ("verbose", "true")
			end

				-- Create project variables:
			create a_variables.make

				-- Create project options:
			create a_project_options.make
			a_project_options.set_verbose (verbose)
			a_project_options.set_debug_mode (debug_mode)
			a_project_options.set_no_exec (no_exec)

			if build_filename = Void then
				build_filename := Default_build_filename
			end
			create a_project_loader.make (build_filename)

			a_project_loader.load (a_variables, a_project_options)
			a_project := a_project_loader.project_element.project
			a_project.merge_in_parent_projects
			if start_target_name /= Void and then start_target_name.count > 0 then
				if not a_project.targets.has (start_target_name) then
					exit_application (1, <<"Project '", a_project.name,
						"' does not contain a target named `", start_target_name + "%'">>)
				end
				a_target := a_project.targets.item (start_target_name)
					-- Check export status of `a_target':
				if not a_target.is_exported_to_any then
					exit_application (1, <<"target: `", a_target.full_name, "%' is not exported.">>)
				end
				a_project.set_start_target_name (start_target_name)
			end

			if show_target_info then
				a_project.show_target_info
			else
				a_target := a_project.start_target
				a_project.build (commandline_arguments)
			end

			if not a_project.build_successful then
				exit_application (1, Void)
			end
		end


feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	build_filename: STRING
			-- Build filename for geant.

	start_target_name: STRING
			-- Name of the target the build process starts with

	verbose: BOOLEAN
			-- Print additional information during build process?

	debug_mode: BOOLEAN
			-- Print additional, internal information during build process?

	show_target_info: BOOLEAN
			-- Print list of name and description for all targets of project?

	no_exec: BOOLEAN
			-- Do not execute commands (only show what they would do)?

	read_command_line is
			-- Read command line arguments.
		local
			i, nb: INTEGER
			p: INTEGER
			arg: STRING
			a_variable_name: STRING
			a_variable_value: STRING
		do
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("--version") then
					report_version_number
				elseif arg.is_equal ("--verbose") or arg.is_equal ("-v") then
					set_verbose (true)
				elseif arg.is_equal ("--noexec") or arg.is_equal ("-n") then
					set_no_exec (true)
				elseif arg.is_equal ("--debug") or arg.is_equal ("-d") then
					set_debug_mode (true)
				elseif arg.is_equal ("--rules") or arg.is_equal ("-r") or
					arg.is_equal ("--targets") or arg.is_equal ("-t") then
					set_show_target_info (true)
				elseif arg.is_equal ("--help") or arg.is_equal ("-h") or arg.is_equal ("-?") then
					report_usage_message
				elseif arg.is_equal ("-b") then
					i := i + 1
					if i > nb then
						report_usage_error
					else
						build_filename := Arguments.argument (i)
					end
				elseif arg.count > 16 and then arg.substring (1, 16).is_equal ("--buildfilename=") then
					build_filename := arg.substring (16, arg.count)
				elseif arg.count > 1 and then arg.item (1) = '-' and then arg.item (2) = 'A' then
					p := arg.index_of('=', 1)
					if p > 3 and p < arg.count then
							-- define commandline argument with value:
						a_variable_name := arg.substring (3, p - 1)
						a_variable_value := arg.substring (p + 1, arg.count)
						commandline_arguments.force (a_variable_value, a_variable_name)
					end
				elseif arg.count > 1 and then arg.item (1) = '-' and then arg.item (2) = 'D' then
					p := arg.index_of('=', 1)
					if p > 3 and p < arg.count then
							-- define commandline variable with value:
						a_variable_name := arg.substring (3, p - 1)
						a_variable_value := arg.substring (p + 1, arg.count)
						Commandline_variables.force (a_variable_value, a_variable_name)
					elseif arg.count > 2 and then p = 0 then
							-- define commandline variable:
						a_variable_name := arg.substring (3, arg.count)
						Commandline_variables.force ("true", a_variable_name)
					end
				elseif i = nb then
					start_target_name := arg
				else
					report_usage_error
				end
				i := i + 1
			end
		end

feature -- Setting

	set_verbose (a_verbose: BOOLEAN) is
			-- Set `verbose' to `a_verbose'
		do
			verbose := a_verbose
		ensure
			verbose_set: verbose = a_verbose
		end

	set_debug_mode (a_debug_mode: BOOLEAN) is
			-- Set `debug_mode' to `a_debug_mode'
		do
			debug_mode := a_debug_mode
		ensure
			debug_mode_set: debug_mode = a_debug_mode
		end

	set_show_target_info (a_show_target_info: BOOLEAN) is
			-- Set `show_target_info' to `a_show_target_info'
		do
			show_target_info := a_show_target_info
		ensure
			show_target_info_set: show_target_info = a_show_target_info
		end

	set_no_exec (a_no_exec: BOOLEAN) is
			-- Set `no_exec' to `a_no_exec'
		do
			no_exec := a_no_exec
		ensure
			no_exec_set: no_exec = a_no_exec
		end

feature {NONE} -- Error handling

	report_usage_error is
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			exit_application (1, Void)
		end

	report_usage_message is
			-- Report usage message and exit.
		do
			error_handler.report_info (Usage_message)
			exit_application (0, Void)
		end

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			exit_application (0, Void)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Geant usage message
		local
			s: STRING
		once
			s := STRING_.cloned_string ("[-options] [target]")
			s.append_string ("%N")
			s.append_string ("where options include:%N")
			s.append_string ("  --version : Show version%N")
			s.append_string ("  -v --verbose : Turn on verbose output%N")
			s.append_string ("  -b --buildfilename <buildfilename> : Specify buildfile (default: 'build.eant'%N")
			s.append_string ("  -n --noexec : Do not execute tasks, just show what they would do%N")
			s.append_string ("  -D<variable> : Define variable named 'variable' with value 'True'%N")
			s.append_string ("  -D<variable>=<value> : Define variable named 'variable' with value 'value'%N")
			s.append_string ("  -d --debug : Show internal messages%N")
			s.append_string ("  -? -h help : Print this help message")

			create Result.make (s)
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Default_build_filename: STRING is
			-- Default Name of build file
		once
			Result := "build.eant"
		ensure
			filename_not_void: Result /= Void
			filename_not_empty: Result.count > 0
		end

end
