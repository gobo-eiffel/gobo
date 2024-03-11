note

	description:

		"Test 'hello_world' example"

	library: "Gobo Eiffel Common Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ETEST_HELLO_WORLD

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "hello_world"
			-- Program name

	library_name: STRING = "common"
			-- Library name of example

feature -- Test

	test_hello_world
			-- Test 'hello_world' example.
		do
			compile_program
		end

end
