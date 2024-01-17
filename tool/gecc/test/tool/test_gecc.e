note

	description:

		"Test 'gecc'"

	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"

class TEST_GECC

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gecc"
			-- Program name

feature -- Test

	test_gecc
			-- Test 'gecc'.
		do
			compile_program
		end

end
