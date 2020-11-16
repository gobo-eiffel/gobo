note

	description:

		"Test suites"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_TEST_SUITE

inherit

	TS_TEST

	ITERABLE [TS_TEST]

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_variables: like variables)
			-- Create a new test suite named `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_variables_not_void: a_variables /= Void
		do
			name := a_name
			variables := a_variables
			create tests.make
		ensure
			name_set: name = a_name
			variables_set: variables = a_variables
		end

feature -- Access

	name: STRING
			-- Name

	variables: TS_VARIABLES
			-- Defined variables

feature -- Measurement

	count: INTEGER
			-- Number of test cases
		local
			a_cursor: DS_LIST_CURSOR [TS_TEST]
		do
			a_cursor := tests.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				Result := Result + a_cursor.item.count
				a_cursor.forth
			end
		end

feature -- Element change

	add_test_cases_to_suite (a_suite: TS_TEST_SUITE)
			-- Add test cases to `a_suite'.
		local
			l_cursor: DS_LIST_CURSOR [TS_TEST]
		do
			l_cursor := tests.new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				l_cursor.item.add_test_cases_to_suite (a_suite)
				l_cursor.forth
			end
		end

feature -- Execution

	execute (a_summary: TS_SUMMARY)
			-- Run test and put results in `a_summary'.
		local
			a_cursor: DS_LIST_CURSOR [TS_TEST]
		do
			a_cursor := tests.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.execute (a_summary)
				a_cursor.forth
			end
		end

feature -- Element change

	put_test (a_test: TS_TEST)
			-- Add `a_test' to test suite.
		require
			a_test_not_void: a_test /= Void
		do
			tests.put_last (a_test)
		end

feature -- Iteration

	new_cursor: ITERATION_CURSOR [TS_TEST]
			-- <Precursor>
		do
			Result := tests.new_iterator
		end

feature {NONE} -- Implementation

	tests: DS_LINKED_LIST [TS_TEST]
			-- Tests held in test suite

invariant

	tests_not_void: tests /= Void
	no_void_test: not tests.has_void

end
