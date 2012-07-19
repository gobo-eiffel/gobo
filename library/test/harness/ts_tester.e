note

	description:

		"Testers: test harness to execute registered test cases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/12/24 $"
	revision: "$Revision: #13 $"

class TS_TESTER

inherit

	ANY
			-- Export features of ANY.

	KL_SHARED_ARGUMENTS

	KL_SHARED_EXCEPTIONS

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

create

	make_default,
	make

feature {NONE} -- Initialization

	make_default
			-- Create a new tester.
		do
			create error_handler.make_standard
			create variables.make
		end

	make
			-- Create a new tester, read command-line options and execute the tests.
			-- This is meant to be the root creation procedure of a test harness
			-- application. The application will be exited with different exit codes
			-- when errors occur. Use `make_default' instead when this created tester
			-- is not meant to be the root of a test harness application.
		do
			exit_on_error := True
			make_default
			read_command_line
			build_suite
			execute
		end

feature -- Access

	suite: TS_TEST_SUITE
			-- Suite of tests to be run
		do
			if internal_suite = Void then
				create internal_suite.make (generator.as_lower, variables)
			end
			Result := internal_suite
		ensure
			suite_not_void: Result /= Void
		end

	variables: TS_VARIABLES
			-- Defined variables (to be passed to the test cases)

	output_filename: STRING
			-- Output filename where messages and summary about
			-- the tests will be printed
			-- (Use standard output when not specified.)

	error_handler: UT_ERROR_HANDLER
			-- Error handler

feature -- Status report

	fail_on_rescue: BOOLEAN
			-- Should the test application crash when an error occur?
			-- (By default test case errors are caught by a rescue
			-- clause and reported to the result summary, but during
			-- debugging it might be useful to get the full exception
			-- trace.)

	progress_status: BOOLEAN
			-- Should progress status be printed while
			-- executing the test cases?

	exit_on_error: BOOLEAN
			-- Should the application exit (with the appropriate error code)
			-- when an error occur?
			-- (Useful when the current tester is root of a test harness
			-- application, otherwise return False.)

	enabled_test_cases: RX_REGULAR_EXPRESSION
			-- Only test cases whose name matches this regexp will
			-- be executed, or execute all test cases is Void

	disabled_test_cases: RX_REGULAR_EXPRESSION
			-- Test cases whose name does not match this regexp will
			-- not be executed

	success_output_filename: STRING
			-- Name of file where to print the name of tests
			-- when successfully executed

feature -- Status setting

	set_fail_on_rescue (b: BOOLEAN)
			-- Set `fail_on_rescue' to `b'.
		do
			fail_on_rescue := b
		ensure
			fail_on_rescue_set: fail_on_rescue = b
		end

	set_progress_status (b: BOOLEAN)
			-- Set `progress_status' to `b'.
		do
			progress_status := b
		ensure
			progress_status_set: progress_status = b
		end

	set_enabled_test_cases (a_regexp: like enabled_test_cases)
			-- Set `enabled_test_cases' to `a_regexp'.
		require
			compiled: a_regexp /= Void implies a_regexp.is_compiled
		do
			enabled_test_cases := a_regexp
		ensure
			enabled_test_cases_set: enabled_test_cases = a_regexp
		end

	set_disabled_test_cases (a_regexp: like disabled_test_cases)
			-- Set `disabled_test_cases' to `a_regexp'.
		require
			compiled: a_regexp /= Void implies a_regexp.is_compiled
		do
			disabled_test_cases := a_regexp
		ensure
			disabled_test_cases_set: disabled_test_cases = a_regexp
		end

	set_success_output_filename (a_filename: like success_output_filename)
			-- Set `success_output_filename' to `a_filename'.
		do
			success_output_filename := a_filename
		ensure
			success_output_filename_set: success_output_filename = a_filename
		end

feature -- Element change

	put_test (a_test: TS_TEST_CASE)
			-- Register `a_test' to be excuted by the current tester.
			-- Note that if several test features need to be registered
			-- for a given test case, a different instance of the test
			-- case should be provided for each registration. In other
			-- words, each test features should be run each on a different
			-- test object.
		require
			a_test_not_void: a_test /= Void
		do
			a_test.set_variables (variables)
			suite.put_test (a_test)
		end

	build_suite
			-- Add to `suite' the test cases that need to executed.
		do
		end

