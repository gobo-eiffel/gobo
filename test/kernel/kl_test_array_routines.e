note

	description:

		"Test features of class KL_ARRAY_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_ARRAY_ROUTINES

inherit

	KL_TEST_CASE

create

	make_default

feature -- Test

	test_has
			-- Test feature `has'.
		local
			l_ri: KL_ARRAY_ROUTINES [INTEGER]
			l_rs: KL_ARRAY_ROUTINES [STRING]
			l_ai: ARRAY [INTEGER]
			l_as: ARRAY [STRING]
			l_s1: STRING
			l_s2: STRING
		do
			create l_ri
			l_ai := <<INTEGER_.to_integer (1), 2, 3, 4>>
			assert ("ai_has_one", l_ri.has (l_ai, 1))
			assert ("ai_has_two", l_ri.has (l_ai, 2))
			assert ("ai_has_three", l_ri.has (l_ai, 3))
			assert ("ai_has_four", l_ri.has (l_ai, 4))
			assert ("ai_not_has_ten", not l_ri.has (l_ai, 10))
			create l_rs
			l_s1 := "foo"
			l_s2 := "bar"
			l_as := <<l_s1, l_s2>>
			assert ("as_has_foo", l_rs.has (l_as, l_s1))
			assert ("as_has_bar", l_rs.has (l_as, l_s2))
			assert ("as_not_has_clone_foo", not l_rs.has (l_as, "foo"))
		end

	test_subarray
			-- Test feature `subarray'.
		local
			l_ri: KL_ARRAY_ROUTINES [INTEGER]
			l_ai1: ARRAY [INTEGER]
			l_ai2: ARRAY [INTEGER]
		do
			create l_ri
			l_ai1 := <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>
			l_ai2 := l_ri.subarray (l_ai1, 3, 5, 7)
			assert_iarrays_same ("same_items", <<INTEGER_.to_integer (3), 4, 5>>, l_ai2)
			assert_integers_equal ("lower_set", 7, l_ai2.lower)
			assert_integers_equal ("upper_set", 9, l_ai2.upper)
				-- Empty subarray.
			l_ai2 := l_ri.subarray (l_ai1, 6, 5, 9)
			assert_integers_equal ("same_items2", 0, l_ai2.count)
			assert_integers_equal ("lower_set2", 9, l_ai2.lower)
			assert_integers_equal ("upper_set2", 8, l_ai2.upper)
				-- Subarray of an empty array.
			create l_ai1.make (4, 3)
			l_ai2 := l_ri.subarray (l_ai1, 4, 3, 2)
			assert_integers_equal ("same_items3", 0, l_ai2.count)
			assert_integers_equal ("lower_set3", 2, l_ai2.lower)
			assert_integers_equal ("upper_set3", 1, l_ai2.upper)
		end

	test_subcopy
			-- Test feature `subcopy'.
		local
			l_ri: KL_ARRAY_ROUTINES [INTEGER]
			l_ai1, l_ai2: ARRAY [INTEGER]
		do
			create l_ri
			create l_ai1.make (2, 6)
			l_ai1.put (1, 2)
			l_ai1.put (2, 3)
			l_ai1.put (3, 4)
			l_ai1.put (4, 5)
			l_ai1.put (5, 6)
			create l_ai2.make (10, 13)
			l_ai2.put (10, 10)
			l_ai2.put (11, 11)
			l_ai2.put (12, 12)
			l_ai2.put (13, 13)
			l_ri.subcopy (l_ai1, l_ai2, 11, 10, 6)
			assert_iarrays_same ("l_ai1_subcopy1", <<INTEGER_.to_integer (1), 2, 3, 4, 5>>, l_ai1)
			assert_iarrays_same ("l_ai2_same1", <<INTEGER_.to_integer (10), 11, 12, 13>>, l_ai2)
			l_ri.subcopy (l_ai1, l_ai2, 11, 12, 4)
			assert_iarrays_same ("l_ai1_subcopy2", <<INTEGER_.to_integer (1), 2, 11, 12, 5>>, l_ai1)
			assert_iarrays_same ("l_ai2_same2", <<INTEGER_.to_integer (10), 11, 12, 13>>, l_ai2)
		end

end
