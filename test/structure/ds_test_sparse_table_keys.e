indexing

	description:

		"Test features of class DS_SPARSE_TABLE_KEYS"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_SPARSE_TABLE_KEYS

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_do_all is
			-- Test feature `do_all'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("one", 1)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("five", 5)
			create a_list2.make (5)
			a_table1.keys.do_all (agent a_list2.force_first)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, a_list2.to_array)
				-- Empty table.
			create a_table1.make (0)
			create a_list2.make (0)
			a_table1.keys.do_all (agent a_list2.force_first)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_all_with_index is
			-- Test feature `do_all_with_index'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("five", 5)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("one", 1)
			create an_array2.make (0, 6)
			a_table1.keys.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 5, 4, 3, 2, 1, 0>>, an_array2)
				-- Empty table.
			create a_table1.make (0)
			create an_array2.make (0, 1)
			a_table1.keys.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_do_if is
			-- Test feature `do_if'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("one", 1)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("five", 5)
			create a_list2.make (5)
			a_table1.keys.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (4), 2>>, a_list2.to_array)
				-- Empty table.
			create a_table1.make (0)
			create a_list2.make (0)
			a_table1.keys.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_if_with_index is
			-- Test feature `do_if_with_index'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("five", 5)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("six", 6)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("one", 1)
			create an_array2.make (1, 5)
			a_table1.keys.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 2, 0, 4, 0>>, an_array2)
				-- Empty table.
			create a_table1.make (0)
			create an_array2.make (0, 1)
			a_table1.keys.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_there_exists is
			-- Test feature `there_exists'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("one", 1)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("five", 5)
			assert ("there_exists1", a_table1.keys.there_exists (agent INTEGER_.is_even))
			create a_table1.make (3)
			a_table1.force_last ("one", 1)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("five", 5)
			assert ("there_dont_exist1", not a_table1.keys.there_exists (agent INTEGER_.is_even))
				-- Empty table.
			create a_table1.make (0)
			assert ("there_dont_exist2", not a_table1.keys.there_exists (agent INTEGER_.is_even))
		end

	test_for_all is
			-- Test feature `for_all'.
		local
			a_table1: DS_HASH_TABLE [STRING, INTEGER]
		do
			create a_table1.make (5)
			a_table1.force_last ("one", 1)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("three", 3)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("five", 5)
			assert ("not_for_all1", not a_table1.keys.for_all (agent INTEGER_.is_even))
			create a_table1.make (3)
			a_table1.force_last ("two", 2)
			a_table1.force_last ("four", 4)
			a_table1.force_last ("six", 6)
			assert ("for_all1", a_table1.keys.for_all (agent INTEGER_.is_even))
				-- Empty table.
			create a_table1.make (0)
			assert ("for_all2", a_table1.keys.for_all (agent INTEGER_.is_even))
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
