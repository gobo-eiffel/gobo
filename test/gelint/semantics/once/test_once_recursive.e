indexing

	description:

		"Test semantics of recursive once functions"

	remark: "[
		See ECMA 367-2, section 8.23.22, page 124: Semantics: Once Routine Execution Semantics,
		which says that the recursive calls to once-functions should return the value of
		'Result' as it was when the recursive calls occurred.
	]"

	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ONCE_RECURSIVE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_once_recursive is
			-- Test recursive once functions.
			-- See ECMA 367-2, section 8.23.22, page 124: Semantics: Once Routine Execution Semantics,
			-- which says that the recursive calls to once-functions should return the value of
			-- 'Result' as it was when the recursive calls occurred.
		do
			assert_integers_equal ("one", 1, f)
		end

feature -- Once function

	f: INTEGER is
			-- Recursive once function
		once
			Result := 1
			Result := f
		end

end
