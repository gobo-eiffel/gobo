note

	description:

		"Gobo Eiffel Test"

	copyright: "Copyright (c) 2000-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GETEST

inherit

	GETEST_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXECUTION_ENVIRONMENT

create

	execute

feature -- Processing

	execute
			-- Start 'getest' execution.
		local
			a_config: TS_CONFIG
			config_parser: TS_CONFIG_PARSER
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			Arguments.set_program_name ("getest")
			create variables.make
			create error_handler.make_standard
			read_command_line
			check postcondition_of_read_command_line: attached config_filename as l_config_filename then
				create a_file.make (l_config_filename)
				a_file.open_read
				if a_file.is_open_read then
					if must_generate then
						std.output.put_line ("Preparing Test Cases")
					elseif must_compile then
						std.output.put_line ("Compiling Test Cases")
					elseif must_execute then
						std.output.put_line ("Running Test Cases")
						std.output.put_new_line
					end
					create config_parser.make (variables, error_handler)
					config_parser.set_fail_on_rescue (fail_on_rescue)
					config_parser.set_compiler_ge (compiler_ge)
					config_parser.set_compiler_ise (compiler_ise)
					config_parser.parse (a_file)
					a_file.close
					a_config := config_parser.last_config
					if a_config /= Void then
						if attached compile_command as l_compile_command then
							a_config.set_compile (l_compile_command)
						end
						if attached class_regexp as l_class_regexp then
							a_config.set_class_regexp (l_class_regexp)
						end
						if attached feature_regexp as l_feature_regexp then
							a_config.set_feature_regexp (l_feature_regexp)
						end
						if default_test_included then
							a_config.set_default_test_included (default_test_included)
						end
						process (a_config)
						if error_handler.error_reported then
							Exceptions.die (1)
						end
					end
				else
					create cannot_read.make (l_config_filename)
					error_handler.report_error (cannot_read)
					Exceptions.die (1)
				end
			end
		end

	process (a_config: TS_CONFIG)
			-- Process `a_config'.
		require
			a_config_not_void: a_config /= Void
		do
			if must_generate then
				generate_test (a_config, False)
			end
			if must_compile then
				compile_test (a_config, must_generate)
			end
			if must_execute then
				run_test (a_config, must_generate or must_compile)
			end
		end

	generate_test (a_config: TS_CONFIG; need_header: BOOLEAN)
			-- Generate Eiffel classes.
		require
			a_config_not_void: a_config /= Void
		local
			testcases: TS_TESTCASES
			nb: INTEGER
		do
			if not error_handler.error_reported then
				if need_header then
					std.output.put_line ("Preparing Test Cases")
				end
				create testcases.make (a_config.testgen, error_handler)
				testcases.set_version (Version_number)
				a_config.process (testcases, error_handler)
				testcases.generate_test_classes
				testcases.generate_root_class (a_config.root_class)
				if is_verbose then
					nb := testcases.count
					std.output.put_string ("Generated ")
					std.output.put_integer (nb)
					std.output.put_string (" Test Case")
					if nb > 1 then
						std.output.put_character ('s')
					end
					std.output.put_new_line
				end
			end
		end

	compile_test (a_config: TS_CONFIG; need_header: BOOLEAN)
			-- Compile generated testcases.
		require
			a_config_not_void: a_config /= Void
		local
			a_command: DP_SHELL_COMMAND
			a_command_name: STRING
		do
			if not error_handler.error_reported then
				if need_header then
					std.output.put_line ("Compiling Test Cases")
				end
				a_command_name := a_config.compile
				if a_command_name.count > 0 then
					std.output.flush
					create a_command.make (a_command_name)
					a_command.execute
					if a_command.exit_code /= 0 then
						report_eiffel_compilation_error
					end
				end
			end
		end

	run_test (a_config: TS_CONFIG; need_header: BOOLEAN)
			-- Execute generated testcases.
		require
			a_config_not_void: a_config /= Void
		local
			a_command: DP_SHELL_COMMAND
			a_command_name: STRING
		do
			if not error_handler.error_reported then
				if need_header then
					std.output.put_line ("Running Test Cases")
					std.output.put_new_line
				end
				a_command_name := a_config.execute
				if a_command_name.count > 0 then
					std.output.flush
					create a_command.make (a_command_name)
					a_command.execute
					if a_command.exit_code /= 0 then
						Exceptions.die (1)
					end
				end
			end
		end

feature -- Access

	config_filename: detachable STRING
			-- Configuration filename

	compile_command: detachable STRING
			-- Compilation command-line given with
			-- the option --compile=...

	class_regexp: detachable LX_REGULAR_EXPRESSION
			-- Class regular expression given with
			-- the option --class=...

	feature_regexp: detachable LX_REGULAR_EXPRESSION
			-- Feature regular expression given with
			-- the option --feature=...

	default_test_included: BOOLEAN
			-- Whether 'default_test' should be included in
			-- generated testcases or not, as specified by the
			-- option --default

	variables: TS_VARIABLES
			-- Defined variables

	error_handler: TS_ERROR_HANDLER
			-- Error handler

feature -- Status report

	is_verbose: BOOLEAN
			-- Should getest run in verbose mode?

	must_generate: BOOLEAN
			-- Should the Eiffel classes be generated?

	must_compile: BOOLEAN
			-- Should the testcases be compiled?

	must_execute: BOOLEAN
			-- Should the testcases be executed?

	compiler_ge: BOOLEAN
	compiler_ise: BOOLEAN
			-- Compiler specified on the command-line
			-- (--ge or --ise)

	compiler_specified: BOOLEAN
			-- Has an Eiffel compiler been specified on the command-line?
			-- (--ge or --ise)
		do
			Result := (compiler_ge or compiler_ise)
		ensure
			definition: Result = (compiler_ge or compiler_ise)
		end

	fail_on_rescue: BOOLEAN
			-- Should the test application crash when an error occur?
			-- (By default test case errors are caught by a rescue
			-- clause and reported to the result summary, but during
			-- debugging it might be useful to get the full exception
			-- trace.)

feature {NONE} -- Command line

	read_command_line
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
			a_file: KL_TEXT_INPUT_FILE
			l_class_regexp: like class_regexp
			l_feature_regexp: like feature_regexp
		do
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("--version") or arg.is_equal ("-V") then
					report_version_number
				elseif arg.is_equal ("--help") or arg.is_equal ("-h") or arg.is_equal ("-?") then
					report_usage_message
				elseif arg.is_equal ("--verbose") or arg.is_equal ("-v") then
					is_verbose := True
				elseif arg.is_equal ("--ise") then
					if compiler_specified then
						report_usage_error
					else
						compiler_ise := True
					end
				elseif arg.is_equal ("--ge") then
					if compiler_specified then
						report_usage_error
					else
						compiler_ge := True
					end
				elseif arg.count >= 9 and then arg.substring (1, 9).is_equal ("--define=") then
					if arg.count > 9 then
						set_defined_variable (arg.substring (10, arg.count))
					else
						report_usage_error
					end
				elseif arg.is_equal ("-D") then
					i := i + 1
					if i <= nb then
						arg := Arguments.argument (i)
						set_defined_variable (arg)
					else
						report_usage_error
					end
				elseif arg.count >= 10 and then arg.substring (1, 10).is_equal ("--compile=") then
					if arg.count > 10 then
						compile_command := arg.substring (11, arg.count)
					else
						report_usage_error
					end
				elseif arg.count >= 8 and then arg.substring (1, 8).is_equal ("--class=") then
					if arg.count > 8 then
						arg := arg.substring (9, arg.count)
						create {LX_DFA_REGULAR_EXPRESSION} l_class_regexp.compile_case_insensitive (arg)
						if l_class_regexp.is_compiled then
							class_regexp := l_class_regexp
						else
							class_regexp := Void
							error_handler.report_option_regexp_syntax_error ("--class=", arg)
						end
					else
						report_usage_error
					end
				elseif arg.count >= 10 and then arg.substring (1, 10).is_equal ("--feature=") then
					if arg.count > 10 then
						arg := arg.substring (11, arg.count)
						create {LX_DFA_REGULAR_EXPRESSION} l_feature_regexp.compile_case_insensitive (arg)
						if l_feature_regexp.is_compiled then
							feature_regexp := l_feature_regexp
						else
							feature_regexp := Void
							error_handler.report_option_regexp_syntax_error ("--feature=", arg)
						end
					else
						report_usage_error
					end
				elseif arg.is_equal ("--default_test") then
					default_test_included := True
				elseif arg.is_equal ("-g") then
					must_generate := True
				elseif arg.is_equal ("-c") then
					must_compile := True
				elseif arg.is_equal ("-e") then
					must_execute := True
				elseif arg.is_equal ("-a") then
					fail_on_rescue := True
				elseif i = nb then
					if config_filename /= Void then
						report_usage_error
					else
						config_filename := arg
					end
				else
					report_usage_error
				end
				i := i + 1
			end
			if config_filename = Void then
				if compiler_ise then
					create a_file.make (ISE_config_filename)
					if a_file.exists then
						config_filename := ISE_config_filename
					end
				elseif compiler_ge then
					create a_file.make (GE_config_filename)
					if a_file.exists then
						config_filename := GE_config_filename
					end
				end
			end
			if config_filename = Void then
				create a_file.make (cfg_config_filename)
				if a_file.exists then
					config_filename := cfg_config_filename
				end
			end
			if config_filename = Void then
				config_filename := Execution_environment.variable_value (Getest_config_variable)
				if not attached config_filename as l_config_filename or else l_config_filename.count = 0 then
					report_undefined_environment_variable_error (Getest_config_variable)
					config_filename := ""
				end
			end
			if not (must_generate or must_compile or must_execute) then
				must_generate := True
				must_compile := True
				must_execute := True
			end
		ensure
			config_filename_not_void: config_filename /= Void
		end

	set_defined_variable (arg: STRING)
			-- Set variable defined in `arg' with format <name>[=<value>].
			-- Report usage error if invalid.
		require
			arg_not_void: arg /= Void
		local
			i: INTEGER
			a_name, a_value: STRING
		do
			i := arg.index_of ('=', 1)
			if i > 1 then
				if i < arg.count then
					a_name := arg.substring (1, i - 1)
					a_value := arg.substring (i + 1, arg.count)
					variables.set_value (a_name, a_value)
				elseif i = arg.count then
					a_name := arg.substring (1, i - 1)
					variables.set_value (a_name, "")
				else
					report_usage_error
				end
			elseif i = 1 then
				report_usage_error
			else
				a_name := arg
				variables.set_value (a_name, "")
			end
		end

