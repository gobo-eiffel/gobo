note

	description:

		"Tests"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class TS_TEST

feature -- Access

	name: STRING
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	variables: TS_VARIABLES
			-- Defined variables
		deferred
		ensure
			variables_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of test cases
		deferred
		ensure
			count_positive: Result >= 0
		end

feature -- Element change

	add_test_cases_to_suite (a_suite: TS_TEST_SUITE)
			-- Add test cases to `a_suite'.
		require
			a_suite_not_void: a_suite /= Void
		deferred
		ensure
			test_cases_added: a_suite.count = old a_suite.count + count
		end

feature -- Execution

	execute (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		require
			a_summary_not_void: a_summary /= Void
		deferred
		end

end
