indexing

	description:

		"Test 'gegrep' example"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_ETEST_GEGREP

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "gegrep"
			-- Example name

	library: STRING is "lexical"
			-- Library name of example

feature -- Test

	test_gegrep is
			-- Test 'gegrep' example.
		do
			compile_example
		end

end -- class LX_ETEST_GEGREP
