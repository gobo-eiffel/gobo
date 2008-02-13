indexing

	description:

		"Test 'gegrep' example"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_ETEST_GEGREP

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING is "gegrep"
			-- Program name

	library_name: STRING is "lexical"
			-- Library name of example

feature -- Test

	test_gegrep is
			-- Test 'gegrep' example.
		do
			compile_program
		end

end
