indexing

	description:

		"Test 'gelex'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GELEX

inherit

	TOOL_TEST_CASE

create

	make_default

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
