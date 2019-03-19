note

	description:

		"Test 'gelint'"

	copyright: "Copyright (c) 2016-2019, Eric Bezault and others"
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
			run_validation
		end

end
