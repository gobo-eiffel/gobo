indexing

	description:

		"Test 'mcalc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class PR_ETEST_MCALC

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "mcalc"
			-- Example name

	library: STRING is "parse"
			-- Library name of example

feature -- Test

	test_mcalc is
			-- Test 'mcalc' example.
		do
			compile_example
		end

end
