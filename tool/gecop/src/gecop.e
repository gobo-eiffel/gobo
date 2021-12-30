note

	description:

		"[
			Gobo Eiffel Cop.
			An Eiffel language conformance validation suite.
		]"

	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GECOP

inherit

	GECOP_VERSION

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_OPERATING_SYSTEM
	KL_SHARED_STANDARD_FILES
	KL_IMPORTED_STRING_ROUTINES

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start 'gecop' execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
			Exceptions.die (exit_code)
		rescue
			Exceptions.die (4)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start 'gecop' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_error_handler: UT_ERROR_HANDLER
		do
			create l_error_handler.make_standard
			execute_with_arguments_and_error_handler (a_args, l_error_handler)
		end

	execute_with_arguments_and_error_handler (a_args: ARRAY [STRING]; a_error_handler: UT_ERROR_HANDLER)
			-- Start 'gecop' execution.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		local
			l_validation_directory_name: STRING
			l_directory: KL_DIRECTORY
			l_relative_path: DS_ARRAYED_LIST [STRING]
			l_tested_eiffel_tool: STRING
			l_tester: TS_TESTER
			l_test_suite: TS_TEST_SUITE
			l_output_stream: KL_STRING_OUTPUT_STREAM
			l_output_string: STRING
			l_aggregate, l_diff: BOOLEAN
			l_set_up_mutex: MUTEX
		do
			Arguments.set_program_name ("gecop")
			create error_handler.make_standard
			parse_arguments (a_args)
			if exit_code = 0 and then not version_flag.was_found then
				if tool_option.was_found and then attached tool_option.parameter as l_tool_name then
					l_tested_eiffel_tool := l_tool_name
				else
					l_tested_eiffel_tool := default_tested_eiffel_tool
				end
				if validation_option.was_found and then attached validation_option.parameter as l_directory_name and then not l_directory_name.is_empty then
					l_validation_directory_name := l_directory_name
				else
					l_validation_directory_name := default_validation_dirname
				end
				l_validation_directory_name := Execution_environment.interpreted_string (l_validation_directory_name)
				create l_directory.make (l_validation_directory_name)
				l_directory.open_read
				if l_directory.is_open_read then
					create l_tester.make_default
					if tool_executable_option.was_found and then attached tool_executable_option.parameter as l_executable_filename and then not l_executable_filename.is_empty then
						l_tester.variables.set_value ("executable", l_executable_filename)
					end
					create l_test_suite.make ("validation", l_tester.variables)
					l_tester.set_suite (l_test_suite)
					create l_relative_path.make_default
					create l_set_up_mutex.make
					process_directory (l_directory, l_relative_path, l_tested_eiffel_tool, filter, l_tester, l_set_up_mutex)
					l_directory.close
					create l_output_stream.make_empty
					l_aggregate := not aggregate_option.was_found or else aggregate_option.parameter
					run_tests (l_tester, l_aggregate, l_output_stream)
					l_output_string := l_output_stream.string
					l_output_string := text_to_markdown (l_output_string)
					l_diff := not diff_option.was_found or else diff_option.parameter
					if l_diff then
						report_diff_with_last_run (l_output_string, l_validation_directory_name, l_tested_eiffel_tool)
					end
					if keep_testdir_flag.was_found then
						write_last_run_file (l_output_string, l_tested_eiffel_tool)
					else
						file_system.recursive_delete_directory (test_dirname)
					end
				else
					report_cannot_read_directory_error (l_validation_directory_name)
					exit_code := 1
				end
			end
		rescue
			exit_code := 4
		end

