note

	description:

		"Test 'event/print' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_ETEST_PRINT

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "print"
			-- Program name

	library_name: STRING = "xml"
			-- Library name of example

feature -- Test

	test_print
			-- Test 'event/print' example.
		do
			compile_program
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "event", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
