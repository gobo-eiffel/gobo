note

	description:

		"Test 'gec'"

	copyright: "Copyright (c) 2006-2025, Eric Bezault and others"
	license: "MIT License"

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
			if eiffel_compiler.is_ge and then not variables.has ("debug") then
				run_validation
			end
		end

end
