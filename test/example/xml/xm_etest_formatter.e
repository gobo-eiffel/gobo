indexing

	description:

		"Test 'tree/formatter' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_ETEST_FORMATTER

inherit

	EXAMPLE_TEST_CASE
		redefine
			example_dirname
		end

feature -- Access

	example: STRING is "formatter"
			-- Example name

	library: STRING is "xml"
			-- Library name of example

feature -- Test

	test_formatter is
			-- Test 'tree/formatter' example.
		do
			compile_example
		end

feature {NONE} -- Implementation

	example_dirname: STRING is
			-- Name of example source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library, "tree", example>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
