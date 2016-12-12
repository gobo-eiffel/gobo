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

	program_name: STRING = "gepp"
			-- Program name

feature -- Test

	test_gepp
			-- Test 'gepp'.
		do
			compile_program
		end

end
