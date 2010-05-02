note

	description:

		"Test 'pretty printer' example"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ETEST_PRETTY_PRINTER

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "pretty_printer"
			-- Program name

	library_name: STRING = "tools"
			-- Library name of example

feature -- Test

	test_pretty_printer
			-- Test 'pretty_printer' example.
		do
			compile_program
		end

end
