indexing

	description:

		"Test 'geyacc'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEYACC

inherit

	TOOL_TEST_CASE

feature -- Access

	program_name: STRING is "geyacc"
			-- Program name

feature -- Test

	test_geyacc is
			-- Test 'geyacc'.
		do
			compile_program
		end

end
