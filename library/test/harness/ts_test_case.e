indexing

	description:

		"Test cases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_TEST_CASE

inherit

	TS_TEST

	TS_ASSERTION_ROUTINES

feature {NONE} -- Initialization

	make_test (an_id: INTEGER; a_variables: like variables) is
			-- Create a new test case with id `an_id'.
		require
			a_variables_not_void: a_variables /= Void
		do
			id := an_id
			internal_variables := a_variables
			initialize
		ensure
			id_set: id = an_id
			variables_set: variables = a_variables
		end

	make_default is
			-- Default initialization.
		do
			initialize
		end

feature -- Initialization

	initialize is
			-- Initialize current test case.
			-- (This routine is called by the creation routine
			-- and can be redefined in descendant classes.)
		do
		end

feature -- Access

	name: STRING is
			-- Name
		do
			Result := name_of_id (id)
		end

	id: INTEGER
			-- Test case id

	variables: TS_VARIABLES is
			-- Defined variables
		do
			if internal_variables = Void then
				create internal_variables.make
			end
			Result := internal_variables
		end

	assertions: TS_ASSERTIONS is
			-- Assertions
		do
			if internal_assertions = Void then
				create internal_assertions.make
			end
			Result := internal_assertions
		end

	assertion_logger: TS_TEST_LOGGER
			-- Logger of assertion checks

feature -- Measurement

	count: INTEGER is 1
			-- Number of test cases

feature -- Execution

	execute (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		do
			assertions.reset
			a_summary.start_test (Current)
			if a_summary.fail_on_rescue then
				execute_without_rescue (a_summary)
			else
				execute_with_rescue (a_summary)
			end
			a_summary.end_test (Current, assertions.count)
			assertions.reset
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

	default_test is
			-- Run default test case.
			-- (Can be redefined in descendant classes.)
		do
		end

feature {NONE} -- Execution

	execute_without_rescue (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		local
			i, nb: INTEGER
			an_error_messages: DS_ARRAYED_LIST [STRING]
		do
			set_up
			execute_i_th (id)
			tear_down
			an_error_messages := assertions.error_messages
			nb := an_error_messages.count
			if nb = 0 then
				a_summary.put_success (Current)
			else
				from i := 1 until i > nb loop
					a_summary.put_failure (Current, an_error_messages.item (i))
					i := i + 1
				end
			end
		end

	execute_with_rescue (a_summary: TS_SUMMARY) is
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		local
			retried: BOOLEAN
			i, nb: INTEGER
			an_error_messages: DS_ARRAYED_LIST [STRING]
		do
			if not retried then
				execute_without_rescue (a_summary)
			else
				tear_down
				if assertions.exception_raised then
					assertions.catch_exception
					an_error_messages := assertions.error_messages
					nb := an_error_messages.count
					if nb = 0 then
							-- This should not happen: if an exception has
							-- been raised, there must be a reported error.
						a_summary.put_success (Current)
					else
						from i := 1 until i > nb loop
							a_summary.put_failure (Current, an_error_messages.item (i))
							i := i + 1
						end
					end
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
		do
			default_test
		end

feature {NONE} -- Implementation

	name_of_id (an_id: INTEGER): STRING is
			-- Name of test case of id `an_id'
		do
			Result := "Default test"
		ensure
			name_not_void: Result /= Void
		end

	internal_variables: TS_VARIABLES
			-- Internal implementation of `variables'

	internal_assertions: TS_ASSERTIONS
			-- Internal implementation of `assertions'

	deferred_feature is
			-- VE needs at least a deferred feature in a deferred class.
		deferred
		end

end
