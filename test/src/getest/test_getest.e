indexing

	description:

		"Test 'getest'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GETEST

inherit

	TOOL_TEST_CASE

feature -- Access

	program_name: STRING is "getest"
			-- Program name

feature -- Test

	test_getest is
			-- Test 'getest'.
		do
			compile_program
		end

end
