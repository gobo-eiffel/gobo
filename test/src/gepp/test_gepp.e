note

	description:

		"Test 'gepp'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEPP

inherit

	TOOL_TEST_CASE

create

	make_default

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
