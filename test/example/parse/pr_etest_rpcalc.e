indexing

	description:

		"Test 'rpcalc' example"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_ETEST_RPCALC

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "rpcalc"
			-- Example name

	library: STRING is "parse"
			-- Library name of example

feature -- Test

	test_rpcalc is
			-- Test 'rpcalc' example.
		do
			compile_example
		end

end -- class PR_ETEST_RPCALC
