note

	description:

		"Test for ECF error EZCA"

	remark: "[
		In this test we have two empty capabilities <void_safety/>.
		This is invalid as per the XML specification, but it's accepted by ISE EiffelStudio.
	]"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_EZCA_TEST2

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for ECF error EZCA.
		do
			compile_and_test ("test2")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the ECF error being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "ecf", "ezca">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest2"
		end

end
