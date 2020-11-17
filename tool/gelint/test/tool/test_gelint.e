note

	description:

		"Test 'gelint'"

	copyright: "Copyright (c) 2016-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			if not eiffel_compiler.is_ise then
				run_validation
			end
		end

end