feature -- Execution

	execute
			-- Execute the tests.
			-- Output messages will be printed to `output_filename'
			-- if specified, to standard output otherwise.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			if output_filename /= Void then
				create a_file.make (output_filename)
				a_file.open_write
				if a_file.is_open_write then
					execute_with_output (a_file)
					a_file.close
				else
					create cannot_write.make (output_filename)
					report_error (cannot_write)
				end
			else
				execute_with_output (std.output)
			end
		end

	execute_with_output (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Execute the tests.
			-- Output messages will be printed to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_summary: TS_SUMMARY
		do
			if progress_status then
				a_file.put_character ('@')
				a_file.put_integer (suite.count)
				a_file.put_new_line
				a_file.flush
				a_summary := new_progress_summary (a_file)
			else
				a_summary := new_summary
			end
			execute_with_summary (a_summary, a_file)
		end

	execute_with_summary (a_summary: TS_SUMMARY; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Execute the tests.
			-- Test results will be recorded in `a_summary'
			-- and output messages will be printed to `a_file'.
		require
			a_summary_not_void: a_summary /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_suite: like suite
			l_old_success_output: KI_TEXT_OUTPUT_STREAM
			l_success_file: KL_TEXT_OUTPUT_FILE
			l_cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			l_suite := suite
			a_summary.set_fail_on_rescue (fail_on_rescue)
			a_summary.set_enabled_test_cases (enabled_test_cases)
			a_summary.set_disabled_test_cases (disabled_test_cases)
			l_old_success_output := a_summary.success_output
			if success_output_filename /= Void then
				create l_success_file.make (success_output_filename)
				l_success_file.recursive_open_append
				if l_success_file.is_open_write then
					a_summary.set_success_output (l_success_file)
				else
					l_success_file := Void
					create l_cannot_write.make (success_output_filename)
					report_error (l_cannot_write)
				end
			end
			l_suite.execute (a_summary)
			if l_success_file /= Void then
				a_summary.set_success_output (l_old_success_output)
				l_success_file.close
			end
			a_summary.print_summary (l_suite, a_file)
			if not a_summary.is_successful then
				if not progress_status then
					a_file.put_new_line
					a_summary.print_errors (a_file)
				end
				if not exit_on_error then
					-- Do nothing.
				elseif a_summary.is_aborted then
					Exceptions.die (4)
				else
					Exceptions.die (3)
				end
			end
		end

feature {NONE} -- Command line

	read_command_line
			-- Read command line arguments.
		local
			i, nb: INTEGER
			arg: STRING
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_error: UT_MESSAGE
			l_filters: STRING
			l_cannot_read: UT_CANNOT_READ_FILE_ERROR
			l_file: KL_TEXT_INPUT_FILE
			l_regexp_name: STRING
		do
			nb := Arguments.argument_count
			from
				i := 1
			until
				i > nb
			loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-o") then
					if i < nb then
						i := i + 1
						output_filename := Arguments.argument (i)
					else
						output_filename := Void
						report_usage_error
					end
				elseif arg.is_equal ("-a") then
					fail_on_rescue := True
				elseif arg.is_equal ("-p") then
					progress_status := True
				elseif arg.count >= 9 and then arg.substring (1, 9).is_equal ("--define=") then
					if arg.count > 9 then
						set_defined_variable (arg.substring (10, arg.count))
					else
						report_usage_error
					end
				elseif arg.count >= 9 and then arg.substring (1, 9).is_equal ("--filter=") then
					if arg.count > 9 then
						arg := arg.substring (10, arg.count)
						create l_regexp.make
						l_regexp.set_caseless (True)
						l_regexp.compile (arg)
						if l_regexp.is_compiled then
							set_enabled_test_cases (l_regexp)
						else
							create l_error.make ("Invalid regular expression for --filter: " + arg)
							report_error (l_error)
						end
					else
						report_usage_error
					end
				elseif arg.count >= 10 and then arg.substring (1, 10).is_equal ("--filters=") then
					if arg.count > 10 then
						arg := arg.substring (11, arg.count)
						create l_file.make (arg)
						l_file.open_read
						if not l_file.is_open_read then
							create l_cannot_read.make (arg)
							report_error (l_cannot_read)
						else
							l_filters := Void
							from
								l_file.read_line
							until
								l_file.end_of_file
							loop
								l_regexp_name := l_file.last_string.twin
								STRING_.left_adjust (l_regexp_name)
								STRING_.right_adjust (l_regexp_name)
								if l_regexp_name.is_empty then
									-- Do nothing.
								elseif l_regexp_name.starts_with ("--") then
									-- Ignore comment.
								else
									if l_filters = Void then
										l_filters := "(?:" + l_regexp_name + ")"
									else
										l_filters := l_filters + "|(?:" + l_regexp_name + ")"
									end
								end
								l_file.read_line
							end
							l_file.close
							if l_filters /= Void then
								l_filters := "^(?:" + l_filters + ")$"
								create l_regexp.make
								l_regexp.set_caseless (True)
								l_regexp.compile (l_filters)
								if l_regexp.is_compiled then
									set_enabled_test_cases (l_regexp)
								else
									create l_error.make ("Invalid regular expression built for --filters: " + l_filters)
									report_error (l_error)
								end
							end
						end
					else
						report_usage_error
					end
				elseif arg.count >= 17 and then arg.substring (1, 17).is_equal ("--exclude_filter=") then
					if arg.count > 17 then
						arg := arg.substring (18, arg.count)
						create l_regexp.make
						l_regexp.set_caseless (True)
						l_regexp.compile (arg)
						if l_regexp.is_compiled then
							set_disabled_test_cases (l_regexp)
						else
							create l_error.make ("Invalid regular expression for --exclude_filter: " + arg)
							report_error (l_error)
						end
					else
						report_usage_error
					end
				elseif arg.count >= 18 and then arg.substring (1, 18).is_equal ("--exclude_filters=") then
					if arg.count > 18 then
						arg := arg.substring (19, arg.count)
						create l_file.make (arg)
						l_file.open_read
						if not l_file.is_open_read then
							create l_cannot_read.make (arg)
							report_error (l_cannot_read)
						else
							l_filters := Void
							from
								l_file.read_line
							until
								l_file.end_of_file
							loop
								l_regexp_name := l_file.last_string.twin
								STRING_.left_adjust (l_regexp_name)
								STRING_.right_adjust (l_regexp_name)
								if l_regexp_name.is_empty then
									-- Do nothing.
								elseif l_regexp_name.starts_with ("--") then
									-- Ignore comment.
								else
									if l_filters = Void then
										l_filters := "(?:" + l_regexp_name + ")"
									else
										l_filters := l_filters + "|(?:" + l_regexp_name + ")"
									end
								end
								l_file.read_line
							end
							l_file.close
							if l_filters /= Void then
								l_filters := "^(?:" + l_filters + ")$"
								create l_regexp.make
								l_regexp.set_caseless (True)
								l_regexp.compile (l_filters)
								if l_regexp.is_compiled then
									set_disabled_test_cases (l_regexp)
								else
									create l_error.make ("Invalid regular expression built for --exclude_filters: " + l_filters)
									report_error (l_error)
								end
							end
						end
					else
						report_usage_error
					end
				elseif arg.count >= 17 and then arg.substring (1, 17).is_equal ("--success_output=") then
					if arg.count > 17 then
						arg := arg.substring (18, arg.count)
						set_success_output_filename (arg)
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
				end
				i := i + 1
			end
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

	report_error (an_error: UT_ERROR)
			-- Report `an_error'.
			-- Terminate with exit status 1 if `exit_on_error' is True.
		require
			an_error_not_void: an_error /= Void
		do
			error_handler.report_error (an_error)
			if exit_on_error then
				Exceptions.die (1)
			end
		end

	report_usage_error
			-- Report usage error and then terminate
			-- with exit status 1.
		do
			error_handler.report_error (Usage_message)
			Exceptions.die (1)
		end

	Usage_message: UT_USAGE_MESSAGE
			-- Tester usage message
		once
			create Result.make ("[-a][-p][-D <name>=<value>|--define=<name>=<value>]* [--filter=<regexp>][--filters=<filename>][--exclude_filter=<regexp>][--exclude_filters=<filename>] [--success_output=<filename>][-o filename]")
		ensure
			usage_message_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	internal_suite: TS_TEST_SUITE
			-- Internal implementation of `suite'

	new_summary: TS_SUMMARY
			-- New test result summary
		do
			create Result.make
		ensure
			summary_not_void: Result /= Void
		end

	new_progress_summary (a_file: KI_TEXT_OUTPUT_STREAM): TS_PROGRESS_SUMMARY
			-- New test result summary with progress status
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			create Result.make (a_file)
		ensure
			progress_summary_not_void: Result /= Void
		end

invariant

	error_handler_not_void: error_handler /= Void
	variables_not_void: variables /= Void
	enabled_test_cases_compiled: enabled_test_cases /= Void implies enabled_test_cases.is_compiled
	disabled_test_cases_compiled: disabled_test_cases /= Void implies disabled_test_cases.is_compiled

end
