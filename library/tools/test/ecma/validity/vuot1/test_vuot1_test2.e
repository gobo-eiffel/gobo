note

	description:

		"Test for validity rule VUOT-1"

	remark: "[
		In this test two object-tests with the same local `x' appear in the
		same expression. This is not forbidden by ECMA yet:

		ECMA 367-2, section 8.24.3 p.127: "Validity: Object Test rule"
		Validity code: VUOT-1
		An Object_test 'ot' of the form '{x: T} exp' is valid if and only if
		it satisfies the following conditions:
		1. 'x' does not have the same lower name as any feature of the enclosing
		   class, or any formal argument or local variable of any enclosing feature
		   or Inline_agent, or, if 'ot' appears in the scope of any other Object_test,
		   its Object-Test Local.

		But in the agenda of ECMA meeting on 6 March 2009, it is suggested that
		it would be also forbidden to have two object-tests with the same local
		name appearing in the same expression to avoid scope intersection (i.e.
		two object-tests with the same local name and whose scopes can overlap)
		as shown in the current test.
	]"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VUOT1_TEST2

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VUOT-1.
		do
			compile_and_test ("test2")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vuot1">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest2"
		end

end
