indexing

	description:

		"Test 'gelex'"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class TEST_GELEX

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "gelex"
			-- Tool name

feature -- Test

	test_gelex is
			-- Test 'gelex'.
		do
			compile_tool
		end

end -- class TEST_GELEX
