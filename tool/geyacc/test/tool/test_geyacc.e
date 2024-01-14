note

	description:

		"Test 'geyacc'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"

class TEST_GEYACC

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "geyacc"
			-- Program name

feature -- Test

	test_geyacc
			-- Test 'geyacc'.
		do
			compile_program
		end

end
