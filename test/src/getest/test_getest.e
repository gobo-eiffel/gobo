indexing

	description:

		"Test 'getest'"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GETEST

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "getest"
			-- Tool name

feature -- Test

	test_getest is
			-- Test 'getest'.
		do
			compile_tool
		end

end
