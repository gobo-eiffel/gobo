note

	description:

		"Test for validity rule GVWMC-2"

	remark: "[
		In this test the deimal integer constant '128' in '{INTEGER_8} 128'
		is too big to be representable as an INTEGER_8.

		This rule is missing in ECMA 367-2.
		ISE reports a syntax error.
	]"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GVWMC2_TEST7

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule GVWMC-2.
		do
			compile_and_test ("test7")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "gvwmc2">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest7"
		end

end
