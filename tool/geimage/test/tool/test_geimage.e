note

	description:

		"Test 'geimage'"

	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEIMAGE

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "geimage"
			-- Program name

feature -- Test

	test_geimage
			-- Test 'geimage'.
		do
			compile_program
		end

end
