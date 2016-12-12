note

	description:

		"Test for validity rule VEEN-8"

	remark: "[
		In this test, we have something like that:

			bb and then {l: STRING} s and then l.is_empty

		where `bb' is not a boolean expression. Therefore the expression
		'l.is_empty' is not in the scope of the object-test local.
		Indeed, the standard:

			ECMA 367-2, section 8.24.4 p.128: "Definition: Conjunctive,
			disjunctive, implicative; Term, semistrict term"

		explicitly mentions boolean operators between boolean expressions,
		and semi-strict operators (which are defined elsewhere in
		the standard to be exclusively parts of class BOOLEAN).
		So 'and then' with target `bb' does not meet the conditions.

		This is nevertheless accepted by ISE 6.2.7.2969, and not
		surprisingly results in a call-on-void-target at execution.
	]"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VEEN8_TEST1

inherit

	GELINT_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VEEN-8.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "veen8">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end
