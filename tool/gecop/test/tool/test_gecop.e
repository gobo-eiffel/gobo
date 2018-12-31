note

	description:

		"Test 'gecop'"

	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GECOP

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gecop"
			-- Program name

feature -- Test

	test_gecop
			-- Test 'gecop'.
		do
			compile_program
		end

end
