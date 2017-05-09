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
			assert_integers_equal ("one", 1, f (1))
		end

feature -- Once function

	f (i: INTEGER): INTEGER
			-- Recursive once function
		once
			Result := i
			Result := f (i + 1)
		end

end
