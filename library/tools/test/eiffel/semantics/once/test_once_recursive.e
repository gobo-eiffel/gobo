note

	description:

		"Test semantics of recursive once functions"

	remark: "[
		ECMA 367-2, section 8.23.22 p.124: "Semantics: Once Routine Execution Semantics",
		says that the recursive calls to once-functions should return the value of
		'Result' as it was when the recursive calls occurred.
	]"

	copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ONCE_RECURSIVE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_once_recursive
			-- Test recursive once functions.
			-- ECMA 367-2, section 8.23.22 p.124: "Semantics: Once Routine Execution Semantics",
			-- says that the recursive calls to once-functions should return the value of
			-- 'Result' as it was when the recursive calls occurred.
		do
			assert_integers_equal ("one", 1, f1 (1))
		end

	test_once_non_basic_expanded
			-- Test recursive once functions with non-basic expanded types.
		do
			assert_integers_equal ("one", 1, f2 (1).attr)
		end
			
feature -- Once functions

	f1 (i: INTEGER): INTEGER
			-- Recursive once function
		once
			Result := 2
			assert_integers_equal ("two", 2, f1 (0))
			Result := i
		end

	f2 (i: INTEGER): AA_EXPANDED
			-- Recursive once function with non-basic expanded type
		once
			Result.set_attr (2)
			assert_integers_equal ("two", 2, f2 (0).attr)
			Result.set_attr (i)
		end
		
end
