indexing

	description:

		"Test 'xslt/serializer' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_ETEST_SERIALIZER

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

feature -- Access

	program_name: STRING is "serializer"
			-- Program name

	library_name: STRING is "xml"
			-- Library name of example

feature -- Test

	test_serializer is
			-- Test 'xslt/serializer' example.
		do
			compile_program
		end

feature {NONE} -- Implementation

	program_dirname: STRING is
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "xslt", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
