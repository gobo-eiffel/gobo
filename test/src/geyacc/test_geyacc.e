indexing

	description:

		"Test 'geyacc'"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEYACC

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "geyacc"
			-- Tool name

feature -- Test

	test_geyacc is
			-- Test 'geyacc'.
		do
			compile_tool
		end

end -- class TEST_GEYACC
