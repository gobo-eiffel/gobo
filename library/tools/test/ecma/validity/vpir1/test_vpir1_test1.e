note

	description:

		"Test for validity rule VPIR-1"

	remark: "[
		In this test the local variable `a' in an inline agent has the same
		name as the object-test local of the enclosing feature whose scope
		contains the inline agent declaration.

		ECMA 367-2, section 8.27.11 p.136: "Validity: Inline Agent Requirements"
		Validity code: VPIR-1
			An Inline_agent 'a' must satisfy the following conditions:
			1. No formal argument or local variable of 'a' has the same name as a feature
			   of the enclosing class, or a formal argument or local variable other than
			   'Result' of an enclosing feature or Inline_agent.

		This rule should be extended to say they should not have the same lower-name
		as an object-test local of an enclosing feature or inline agent whose scope
		contains the inline agent. See message sent by Eric Bezault to ECMA on 9 April 2008.
	]"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VPIR1_TEST1

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VPIR-1.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vpir1">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end

