indexing

	description:

		"Test for validity rule VUOT-1"

	remark: "[
		In this test the object-test local `a' in an inline agent has the same
		name as the object-test local of the enclosing feature whose scope
		contains the inline agent declaration.

		ECMA 367-2, section 8.24.3 p.127: "Validity: Object Test rule"
		Validity code: VUOT-1
		An Object_test 'ot' of the form '{x: T} exp' is valid if and only if
		it satisfies the following conditions:
		1. 'x' does not have the same lower name as any feature of the enclosing
		   class, or any formal argument or local variable of any enclosing feature
		   or Inline_agent, or, if 'ot' appears in the scope of any other Object_test,
		   its Object-Test Local.

		This rule should be extended to say that if 'ot' appears in an inline agent,
		'x' should not have the same lower-name as an object-test local of an
		enclosing feature or inline agent whose scope contains the declaration of
		this inline agent. See message sent by Eric Bezault to ECMA on 19 April 2008.

		Note that neither Gobo nor ISE implement this extension.
	]"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VUOT1_TEST1

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity is
			-- Test for validity rule VUOT-1.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING is
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vuot1">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING is
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end
