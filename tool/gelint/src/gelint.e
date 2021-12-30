note

	description:

		"Gobo Eiffel Lint"

	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GELINT

inherit

	GELINT_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	ET_SHARED_ISE_VARIABLES
		export {NONE} all end

	UT_SHARED_ECMA_VERSIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start 'gelint' execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
			Exceptions.die (exit_code)
		rescue
			Exceptions.die (4)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start 'gelint' execution with arguments `a_args'.
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
			-- Start 'gelint' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		local
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
		do
			Arguments.set_program_name ("gelint")
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			error_handler := a_error_handler
			parse_arguments (a_args)
			if exit_code = 0 and then not version_flag.was_found then
				l_filename := ecf_filename
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					last_system := Void
					parse_ecf_file (l_file)
					l_file.close
					if attached last_system as l_last_system then
						process_system (l_last_system)
						debug ("stop")
							std.output.put_line ("Press Enter...")
							io.read_line
						end
						if error_handler.has_eiffel_error then
							exit_code := 2
						elseif error_handler.has_internal_error then
							exit_code := 5
						end
					else
						exit_code := 3
					end
				else
					report_cannot_read_error (l_filename)
					exit_code := 1
				end
			end
		rescue
			exit_code := 4
		end

feature -- Access

	last_system: detachable ET_SYSTEM
			-- Last system parsed, if any

feature {NONE} -- Eiffel config file parsing

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
		do
			last_system := Void
			if is_silent then
				create l_ecf_error_handler.make_null
			else
				create l_ecf_error_handler.make_standard
			end
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_override_settings (override_settings)
			l_ecf_parser.set_override_capabilities (override_capabilities)
			l_ecf_parser.set_override_variables (override_variables)
			if attached ise_version as l_ise_version then
				l_ecf_parser.set_ise_version (l_ise_version)
			end
			l_ecf_parser.parse_file (a_file, target_name)
			if not l_ecf_error_handler.has_error then
				last_system := l_ecf_parser.last_system
			end
		end

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			a_dynamic_system: ET_DYNAMIC_SYSTEM
			a_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_system_processor: ET_SYSTEM_PROCESSOR
			dt1: detachable DT_DATE_TIME
		do
			error_handler.set_ise
			error_handler.set_verbose (is_verbose)
			if ise_version = Void then
				ise_version := ise_latest
			end
			l_system_processor := {ET_SYSTEM_PROCESSOR_FACTORY}.new_system_processor (thread_count)
			l_system_processor.set_error_handler (error_handler)
			l_system_processor.set_benchmark_shown (not is_no_benchmark and not is_silent)
			l_system_processor.set_nested_benchmark_shown (is_nested_benchmark and not is_no_benchmark and not is_silent)
			l_system_processor.set_metrics_shown (is_metrics and not is_silent)
			l_system_processor.set_ise_version (ise_version)
			l_system_processor.set_ecma_version (ecma_version)
			l_system_processor.set_flat_mode (is_flat)
			l_system_processor.set_flat_dbc_mode (is_flat_dbc)
			l_system_processor.set_unknown_builtin_reported (False)
			dt1 := l_system_processor.benchmark_start_time
			if is_catcall then
				create a_dynamic_system.make (a_system, l_system_processor)
				a_dynamic_system.set_catcall_error_mode (True)
				create {ET_DYNAMIC_PULL_TYPE_SET_BUILDER} a_builder.make (a_dynamic_system, l_system_processor)
				a_dynamic_system.set_dynamic_type_set_builder (a_builder)
				a_dynamic_system.compile (l_system_processor)
			else
				l_system_processor.set_providers_enabled (True)
				l_system_processor.set_cluster_dependence_enabled (False)
				l_system_processor.compile (a_system)
			end
			l_system_processor.record_end_time (dt1, "Total Time")
		end

feature -- Arguments

	ecf_filename: STRING
			-- Name of the ECF file

	target_name: detachable STRING
			-- Name of target to be used in ECF file.
			-- Use last target in ECF file if not specified.
		do
			if target_option.was_found then
				Result := target_option.parameter
			end
		end

	override_settings: detachable ET_ECF_SETTINGS
			-- Settings overriding those specified for the selected ECF target

	override_capabilities: detachable ET_ECF_CAPABILITIES
			-- Capabilities overriding those specified for the selected ECF target

	override_variables: detachable ET_ECF_VARIABLES
			-- Variables overriding those specified for the selected ECF target

	is_flat: BOOLEAN
			-- For each class, not only check the validity of the features declared
			-- in this class, but also of those inherited from its parent classes.
		do
			Result := flat_flag.was_found
		end

	is_flat_dbc: BOOLEAN
			-- Check the validity of inherited pre- and postconditions when
			-- a feature is redeclared.
		do
			Result := not noflatdbc_flag.was_found
		end

	is_catcall: BOOLEAN
			-- Report possible CAT-call errors, based on the statically computed
			-- dynamic type sets of each variables in the Eiffel code.
		do
			Result := catcall_flag.was_found
		end

	ise_version: detachable UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

	ecma_version: detachable UT_VERSION
			-- ECMA version, whose semantics should be
			-- used by the Eiffel code analysis process
		do
			if ecma_flag.was_found then
				Result := ecma_367_latest
			end
		end

	is_silent: BOOLEAN
			-- Should gelint run in silent mode?
		do
			Result := silent_flag.was_found
		end

	is_no_benchmark: BOOLEAN
			-- Should no benchmark information be displayed?
			-- (default: display non-nested benchmark information)
		do
			Result := no_benchmark_flag.was_found
		end

	is_nested_benchmark: BOOLEAN
			-- Should nested benchmark information be displayed?
		do
			Result := nested_benchmark_flag.was_found
		end

	is_metrics: BOOLEAN
			-- Should metrics information be displayed?
		do
			Result := metrics_flag.was_found
		end

	is_verbose: BOOLEAN
			-- Should gelint run in verbose mode?
		do
			Result := verbose_flag.was_found
		end

	thread_count: INTEGER
			-- Number of threads to be used
		do
			Result := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32
			if thread_option.was_found then
				Result := thread_option.parameter
				if Result <= 0 then
					Result := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32 + Result
				end
			end
			if Result < 1 or not {PLATFORM}.is_thread_capable then
				Result := 1
			end
		ensure
			thread_count_not_negative: Result >= 1
		end

feature -- Argument parsing

	target_option: AP_STRING_OPTION
			-- Option for '--target=<target_name>'

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

	ecma_flag: AP_FLAG
			-- Flag for '--ecma'

	flat_flag: AP_FLAG
			-- Flag for '--flat'

	noflatdbc_flag: AP_FLAG
			-- Flag for '--noflatdbc'

	catcall_flag: AP_FLAG
			-- Flag for '--catcall'

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
		do
			create l_parser.make
			l_parser.set_application_description ("Gobo Eiffel Lint, Eiffel code analyzer.")
			l_parser.set_parameters_description ("ecf_filename")
				-- target.
			create target_option.make_with_long_form ("target")
			target_option.set_description ("Name of target to be used in ECF file. (default: last target in ECF file)")
			target_option.set_parameter_description ("target_name")
			l_parser.options.force_last (target_option)
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
				-- ecma.
			create ecma_flag.make_with_long_form ("ecma")
			ecma_flag.set_description ("Strictly follow the ECMA Eiffel standard during code analysis.")
			l_parser.options.force_last (ecma_flag)
				-- flat.
			create flat_flag.make_with_long_form ("flat")
			flat_flag.set_description ("Should the validity of inherited features be checked?")
			l_parser.options.force_last (flat_flag)
				-- noflatdbc.
			create noflatdbc_flag.make_with_long_form ("noflatdbc")
			noflatdbc_flag.set_description ("Should the validity of inherited pre- and postconditions be checked when a feature is redeclared?")
			l_parser.options.force_last (noflatdbc_flag)
				-- catcall.
			create catcall_flag.make_with_long_form ("catcall")
			catcall_flag.set_description ("Should possible CAT-call errors be reported, based on the statically computed dynamic type sets of each variables in the Eiffel code?")
			l_parser.options.force_last (catcall_flag)
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
			version_flag.set_description ("Print the version number of gelint and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_first (l_list)
				-- Parsing.
			l_parser.parse_array (a_args)
			if silent_flag.was_found then
				create {ET_NULL_ERROR_HANDLER} error_handler.make_null
			end
			if version_flag.was_found then
				report_version_number
				ecf_filename := ""
				exit_code := 40
			elseif l_parser.parameters.count /= 1 then
				report_usage_message (l_parser)
				ecf_filename := ""
				exit_code := 1
			else
				ecf_filename := l_parser.parameters.first
				set_ise_version (ise_option, l_parser)
				set_override_variables (variable_option, l_parser)
				set_override_settings (setting_option, l_parser)
				set_override_capabilities (capability_option, l_parser)
			end
		ensure
			target_option_not_void: target_option /= Void
			verbose_flag_not_void: verbose_flag /= Void
			no_benchmark_flag_not_void: no_benchmark_flag /= Void
			nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
			metrics_flag_not_void: metrics_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			ise_option_not_void: ise_option /= Void
			ecma_flag_not_void: ecma_flag /= Void
			flat_flag_not_void: flat_flag /= Void
			noflatdbc_flag_not_void: noflatdbc_flag /= Void
			catcall_flag_not_void: catcall_flag /= Void
			setting_option_not_void: setting_option /= Void
			capability_option_not_void: capability_option /= Void
			variable_option_not_void: variable_option /= Void
			thread_option_not_void: thread_option /= Void
			version_flag_not_void: version_flag /= Void
		end

	set_ise_version (a_option: like ise_option; a_parser: AP_PARSER)
			-- Set `ise_version' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_ise_version: detachable UT_VERSION
		do
			if not a_option.was_found then
				l_ise_version := Void
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
			ise_version := l_ise_version
		end

	set_override_settings (a_option: like setting_option; a_parser: AP_PARSER)
			-- Set `override_settings' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
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
			override_settings := l_override_settings
		end

	set_override_capabilities (a_option: like capability_option; a_parser: AP_PARSER)
			-- Set `override_capabilities' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
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
			override_capabilities := l_override_capabilities
		end

	set_override_variables (a_option: like variable_option; a_parser: AP_PARSER)
			-- Set `override_variables' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_override_variables: ET_ECF_VARIABLES
			l_definition: STRING
			l_index: INTEGER
			l_gobo_eiffel: detachable STRING
		do
			create l_override_variables.make
			l_gobo_eiffel := Execution_environment.variable_value ("GOBO_EIFFEL")
			if l_gobo_eiffel /= Void and then not l_gobo_eiffel.is_empty then
				l_override_variables.set_primary_value ("GOBO_EIFFEL", l_gobo_eiffel)
			else
				if ise_option.was_found then
					l_gobo_eiffel := "ise"
				else
					l_gobo_eiffel := "ge"
				end
				l_override_variables.set_primary_value ("GOBO_EIFFEL", l_gobo_eiffel)
				Execution_environment.set_variable_value ("GOBO_EIFFEL", l_gobo_eiffel)
			end
			if not a_option.parameters.is_empty then
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
			override_variables := l_override_variables
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	report_usage_message (a_parser: AP_PARSER)
			-- Report usage message.
		require
			a_parser_not_void: a_parser /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_parser.full_usage_instruction)
			error_handler.report_error (l_error)
		end

	exit_code: INTEGER
			-- Exit code

invariant

	error_handler_not_void: error_handler /= Void
	ecf_filename_not_void: ecf_filename /= Void
	target_option_not_void: target_option /= Void
	verbose_flag_not_void: verbose_flag /= Void
	no_benchmark_flag_not_void: no_benchmark_flag /= Void
	nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
	metrics_flag_not_void: metrics_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	ise_option_not_void: ise_option /= Void
	ecma_flag_not_void: ecma_flag /= Void
	flat_flag_not_void: flat_flag /= Void
	noflatdbc_flag_not_void: noflatdbc_flag /= Void
	catcall_flag_not_void: catcall_flag /= Void
	setting_option_not_void: setting_option /= Void
	capability_option_not_void: capability_option /= Void
	variable_option_not_void: variable_option /= Void
	thread_option_not_void: thread_option /= Void
	version_flag_not_void: version_flag /= Void

end
