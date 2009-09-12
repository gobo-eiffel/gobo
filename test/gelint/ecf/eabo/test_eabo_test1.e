indexing

	description:

		"Test for ECF error EABO"

	remark: "[
		In this test the UUID field is missing in lib1.ecf.
	]"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EABO_TEST1

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity is
			-- Test for ECF error EABO.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING is
			-- Name of the directory containing the tests of the ECF error being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "ecf", "eabo">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end
