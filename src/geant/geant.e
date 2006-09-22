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
			version_flag: AP_FLAG
			version_aol: AP_ALTERNATIVE_OPTIONS_LIST
			verbose_flag: AP_FLAG
			buildfilename_option: AP_STRING_OPTION
			noexec_flag: AP_FLAG
			define_option: AP_STRING_OPTION
			debug_flag: AP_FLAG
			targets_flag: AP_FLAG
			argument_option: AP_STRING_OPTION
			arg_parser: AP_PARSER
			i,p: INTEGER
			arg: STRING
			a_variable_name: STRING
			a_variable_value: STRING
			error: AP_ERROR
		do
			create arg_parser.make
			arg_parser.set_application_description ("Geant is a build tool specifically tailored for the Eiffel programming language.")
			arg_parser.set_parameters_description ("[target]")

			create argument_option.make_with_short_form ('A')
			argument_option.set_description ("Defines argument named 'variable' with value 'value' for the current target.")
			argument_option.set_parameter_description ("<variable>=<value>")
			arg_parser.options.force_last (argument_option)

			create define_option.make_with_short_form ('D')
			define_option.set_description ("Defines variable named 'variable' with value 'value'. If no value is supplied, True is assumed as value.")
			define_option.set_parameter_description ("<variable>[=<value>]")
			arg_parser.options.force_last (define_option)

			create version_flag.make_with_long_form ("version")
			version_flag.set_description ("Show version")
			create version_aol.make (version_flag)
			arg_parser.alternative_options_lists.force_last (version_aol)

			create verbose_flag.make ('v', "verbose")
			verbose_flag.set_description ("Turn on verbose output")
			arg_parser.options.force_last (verbose_flag)

			create buildfilename_option.make ('b', "buildfilename")
			buildfilename_option.set_description ("Specify buildfile (default: 'build.eant')")
			buildfilename_option.set_parameter_description ("<file>")
			arg_parser.options.force_last (buildfilename_option)

			create noexec_flag.make ('n', "noexec")
			noexec_flag.set_description ("Do not execute tasks, just show what they would do")
			arg_parser.options.force_last (noexec_flag)

			create debug_flag.make ('d', "debug")
			debug_flag.set_description ("Show internal messages")
			arg_parser.options.force_last (debug_flag)

			create targets_flag.make ('t', "targets")
			targets_flag.set_description ("List all targets")
			arg_parser.options.force_last (targets_flag)

			arg_parser.parse_arguments

			if version_flag.was_found then
				report_version_number
			end
			set_verbose(verbose_flag.was_found)
			set_no_exec (noexec_flag.was_found)
			set_debug_mode (debug_flag.was_found)
			if buildfilename_option.was_found then
				build_filename := buildfilename_option.parameter
			end
			set_show_target_info (targets_flag.was_found)
			from i := 1 until i > argument_option.parameters.count loop
				arg := argument_option.parameters.item (i)
				p := arg.index_of('=', 1)
				if p > 0 then
					-- define commandline argument with value:
					a_variable_name := arg.substring (1, p-1)
					a_variable_value := arg.substring (p+1, arg.count)
					Commandline_arguments.force (a_variable_value, a_variable_name)
				else
					create error.make_invalid_parameter_error (argument_option, arg)
					arg_parser.error_handler.report_error (error)
					arg_parser.final_error_action
				end
				i := i + 1
			end
			from i := 1 until i > define_option.parameters.count loop
				arg := define_option.parameters.item (i)
				p := arg.index_of('=', 1)
				if p > 0 then
					-- define commandline variable with value:
					a_variable_name := arg.substring (1, p-1)
					a_variable_value := arg.substring (p+1, arg.count)
					Commandline_variables.force (a_variable_value, a_variable_name)
				else
					-- define commandline variable:
					Commandline_variables.force ("true", arg)
				end
				i := i + 1
			end
			if arg_parser.parameters.count = 1 then
				start_target_name := arg_parser.parameters.first
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

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			exit_application (0, Void)
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
