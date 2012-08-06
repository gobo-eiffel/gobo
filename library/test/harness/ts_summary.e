note

	description:

		"Test result summaries"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/09/29 $"
	revision: "$Revision: #10 $"

class TS_SUMMARY

inherit

	ANY

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new result summary.
		do
			create results.make
			success_output := null_output_stream
			failure_output := null_output_stream
			abort_output := null_output_stream
			completed_output := null_output_stream
		end

feature -- Access

	results: DS_LINKED_LIST [TS_RESULT]
			-- List of results

feature -- Status report

	is_successful: BOOLEAN
			-- Have all tests been successful?
		do
			Result := failure_count = 0 and abort_count = 0
		end

	is_aborted: BOOLEAN
			-- Has at least one test been aborted?
		do
			Result := abort_count /= 0
		end

	fail_on_rescue: BOOLEAN
			-- Should the test application crash when an error occur?
			-- (By default test case errors are caught by a rescue
			-- clause and reported to the result summary, but during
			-- debugging it might be useful to get the full exception
			-- trace.)

	enabled_test_cases: DS_LINKED_LIST [RX_REGULAR_EXPRESSION]
			-- Only test cases whose name matches one of these regexps will
			-- be executed, or execute all test cases is Void

	disabled_test_cases: DS_LINKED_LIST [RX_REGULAR_EXPRESSION]
			-- Test cases whose name matches one of these regexps will
			-- not be executed

	success_output: KI_TEXT_OUTPUT_STREAM
			-- File where to print the name of tests
			-- when successfully executed

	failure_output: KI_TEXT_OUTPUT_STREAM
			-- File where to print the name of tests when failed

	abort_output: KI_TEXT_OUTPUT_STREAM
			-- File where to print the name of tests when aborted

	completed_output: KI_TEXT_OUTPUT_STREAM
			-- File where to print the name of tests when completed

feature -- Status setting

	set_fail_on_rescue (b: BOOLEAN)
			-- Set `fail_on_rescue' to `b'.
		do
			fail_on_rescue := b
		ensure
			fail_on_rescue_set: fail_on_rescue = b
		end

	set_enabled_test_cases (a_test_cases: like enabled_test_cases)
			-- Set `enabled_test_cases' to `a_regexp'.
		require
			no_void_test_case: a_test_cases /= Void implies not a_test_cases.has_void
			test_cases_compiled: a_test_cases /= Void implies a_test_cases.for_all (agent {RX_REGULAR_EXPRESSION}.is_compiled)
		do
			enabled_test_cases := a_test_cases
		ensure
			enabled_test_cases_set: enabled_test_cases = a_test_cases
		end

	set_disabled_test_cases (a_test_cases: like disabled_test_cases)
			-- Set `disabled_test_cases' to `a_test_cases'.
		require
			no_void_test_case: a_test_cases /= Void implies not a_test_cases.has_void
			test_cases_compiled: a_test_cases /= Void implies a_test_cases.for_all (agent {RX_REGULAR_EXPRESSION}.is_compiled)
		do
			disabled_test_cases := a_test_cases
		ensure
			disabled_test_cases_set: disabled_test_cases = a_test_cases
		end

	set_success_output (a_output: like success_output)
			-- Set `success_output' to `a_output'.
		require
			a_output_not_void: a_output /= Void
			a_output_open_write: a_output.is_open_write
		do
			success_output := a_output
		ensure
			success_output_set: success_output = a_output
		end

	set_failure_output (a_output: like failure_output)
			-- Set `failure_output' to `a_output'.
		require
			a_output_not_void: a_output /= Void
			a_output_open_write: a_output.is_open_write
		do
			failure_output := a_output
		ensure
			failure_output_set: failure_output = a_output
		end

	set_abort_output (a_output: like abort_output)
			-- Set `abort_output' to `a_output'.
		require
			a_output_not_void: a_output /= Void
			a_output_open_write: a_output.is_open_write
		do
			abort_output := a_output
		ensure
			abort_output_set: abort_output = a_output
		end

	set_completed_output (a_output: like completed_output)
			-- Set `completed_output' to `a_output'.
		require
			a_output_not_void: a_output /= Void
			a_output_open_write: a_output.is_open_write
		do
			completed_output := a_output
		ensure
			completed_output_set: completed_output = a_output
		end

feature -- Measurement

	test_count: INTEGER
			-- Number of tests executed
		do
			Result := success_count + failure_count + abort_count
		ensure
			definition: Result = (success_count + failure_count + abort_count)
		end

	success_count: INTEGER
			-- Number of successful tests

	failure_count: INTEGER
			-- Number of failed tests

	abort_count: INTEGER
			-- Number of aborted tests

	assertion_count: INTEGER
			-- Number of assertions executed

