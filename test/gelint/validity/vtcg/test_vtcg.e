note

	description:

		"VTCG test cases"

	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_VTCG

inherit

	GELINT_TEST_CASE

feature -- Test

	test_1
			-- Test #1.
		do
			compile_and_test ("test1")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "gelint", "validity", "vtcg">>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