feature {NONE} -- Error handling

	report_usage_error
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	report_undefined_environment_variable_error (a_variable: STRING)
			-- Report that environment variable `a_variable' is not
			-- defined and then terminate with exit status 1.
		require
			a_variable_not_void: a_variable /= Void
		local
			an_error: UT_UNDEFINED_ENVIRONMENT_VARIABLE_ERROR
		do
			create an_error.make (a_variable)
			error_handler.report_error (an_error)
			Exceptions.die (1)
		end

	report_eiffel_compilation_error
			-- Report that an Eiffel compilation error occurred
			-- and then terminate with exit status 3.
		do
			error_handler.report_eiffel_compilation_error
			Exceptions.die (3)
		end

	report_usage_message
			-- Report usage message and exit.
		do
			error_handler.report_info (Usage_message)
			Exceptions.die (0)
		end

	report_version_number
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Getest usage message
		once
			create Result.make ("[-aceghvV?][--help][--version][--verbose]%N%
				%%T[-D <name>=<value>|--define=<name>=<value>]*%N%
				%%T[--class=<regexp>][--feature=<regexp>][--default_test]%N%
				%%T[--compile=<command>][--ise|--ge|<filename>]")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Getest_config_variable: STRING = "GETEST_CONFIG"
			-- Environment variable

	ISE_config_filename: STRING = "getest.ise"
	GE_config_filename: STRING = "getest.ge"
	cfg_config_filename: STRING = "getest.cfg"
			-- Default configuration filenames

invariant

	error_handler_not_void: error_handler /= Void
	variables_not_void: variables /= Void
	compiled_class_regexp: attached class_regexp as l_class_regexp implies l_class_regexp.is_compiled
	compiled_feature_regexp: attached feature_regexp as l_feature_regexp implies l_feature_regexp.is_compiled

end
