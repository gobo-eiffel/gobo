indexing

	description:

		"Test 'calc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class PR_ETEST_CALC

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	program_name: STRING is "calc"
			-- Program name

	library_name: STRING is "parse"
			-- Library name of example

feature -- Test

	test_calc is
			-- Test 'calc' example.
		do
			compile_program
		end

end
