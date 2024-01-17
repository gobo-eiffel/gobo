note

	description:

		"Test cases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2020, Eric Bezault and others"
	license: "MIT License"

deferred class TS_TEST_CASE

inherit

	TS_TEST

	TS_ASSERTION_ROUTINES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_MEMORY

feature {NONE} -- Initialization

	make_default
			-- Default initialization.
		do
			initialize
		end

feature -- Initialization

	initialize
			-- Initialize current test case.
			-- (This routine is called by the creation routine
			-- and can be redefined in descendant classes.)
		do
		end

	set_test (a_name: like name; a_test_feature: PROCEDURE)
			-- Identify one of the test features of current test case
			-- as being the one that will be executed when running
			-- this test case.
		require
			a_name_not_void: a_name /= Void
			a_test_feature_not_void: a_test_feature /= Void
		do
			internal_name := a_name
			internal_test_feature := a_test_feature
		ensure
			name_set: name = a_name
			internal_test_feature_set: internal_test_feature = a_test_feature
		end

feature -- Access

	name: STRING
			-- Name
		do
			if attached internal_name as l_internal_name then
				Result := l_internal_name
			else
				Result := default_test_name
			end
		end

	variables: TS_VARIABLES
			-- Defined variables
		local
			l_internal_variables: like internal_variables
		do
			l_internal_variables := internal_variables
			if l_internal_variables = Void then
				create l_internal_variables.make
				internal_variables := l_internal_variables
			end
			Result := l_internal_variables
		end

	assertions: TS_ASSERTIONS
			-- Assertions
		local
			l_internal_assertions: like internal_assertions
		do
			l_internal_assertions := internal_assertions
			if l_internal_assertions = Void then
				create l_internal_assertions.make
				internal_assertions := l_internal_assertions
			end
			Result := l_internal_assertions
		end

	logger: TS_TEST_LOGGER
			-- Logger for tests and assertion checkings
		local
			l_internal_logger: like internal_logger
		do
			l_internal_logger := internal_logger
			if l_internal_logger = Void then
				create {TS_NULL_TEST_LOGGER} l_internal_logger.make
				internal_logger := l_internal_logger
			end
			Result := l_internal_logger
		end

feature -- Setting

	set_variables (a_variables: like variables)
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			internal_variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

	set_logger (a_logger: like logger)
			-- Set `logger' to `a_logger'.
		do
			internal_logger := a_logger
		ensure
			logger_set: logger = a_logger
		end

feature -- Measurement

	count: INTEGER = 1
			-- Number of test cases

feature -- Element change

	add_test_cases_to_suite (a_suite: TS_TEST_SUITE)
			-- Add test cases to `a_suite'.
		do
			a_suite.put_test (Current)
		end

feature -- Execution

	execute (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		local
			l_collecting: BOOLEAN
			l_enabled_test_cases: detachable DS_LINKED_LIST [RX_REGULAR_EXPRESSION]
			l_disabled_test_cases: detachable DS_LINKED_LIST [RX_REGULAR_EXPRESSION]
		do
			l_enabled_test_cases := a_summary.enabled_test_cases
			l_disabled_test_cases := a_summary.disabled_test_cases
			if (l_enabled_test_cases = Void or else l_enabled_test_cases.there_exists (agent {RX_REGULAR_EXPRESSION}.recognizes (name))) and then (l_disabled_test_cases = Void or else not l_disabled_test_cases.there_exists (agent {RX_REGULAR_EXPRESSION}.recognizes (name))) then
				l_collecting := memory.collecting
				assertions.reset
				a_summary.start_test (Current)
				if a_summary.fail_on_rescue then
					execute_without_rescue (a_summary)
				else
					execute_with_rescue (a_summary)
				end
				a_summary.end_test (Current, assertions.count)
				assertions.reset
					-- Make sure that the garbage collector is in the
					-- same state as before running the test.
				if l_collecting /= memory.collecting then
					if l_collecting then
						memory.collection_on
						memory.full_collect
						memory.full_coalesce
					else
						memory.collection_off
					end
				end
			end
		end

	set_up
			-- Setup for a test.
			-- (Can be redefined in descendant classes.)
		do
		end

	tear_down
			-- Tear down after a test.
			-- (Can be redefined in descendant classes.)
		do
		end

	default_test
			-- Run default test case.
			-- (Can be redefined in descendant classes.)
		do
		end

feature -- Registration

	register_test_case (a_tester: TS_TESTER; a_test_name: STRING; a_test_feature: PROCEDURE)
			-- Register `a_test_feature' in `a_tester' with name `a_test_name'.
		require
			a_tester_not_void: a_tester /= Void
			a_test_name_not_void: a_test_name /= Void
			a_test_feature_not_void: a_test_feature /= Void
			a_test_feature_target: a_test_feature.target = Current
		do
			set_test (a_test_name, a_test_feature)
			a_tester.put_test (Current)
		end

	register_cloned_test_case (a_tester: TS_TESTER; a_test_name: STRING; a_test_feature: PROCEDURE)
			-- Register `a_test_feature' in `a_tester' with name `a_test_name'
			-- using a clone of `Current' as test case object.
		require
			a_tester_not_void: a_tester /= Void
			a_test_name_not_void: a_test_name /= Void
			a_test_feature_not_void: a_test_feature /= Void
			a_test_feature_target: a_test_feature.target = Current
		local
			l_test_case: like Current
		do
			l_test_case := twin
			a_test_feature.set_target (l_test_case)
			l_test_case.set_test (a_test_name, a_test_feature)
			a_tester.put_test (l_test_case)
		end

	register_test_cases (a_tester: TS_TESTER)
			-- Register all test cases in `features_under_test'.
			-- Can be redefined to provide more meaningful test names.
		require
			a_tester_not_void: a_tester /= Void
		local
			i, nb: INTEGER
			l_features: like features_under_test
		do
			l_features := features_under_test
			i := l_features.lower
			nb := l_features.upper
			if i <= nb then
				register_test_case (a_tester, generator + ".test#" + i.out, l_features.item (i))
				from
					i := i + 1
				until
					i > nb
				loop
					register_cloned_test_case (a_tester, generator + ".test#" + i.out, l_features.item (i))
					i := i + 1
				end
			end
		end

	features_under_test: ARRAY [PROCEDURE]
			-- Features to be registered to the test harness
			-- using `register_test_cases'
		once
			Result := array_routines.make_empty_with_lower (1)
		ensure
			features_under_test_not_void: Result /= Void
