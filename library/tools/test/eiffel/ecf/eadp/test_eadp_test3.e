note

	description:

		"Test for ECF error EADP"

	remark: "[
		In this test the capability 'support' specified for current target
		is not supported by the default capability 'support' in lib1.ecf.
	]"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EADP_TEST3

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for ECF error EADP.
		do
			compile_and_test ("test3")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the ECF error being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "ecf", "eadp">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest3"
		end

end
