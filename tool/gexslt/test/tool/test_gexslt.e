note

	description:

		"Test 'gexslt'"

	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEXSLT

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gexslt"
			-- Program name

feature -- Test

	test_gec
			-- Test 'gexslt'.
		do
			compile_program
		end

end
