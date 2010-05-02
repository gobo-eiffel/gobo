note

	description:

		"Test cases"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	set_test (a_name: like name; a_test_feature: PROCEDURE [TS_TEST_CASE, TUPLE])
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
			Result := internal_name
			if Result = Void then
				Result := default_test_name
			end
		end

	variables: TS_VARIABLES
			-- Defined variables
		do
			if internal_variables = Void then
				create internal_variables.make
			end
			Result := internal_variables
		end

	assertions: TS_ASSERTIONS
			-- Assertions
		do
			if internal_assertions = Void then
				create internal_assertions.make
			end
			Result := internal_assertions
		end

	test_logger: TS_TEST_LOGGER
			-- Logger for tests and assertion checkings
		obsolete
			"[080210] Use `logger' instead"
		do
			Result := logger
		end

	logger: TS_TEST_LOGGER
			-- Logger for tests and assertion checkings
		do
			if internal_logger = Void then
				create {TS_NULL_TEST_LOGGER} internal_logger.make
			end
			Result := internal_logger
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

	set_test_logger (a_logger: like test_logger)
			-- Set `logger' to `a_logger'.
		obsolete
			"[080210] Use `set_logger' instead"
		require
			a_logger_not_void: a_logger /= Void
		do
			set_logger (a_logger)
		ensure
			logger_set: logger = a_logger
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

feature -- Execution

	execute (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		local
			l_collecting: BOOLEAN
			l_enabled_test_cases: RX_REGULAR_EXPRESSION
		do
			l_enabled_test_cases := a_summary.enabled_test_cases
			if l_enabled_test_cases = Void or else l_enabled_test_cases.recognizes (name) then
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

	register_test_case (a_tester: TS_TESTER; a_test_name: STRING; a_test_feature: PROCEDURE [TS_TEST_CASE, TUPLE])
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

	register_cloned_test_case (a_tester: TS_TESTER; a_test_name: STRING; a_test_feature: PROCEDURE [TS_TEST_CASE, TUPLE])
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

	features_under_test: ARRAY [PROCEDURE [TS_TEST_CASE, TUPLE]]
			-- Features to be registered to the test harness
			-- using `register_test_cases'
		once
			create Result.make (1, 0)
		ensure
			features_under_test_not_void: Result /= Void
			no_void_feature_under_test: not Result.has (Void)
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
			if internal_test_feature /= Void then
				internal_test_feature.call ([])
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
			l_message: STRING
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
					logger.report_abort
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
					l_message := Exceptions.exception_trace
					if l_message = Void or else l_message.is_empty then
						l_message := "Eiffel exception"
					else
						l_message := "Eiffel exception%N" + l_message
					end
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

	internal_name: STRING
			-- Internal implementation of `name'

	internal_test_feature: PROCEDURE [TS_TEST_CASE, TUPLE]
			-- Internal implementation of test feature to be executed
			-- (Should be an agent to one of test features of the current test case.)

	internal_variables: TS_VARIABLES
			-- Internal implementation of `variables'

	internal_assertions: TS_ASSERTIONS
			-- Internal implementation of `assertions'

	internal_logger: TS_TEST_LOGGER
			-- Internal implementation of `logger'

feature {NONE} -- Constants

	default_test_name: STRING = "Default test"
			-- Name for default test

end
