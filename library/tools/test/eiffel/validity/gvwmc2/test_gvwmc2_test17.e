note

	description:

		"Test for validity rule GVWMC-2"

	remark: "[
		In this test the hexadecimal integer constant '+0x80' (i.e. 128) in
		'{INTEGER_8} +0x80' is too big to be representable as an INTEGER_8,
		even though ISE compiler considers 0x80 (with no sign) as representable
		as an INTEGER_8 (with value -128).

		This rule is missing in ECMA 367-2.
		ISE reports a syntax error.
	]"

	copyright: "Copyright (c) 2009-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GVWMC2_TEST17

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule GVWMC-2.
		do
			compile_and_test ("test17")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "validity", "gvwmc2">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest17"
		end

end