feature {NONE} -- Processing

	process_directory (a_directory: KL_DIRECTORY; a_relative_path: DS_ARRAYED_LIST [STRING]; a_tested_eiffel_tool: STRING; a_filter: detachable RX_REGULAR_EXPRESSION; a_tester: TS_TESTER; a_set_up_mutex: detachable MUTEX)
			-- Traverse `a_directory' and recursively its subdirectories to find
			-- test cases to be added to `a_tester' (if matching `a_filter') and
			-- later run with `a_tested_eiffel_tool'.
		require
			a_directory_not_void: a_directory /= Void
			a_directory_open_read: a_directory.is_open_read
			a_relative_path_not_void: a_relative_path /= Void
			no_void_relative_path: not a_relative_path.has_void
			a_tested_eiffel_tool_not_void: a_tested_eiffel_tool /= Void
			a_filter_is_compiled: a_filter /= Void implies a_filter.is_compiled
			a_tester_not_void: a_tester /= Void
		local
			l_dirname: STRING
			l_entries: DS_ARRAYED_LIST [STRING]
			l_entry_name: STRING
			l_entry_fullname: STRING
			i, nb: INTEGER
			l_subdirectory: KL_DIRECTORY
			l_test_name: STRING
			l_test_case: EIFFEL_TEST_CASE
			l_test_suite: detachable TS_TEST_SUITE
			l_test_suite_name: STRING
			l_root_name: STRING
			l_comparator: UC_STRING_COMPARATOR
			l_sorter: DS_QUICK_SORTER [STRING]
			l_test_dirname: STRING
		do
			l_dirname := a_directory.name
			create l_entries.make_default
			from a_directory.read_entry until a_directory.end_of_input loop
				l_entry_name := a_directory.last_entry
				if l_entry_name.count > 0 and not STRING_.same_string (l_entry_name, file_system.relative_current_directory) and not STRING_.same_string (l_entry_name, file_system.relative_parent_directory) then
					l_entries.force_last (l_entry_name.twin)
				end
				a_directory.read_entry
			end
			create l_comparator
			create l_sorter.make (l_comparator)
			l_entries.sort (l_sorter)
			nb := l_entries.count
			from i := 1 until i > nb loop
				l_entry_name := l_entries.item (i)
				l_entry_fullname := file_system.pathname (l_dirname, l_entry_name)
				create l_subdirectory.make (l_entry_fullname)
				l_subdirectory.open_read
				if l_subdirectory.is_open_read then
					if a_relative_path.is_empty then
						l_test_name := l_entry_name
						l_test_suite_name := "validation"
					else
						if a_relative_path.count = 1 then
							l_test_suite_name := a_relative_path.first
						else
							l_root_name := a_relative_path.first
							a_relative_path.remove_first
							l_test_suite_name := unix_file_system.nested_pathname (l_root_name, a_relative_path.to_array)
							a_relative_path.force_first (l_root_name)
						end
						l_test_name := unix_file_system.pathname (l_test_suite_name, l_entry_name)
					end
					a_relative_path.force_last (l_entry_name)
					if l_entry_name.count >= 4 and then l_entry_name.starts_with ("test") then
						if a_filter = Void or else a_filter.matches (l_test_name) then
							if l_test_suite = Void then
								create l_test_suite.make (l_test_suite_name, a_tester.variables)
								a_tester.suite.put_test (l_test_suite)
							end
							l_test_dirname := file_system.nested_pathname (test_dirname, a_relative_path.to_array)
							create l_test_case.make (l_entry_fullname, l_test_dirname)
							l_test_case.set_test (l_test_name, agent l_test_case.compile_and_test (a_tested_eiffel_tool))
							l_test_case.set_variables (a_tester.variables)
							l_test_case.set_set_up_mutex (a_set_up_mutex)
							l_test_suite.put_test (l_test_case)
						end
					else
						process_directory (l_subdirectory, a_relative_path, a_tested_eiffel_tool, a_filter, a_tester, a_set_up_mutex)
					end
					a_relative_path.remove_last
					l_subdirectory.close
				end
				i := i + 1
			end
		end

	run_tests (a_tester: TS_TESTER; a_aggregate: BOOLEAN; a_output_file: KI_TEXT_OUTPUT_STREAM)
			-- Run tests in `a_tester'.
			-- Aggregate the test results if `a_aggregate' is true.
			-- Write the test results to the console window and to `a_output_file'.
		require
			a_tester_not_void: a_tester /= Void
			a_output_file_not_void: a_output_file /= Void
			a_output_file_open_write: a_output_file.is_open_write
		local
			l_summary: TS_SUMMARY
			l_tester: TS_TESTER
			l_test_suite: TS_TEST_SUITE
			l_has_test_suite: BOOLEAN
			l_has_test_case: BOOLEAN
			l_thread_count: INTEGER
			l_old_test_suite: TS_TEST_SUITE
		do
			if a_aggregate then
				std.output.put_new_line
				std.output.put_line ("Testing " + a_tester.suite.name + "...")
				std.output.put_line ("Running Test Cases")
				std.output.put_new_line
				create l_summary.make
				l_summary.set_sort_errors (True)
				l_thread_count := thread_count
				if l_thread_count > 1 then
					l_old_test_suite := a_tester.suite
					l_test_suite := {TS_TEST_SUITE_FACTORY}.new_test_suite (l_old_test_suite.name, l_old_test_suite.variables, l_thread_count)
					l_old_test_suite.add_test_cases_to_suite (l_test_suite)
					a_tester.set_suite (l_test_suite)
					a_tester.execute_with_summary (l_summary, std.output)
					a_tester.set_suite (l_old_test_suite)
				else
					a_tester.execute_with_summary (l_summary, std.output)
				end
					-- Write to `a_output_file'.
				a_output_file.put_new_line
				a_output_file.put_line ("Testing " + a_tester.suite.name + "...")
				a_output_file.put_line ("Running Test Cases")
				a_output_file.put_new_line
				l_summary.print_summary_without_assertions (a_tester.suite, a_output_file)
				if not l_summary.is_successful then
					a_output_file.put_new_line
					l_summary.print_errors (a_output_file)
				end
			else
				across a_tester.suite as i_tests loop
					if attached {TS_TEST_SUITE} i_tests as l_suite then
						create l_tester.make_default
						l_tester.set_suite (l_suite)
						run_tests (l_tester, False, a_output_file)
						l_has_test_suite := True
					else
						l_has_test_case := True
					end
				end
				if not l_has_test_suite then
					run_tests (a_tester, True, a_output_file)
				elseif l_has_test_case then
					create l_test_suite.make (a_tester.suite.name, a_tester.suite.variables)
					across a_tester.suite as i_tests loop
						if not attached {TS_TEST_SUITE} i_tests then
							l_test_suite.put_test (i_tests)
						end
					end
					create l_tester.make_default
					l_tester.set_suite (l_test_suite)
					run_tests (l_tester, True, a_output_file)
				end
			end
		end

	write_last_run_file (a_output_string: STRING; a_tested_eiffel_tool: STRING)
			-- Write `a_output_string' to last run file associated with `a_tested_eiffel_tool'.
		require
			a_output_string_not_void: a_output_string /= Void
			a_tested_eiffel_tool_not_void: a_tested_eiffel_tool /= Void
		local
			l_output_filename: STRING
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			if attached last_run_filename_suffix (a_tested_eiffel_tool) as l_last_run_filename_suffix then
				l_output_filename := file_system.pathname (test_dirname, "last_run" + l_last_run_filename_suffix + ".md")
			else
				l_output_filename := file_system.pathname (test_dirname, "last_run.log")
			end
			create l_output_file.make (l_output_filename)
			l_output_file.recursive_open_write
			if l_output_file.is_open_write then
				l_output_file.put_string (a_output_string)
				l_output_file.close
			else
				report_cannot_write_to_file_error (l_output_filename)
				exit_code := 1
			end
		end

	report_diff_with_last_run (a_output_string: STRING; a_validation_directory_name: STRING; a_tested_eiffel_tool: STRING)
			-- Report whether diffs were found in the test results `a_output_string'
			-- since last run for `a_tested_eiffel_tool'.
		require
			a_output_string_not_void: a_output_string /= Void
			a_validation_directory_name_not_void: a_validation_directory_name /= Void
			a_tested_eiffel_tool_not_void: a_tested_eiffel_tool /= Void
		local
			l_input_filename: STRING
			l_input_file: KL_TEXT_INPUT_FILE
			l_input_string: STRING
			l_has_diff: BOOLEAN
		do
			if attached last_run_filename_suffix (a_tested_eiffel_tool) as l_last_run_filename_suffix then
				l_input_filename := file_system.pathname (a_validation_directory_name, "last_run" + l_last_run_filename_suffix + ".md")
				create l_input_file.make (l_input_filename)
				l_input_file.open_read
				if l_input_file.is_open_read then
					create l_input_string.make (a_output_string.count)
					from
						l_input_file.read_string (4096)
					until
						l_input_file.end_of_file
					loop
						l_input_string.append_string (l_input_file.last_string)
						l_input_file.read_string (4096)
					end
					l_input_file.close
					l_has_diff := not l_input_string.same_string (a_output_string)
				else
					l_has_diff := True
				end
			else
				l_has_diff := True
			end
			std.output.put_new_line
			if l_has_diff then
				std.output.put_line ("DIFFS FOUND SINCE LAST RUN")
			else
				std.output.put_line ("No Diff since last run")
			end
			std.output.put_new_line
		end

	text_to_markdown (a_string: STRING): STRING
			-- Convert `a_string' to a Markdown hyperlinked text.
			-- This will allow to jump directly to the failing test case folder
			-- when browsing in a Markdown aware environment (like GitHub).
		require
			a_string_not_void: a_string /= Void
		local
			l_test_case_name_rexgexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create l_test_case_name_rexgexp.make
			l_test_case_name_rexgexp.compile ("\[([^\]]+)\]")
			l_test_case_name_rexgexp.match (a_string)
			Result := l_test_case_name_rexgexp.replace_all ("\[[\1\](\1\)\]")
			Result.replace_substring_all ("_", "\_")
			Result.replace_substring_all ("...", "...</br>")
			Result.replace_substring_all ("#", "    #")
			Result.replace_substring_all ("%NFAIL", "</br>%NFAIL")
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_cannot_read_directory_error (a_dirname: STRING)
			-- Report that `a_dirname' cannot be
			-- opened in read mode.
		require
			a_dirname_not_void: a_dirname /= Void
		local
			an_error: UT_CANNOT_READ_DIRECTORY_ERROR
		do
			create an_error.make (a_dirname)
			error_handler.report_error (an_error)
		end

	report_cannot_write_to_file_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_invalid_filter_regexp (a_filter_regexp: STRING)
			-- Report that `a_filter_pattern' is not a
			-- valid regular expression.
		require
			a_filter_regexp_not_void: a_filter_regexp /= Void
		local
			l_error: UT_INVALID_REGULAR_EXPRESSION_ERROR
		do
			create l_error.make (a_filter_regexp)
			error_handler.report_error (l_error)
		end

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	exit_code: INTEGER
			-- Exit code

feature -- Access

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

	filter: detachable RX_PCRE_REGULAR_EXPRESSION
			-- When specified, run only the test cases matching this regexp

feature -- Argument parsing

	tool_option: AP_ENUMERATION_OPTION
			-- Option for '--tool=<eiffel_tool>'

	tool_executable_option: AP_STRING_OPTION
			-- Option for '--tool_executable=<executable_filename>'

	validation_option: AP_STRING_OPTION
			-- Option for '--validation=<directory_name>'

	filter_option: AP_STRING_OPTION
			-- Option for '--filter=<regexp>'

	aggregate_option: AP_BOOLEAN_OPTION
			-- Option for '--aggregate=<no|yes>'

	diff_option: AP_BOOLEAN_OPTION
			-- Option for '--diff=<no|yes>'

	keep_testdir_flag: AP_FLAG
			-- Flag for '--keep-testdir'

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
			l_filter: like filter
		do
			create l_parser.make
			l_parser.set_application_description ("Gobo Eiffel Cop, an Eiffel language conformance validation suite.")
			l_parser.set_parameters_description ("")
				-- tool
			create tool_option.make_with_long_form ("tool")
			tool_option.set_description ("Eiffel tool to be tested against the validation suite. (default: ge)")
			tool_option.extend ("ge")
			tool_option.extend ("ise")
			tool_option.extend ("gec")
			tool_option.extend ("gelint")
			tool_option.extend ("ge_debug")
			tool_option.extend ("ge_lint")
			tool_option.extend ("ise_debug")
			tool_option.extend ("ise_dotnet")
			tool_option.extend ("ise_dotnet_debug")
			l_parser.options.force_last (tool_option)
				-- tool_executable
			create tool_executable_option.make_with_long_form ("tool-executable")
			tool_executable_option.set_description ("Executable filename (optionally with a pathname) of Eiffel tool to be tested. (default: gec|gelint|ec in the PATH)")
			tool_executable_option.set_parameter_description ("filename")
			l_parser.options.force_last (tool_executable_option)
				-- validation
			create validation_option.make_with_long_form ("validation")
			validation_option.set_description ("Directory containing the Eiffel validation suite. (default: $GOBO/tool/gecop/validation)")
			validation_option.set_parameter_description ("directory_name")
			l_parser.options.force_last (validation_option)
				-- filter
			create filter_option.make_with_long_form ("filter")
			filter_option.set_description ("When specified, run only the test cases matching this regexp. (default: no filter)")
			filter_option.set_parameter_description ("regexp")
			l_parser.options.force_last (filter_option)
				-- aggregate
			create aggregate_option.make_with_long_form ("aggregate")
			aggregate_option.set_description ("Should test results be aggregated into a single report? (default: yes)")
			aggregate_option.set_parameter_description ("no|yes")
			l_parser.options.force_last (aggregate_option)
				-- diff
			create diff_option.make_with_long_form ("diff")
			diff_option.set_description ("Should test results be compared with the previous run? (default: yes)")
			diff_option.set_parameter_description ("no|yes")
			l_parser.options.force_last (diff_option)
				-- keep-testdir
			create keep_testdir_flag.make_with_long_form ("keep-testdir")
			keep_testdir_flag.set_description ("Do no delete temporary directory after running the validation suite. (default: delete testdir)")
			l_parser.options.force_last (keep_testdir_flag)
				-- thread
			create thread_option.make_with_long_form ("thread")
			thread_option.set_description ("Number of threads to be used. Negative numbers -N mean %"number of CPUs - N%". (default: number of CPUs)")
			thread_option.set_parameter_description ("thread_count")
			if {PLATFORM}.is_thread_capable then
				l_parser.options.force_last (thread_option)
			end
				-- version
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of gecop and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_last (l_list)
				-- Parsing.
			l_parser.parse_array (a_args)
			if version_flag.was_found then
				report_version_number
				exit_code := 0
			elseif not l_parser.parameters.is_empty then
				error_handler.report_info_message (l_parser.help_option.full_usage_instruction (l_parser))
				exit_code := 1
			elseif filter_option.was_found and then attached filter_option.parameter as l_filter_pattern and then not l_filter_pattern.is_empty then
				create l_filter.make
				if Operating_system.is_windows then
					l_filter.set_case_insensitive (True)
				end
				l_filter.compile (l_filter_pattern)
				if not l_filter.is_compiled then
					report_invalid_filter_regexp (l_filter_pattern)
					exit_code := 1
				else
					filter := l_filter
				end
			end
		ensure
			tool_option_not_void: tool_option /= Void
			tool_executable_option_not_void: tool_executable_option /= Void
			validation_option_not_void: validation_option /= Void
			filter_option_not_void: filter_option /= Void
			aggregate_option_not_void: aggregate_option /= Void
			diff_option_not_void: diff_option /= Void
			keep_testdir_flag_not_void: keep_testdir_flag /= Void
			thread_option_not_void: thread_option /= Void
			version_flag_not_void: version_flag /= Void
		end

feature {NONE} -- Implementation

	last_run_filename_suffix (a_tested_eiffel_tool: STRING): detachable STRING
			-- Filename suffix for the 'last_run' file associated with `a_tested_eiffel_tool'
		do
			if a_tested_eiffel_tool.starts_with ("ise") then
				Result := "_ise"
			elseif a_tested_eiffel_tool.starts_with ("ge") then
				if a_tested_eiffel_tool.ends_with ("lint") then
					Result := "_gelint"
				else
					Result := "_gec"
				end
			end
		end

feature {NONE} -- Constants

	default_validation_dirname: STRING
			-- Default validation directory name
		once
			Result := file_system.nested_pathname ("$GOBO", <<"tool", "gecop", "validation">>)
		ensure
			default_validation_dirname_not_void: Result /= Void
		end

	default_tested_eiffel_tool: STRING = "ge"
			-- Name of Eiffel tool to be tested by default

	test_dirname: STRING = "Tvalidation"
			-- Name of temporary directory where to run the test

invariant

	error_handler_not_void: error_handler /= Void
	tool_option_not_void: tool_option /= Void
	tool_executable_option_not_void: tool_executable_option /= Void
	validation_option_not_void: validation_option /= Void
	filter_option_not_void: filter_option /= Void
	aggregate_option_not_void: aggregate_option /= Void
	diff_option_not_void: diff_option /= Void
	keep_testdir_flag_not_void: keep_testdir_flag /= Void
	thread_option_not_void: thread_option /= Void
	version_flag_not_void: version_flag /= Void

end
