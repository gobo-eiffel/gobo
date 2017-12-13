note

	description:

		"Test for ECF error EADQ"

	remark: "[
		In this test the capability 'use' specified
		is not supported by the default 'support'.
	]"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EADQ_TEST2

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for ECF error EADQ.
		do
			compile_and_test ("test2")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the ECF error being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "ecf", "eadq">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest2"
		end

end
