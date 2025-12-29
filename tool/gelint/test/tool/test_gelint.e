note

	description:

		"Test 'gelint'"

	copyright: "Copyright (c) 2016-2025, Eric Bezault and others"
	license: "MIT License"

class TEST_GELINT

inherit

	EIFFEL_TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gelint"
			-- Program name

feature -- Test

	test_gelint
			-- Test 'gelint'.
		do
			compile_program
			if eiffel_compiler.is_ge and then not variables.has ("debug") then
				run_validation
			end
		end

end
