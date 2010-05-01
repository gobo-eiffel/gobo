note

	description:

		"Test 'rpcalc' example"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_ETEST_RPCALC

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING is "rpcalc"
			-- Program name

	library_name: STRING is "parse"
			-- Library name of example

feature -- Test

	test_rpcalc is
			-- Test 'rpcalc' example.
		do
			compile_program
		end

end
