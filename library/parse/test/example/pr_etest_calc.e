note

	description:

		"Test 'calc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_ETEST_CALC

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "calc"
			-- Program name

	library_name: STRING = "parse"
			-- Library name of example

feature -- Test

	test_calc
			-- Test 'calc' example.
		do
			compile_program
		end

end