feature -- Element change

	put_success (a_test: TS_TEST)
			-- Add successful test `a_test'.
		require
			a_test_not_void: a_test /= Void
		local
			a_result: TS_SUCCESSFUL_RESULT
		do
			create a_result.make (a_test)
			results.put_last (a_result)
			success_count := success_count + 1
			success_output.put_line (a_test.name)
			success_output.flush
			completed_output.put_line (a_test.name)
			completed_output.flush
		end

	put_failure (a_test: TS_TEST; a_reason: STRING)
			-- Add failed test `a_test'.
		require
			a_test_not_void: a_test /= Void
			a_reason_not_void: a_reason /= Void
		local
			a_result: TS_FAILED_RESULT
		do
			create a_result.make (a_test, a_reason)
			results.put_last (a_result)
			failure_count := failure_count + 1
			failure_output.put_line (a_test.name)
			failure_output.flush
			completed_output.put_line (a_test.name)
			completed_output.flush
		end

	put_abort (a_test: TS_TEST; a_reason: STRING)
			-- Add aborted test `a_test'.
		require
			a_test_not_void: a_test /= Void
			a_reason_not_void: a_reason /= Void
		local
			a_result: TS_ABORTED_RESULT
		do
			create a_result.make (a_test, a_reason)
			results.put_last (a_result)
			abort_count := abort_count + 1
			abort_output.put_line (a_test.name)
			abort_output.flush
			completed_output.put_line (a_test.name)
			completed_output.flush
		end

	start_test (a_test: TS_TEST)
			-- Inform Current that a test will be started.
		require
			a_test_not_void: a_test /= Void
		do
				-- Do nothing.
		end

	end_test (a_test: TS_TEST; asserts: INTEGER)
			-- Inform Current that a test was completed with
			-- `asserts' assertions run.
		do
			assertion_count := assertion_count + asserts
		end

feature -- Output

	print_summary (a_test: TS_TEST; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print summary for `a_test' to `a_file'.
		require
			a_test_not_void: a_test /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("Test Summary for ")
			a_file.put_line (a_test.name)
			a_file.put_new_line
			if failure_count = 0 and abort_count = 0 then
				a_file.put_string ("# PASSED:     ")
			else
				a_file.put_string ("# Passed:     ")
			end
			a_file.put_integer (success_count)
			a_file.put_string (" test")
			if success_count > 1 then
				a_file.put_character ('s')
			end
			a_file.put_new_line
			if failure_count > 0 then
				a_file.put_string ("# FAILED:     ")
			else
				a_file.put_string ("# Failed:     ")
			end
			a_file.put_integer (failure_count)
			a_file.put_string (" test")
			if failure_count > 1 then
				a_file.put_character ('s')
			end
			a_file.put_new_line
			if abort_count > 0 then
				a_file.put_string ("# ABORTED:    ")
			else
				a_file.put_string ("# Aborted:    ")
			end
			a_file.put_integer (abort_count)
			a_file.put_string (" test")
			if abort_count > 1 then
				a_file.put_character ('s')
			end
			a_file.put_new_line
			a_file.put_string ("# Total:      ")
			a_file.put_integer (test_count)
			a_file.put_string (" test")
			if test_count > 1 then
				a_file.put_character ('s')
			end
			a_file.put_string (" (")
			a_file.put_integer (assertion_count)
			a_file.put_string (" assertion")
			if assertion_count > 1 then
				a_file.put_character ('s')
			end
			a_file.put_character (')')
			a_file.put_new_line
		end

	print_errors (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print failed or aborted results to `a_file'.
		require
			not_successful: not is_successful
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LIST_CURSOR [TS_RESULT]
			a_result: TS_RESULT
		do
			a_file.put_line ("Test Results:")
			a_cursor := results.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_result := a_cursor.item
				if not a_result.passed then
					a_result.print_result (a_file)
					a_file.put_new_line
				end
				a_cursor.forth
			end
		end

	print_results (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print all results to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_cursor: DS_LIST_CURSOR [TS_RESULT]
		do
			if not results.is_empty then
				a_file.put_line ("Test Results:")
				a_cursor := results.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_cursor.item.print_result (a_file)
					a_file.put_new_line
					a_cursor.forth
				end
			end
		end

invariant

	success_count_positive: success_count >= 0
	failure_count_positive: failure_count >= 0
	abort_count_positive: abort_count >= 0
	assertion_count_positive: assertion_count >= 0
	results_not_void: results /= Void
	no_void_result: not results.has_void
	no_void_enabled_test_cases: enabled_test_cases /= Void implies not enabled_test_cases.has_void
	enabled_test_cases_compiled: enabled_test_cases /= Void implies enabled_test_cases.for_all (agent {RX_REGULAR_EXPRESSION}.is_compiled)
	no_void_disabled_test_cases: disabled_test_cases /= Void implies not disabled_test_cases.has_void
	disabled_test_cases_compiled: disabled_test_cases /= Void implies disabled_test_cases.for_all (agent {RX_REGULAR_EXPRESSION}.is_compiled)
	success_output_not_void: success_output /= Void
	success_output_open_write: success_output.is_open_write
	failure_output_not_void: failure_output /= Void
	failure_output_open_write: failure_output.is_open_write
	abort_output_not_void: abort_output /= Void
	abort_output_open_write: abort_output.is_open_write
	completed_output_not_void: completed_output /= Void
	completed_output_open_write: completed_output.is_open_write

end