--			no_void_feature_under_test: not Result.has (Void)
--			features_under_test_target: forall f in Result, f.target = Current
		end

feature {NONE} -- Execution

	execute_without_rescue (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		local
			i, nb: INTEGER
			an_error_messages: DS_ARRAYED_LIST [STRING]
		do
			set_up
			if attached internal_test_feature as l_internal_test_feature then
				l_internal_test_feature.call ([])
			else
				default_test
			end
			tear_down
			an_error_messages := assertions.error_messages
			nb := an_error_messages.count
			if nb = 0 then
				a_summary.put_success (Current)
			else
				from
					i := 1
				until
					i > nb
				loop
					a_summary.put_failure (Current, an_error_messages.item (i))
					i := i + 1
				end
			end
		end

	execute_with_rescue (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		local
			retried: BOOLEAN
			i, nb: INTEGER
			an_error_messages: DS_ARRAYED_LIST [STRING]
			l_message: detachable STRING
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
						from
							i := 1
						until
							i > nb
						loop
							a_summary.put_failure (Current, an_error_messages.item (i))
							i := i + 1
						end
					end
				else
						-- Get exception trace.
					l_message := Exceptions.exception_trace
					if l_message = Void or else l_message.is_empty then
						l_message := "Eiffel exception"
					else
						l_message := "Eiffel exception%N" + l_message
					end
					logger.report_abort (l_message)
						-- Report any test failure before reporting the Eiffel exception.
					an_error_messages := assertions.error_messages
					nb := an_error_messages.count
					from
						i := 1
					until
						i > nb
					loop
						a_summary.put_failure (Current, an_error_messages.item (i))
						i := i + 1
					end
						-- Report the Eiffel exception.
					a_summary.put_abort (Current, l_message)
				end
			end
		rescue
			if not retried then
				retried := True
				retry
			end
		end

feature {NONE} -- Implementation

	internal_name: detachable STRING
			-- Internal implementation of `name'

	internal_test_feature: detachable PROCEDURE
			-- Internal implementation of test feature to be executed
			-- (Should be an agent to one of test features of the current test case.)

	internal_variables: detachable TS_VARIABLES
			-- Internal implementation of `variables'

	internal_assertions: detachable TS_ASSERTIONS
			-- Internal implementation of `assertions'

	internal_logger: detachable TS_TEST_LOGGER
			-- Internal implementation of `logger'

	array_routines: KL_ARRAY_ROUTINES [PROCEDURE]
			-- Routines that ought to be in class "ARRAY"
		once
			create Result
		ensure
			array_routines_not_void: Result /= Void
		end

feature {NONE} -- Constants

	default_test_name: STRING = "Default test"
			-- Name for default test

end
