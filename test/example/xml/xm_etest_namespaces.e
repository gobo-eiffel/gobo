indexing

	description:

		"Test 'tree/namespaces' example"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_ETEST_NAMESPACES

inherit

	EXAMPLE_TEST_CASE
		redefine
			program_dirname
		end

feature -- Access

	program_name: STRING is "namespaces"
			-- Program name

	library_name: STRING is "xml"
			-- Library name of example

feature -- Test

	test_namespaces is
			-- Test 'tree/namespaces' example.
		do
			if not eiffel_compiler.is_se then
					-- SE -0.74 crashes when compiling this example.
				compile_program
			end
		end

feature {NONE} -- Implementation

	program_dirname: STRING is
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"example", library_name, "tree", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
