note

	description:

		"Test for validity rule VJAR"

	remark: "[
		This is a regression test for gec and gelint, where a VJAR validity error
		was reported in this case:
		
		    local
		         s: like foo.out
		    do
		         s := foo.out
		    end
		
		with `foo' an attribute of type G (the generic paramater of the enclosing
		class), claiming that STRING does not conform to STRING.
	]"
	
	copyright: "Copyright (c) 2013-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_VJAR_TEST4

inherit

	EIFFEL_TEST_CASE

create

	make_default

feature -- Test

	test_validity
			-- Test for validity rule VJAR.
		do
			compile_and_test ("test4")
		end

feature {NONE} -- Implementation

	rule_dirname: STRING
			-- Name of the directory containing the tests of the rule being tested
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "tools", "test", "eiffel", "validity", "vjar">>)
			Result := Execution_environment.interpreted_string (Result)
		end

	testdir: STRING
			-- Name of temporary directory where to run the test
		do
			Result := "Ttest4"
		end

end
