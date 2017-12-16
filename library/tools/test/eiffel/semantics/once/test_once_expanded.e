note

	description:

		"Test semantics of once functions with no non-basic expanded types"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ONCE_EXPANDED

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_once_basic_expanded
			-- Test once functions with basic expanded types.
		do
			assert_integers_equal ("first_call", 1, f1 (1))
			assert_integers_equal ("second_call", 1, f1 (2))
		end
		
	test_once_non_basic_expanded
			-- Test once functions with non-basic expanded types.
		do
			assert_integers_equal ("first_call", 1, f2 (1).attr)
			assert_integers_equal ("second_call", 1, f2 (2).attr)
		end

feature -- Once functions

	f1 (i: INTEGER): INTEGER
			-- Once function with basic expanded type
		once
			Result := i
		end
		
	f2 (i: INTEGER): AA_EXPANDED
			-- Once function with non-basic expanded type
		once
			Result.set_attr (i)
		end

end
