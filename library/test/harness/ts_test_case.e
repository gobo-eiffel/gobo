indexing

	description:

		"Test cases"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class TS_TEST_CASE

inherit

	TS_TEST
	TS_ASSERTION_ROUTINES

feature {NONE} -- Initialization

	make (an_id: INTEGER) is
			-- Create a new test case with id `an_id'.
		do
			id := an_id
		ensure
			id_set: id = an_id
		end

feature -- Access

	name: STRING is
			-- Name
		do
			Result := name_of_id (id)
		end

	id: INTEGER
			-- Test case id

feature -- Measurement

	count: INTEGER is 1
			-- Number of test cases

feature -- Execution

	execute (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		do
			Assertions.reset
			a_summary.start_test (Current)
			if a_summary.fail_on_rescue then
				execute_without_rescue (a_summary)
			else
				execute_with_rescue (a_summary)
			end
			a_summary.end_test (Current, Assertions.count)
		end

	set_up is
			-- Setup for a test.
			-- (Can be redefined in descendant classes.)
		do
		end

	tear_down is
			-- Tear down after a test.
			-- (Can be redefined in descendant classes.)
		do
		end

feature {NONE} -- Execution

	execute_without_rescue (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		do
			set_up
			execute_i_th (id)
			tear_down
			a_summary.put_success (Current)
		end

	execute_with_rescue (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		local
			retried: BOOLEAN
		do
			if not retried then
				execute_without_rescue (a_summary)
			else
				tear_down
				if Assertions.failed then
					a_summary.put_failure (Current, Assertions.error_message)
				else
					a_summary.put_abort (Current, "Eiffel exception")
				end
			end
		rescue
			if not retried then
				retried := True
				retry
			end
		end

	execute_i_th (an_id: INTEGER) is
			-- Run test case of id `an_id'.
		deferred
		end

feature {NONE} -- Implementation

	name_of_id (an_id: INTEGER): STRING is
			-- Name of test case of id `an_id'
		deferred
		ensure
			name_not_void: Result /= Void
		end

end -- class TS_TEST_CASE
