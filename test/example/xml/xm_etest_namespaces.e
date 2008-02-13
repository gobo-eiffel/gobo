indexing

	description:

		"Test 'tree/namespaces' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_ETEST_NAMESPACES

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

create

	make_default

feature -- Access

	program_name: STRING is "namespaces"
			-- Program name

	library_name: STRING is "xml"
			-- Library name of example

feature -- Test

	test_namespaces is
			-- Test 'tree/namespaces' example.
		do
			compile_program
		end

feature {NONE} -- Implementation

	program_dirname: STRING is
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "tree", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
