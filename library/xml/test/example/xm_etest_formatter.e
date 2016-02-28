note

	description:

		"Test 'tree/formatter' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_ETEST_FORMATTER

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING = "formatter"
			-- Program name

	library_name: STRING = "xml"
			-- Library name of example

feature -- Test

	test_formatter
			-- Test 'tree/formatter' example.
		do
			compile_program
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", "tree", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
