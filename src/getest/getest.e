indexing

	description:

		"Gobo Eiffel Test"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GETEST

inherit

	GETEST_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_STANDARD_FILES
	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

creation

	execute

feature -- Processing

	execute is
			-- Start 'getest' execution.
		local
			a_config: TS_CONFIG
			config_parser: TS_CONFIG_PARSER
			a_file: like INPUT_STREAM_TYPE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
		do
			Arguments.set_program_name ("getest")
			!! error_handler.make_standard
			read_command_line
			a_file := INPUT_STREAM_.make_file_open_read (config_filename)
			if INPUT_STREAM_.is_open_read (a_file) then
				std.output.put_string ("Preparing Test Cases%N")
				!! config_parser.make (error_handler)
				config_parser.parse (a_file)
				INPUT_STREAM_.close (a_file)
				a_config := config_parser.last_config
				process (a_config)
				if error_handler.error_reported then
					Exceptions.die (1)
				end
			else
				!! cannot_read.make (config_filename)
				error_handler.report_error (cannot_read)
				Exceptions.die (1)
			end
		end

	read_command_line is
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
		do
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("--version") or arg.is_equal ("-V") then
					report_version_number
				elseif arg.is_equal ("--help") or arg.is_equal ("-h") or arg.is_equal ("-?") then
					report_usage_message
				elseif arg.is_equal ("--se") then
					if config_filename /= Void then
						report_usage_error
					else
						config_filename := SE_config_filename
					end
				elseif arg.is_equal ("--ise") then
					if config_filename /= Void then
						report_usage_error
					else
						config_filename := ISE_config_filename
					end
				elseif arg.is_equal ("--hact") then
					if config_filename /= Void then
						report_usage_error
					else
						config_filename := HACT_config_filename
					end
				elseif arg.is_equal ("--ve") then
					if config_filename /= Void then
						report_usage_error
					else
						config_filename := VE_config_filename
					end
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
				config_filename := Execution_environment.variable_value (Getest_config_variable)
				if config_filename = Void or else config_filename.count = 0 then
					report_undefined_environment_variable_error (Getest_config_variable)
				end
			end
		ensure
			config_filename_not_void: config_filename /= Void
		end

	process (a_config: TS_CONFIG) is
			-- Process `a_config'.
		require
			a_config_not_void: a_config /= Void
		do
			generate_test (a_config)
			compile_test (a_config)
			run_test (a_config)
		end

	generate_test (a_config: TS_CONFIG) is
			-- Generate Eiffel classes.
		require
			a_config_not_void: a_config /= Void
		local
			testcases: TS_TESTCASES
		do
			if not error_handler.error_reported then
				!! testcases.make (a_config.testgen, error_handler)
				a_config.process (testcases, error_handler)
				testcases.generate_test_classes
				testcases.generate_root_class (a_config.root_class)
			end
		end

	compile_test (a_config: TS_CONFIG) is
			-- Compile generated testcases.
		require
			a_config_not_void: a_config /= Void
		local
			a_command: UT_SHELL_COMMAND
			a_command_name: STRING
		do
			if not error_handler.error_reported then
				std.output.put_string ("Compiling Test Cases%N")
				a_command_name := a_config.compile
				if a_command_name.count > 0 then
					OUTPUT_STREAM_.flush (std.output)
					!! a_command.make (a_command_name)
					a_command.execute
				end
			end
		end

	run_test (a_config: TS_CONFIG) is
			-- Execute generated testcases.
		require
			a_config_not_void: a_config /= Void
		local
			a_command: UT_SHELL_COMMAND
			a_command_name: STRING
		do
			if not error_handler.error_reported then
				std.output.put_string ("Running Test Cases%N%N")
				a_command_name := a_config.execute
				if a_command_name.count > 0 then
					OUTPUT_STREAM_.flush (std.output)
					!! a_command.make (a_command_name)
					a_command.execute
				end
			end
		end

feature -- Access

	config_filename: STRING
			-- Configuration filename

	error_handler: TS_ERROR_HANDLER
			-- Error handler

feature {NONE} -- Error handling

	report_usage_error is
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	report_undefined_environment_variable_error (a_variable: STRING) is
			-- Report that environment variable `a_variable' is not
			-- defined and then terminate with exit status 1.
		require
			a_variable_not_void: a_variable /= Void
		local
			an_error: UT_UNDEFINED_ENVIRONMENT_VARIABLE_ERROR
		do
			!! an_error.make (a_variable)
			error_handler.report_error (an_error)
			Exceptions.die (1)
		end

	report_usage_message is
			-- Report usage message and exit.
		do
			error_handler.report_message (Usage_message)
			Exceptions.die (0)
		end

	report_version_number is
			-- Report version number and exit.
		local
			a_message: UT_VERSION_NUMBER
		do
			!! a_message.make (Version_number)
			error_handler.report_message (a_message)
			Exceptions.die (0)
		end

	Usage_message: UT_USAGE_MESSAGE is
			-- Getest usage message
		once
			!! Result.make ("[-hV?][--help][--version][--se|--ise|--hact|--ve|filename]")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Getest_config_variable: STRING is "GETEST_CONFIG"
			-- Environment variable

	HACT_config_filename: STRING is "getest.hact"
	ISE_config_filename: STRING is "getest.ise"
	SE_config_filename: STRING is "getest.se"
	VE_config_filename: STRING is "getest.ve"
			-- Default configuration filenames

invariant

	error_handler_not_void: error_handler /= Void

end -- class GETEST
