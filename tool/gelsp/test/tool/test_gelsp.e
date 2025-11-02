note

	description:

		"Test 'gelsp'"

	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class TEST_GELSP

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gelsp"
			-- Program name

feature -- Test

	test_gelsp
			-- Test 'gelsp'.
		do
			compile_program
		end

end
