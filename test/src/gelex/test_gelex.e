indexing

	description:

		"Test 'gelex'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GELEX

inherit

	TOOL_TEST_CASE

feature -- Access

	program_name: STRING is "gelex"
			-- Program name

feature -- Test

	test_gelex is
			-- Test 'gelex'.
		do
			compile_program
		end

end
