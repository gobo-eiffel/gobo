indexing

	description:

		"Test features of class DS_HASH_SET"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_HASH_SET

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_hash_set1 is
			-- Test features of DS_HASH_SET.
		local
			a_set: DS_HASH_SET [INTEGER]
		do
			create a_set.make (10)
			assert ("empty1", a_set.is_empty)
			assert_integers_equal ("capacity", 10, a_set.capacity)
			a_set.put (1)
			a_set.force (2)
			a_set.put_new (3)
			a_set.force_new (4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4>>, a_set.to_array)
			assert ("has_1", a_set.has (1))
			assert ("has_2", a_set.has (2))
			assert ("has_3", a_set.has (3))
			assert ("has_4", a_set.has (4))
			assert ("not_has_5", not a_set.has (5))
			a_set.remove (3)
			assert ("not_has_3", not a_set.has (3))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 4>>, a_set.to_array)
			a_set.force_last (10)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 4, 10>>, a_set.to_array)
			a_set.put (5)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 5, 4, 10>>, a_set.to_array)
			a_set.remove (10)
			a_set.put (6)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 5, 4, 6>>, a_set.to_array)
			a_set.remove (6)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 5, 4>>, a_set.to_array)
			a_set.put (7)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 5, 4, 7>>, a_set.to_array)
			a_set.wipe_out
			assert ("empty2", a_set.is_empty)
			a_set.put (8)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (8)>>, a_set.to_array)
			a_set.put (8)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (8)>>, a_set.to_array)
		end

	test_do_all is
			-- Test feature `do_all'.
		local
			a_set1: DS_HASH_SET [INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (1)
			a_set1.force_last (2)
			a_set1.force_last (3)
			a_set1.force_last (4)
			a_set1.force_last (5)
			create a_list2.make (5)
			a_set1.do_all (agent a_list2.force_first)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, a_list2.to_array)
				-- Empty set.
			create a_set1.make (0)
			create a_list2.make (0)
			a_set1.do_all (agent a_list2.force_first)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_all_with_index is
			-- Test feature `do_all_with_index'.
		local
			a_set1: DS_HASH_SET [INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (5)
			a_set1.force_last (4)
			a_set1.force_last (3)
			a_set1.force_last (2)
			a_set1.force_last (1)
			create an_array2.make (0, 6)
			a_set1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 5, 4, 3, 2, 1, 0>>, an_array2)
				-- Empty set.
			create a_set1.make (0)
			create an_array2.make (0, 1)
			a_set1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_do_if is
			-- Test feature `do_if'.
		local
			a_set1: DS_HASH_SET [INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (1)
			a_set1.force_last (2)
			a_set1.force_last (3)
			a_set1.force_last (4)
			a_set1.force_last (5)
			create a_list2.make (5)
			a_set1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (4), 2>>, a_list2.to_array)
				-- Empty set.
			create a_set1.make (0)
			create a_list2.make (0)
			a_set1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_if_with_index is
			-- Test feature `do_if_with_index'.
		local
			a_set1: DS_HASH_SET [INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (5)
			a_set1.force_last (2)
			a_set1.force_last (6)
			a_set1.force_last (4)
			a_set1.force_last (1)
			create an_array2.make (1, 5)
			a_set1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 2, 0, 4, 0>>, an_array2)
				-- Empty set.
			create a_set1.make (0)
			create an_array2.make (0, 1)
			a_set1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_there_exists is
			-- Test feature `there_exists'.
		local
			a_set1: DS_HASH_SET [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (1)
			a_set1.force_last (2)
			a_set1.force_last (3)
			a_set1.force_last (4)
			a_set1.force_last (5)
			assert ("there_exists1", a_set1.there_exists (agent INTEGER_.is_even))
			create a_set1.make (3)
			a_set1.force_last (1)
			a_set1.force_last (3)
			a_set1.force_last (5)
			assert ("there_dont_exist1", not a_set1.there_exists (agent INTEGER_.is_even))
				-- Empty set.
			create a_set1.make (0)
			assert ("there_dont_exist2", not a_set1.there_exists (agent INTEGER_.is_even))
		end

	test_for_all is
			-- Test feature `for_all'.
		local
			a_set1: DS_HASH_SET [INTEGER]
		do
			create a_set1.make (5)
			a_set1.force_last (1)
			a_set1.force_last (2)
			a_set1.force_last (3)
			a_set1.force_last (4)
			a_set1.force_last (5)
			assert ("not_for_all1", not a_set1.for_all (agent INTEGER_.is_even))
			create a_set1.make (3)
			a_set1.force_last (2)
			a_set1.force_last (4)
			a_set1.force_last (6)
			assert ("for_all1", a_set1.for_all (agent INTEGER_.is_even))
				-- Empty set.
			create a_set1.make (0)
			assert ("for_all2", a_set1.for_all (agent INTEGER_.is_even))
		end

feature {NONE} -- Implementation

	same_integers (i, j: INTEGER): BOOLEAN is
			-- Is `i' equal to `j'?
			-- (Used as agent to test iterators.)
		do
			Result := (i = j)
		ensure
			definition: Result = (i = j)
		end

end
