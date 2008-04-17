indexing

	description:

		"Test for validity rule VUEX-1"

	remark: "[
		In this test we call `a' in an inline agent, but `a' is a local variable
		of the enclosing feature.

		ECMA 367-2 gives the choice between two validity rules:
		VPIR-1, section 8.27.11 p.136: "Validity: Inline Agent Requirements"
			An Inline_agent 'a' must satisfy the following conditions:
			1. No formal argument or local variable of 'a' has the same name as a
			   feature of the enclosing class, or a formal argument or local
			   variable other than 'Result' of an enclosing feature or Inline_agent.
		VUEX-1, section 8.23.11 p.122: "Validity: Export rule"
			A Non_object_call of Type T and feature `fname' in a class C is valid
			if and only if it satisfies the following conditions:
			1. `fname' is the final name of a feature `f' of T.

		Gobo reports a VUEX-1 error. Note that ISE reports a VEEN error.
	]"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VUEX1_TEST2

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity is
			-- Test for validity rule VUEX-1.
		do
			compile_and_test ("test2")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING is
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vuex1">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest2"
		end

end

