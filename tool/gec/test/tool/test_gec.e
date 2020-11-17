note

	description:

		"Test 'gec'"

	copyright: "Copyright (c) 2006-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEC

inherit

	EIFFEL_TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gec"
			-- Program name

feature -- Test

	test_gec
			-- Test 'gec'.
		do
			compile_program
			if not eiffel_compiler.is_ise then
				run_validation
			end
		end

end
