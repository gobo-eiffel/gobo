note

	description:

		"Gobo Eiffel Doc"

	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC

inherit

	GEDOC_VERSION

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start 'gedoc' execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
			Exceptions.die (exit_code)
		rescue
			Exceptions.die (2)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start 'gedoc' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_error_handler: ET_ERROR_HANDLER
		do
			create l_error_handler.make_standard
			execute_with_arguments_and_error_handler (a_args, l_error_handler)
		end

	execute_with_arguments_and_error_handler (a_args: ARRAY [STRING]; a_error_handler: ET_ERROR_HANDLER)
			-- Start 'gedoc' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		do
			Arguments.set_program_name ("gedoc")
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			error_handler := a_error_handler
			parse_arguments (a_args)
			if exit_code = 0 and then attached format as l_format then
				l_format.execute
				if l_format.has_error then
					exit_code := 1
				end
			end
			if exit_code = 0 and has_error then
				exit_code := 1
			end
		rescue
			exit_code := 2
		end

feature -- Access

	format: detachable GEDOC_FORMAT
			-- Documentation format to be executed

feature -- Argument parsing

	target_option: AP_STRING_OPTION
			-- Option for '--target=<target_name>'

	format_option: AP_ENUMERATION_OPTION
			-- Option for '--format=<pretty_print|html_ise_stylesheet|ecf_pretty_print|available_targets>'

	class_option: AP_STRING_OPTION
			-- Option for '--class=<class_name>'

	output_option: AP_STRING_OPTION
			-- Option for '--output=<directory_name>'

	library_prefix_flag: AP_FLAG
			-- Flag for '--library-prefix'

	force_flag: AP_FLAG
			-- Flag for '--force'

	interactive_flag: AP_FLAG
			-- Flag for '--interactive'

	verbose_flag: AP_FLAG
			-- Flag for '--verbose'

	nested_benchmark_flag: AP_FLAG
			-- Flag for '--nested-benchmark'

	no_benchmark_flag: AP_FLAG
			-- Flag for '--no-benchmark'

	metrics_flag: AP_FLAG
			-- Flag for '--metrics'

	silent_flag: AP_FLAG
			-- Flag for '--silent'

	ise_option: AP_STRING_OPTION
			-- Option for '--ise[=major[.minor[.revision[.build]]]]'

	ecf_option: AP_STRING_OPTION
			-- Option for '--ecf=<latest|major.minor.revision>'

	setting_option: AP_STRING_OPTION
			-- Option for '--setting=name=value'

	capability_option: AP_STRING_OPTION
			-- Option for '--capability=name=value'

	variable_option: AP_STRING_OPTION
			-- Option for '--variable=FOO=BAR'

	thread_option: AP_INTEGER_OPTION
			-- Option for '--thread=<thread_count>'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments (a_args: ARRAY [STRING])
			-- Initialize options and parse arguments `a_args'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_parser: AP_PARSER
			l_list: AP_ALTERNATIVE_OPTIONS_LIST
			l_format: GEDOC_FORMAT
		do
			create l_parser.make
			l_parser.set_application_description ("Gobo Eiffel Doc, generate Eiffel documentation.")
			l_parser.set_parameters_description ("filename")
				-- target.
			create target_option.make_with_long_form ("target")
			target_option.set_description ("Name of target to be used in ECF file. (default: last target in ECF file)")
			target_option.set_parameter_description ("target_name")
			l_parser.options.force_last (target_option)
				-- format.
			create format_option.make_with_long_form ("format")
			format_option.set_description ("Format for the output. (default: pretty_print)")
			format_option.extend ("pretty_print")
			format_option.extend ("html_ise_stylesheet")
			format_option.extend ("descendants")
			format_option.extend ("implicit_converts")
			format_option.extend ("explicit_converts")
			format_option.extend ("ecf_pretty_print")
			format_option.extend ("available_targets")
			format_option.set_parameter_description ("pretty_print|html_ise_stylesheet|descendants|implicit_converts|explicit_converts|ecf_pretty_print|available_targets")
			l_parser.options.force_last (format_option)
				-- class.
			create class_option.make ('c', "class")
			class_option.set_description ("Name (with wildcards) of classes to be processed.")
			class_option.set_parameter_description ("class_name")
			l_parser.options.force_last (class_option)
				-- output directory.
			create output_option.make ('o', "output")
			output_option.set_description ("Directory for generated files. (default: next to each class file)")
			output_option.set_parameter_description ("directory_name")
			l_parser.options.force_last (output_option)
				-- library-prefix.
			create library_prefix_flag.make_with_long_form ("library-prefix")
			library_prefix_flag.set_description ("Add subfolders with library names in the output directory.")
			l_parser.options.force_last (library_prefix_flag)
				-- force.
			create force_flag.make ('f', "force")
			force_flag.set_description ("Overwrite existing files without asking.")
			l_parser.options.force_last (force_flag)
				-- interactive.
			create interactive_flag.make ('i', "interactive")
			interactive_flag.set_description ("Ask before overwriting a file, unless --force is specified.")
			l_parser.options.force_last (interactive_flag)
				-- verbose.
			create verbose_flag.make_with_long_form ("verbose")
			verbose_flag.set_description ("Should detailed informative messages be displayed?")
			l_parser.options.force_last (verbose_flag)
				-- no-benchmark.
			create no_benchmark_flag.make_with_long_form ("no-benchmark")
			no_benchmark_flag.set_description ("Should no benchmark information be displayed? (default: display non-nested benchmark information)")
			l_parser.options.force_last (no_benchmark_flag)
				-- nested-benchmark.
			create nested_benchmark_flag.make_with_long_form ("nested-benchmark")
			nested_benchmark_flag.set_description ("Should nested benchmark information be displayed?")
			l_parser.options.force_last (nested_benchmark_flag)
				-- metrics.
			create metrics_flag.make_with_long_form ("metrics")
			metrics_flag.set_description ("Should metrics information be displayed?")
			l_parser.options.force_last (metrics_flag)
				-- silent.
			create silent_flag.make_with_long_form ("silent")
			silent_flag.set_description ("Should no informative messages be displayed?")
			l_parser.options.force_last (silent_flag)
				-- ise.
			create ise_option.make_with_long_form ("ise")
			ise_option.set_description ("Version of Eiffel whose semantics should be used during code analysis. (default: latest version)")
			ise_option.set_parameter_description ("major[.minor[.revision[.build]]]")
			ise_option.set_parameter_optional (ise_latest.out)
			l_parser.options.force_last (ise_option)
				-- ecf.
			create ecf_option.make_with_long_form ("ecf")
			ecf_option.set_description ("Version of ECF to be used when converting ECF files. (default: version of the ECF input file)")
			ecf_option.set_parameter_description ("latest|major.minor.revision")
			l_parser.options.force_last (ecf_option)
				-- setting.
			create setting_option.make_with_long_form ("setting")
			setting_option.set_description ("Override settings defined in ECF file.")
			setting_option.set_parameter_description ("name=value")
			l_parser.options.force_last (setting_option)
				-- capability.
			create capability_option.make_with_long_form ("capability")
			capability_option.set_description ("Override capability usage defined in ECF file.")
			capability_option.set_parameter_description ("name=value")
			l_parser.options.force_last (capability_option)
				-- variable.
			create variable_option.make_with_long_form ("variable")
			variable_option.set_description ("Override variables defined in ECF file.")
			variable_option.set_parameter_description ("NAME=VALUE")
			l_parser.options.force_last (variable_option)
				-- thread.
			create thread_option.make_with_long_form ("thread")
			thread_option.set_description ("Number of threads to be used. Negative numbers -N mean %"number of CPUs - N%". (default: number of CPUs)")
			thread_option.set_parameter_description ("thread_count")
			if {PLATFORM}.is_thread_capable then
				l_parser.options.force_last (thread_option)
			end
				-- version.
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gedoc and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_first (l_list)
				-- Parsing.
			l_parser.parse_arguments
			if silent_flag.was_found then
				create {ET_NULL_ERROR_HANDLER} error_handler.make_null
			end
			if version_flag.was_found then
				report_version_number
				exit_code := 0
			elseif l_parser.parameters.count /= 1 or else not attached l_parser.parameters.first as l_input_filename then
				report_usage_message (l_parser)
				exit_code := 1
			elseif not format_option.was_found or format_option.parameter ~ "pretty_print" then
				create {GEDOC_PRETTY_PRINT_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "html_ise_stylesheet" then
				create {GEDOC_HTML_ISE_STYLESHEET_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "descendants" then
				create {GEDOC_DESCENDANTS_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "implicit_converts" then
				create {GEDOC_IMPLICIT_CONVERTS_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "explicit_converts" then
				create {GEDOC_EXPLICIT_CONVERTS_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "ecf_pretty_print" then
				create {GEDOC_ECF_PRETTY_PRINT_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			elseif format_option.parameter ~ "available_targets" then
				create {GEDOC_AVAILABLE_TARGETS_FORMAT} l_format.make (l_input_filename, new_system_processor (thread_option))
			end
			if l_format /= Void then
				set_target_name (target_option, l_parser, l_format)
				set_ise_version (ise_option, l_parser, l_format)
				set_ecf_version (ecf_option, l_parser, l_format)
				set_override_settings (setting_option, l_parser, l_format)
				set_override_capabilities (capability_option, l_parser, l_format)
				set_override_variables (variable_option, l_parser, l_format)
				set_class_filters (class_option, l_parser, l_format)
				set_output_directory (output_option, l_parser, l_format)
				l_format.set_force_flag (force_flag.was_found)
				l_format.set_interactive_flag (interactive_flag.was_found)
				l_format.set_library_prefix_flag (library_prefix_flag.was_found)
				l_format.set_verbose_flag (verbose_flag.was_found)
				l_format.set_benchmark_flag (not no_benchmark_flag.was_found)
				l_format.set_nested_benchmark_flag (nested_benchmark_flag.was_found)
				l_format.set_metrics_flag (metrics_flag.was_found)
				l_format.set_silent_flag (silent_flag.was_found)
				format := l_format
			end
		ensure
			format_option_not_void: format_option /= Void
			class_option_not_void: class_option /= Void
			output_option_not_void: output_option /= Void
			library_prefix_flag_not_void: library_prefix_flag /= Void
			force_flag_not_void: force_flag /= Void
			interactive_flag_not_void: interactive_flag /= Void
			verbose_flag_not_void: verbose_flag /= Void
			no_benchmark_flag_not_void: no_benchmark_flag /= Void
			nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
			metrics_flag_not_void: metrics_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			ise_option_not_void: ise_option /= Void
			ecf_option_not_void: ecf_option /= Void
			setting_option_not_void: setting_option /= Void
			capability_option_not_void: capability_option /= Void
			variable_option_not_void: variable_option /= Void
			thread_option_not_void: thread_option /= Void
			version_flag_not_void: version_flag /= Void
		end

	set_target_name (a_option: like target_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'target_name' of `a_format' with information passed in `a_option'.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		do
			if a_option.was_found then
				a_format.set_target_name (a_option.parameter)
			else
				a_format.set_target_name (Void)
			end
		end

	set_ise_version (a_option: like ise_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'ise_version' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_ise_version: detachable UT_VERSION
		do
			if not a_option.was_found then
				l_ise_version := ise_latest
			elseif not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				exit_code := 1
			elseif STRING_.same_string (l_parameter, ise_latest.out) then
				l_ise_version := ise_latest
			else
				create l_ise_regexp.make
				l_ise_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_ise_regexp.recognizes (l_parameter) then
					inspect l_ise_regexp.match_count
					when 2 then
						create l_ise_version.make_major (l_ise_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_ise_version.make_major_minor (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, l_ise_regexp.captured_substring (7).to_integer)
					else
						report_usage_message (a_parser)
						exit_code := 1
					end
				else
					report_usage_message (a_parser)
					exit_code := 1
				end
			end
			if l_ise_version /= Void then
				a_format.set_ise_version (l_ise_version)
			end
		end

	set_ecf_version (a_option: like ecf_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'ecf_version' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_ecf_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_ecf_version: detachable UT_VERSION
		do
			if not a_option.was_found then
				l_ecf_version := Void
			elseif not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				exit_code := 1
			elseif STRING_.same_string (l_parameter, "latest") then
				l_ecf_version := {UT_SHARED_ECF_VERSIONS}.ecf_last_known
			else
				create l_ecf_regexp.make
				l_ecf_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?")
				if l_ecf_regexp.recognizes (l_parameter) then
					inspect l_ecf_regexp.match_count
					when 6 then
						create l_ecf_version.make (l_ecf_regexp.captured_substring (1).to_integer, l_ecf_regexp.captured_substring (3).to_integer, l_ecf_regexp.captured_substring (5).to_integer, 0)
					else
						report_usage_message (a_parser)
						exit_code := 1
					end
				else
					report_usage_message (a_parser)
					exit_code := 1
				end
			end
			if l_ecf_version /= Void then
				a_format.set_ecf_version (l_ecf_version)
			end
		end

	set_override_settings (a_option: like setting_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'override_settings' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_override_settings: detachable ET_ECF_SETTINGS
			l_definition: STRING
			l_index: INTEGER
		do
			if not a_option.parameters.is_empty then
				create l_override_settings.make
				across a_option.parameters as i_setting loop
					if attached i_setting as l_setting then
						l_definition := l_setting
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_override_settings.set_primary_value (l_definition, "")
							elseif l_index = l_definition.count then
								l_override_settings.set_primary_value (l_definition.substring (1, l_index - 1), "")
							elseif l_index /= 1 then
								l_override_settings.set_primary_value (l_definition.substring (1, l_index - 1), l_definition.substring (l_index + 1, l_definition.count))
							end
						end
					end
				end
			end
			a_format.set_override_settings (l_override_settings)
		end

	set_override_capabilities (a_option: like capability_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'override_capabilities' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_override_capabilities: detachable ET_ECF_CAPABILITIES
			l_definition: STRING
			l_index: INTEGER
		do
			if not a_option.parameters.is_empty then
				create l_override_capabilities.make
				across a_option.parameters as i_capability loop
					if attached i_capability as l_capability then
						l_definition := l_capability
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_override_capabilities.set_primary_use_value (l_definition, "")
							elseif l_index = l_definition.count then
								l_override_capabilities.set_primary_use_value (l_definition.substring (1, l_index - 1), "")
							elseif l_index /= 1 then
								l_override_capabilities.set_primary_use_value (l_definition.substring (1, l_index - 1), l_definition.substring (l_index + 1, l_definition.count))
							end
						end
					end
				end
			end
			a_format.set_override_capabilities (l_override_capabilities)
		end

	set_override_variables (a_option: like variable_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'override_variables' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_override_variables: ET_ECF_VARIABLES
			l_definition: STRING
			l_index: INTEGER
			l_gobo_eiffel: detachable STRING
		do
			l_gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if l_gobo_eiffel = Void or else l_gobo_eiffel.is_empty then
				if ise_option.was_found then
					l_gobo_eiffel := "ise"
				else
					l_gobo_eiffel := "ge"
				end
				Execution_environment.set_variable_value ("GOBO_EIFFEL", l_gobo_eiffel)
			end
			if not a_option.parameters.is_empty then
				create l_override_variables.make
				across a_option.parameters as i_variable loop
					if attached i_variable as l_variable then
						l_definition := l_variable
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_override_variables.set_primary_value (l_definition, "")
							elseif l_index = l_definition.count then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), "")
							elseif l_index /= 1 then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), l_definition.substring (l_index + 1, l_definition.count))
							end
						end
					end
				end
			end
			a_format.set_override_variables (l_override_variables)
		end

	set_class_filters (a_option: like class_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'class_filters' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		local
			l_wildcard: LX_DFA_WILDCARD
			l_class_filters: DS_ARRAYED_LIST [LX_DFA_WILDCARD]
		do
			if not a_option.parameters.is_empty then
				create l_class_filters.make (a_option.parameters.count)
				across a_option.parameters as i_class_option loop
					if attached i_class_option as l_class_filter and then not l_class_filter.is_empty then
						create l_wildcard.compile_case_insensitive (l_class_filter)
						if not l_wildcard.is_compiled then
							report_invalid_class_option_error (l_class_filter)
							exit_code := 1
						else
							l_class_filters.put_last (l_wildcard)
						end
					end
				end
				if not l_class_filters.is_empty then
					a_format.set_class_filters (l_class_filters)
				end
			end
		end

	set_output_directory (a_option: like output_option; a_parser: AP_PARSER; a_format: GEDOC_FORMAT)
			-- Set 'output_directory' of `a_format' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
			a_format_not_void: a_format /= Void
		do
			if a_option.was_found and then attached a_option.parameter as l_output_directory then
				a_format.set_output_directory (Execution_environment.interpreted_string (l_output_directory))
			elseif a_format.is_output_directory_required then
				report_missing_output_option_error
				exit_code := 1
			end
		end

	new_system_processor (a_thread_option: AP_INTEGER_OPTION): ET_SYSTEM_PROCESSOR
			-- New system processor, using the number of threads
			-- specified in `a_thread_option'
		require
			a_thread_option_not_void: a_thread_option /= Void
		local
			l_thread_count: INTEGER
		do
			l_thread_count := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32
			if a_thread_option.was_found then
				l_thread_count := a_thread_option.parameter
				if l_thread_count <= 0 then
					l_thread_count := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32 + l_thread_count
				end
			end
			if l_thread_count < 1 or not {PLATFORM}.is_thread_capable then
				l_thread_count := 1
			end
			Result := {ET_SYSTEM_PROCESSOR_FACTORY}.new_system_processor (l_thread_count)
			Result.set_error_handler (error_handler)
		ensure
			new_system_processor_not_void: Result /= Void
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	has_error: BOOLEAN
			-- Have some errors been reported?

	report_error (a_error: UT_ERROR)
			-- Report `a_error'.
		require
			a_error_not_void: a_error /= Void
		do
			error_handler.report_error (a_error)
			has_error := True
		end

	report_invalid_class_option_error (a_wildcard: STRING)
			-- Report that the wildcard specified for `class_option' is invalid.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Invalid wildcard '" + a_wildcard + "' in option '--class'.")
			report_error (l_error)
		end

	report_missing_output_option_error
			-- Report that the specified format requires an output directory
			-- but none was provided.
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Missing option '--output'. This option is required for the specified format.")
			report_error (l_error)
		end

	report_version_number
			-- Report version number.
		local
			l_message: UT_VERSION_NUMBER
		do
			create l_message.make (Version_number)
			error_handler.report_info (l_message)
		end

	report_usage_message (a_parser: AP_PARSER)
			-- Report usage message.
		require
			a_parser_not_void: a_parser /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_parser.full_usage_instruction)
			report_error (l_error)
		end

	exit_code: INTEGER
			-- Exit code

invariant

	error_handler_not_void: error_handler /= Void
	target_option_not_void: target_option /= Void
	format_option_not_void: format_option /= Void
	class_option_not_void: class_option /= Void
	output_option_not_void: output_option /= Void
	library_prefix_flag_not_void: library_prefix_flag /= Void
	force_flag_not_void: force_flag /= Void
	interactive_flag_not_void: interactive_flag /= Void
	verbose_flag_not_void: verbose_flag /= Void
	no_benchmark_flag_not_void: no_benchmark_flag /= Void
	nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
	metrics_flag_not_void: metrics_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	ise_option_not_void: ise_option /= Void
	ecf_option_not_void: ecf_option /= Void
	setting_option_not_void: setting_option /= Void
	capability_option_not_void: capability_option /= Void
	variable_option_not_void: variable_option /= Void
	thread_option_not_void: thread_option /= Void
	version_flag_not_void: version_flag /= Void

end
