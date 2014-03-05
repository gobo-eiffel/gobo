note

	description:

		"Test for validity rule VFAV-4"

	remark: "[
		A function with a parenthesis alias must have a least
		one argument.
	]"
	
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VFAV4_TEST2

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VFAV-4.
		do
			compile_and_test ("test2")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vfav4">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest2"
		end

end
