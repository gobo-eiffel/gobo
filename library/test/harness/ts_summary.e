indexing

	description:

		"Test result summaries"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_SUMMARY

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new result summary.
		do
			create results.make
		end

feature -- Access

	results: DS_LINKED_LIST [TS_RESULT]
			-- List of results

feature -- Status report

	is_successful: BOOLEAN is
			-- Have all tests been successful?
		do
			Result := failure_count = 0 and abort_count = 0
		end

	fail_on_rescue: BOOLEAN
			-- Should the test application crash when an error occur?
			-- (By default test case errors are caught by a rescue
			-- clause and reported to the result summary, but during
			-- debugging it might be useful to get the full exception
			-- trace.)

	enabled_test_cases: RX_REGULAR_EXPRESSION
			-- Only test cases whose name matches this regexp will
			-- be executed, or execute all test cases is Void

feature -- Status setting

	set_fail_on_rescue (b: BOOLEAN) is
			-- Set `fail_on_rescue' to `b'.
		do
			fail_on_rescue := b
		ensure
			fail_on_rescue_set: fail_on_rescue = b
		end

	set_enabled_test_cases (a_regexp: like enabled_test_cases) is
			-- Set `enabled_test_cases' to `a_regexp'.
		require
			compiled: a_regexp /= Void implies a_regexp.is_compiled
		do
			enabled_test_cases := a_regexp
		ensure
			enabled_test_cases_set: enabled_test_cases = a_regexp
		end

feature -- Measurement

	test_count: INTEGER is
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

	put_success (a_test: TS_TEST) is
			-- Add successful test `a_test'.
		require
			a_test_not_void: a_test /= Void
		local
			a_result: TS_SUCCESSFUL_RESULT
		do
			create a_result.make (a_test)
			results.put_last (a_result)
			success_count := success_count + 1
		end

	put_failure (a_test: TS_TEST; a_reason: STRING) is
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
		end

	put_abort (a_test: TS_TEST; a_reason: STRING) is
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
		end

	start_test (a_test: TS_TEST) is
			-- Inform Current that a test will be started.
		require
			a_test_not_void: a_test /= Void
		do
				-- Do nothing.
		end

	end_test (a_test: TS_TEST; asserts: INTEGER) is
			-- Inform Current that a test was completed with
			-- `asserts' assertions run.
		do
			assertion_count := assertion_count + asserts
		end

feature -- Output

	print_summary (a_test: TS_TEST; a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_errors (a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_results (a_file: KI_TEXT_OUTPUT_STREAM) is
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
	enabled_test_cases_compiled: enabled_test_cases /= Void implies enabled_test_cases.is_compiled

end
