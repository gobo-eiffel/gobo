indexing

	description:

		"Test 'event/print' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_ETEST_PRINT

inherit

	EXAMPLE_TEST_CASE
		redefine
			example_dirname
		end

feature -- Access

	example: STRING is "print"
			-- Example name

	library: STRING is "xml"
			-- Library name of example

feature -- Test

	test_print is
			-- Test 'event/print' example.
		do
			compile_example
		end

feature {NONE} -- Implementation

	example_dirname: STRING is
			-- Name of example source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library, "event", example>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
