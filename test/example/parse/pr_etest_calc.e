indexing

	description:

		"Test 'calc' example"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_ETEST_CALC

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "calc"
			-- Example name

	library: STRING is "parse"
			-- Library name of example

feature -- Test

	test_calc is
			-- Test 'calc' example.
		do
			compile_example
		end

end -- class PR_ETEST_CALC
