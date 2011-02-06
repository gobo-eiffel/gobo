note

	description:

		"Test features of class DS_HASH_TABLE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_HASH_TABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_hash_table1
			-- Test features of DS_HASH_TABLE.
		local
			a_table: DS_HASH_TABLE [INTEGER, INTEGER]
		do
			create a_table.make (10)
			assert ("empty1", a_table.is_empty)
			assert_integers_equal ("capacity", 10, a_table.capacity)
			a_table.put (1, 1)
			a_table.force (2, 2)
			a_table.put_new (3, 3)
			a_table.force_new (4, 4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4>>, a_table.to_array)
			assert ("has_1", a_table.has (1))
			assert ("has_2", a_table.has (2))
			assert ("has_3", a_table.has (3))
			assert ("has_4", a_table.has (4))
			assert ("not_has_5", not a_table.has (5))
			a_table.remove (3)
			assert ("not_has_3", not a_table.has (3))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 4>>, a_table.to_array)
			a_table.force_last (10, 10)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 4, 10>>, a_table.to_array)
			a_table.put (5, 5)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 5, 4, 10>>, a_table.to_array)
			a_table.remove (10)
			a_table.put (6, 6)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 5, 4, 6>>, a_table.to_array)
			a_table.remove (6)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 5, 4>>, a_table.to_array)
			a_table.put (7, 7)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 5, 4, 7>>, a_table.to_array)
			a_table.wipe_out
			assert ("empty2", a_table.is_empty)
			a_table.put (8, 8)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (8)>>, a_table.to_array)
			a_table.put (8, 8)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (8)>>, a_table.to_array)
		end

	test_keys
			-- Test feature 'keys'.
		local
			l_table: DS_HASH_TABLE [STRING, INTEGER]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_table.make (5)
			l_table.put_last ("five", 5)
			l_table.put_last ("four", 4)
			l_table.put_last ("three", 3)
			l_table.put_last ("two", 2)
			l_table.put_last ("one", 1)
			create l_list.make_from_linear (l_table.keys)
			assert_iarrays_same ("keys", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, l_list.to_array)
		end

	test_do_all
			-- Test feature `do_all'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last (1, "one")
			a_table1.force_last (2, "two")
			a_table1.force_last (3, "three")
			a_table1.force_last (4, "four")
			a_table1.force_last (5, "five")
			create a_list2.make (5)
			a_table1.do_all (agent a_list2.force_first)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, a_list2.to_array)
				-- Empty table.
			create a_table1.make (0)
			create a_list2.make (0)
			a_table1.do_all (agent a_list2.force_first)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_all_with_index
			-- Test feature `do_all_with_index'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
			an_array2: ARRAY [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last (5, "five")
			a_table1.force_last (4, "four")
			a_table1.force_last (3, "three")
			a_table1.force_last (2, "two")
			a_table1.force_last (1, "one")
			create an_array2.make_filled (0, 0, 6)
			a_table1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 5, 4, 3, 2, 1, 0>>, an_array2)
				-- Empty table.
			create a_table1.make (0)
			create an_array2.make_filled (0, 0, 1)
			a_table1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_do_if
			-- Test feature `do_if'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last (1, "one")
			a_table1.force_last (2, "two")
			a_table1.force_last (3, "three")
			a_table1.force_last (4, "four")
			a_table1.force_last (5, "five")
			create a_list2.make (5)
			a_table1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (4), 2>>, a_list2.to_array)
				-- Empty table.
			create a_table1.make (0)
			create a_list2.make (0)
			a_table1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_if_with_index
			-- Test feature `do_if_with_index'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
			an_array2: ARRAY [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last (5, "five")
			a_table1.force_last (2, "two")
			a_table1.force_last (6, "six")
			a_table1.force_last (4, "four")
			a_table1.force_last (1, "one")
			create an_array2.make_filled (0, 1, 5)
			a_table1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 2, 0, 4, 0>>, an_array2)
				-- Empty table.
			create a_table1.make (0)
			create an_array2.make_filled (0, 0, 1)
			a_table1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_there_exists
			-- Test feature `there_exists'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
		do
			create a_table1.make (5)
			a_table1.force_last (1, "one")
			a_table1.force_last (2, "two")
			a_table1.force_last (3, "three")
			a_table1.force_last (4, "four")
			a_table1.force_last (5, "five")
			assert ("there_exists1", a_table1.there_exists (agent INTEGER_.is_even))
			create a_table1.make (3)
			a_table1.force_last (1, "one")
			a_table1.force_last (3, "three")
			a_table1.force_last (5, "five")
			assert ("there_dont_exist1", not a_table1.there_exists (agent INTEGER_.is_even))
				-- Empty table.
			create a_table1.make (0)
			assert ("there_dont_exist2", not a_table1.there_exists (agent INTEGER_.is_even))
		end

	test_for_all
			-- Test feature `for_all'.
		local
			a_table1: DS_HASH_TABLE [INTEGER, STRING]
		do
			create a_table1.make (5)
			a_table1.force_last (1, "one")
			a_table1.force_last (2, "two")
			a_table1.force_last (3, "three")
			a_table1.force_last (4, "four")
			a_table1.force_last (5, "five")
			assert ("not_for_all1", not a_table1.for_all (agent INTEGER_.is_even))
			create a_table1.make (3)
			a_table1.force_last (2, "two")
			a_table1.force_last (4, "four")
			a_table1.force_last (6, "six")
			assert ("for_all1", a_table1.for_all (agent INTEGER_.is_even))
				-- Empty table.
			create a_table1.make (0)
			assert ("for_all2", a_table1.for_all (agent INTEGER_.is_even))
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

end
