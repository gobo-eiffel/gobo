note

	description:

		"Test features of class DS_HASH_SET"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"

class DS_TEST_HASH_SET

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_hash_set1
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

	test_do_all
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

	test_do_all_with_index
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
			create an_array2.make_filled (0, 0, 6)
			a_set1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 5, 4, 3, 2, 1, 0>>, an_array2)
				-- Empty set.
			create a_set1.make (0)
			create an_array2.make_filled (0, 0, 1)
			a_set1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_do_if
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

	test_do_if_with_index
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
			create an_array2.make_filled (0, 1, 5)
			a_set1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 2, 0, 4, 0>>, an_array2)
				-- Empty set.
			create a_set1.make (0)
			create an_array2.make_filled (0, 0, 1)
			a_set1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_there_exists
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

	test_for_all
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

	test_compress
			-- Test feature 'compress'.
		local
			l_set: DS_HASH_SET [INTEGER]
		do
			create l_set.make_default
			l_set.force (5)
			l_set.force (6)
			l_set.force (10)
			l_set.remove (6)
			l_set.compress
			assert ("has_5", l_set.has (5))
			assert ("no_has_6", not l_set.has (6))
			assert ("has_10", l_set.has (10))
			assert_integers_equal ("count", 2, l_set.count)
		end

	test_reentrant_search_position
			-- Test reentrancy of feature 'search_position'.
		local
			a_set1: DS_HASH_SET [STRING]
		do
			create a_set1.make (5)
			a_set1.set_equality_tester (create {KL_AGENT_EQUALITY_TESTER [STRING]}.make (agent same_strings_with_side_effect (?, ?, a_set1)))
			a_set1.set_hash_function (create {KL_AGENT_HASH_FUNCTION [STRING]}.make (agent unique_string_hash_code))
			a_set1.force_last ("one")
			a_set1.force_last ("two")
			assert ("not_has_void", not a_set1.has_void)
		end

	test_force_new
			-- Test feature 'force_new'.
		local
			l_set1: DS_HASH_SET [INTEGER]
			l_array1: ARRAY [BOOLEAN]
		do
				-- Try to see what happens if we insert
				-- more items than the initial capacity.
			create l_set1.make (2)
			l_set1.force_new (1)
			l_set1.force_new (2)
			l_set1.force_new (3)
			create l_array1.make_filled (False, 1, 3)
			l_set1.do_all (agent l_array1.put (True, ?))
			assert_barrays_same ("items1", <<True, True, True>>, l_array1)
		end
		
feature {NONE} -- Implementation

	same_integers (i, j: INTEGER): BOOLEAN
			-- Is `i' equal to `j'?
			-- (Used as agent to test iterators.)
		do
			Result := (i = j)
		ensure
			definition: Result = (i = j)
		end

	same_strings_with_side_effect (s1, s2: STRING; a_set: DS_HASH_SET [STRING]): BOOLEAN
			-- Is `s1' equal to `s2'?
			-- (Used as agent to test iterators.)
			-- Make sure that a call to `a_set.search_position' is invoked.
		require
			a_set_not_void: a_set /= Void
		do
				-- Force a call to `a_set.search_position'.
			Result := not a_set.has_void
			Result := (s1 ~ s2)
		ensure
			definition: Result = (s1 ~ s2)
		end

	unique_string_hash_code (a_string: STRING): INTEGER
			-- Unique hash-code for all strings
		do
			Result := 1
		end

end
