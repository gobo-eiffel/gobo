indexing

	description:

		"Test 'gepp'"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEPP

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "gepp"
			-- Tool name

feature -- Test

	test_gepp is
			-- Test 'gepp'.
		do
			compile_tool
		end

end
