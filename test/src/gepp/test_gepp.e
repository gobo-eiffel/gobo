indexing

	description:

		"Test 'gepp'"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

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

end -- class TEST_GEPP
