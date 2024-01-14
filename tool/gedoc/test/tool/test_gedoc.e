note

	description:

		"Test 'gedoc'"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class TEST_GEDOC

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gedoc"
			-- Program name

feature -- Test

	test_gedoc
			-- Test 'gedoc'.
		do
			compile_program
		end

end
