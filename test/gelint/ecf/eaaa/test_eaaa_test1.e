indexing

	description:

		"Test for ECF error EAAA"

	remark: "[
		In this test the name of the library 'base' in lib1.ecf is missing.
	]"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EAAA_TEST1

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity is
			-- Test for ECF error EAAA.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING is
			-- Name of the directory containing the tests of the ECF error being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "ecf", "eaaa">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end
