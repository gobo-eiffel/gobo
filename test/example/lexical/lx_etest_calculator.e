indexing

	description:

		"Test 'calculator' example"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_ETEST_CALCULATOR

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	example: STRING is "calculator"
			-- Example name

	library: STRING is "lexical"
			-- Library name of example

feature -- Test

	test_calculator is
			-- Test 'calculator' example.
		do
			if eiffel_compiler.is_hact then
				compile_example
			end
		end

end -- class LX_ETEST_CALCULATOR
