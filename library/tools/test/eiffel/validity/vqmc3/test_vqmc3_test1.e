note

	description:

		"Test for validity rule VQMC-3"

	remark: "[
		In this test the hexadecimal integer constant '0x1000' in 'cc: INTEGER_8 = 0x1000'
		is too big to be representable as an INTEGER_8.

		This rule is in ECMA 367-2, section 8.18.2, p.100.
		ISE reports that the type of 0x1000 is INTEGER_32 and hence does not match
		the declared type INTEGER_8. This is not quite what ECMA 367-2 expects.
	]"

	copyright: "Copyright (c) 2009-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VQMC3_TEST1

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VQMC-3.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "validity", "vqmc3">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest1"
		end

end
