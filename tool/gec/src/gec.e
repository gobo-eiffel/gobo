note

	description:

		"Gobo Eiffel Compiler"

	copyright: "Copyright (c) 2005-2024, Eric Bezault and others"
	license: "MIT License"

class GEC

inherit

	GEC_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_STANDARD_FILES
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_FILE_SYSTEM
	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	UT_SHARED_ISE_VARIABLES
		export {NONE} all end

	UT_SHARED_GOBO_VARIABLES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start 'gec' execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
			Exceptions.die (exit_code)
		rescue
			if attached {EXCEPTIONS}.exception_trace as l_trace then
				std.error.put_string ({UTF_CONVERTER}.escaped_utf_32_string_to_utf_8_string_8 (l_trace))
			end
			Exceptions.die (4)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start 'gec' execution with arguments `a_args'.
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
			-- Start 'gec' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			Arguments.set_program_name ("gec")
				-- Set environment variables "$GOBO", "$GOBO_LIBRARY",
				-- "$BOEHM_GC" and "$ZIG" if not set yet.
			gobo_variables.set_gobo_variables
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			error_handler := a_error_handler
			parse_arguments (a_args)
			if exit_code = 0 and then not version_flag.was_found then
				a_filename := input_filename
				if file_system.has_extension (a_filename, file_system.eiffel_extension) then
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						parse_eiffel_file (a_file)
						a_file.close
						if override_root_type = Void then
							exit_code := 1
						end
					else
						report_cannot_read_error (a_filename)
						exit_code := 1
					end
					a_filename := file_system.nested_pathname ("${GOBO}", <<"library", "common", "config", "ecf", "default.ecf">>)
					a_filename := Execution_environment.interpreted_string (a_filename)
				end
				if exit_code = 0 then
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						last_system := Void
						parse_ecf_file (a_file)
						a_file.close
						if attached last_system as l_last_system then
							process_system (l_last_system)
							debug ("stop")
								std.output.put_line ("Press Enter...")
								std.input.read_character
							end
							if exit_code = 0 and error_handler.has_error then
								exit_code := 2
							end
						else
							exit_code := 3
						end
					else
						report_cannot_read_error (a_filename)
						exit_code := 1
					end
				end
			end
		rescue
			exit_code := 4
		end

feature -- Access

	last_system: detachable ET_SYSTEM
			-- Last Eiffel system parsed, if any

feature {NONE} -- Eiffel config file parsing

	parse_eiffel_file (a_file: KL_TEXT_INPUT_FILE)
			-- Read Eiffel file `a_file' containing the root class.
			-- Put result in `override_root_cluster_pathname',
			-- `override_root_type' and `override_root_creation'
			-- if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_system: ET_SYSTEM
			l_ast_factory: ET_AST_FACTORY
			l_system_processor: ET_SYSTEM_PROCESSOR
			l_cluster: ET_CLUSTER
			l_time_stamp: INTEGER
			l_parser: ET_EIFFEL_PARSER
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_class: ET_CLASS
			l_root_cluster_pathname: STRING
		do
			override_root_cluster_pathname := Void
			override_root_type := Void
			override_root_creation := Void
			create l_system.make ("system_name")
			create l_system_processor.make
			l_system_processor.set_ise_version (ise_version)
			create l_ast_factory.make
			l_system_processor.set_ast_factory (l_ast_factory)
			l_system_processor.set_error_handler (error_handler)
			l_root_cluster_pathname := file_system.absolute_pathname (file_system.dirname (a_file.name))
			create l_cluster.make ("root_cluster", l_root_cluster_pathname, l_system)
			create l_parser.make (l_system_processor)
			l_time_stamp := a_file.time_stamp
			l_parser.parse_file (a_file, a_file.name, l_time_stamp, l_cluster)
			if not l_parser.syntax_error then
				create l_classes.make (1)
				l_system.classes_do_if_recursive (agent l_classes.force_last, agent {ET_CLASS}.is_parsed)
				if l_classes.is_empty then
						-- Internal error: No class found.
						-- At syntax error should already have been reported.
				else
						-- Use the first class in the file.
					l_class := l_classes.first
					override_root_cluster_pathname := l_root_cluster_pathname
					override_root_type := l_class.name
					if not attached l_class.creators as l_creators or else l_creators.is_empty then
						override_root_creation := tokens.default_create_feature_name
					elseif l_creators.first.is_empty then
						override_root_creation := tokens.default_create_feature_name
					else
							-- Use the first creation procedure.
						override_root_creation := l_creators.first.feature_name (1)
					end
				end
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_ecf_system: ET_ECF_SYSTEM
			l_target: ET_ECF_TARGET
			l_value: STRING
			l_root_cluster: ET_ECF_CLUSTER
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
			l_ecf_parser.parse_file (a_file, target_name)
			if not l_ecf_error_handler.has_error then
				l_ecf_system := l_ecf_parser.last_system
				if l_ecf_system /= Void then
					l_target := l_ecf_system.selected_target
					if l_target /= Void then
						if attached override_root_cluster_pathname as l_override_root_cluster_pathname then
							create l_root_cluster.make ("root_cluster", l_override_root_cluster_pathname, l_ecf_system, l_target)
							l_ecf_system.clusters.put_last (l_root_cluster)
						end
						if attached override_root_type as l_override_root_type then
							l_ecf_system.set_root_type (l_override_root_type)
							l_ecf_system.set_system_name (l_override_root_type.lower_name)
						end
						if attached override_root_creation as l_override_root_creation then
							l_ecf_system.set_root_creation (l_override_root_creation)
						end
						l_value := l_target.variables.value ("gelint")
						if l_value /= Void and then l_value.is_boolean then
							ecf_gelint_option := l_value.to_boolean
						end
						l_value := l_target.variables.value ("scoop_exceptions")
						if l_value /= Void and then not l_value.is_empty then
							ecf_scoop_exceptions_option := l_value
						end
					end
					last_system := l_ecf_system
				end
			end
		end

	ecf_gelint_option: BOOLEAN
			-- Same as command-line option --gelint, but specified from the ECF file

	ecf_scoop_exceptions_option: detachable STRING
			-- Indicate what to do when a SCOOP region becomes dirty after an unhandled exception.
			-- default: same as in the SCOOP specification.
			-- stop_when_dirty: the application should stop when a SCOOP region becomes dirty after an unhandled exception.

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_system: ET_DYNAMIC_SYSTEM
			l_system_processor: ET_SYSTEM_PROCESSOR
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_thread_count: INTEGER
			dt_total: detachable DT_DATE_TIME
		do
			error_handler.set_ise
			error_handler.set_verbose (is_verbose)
			l_thread_count := thread_count
			l_system_processor := {ET_SYSTEM_PROCESSOR_FACTORY}.new_system_processor (l_thread_count)
			l_system_processor.set_error_handler (error_handler)
			l_system_processor.set_ise_version (ise_version)
			l_system_processor.set_benchmark_shown (not is_no_benchmark and not is_silent)
			l_system_processor.set_nested_benchmark_shown (is_nested_benchmark and not is_no_benchmark and not is_silent)
			l_system_processor.set_metrics_shown (is_metrics and not is_silent)
			dt_total := l_system_processor.benchmark_start_time
			if is_gelint then
				l_system_processor.set_flat_mode (True)
				l_system_processor.set_flat_dbc_mode (True)
			end
			create l_system.make (a_system, l_system_processor)
			if is_gelint or l_thread_count > 1 or l_system_processor.benchmark_shown or l_system_processor.nested_benchmark_shown then
				l_system.set_full_class_checking (True)
			end
			l_system.set_catcall_error_mode (catcall_error_mode)
			l_system.set_catcall_warning_mode (catcall_warning_mode)
			l_system.set_new_instance_types (new_instance_types)
			create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} l_builder.make (l_system, l_system_processor)
			l_system.set_dynamic_type_set_builder (l_builder)
			l_system.compile (l_system_processor)
			if not attached a_system.root_type as l_root_type then
				-- Do nothing.
			elseif l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) then
				-- Do nothing.
			elseif l_system.has_fatal_error then
				exit_code := 1
			else
				compile_degree_minus_3 (l_system, l_system_processor)
				if exit_code = 0 and not no_c_compile then
					compile_c_code (a_system, l_system_processor)
				end
			end
			l_system_processor.record_end_time (dt_total, "Total Time")
		end

	compile_degree_minus_3 (a_system: ET_DYNAMIC_SYSTEM; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Generate C code.
		require
			a_system_not_void: a_system /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_current_system: ET_SYSTEM
			l_system_name: STRING
			l_generator: ET_C_GENERATOR
			dt1: detachable DT_DATE_TIME
		do
			dt1 := a_system_processor.benchmark_start_time
			create l_generator.make (a_system, a_system_processor)
			if gc_option.was_found or use_boehm_gc then
					-- Override any option that might have been specified
					-- in the Eiffel config file.
				l_generator.set_use_boehm_gc (use_boehm_gc)
			end
			l_generator.set_scoop_exceptions_stop_when_dirty (scoop_exceptions_stop_when_dirty)
			l_generator.set_finalize_mode (is_finalize)
			l_generator.set_split_mode (not no_split)
			if split_size > 0 then
				l_generator.set_split_threshold (split_size)
			end
			l_current_system := a_system.current_system
			if attached l_current_system.executable_name as l_name then
				l_system_name := l_name
			elseif attached l_current_system.system_name as l_name then
				l_system_name := l_name
			elseif attached l_current_system.root_type as l_root_type then
				l_system_name := l_root_type.base_class.lower_name
			else
				l_system_name := "unknown"
			end
			l_generator.generate (l_system_name)
			if is_metrics and not is_silent then
				error_handler.info_file.put_string ("Type count: ")
				error_handler.info_file.put_integer (a_system.dynamic_types.count)
				error_handler.info_file.put_new_line
				error_handler.info_file.put_string ("Alive type count: ")
				error_handler.info_file.put_integer (a_system.alive_dynamic_type_count)
				error_handler.info_file.put_new_line
				error_handler.info_file.put_string ("Feature count: ")
				error_handler.info_file.put_integer (a_system.dynamic_feature_count)
				error_handler.info_file.put_new_line
				error_handler.info_file.put_string ("Dynamic type set count: ")
				error_handler.info_file.put_integer (a_system.dynamic_type_set_builder.dynamic_type_set_count)
				error_handler.info_file.put_new_line
				error_handler.info_file.put_string ("Never void targets: ")
				error_handler.info_file.put_integer (l_generator.never_void_target_count)
				error_handler.info_file.put_new_line
				error_handler.info_file.put_string ("Can be void targets: ")
				error_handler.info_file.put_integer (l_generator.can_be_void_target_count)
				error_handler.info_file.put_new_line
			end
			if l_generator.has_fatal_error then
				exit_code := 1
			end
			a_system_processor.record_end_time (dt1, "Degree -3")
		end

	compile_c_code (a_system: ET_SYSTEM; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Compile generated C code.
		require
			a_system_not_void: a_system /= Void
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_system_name: STRING
			l_command: KL_SHELL_COMMAND
			l_script_filename: STRING
			l_executable_filename: STRING
			l_gecc: GECC
			l_exit_code: INTEGER
			dt1: detachable DT_DATE_TIME
			l_gecc_pathname: STRING
		do
			dt1 := a_system_processor.benchmark_start_time
			if attached a_system.executable_name as l_name then
				l_system_name := l_name
			elseif attached a_system.system_name as l_name then
				l_system_name := l_name
			elseif attached a_system.root_type as l_root_type then
				l_system_name := l_root_type.base_class.lower_name
			else
				l_system_name := "unknown"
			end
			if operating_system.is_windows then
				l_script_filename := l_system_name + ".bat"
			else
				l_script_filename := l_system_name + ".sh"
			end
			file_system.cd (c_folder)
			if c_compile_using_script then
				create l_command.make (file_system.absolute_pathname (l_script_filename))
				l_command.execute
				l_exit_code := l_command.exit_code
			elseif c_compile_using_gecc then
				l_gecc_pathname := {UT_GOBO_VARIABLES}.executable_pathname ("gecc")
				create l_command.make (l_gecc_pathname + " --thread=" + thread_count.out + " " + l_script_filename)
				l_command.execute
				l_exit_code := l_command.exit_code
			elseif {PLATFORM}.is_thread_capable then
				create l_gecc.execute_with_arguments (<<"--thread=" + thread_count.out, l_script_filename>>)
				l_exit_code := l_gecc.exit_code
			else
				create l_gecc.execute_with_arguments (<<l_script_filename>>)
				l_exit_code := l_gecc.exit_code
			end
			file_system.cd (file_system.relative_parent_directory)
			l_executable_filename := l_system_name + file_system.exe_extension
			file_system.rename_file (file_system.pathname (c_folder, l_executable_filename), l_executable_filename)
			if l_exit_code /= 0 then
				exit_code := 1
			end
				-- Add a "%R" to erase any message left from Zig.
			a_system_processor.record_end_time (dt1, "%RDegree -4")
		end

feature -- Arguments

	input_filename: STRING
			-- Name of the ECF or Eiffel file

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

	override_root_type: detachable ET_CLASS_NAME
			-- Root type to be used instead of the one specified in the selected ECF target

	override_root_creation: detachable ET_FEATURE_NAME
			-- Root creation to be used instead of the one specified in the selected ECF target

	override_root_cluster_pathname: detachable STRING
			-- Pathname of cluster containing `override_root_type'

	is_finalize: BOOLEAN
			-- Compilation with optimizations turned on?
		do
			Result := finalize_flag.was_found
		end

	is_gelint: BOOLEAN
			-- Should gelint be run on the full content of each class being compiled?
		do
			Result := gelint_flag.was_found or ecf_gelint_option
		end

	scoop_exceptions_stop_when_dirty: BOOLEAN
			-- Should the application stop when a SCOOP region becomes dirty after an unhandled exception?
		do
			Result := attached ecf_scoop_exceptions_option as l_ecf_scoop_exceptions_option and then
				l_ecf_scoop_exceptions_option.as_lower.same_string ("stop_when_dirty")
		end

	ise_version: UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

	catcall_error_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?
		do
			Result := catcall_option.was_found and then attached catcall_option.parameter as l_parameter and then STRING_.same_string (l_parameter, "error")
		end

	catcall_warning_mode: BOOLEAN
			-- Are CAT-call errors considered just as warnings?
		do
			Result := catcall_option.was_found and then attached catcall_option.parameter as l_parameter and then STRING_.same_string (l_parameter, "warning")
		end

	new_instance_types: detachable DS_HASH_SET [STRING]
			-- Name of the types which can have instances created by 'TYPE.new_instance'
			-- or 'TYPE.new_special_any_instance'
			--
			-- Use all non-deferred, non-NONE, alive types if no types have been specified.

	no_c_compile: BOOLEAN
			-- Should the back-end C compiler not be invoked on the generated C code?
		do
			Result := c_compile_option.was_found and then attached c_compile_option.parameter as l_parameter and then STRING_.same_string (l_parameter, "no")
		end

	c_compile_using_gecc: BOOLEAN
			-- Should the back-end C compiler be invoked on the generated C code using 'gecc'?
		do
			Result := c_compile_option.was_found and then attached c_compile_option.parameter as l_parameter and then STRING_.same_string (l_parameter, "gecc")
		end

	c_compile_using_script: BOOLEAN
			-- Should the back-end C compiler be invoked on the generated C code using a script?
		do
			Result := c_compile_option.was_found and then attached c_compile_option.parameter as l_parameter and then STRING_.same_string (l_parameter, "script")
		end

	no_split: BOOLEAN
			-- Should C code be generated into a single file?
		do
			Result := split_option.was_found and then not split_option.parameter
		end

	split_size: INTEGER
			-- Size (in bytes) of generated C files in bytes when in split mode

	use_boehm_gc: BOOLEAN
			-- Should the application be compiled with the Boehm GC?
		do
			if attached Execution_environment.variable_value (gobo_cli_gc_variable_name) as l_variable_value then
				Result := STRING_.same_string (l_variable_value, "boehm")
			elseif gc_option.was_found and then attached gc_option.parameter as l_parameter then
				Result := STRING_.same_string (l_parameter, "boehm")
			elseif attached Execution_environment.variable_value (gobo_default_gc_variable_name) as l_variable_value then
				Result := STRING_.same_string (l_variable_value, "boehm")
			else
				Result := attached gobo_variables.boehm_gc_value as l_boehm_gc and then not l_boehm_gc.is_empty
			end
		end

	thread_count: INTEGER
			-- Number of threads to be used
		do
			Result := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32 - 3
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

	is_silent: BOOLEAN
			-- Should gec run in silent mode?
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
			-- Should gec run in verbose mode?
		do
			Result := verbose_flag.was_found
		end

feature -- Argument parsing

	target_option: AP_STRING_OPTION
			-- Option for '--target=<target_name>'

	setting_option: AP_STRING_OPTION
			-- Option for '--setting=name=value'

	capability_option: AP_STRING_OPTION
			-- Option for '--capability=name=value'

	variable_option: AP_STRING_OPTION
			-- Option for '--variable=FOO=BAR'

	catcall_option: AP_ENUMERATION_OPTION
			-- Option for '--catcall=<no|error|warning>'

	finalize_flag: AP_FLAG
			-- Flag for '--finalize'

	gelint_flag: AP_FLAG
			-- Flag for '--gelint'

	ise_option: AP_STRING_OPTION
			-- Option for '--ise=major[.minor[.revision[.build]]]'

	c_compile_option: AP_ENUMERATION_OPTION
			-- Option for '--cc=<no|script|gecc>'

	split_option: AP_BOOLEAN_OPTION
			-- Option for '--split=<no|yes>'

	split_size_option: AP_INTEGER_OPTION
			-- Option for '--split-size=<size>'

	gc_option: AP_ENUMERATION_OPTION
			-- Option for '--gc=<no|boehm>'

	new_instance_types_option: AP_STRING_OPTION
			-- Option for '--new-instance-types=<filename>'

	thread_option: AP_INTEGER_OPTION
			-- Option for '--thread=<thread_count>'

	nested_benchmark_flag: AP_FLAG
			-- Flag for '--nested-benchmark'

	no_benchmark_flag: AP_FLAG
			-- Flag for '--no-benchmark'

	metrics_flag: AP_FLAG
			-- Flag for '--metrics'

	silent_flag: AP_FLAG
			-- Flag for '--silent'

	verbose_flag: AP_FLAG
			-- Flag for '--verbose'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments (a_args: ARRAY [STRING])
			-- Initialize options and parse arguments `a_args'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			a_parser: AP_PARSER
			a_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create a_parser.make
			a_parser.set_application_description ("Gobo Eiffel Compiler, translate Eiffel programs into executables.")
			a_parser.set_parameters_description ("eiffel_filename|ecf_filename")
				-- target.
			create target_option.make_with_long_form ("target")
			target_option.set_description ("Name of target to be used in ECF file. (default: last target in ECF file)")
			target_option.set_parameter_description ("target_name")
			a_parser.options.force_last (target_option)
				-- setting.
			create setting_option.make_with_long_form ("setting")
			setting_option.set_description ("Override settings defined in ECF file.")
			setting_option.set_parameter_description ("name=value")
			a_parser.options.force_last (setting_option)
				-- capability.
			create capability_option.make_with_long_form ("capability")
			capability_option.set_description ("Override capability usage defined in ECF file.")
			capability_option.set_parameter_description ("name=value")
			a_parser.options.force_last (capability_option)
				-- variable.
			create variable_option.make_with_long_form ("variable")
			variable_option.set_description ("Override variables defined in ECF file.")
			variable_option.set_parameter_description ("NAME=VALUE")
			a_parser.options.force_last (variable_option)
				-- finalize.
			create finalize_flag.make_with_long_form ("finalize")
			finalize_flag.set_description ("Compile with optimizations turned on.")
			a_parser.options.force_last (finalize_flag)
				-- gelint.
			create gelint_flag.make_with_long_form ("gelint")
			gelint_flag.set_description ("Run gelint on the full content of each class being compiled.")
			a_parser.options.force_last (gelint_flag)
				-- ise.
			create ise_option.make_with_long_form ("ise")
			ise_option.set_description ("Version of Eiffel whose semantics should be used during code analysis. (default: latest version)")
			ise_option.set_parameter_description ("major[.minor[.revision[.build]]]")
			ise_option.set_default_parameter (ise_latest.out)
			a_parser.options.force_last (ise_option)
				-- catcall
			create catcall_option.make_with_long_form ("catcall")
			catcall_option.set_description ("Should CAT-call errors be considered as fatal errors, as warnings, or just ignored? (default: ignored)")
			catcall_option.extend ("no")
			catcall_option.extend ("error")
			catcall_option.extend ("warning")
			catcall_option.set_parameter_description ("no|error|warning")
			a_parser.options.force_last (catcall_option)
				-- cc
			create c_compile_option.make_with_long_form ("cc")
			c_compile_option.set_description ("Should the back-end C compiler be invoked on the generated C code, and if yes with what method? (default: gecc, built-in)")
			c_compile_option.extend ("no")
			c_compile_option.extend ("script")
			c_compile_option.extend ("gecc")
			c_compile_option.set_parameter_description ("no|script|gecc")
			a_parser.options.force_last (c_compile_option)
				-- split
			create split_option.make_with_long_form ("split")
			split_option.set_description ("Should generated C code be split over several C files instead of being held in a single possibly large C file? (default: yes)")
			split_option.set_parameter_description ("no|yes")
			a_parser.options.force_last (split_option)
				-- split-size
			create split_size_option.make_with_long_form ("split-size")
			split_size_option.set_description ("Size of generated C files in bytes when in split mode. (default: 2,500,000)")
			split_size_option.set_parameter_description ("size")
			a_parser.options.force_last (split_size_option)
				-- new-instance-types
			create new_instance_types_option.make_with_long_form ("new-instance-types")
			new_instance_types_option.set_description ("File containing the list of types which can have instances created by 'TYPE.new_instance' or 'TYPE.new_special_any_instance'. (default: use all non-deferred, non-NONE, alive types)")
			new_instance_types_option.set_parameter_description ("filename")
			a_parser.options.force_last (new_instance_types_option)
				-- gc
			create gc_option.make_with_long_form ("gc")
			gc_option.set_description ("Which garbage collector should the application be compiled with? (default: boehm if available, no otherwise)")
			gc_option.extend ("no")
			gc_option.extend ("boehm")
			gc_option.set_parameter_description ("no|boehm")
			a_parser.options.force_last (gc_option)
				-- thread
			create thread_option.make_with_long_form ("thread")
			thread_option.set_description ("Number of threads to be used. Negative numbers -N mean %"number of CPUs - N%". (default: -3)")
			thread_option.set_parameter_description ("thread_count")
			if {PLATFORM}.is_thread_capable then
				a_parser.options.force_last (thread_option)
			end
				-- silent
			create silent_flag.make_with_long_form ("silent")
			silent_flag.set_description ("Run gec in silent mode.")
			a_parser.options.force_last (silent_flag)
				-- no-benchmark.
			create no_benchmark_flag.make_with_long_form ("no-benchmark")
			no_benchmark_flag.set_description ("Should no benchmark information be displayed? (default: display non-nested benchmark information)")
			a_parser.options.force_last (no_benchmark_flag)
				-- nested-benchmark.
			create nested_benchmark_flag.make_with_long_form ("nested-benchmark")
			nested_benchmark_flag.set_description ("Should nested benchmark information be displayed?")
			a_parser.options.force_last (nested_benchmark_flag)
				-- metrics.
			create metrics_flag.make_with_long_form ("metrics")
			metrics_flag.set_description ("Should metrics information be displayed?")
			a_parser.options.force_last (metrics_flag)
				-- verbose
			create verbose_flag.make_with_long_form ("verbose")
			verbose_flag.set_description ("Run gec in verbose mode.")
			a_parser.options.force_last (verbose_flag)
				-- version
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gec and exit.")
			create a_list.make (version_flag)
			a_list.force_last (verbose_flag)
			a_parser.alternative_options_lists.force_last (a_list)
				-- Parsing.
			a_parser.parse_array (a_args)
			if silent_flag.was_found then
				create {ET_NULL_ERROR_HANDLER} error_handler.make_null
			end
			if version_flag.was_found then
				report_version_number
				input_filename := ""
				ise_version := ise_latest
				exit_code := 0
			elseif a_parser.parameters.count /= 1 then
				report_usage_message (a_parser)
				input_filename := ""
				ise_version := ise_latest
				exit_code := 1
			else
				input_filename := a_parser.parameters.first
				set_ise_version (ise_option, a_parser)
				set_override_settings (setting_option, a_parser)
				set_override_capabilities (capability_option, a_parser)
				set_override_variables (variable_option, a_parser)
				set_split_size (split_size_option, a_parser)
				set_new_instance_types (new_instance_types_option, a_parser)
			end
		ensure
			input_filename_not_void: input_filename /= Void
			target_option_not_void: target_option /= Void
			setting_option_not_void: setting_option /= Void
			capability_option_not_void: capability_option /= Void
			variable_option_not_void: variable_option /= Void
			catcall_option_not_void: catcall_option /= Void
			finalize_flag_not_void: finalize_flag /= Void
			silent_flag_not_void: silent_flag /= Void
			no_benchmark_flag_not_void: no_benchmark_flag /= Void
			nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
			metrics_flag_not_void: metrics_flag /= Void
			verbose_flag_not_void: verbose_flag /= Void
			version_flag_not_void: version_flag /= Void
			c_compile_option_not_void: c_compile_option /= Void
			split_option_not_void: split_option /= Void
			split_size_option_not_void: split_size_option /= Void
			gc_option_not_void: gc_option /= Void
			thread_option_not_void: thread_option /= Void
			new_instance_types_option_not_void: new_instance_types_option /= Void
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
			l_ise_version := ise_latest
			if not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				exit_code := 1
			elseif not STRING_.same_string (l_parameter, ise_latest.out) then
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
			l_gobo_cli_setting_variable_value: detachable STRING
			l_gobo_default_setting_variable_value: detachable STRING
			l_splitter: ST_SPLITTER
		do
			if attached Execution_environment.variable_value (gobo_default_setting_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_default_setting_variable_value := l_variable_value
			end
			if attached Execution_environment.variable_value (gobo_cli_setting_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_cli_setting_variable_value := l_variable_value
			end
			if not a_option.parameters.is_empty or is_finalize or l_gobo_default_setting_variable_value /= Void or l_gobo_cli_setting_variable_value /= Void then
				create l_override_settings.make
				if l_gobo_default_setting_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_settings.set_primary_values_from_definitions (l_splitter.split (l_gobo_default_setting_variable_value))
				end
				l_override_settings.set_primary_values_from_definitions (a_option.parameters)
				if l_gobo_cli_setting_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_settings.set_primary_values_from_definitions (l_splitter.split (l_gobo_cli_setting_variable_value))
				end
				if is_finalize then
					l_override_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.finalize_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
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
			l_gobo_cli_capability_variable_value: detachable STRING
			l_gobo_default_capability_variable_value: detachable STRING
			l_splitter: ST_SPLITTER
		do
			if attached Execution_environment.variable_value (gobo_default_capability_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_default_capability_variable_value := l_variable_value
			end
			if attached Execution_environment.variable_value (gobo_cli_capability_variable_name) as l_variable_value and then not l_variable_value.is_empty then
				l_gobo_cli_capability_variable_value := l_variable_value
			end
			if not a_option.parameters.is_empty or l_gobo_default_capability_variable_value /= Void or l_gobo_cli_capability_variable_value /= Void then
				create l_override_capabilities.make
				if l_gobo_default_capability_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_capabilities.set_primary_use_values_from_definitions (l_splitter.split (l_gobo_default_capability_variable_value))
				end
				l_override_capabilities.set_primary_use_values_from_definitions (a_option.parameters)
				if l_gobo_cli_capability_variable_value /= Void then
					create l_splitter.make_with_separators (", ")
					l_override_capabilities.set_primary_use_values_from_definitions (l_splitter.split (l_gobo_cli_capability_variable_value))
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
		do
			create l_override_variables.make
			l_override_variables.set_primary_value ("GOBO_EIFFEL", "ge")
			Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
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

	set_split_size (a_option: like split_size_option; a_parser: AP_PARSER)
			-- Set `split_size' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_error: AP_ERROR
		do
			if a_option.was_found then
				if a_option.parameter > 0 then
					split_size := a_option.parameter
				else
					create l_error.make_invalid_parameter_error (a_option, a_option.parameter.out)
					error_handler.report_error (l_error)
					exit_code := 1
				end
			end
		end

	set_new_instance_types (a_option: like new_instance_types_option; a_parser: AP_PARSER)
			-- Set `new_instance_types' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_new_instance_types: DS_HASH_SET [STRING]
			l_file: KL_TEXT_INPUT_FILE
			s: STRING
		do
			if a_option.was_found and then attached a_option.parameter as l_filename then
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					create l_new_instance_types.make_equal (100)
					new_instance_types := l_new_instance_types
					from
						l_file.read_line
					until
						l_file.end_of_file
					loop
						s := l_file.last_string.twin
						s.adjust
						if not s.is_empty and not s.starts_with ("--") then
							l_new_instance_types.force (s)
						end
						l_file.read_line
					end
					l_file.close
				else
					report_cannot_read_error (l_filename)
					exit_code := 1
				end
			end
		end

feature {NONE} -- Environment variables

	gobo_cli_setting_variable_name: STRING = "GOBO_CLI_SETTING"
			-- Environment variable name to specify settings
			-- as if they were specified with the command-line
			-- argument '--setting'.

	gobo_default_setting_variable_name: STRING = "GOBO_DEFAULT_SETTING"
			-- Environment variable name to specify settings
			-- which are not overridden with the command-line
			-- argument '--setting'.

	gobo_cli_capability_variable_name: STRING = "GOBO_CLI_CAPABILITY"
			-- Environment variable name to specify capabilities
			-- as if they were specified with the command-line
			-- argument '--capability'.

	gobo_default_capability_variable_name: STRING = "GOBO_DEFAULT_CAPABILITY"
			-- Environment variable name to specify capabilities
			-- which are not overridden with the command-line
			-- argument '--capability'.

	gobo_cli_gc_variable_name: STRING = "GOBO_CLI_GC"
			-- Environment variable name to specify the GC to
			-- be used as if it was specified with the command-line
			-- argument '--gc'.

	gobo_default_gc_variable_name: STRING = "GOBO_DEFAULT_GC"
			-- Environment variable name to specify the GC to
			-- be used if not overridden with the command-line
			-- argument '--gc'.

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
			l_text: STRING
			l_count: INTEGER
		do
			if is_verbose then
				create l_text.make (100)
				l_text.append_string (Version_number)
				l_text.append_string ("%Nexecutable: ")
				l_text.append_string ({KL_EXECUTION_ENVIRONMENT}.current_executable_pathname)
				l_text.append_string ("%N$GOBO: ")
				if attached {UT_GOBO_VARIABLES}.gobo_value as l_gobo then
					l_text.append_string (l_gobo)
				end
				l_text.append_string ("%Nthreads: ")
				l_count := thread_count
				l_text.append_integer (l_count)
				l_text.append_string (" thread")
				if l_count > 1 then
					l_text.append_character ('s')
				end
				l_text.append_string (" used on ")
				l_count := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32
				l_text.append_integer (l_count)
				l_text.append_string (" available CPU")
				if l_count > 1 then
					l_text.append_character ('s')
				end
			else
				l_text := Version_number
			end
			create a_message.make (l_text)
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

feature -- C generation

	c_folder: STRING = ".gobo"
			-- Folder containing then generated C files

invariant

	error_handler_not_void: error_handler /= Void
	input_filename_not_void: input_filename /= Void
	ise_version_not_void: ise_version /= Void
	target_option_not_void: target_option /= Void
	setting_option_not_void: setting_option /= Void
	capability_option_not_void: capability_option /= Void
	variable_option_not_void: variable_option /= Void
	catcall_option_not_void: catcall_option /= Void
	gelint_flag_not_void: gelint_flag /= Void
	ise_option_not_void: ise_option /= Void
	finalize_flag_not_void: finalize_flag /= Void
	silent_flag_not_void: silent_flag /= Void
	no_benchmark_flag_not_void: no_benchmark_flag /= Void
	nested_benchmark_flag_not_void: nested_benchmark_flag /= Void
	metrics_flag_not_void: metrics_flag /= Void
	verbose_flag_not_void: verbose_flag /= Void
	version_flag_not_void: version_flag /= Void
	c_compile_option_not_void: c_compile_option /= Void
	split_option_not_void: split_option /= Void
	split_size_option_not_void: split_size_option /= Void
	new_instance_types_option_not_void: new_instance_types_option /= Void
	gc_option_not_void: gc_option /= Void
	thread_option_not_void: thread_option /= Void

end
