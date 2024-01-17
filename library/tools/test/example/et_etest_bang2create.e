note

	description:

		"Test 'bang2create' example"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"

class ET_ETEST_BANG2CREATE

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "bang2create"
			-- Program name

	library_name: STRING = "tools"
			-- Library name of example

feature -- Test

	test_bang2create
			-- Test 'bang2create' example.
		do
			compile_program
		end

end
