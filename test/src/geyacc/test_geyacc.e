note

	description:

		"Test 'geyacc'"

	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEYACC

inherit

	TOOL_TEST_CASE

create

	make_default

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
