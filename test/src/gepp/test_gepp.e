indexing

	description:

		"Test 'gepp'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEPP

inherit

	TOOL_TEST_CASE

feature -- Access

	program_name: STRING is "gepp"
			-- Program name

feature -- Test

	test_gepp is
			-- Test 'gepp'.
		do
			compile_program
		end

end
