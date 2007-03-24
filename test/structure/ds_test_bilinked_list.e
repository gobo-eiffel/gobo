indexing

	description:

		"Test features of class DS_BILINKED_LIST"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TEST_BILINKED_LIST

inherit

	TS_TEST_CASE

feature -- Test

	test_do_all is
			-- Test feature `do_all'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			create a_list2.make (5)
			a_list1.do_all (agent a_list2.force_first)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, a_list2.to_array)
				-- Empty list.
			create a_list1.make
			create a_list2.make (0)
			a_list1.do_all (agent a_list2.force_first)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_all_with_index is
			-- Test feature `do_all_with_index'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (5), 4, 3, 2, 1>>)
			create an_array2.make (0, 6)
			a_list1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 5, 4, 3, 2, 1, 0>>, an_array2)
				-- Empty list.
			create a_list1.make
			create an_array2.make (0, 1)
			a_list1.do_all_with_index (agent an_array2.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_do_if is
			-- Test feature `do_if'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
			a_list2: DS_ARRAYED_LIST [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			create a_list2.make (5)
			a_list1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (4), 2>>, a_list2.to_array)
				-- Empty list.
			create a_list1.make
			create a_list2.make (0)
			a_list1.do_if (agent a_list2.force_first, agent INTEGER_.is_even)
			assert ("empty1", a_list2.is_empty)
		end

	test_do_if_with_index is
			-- Test feature `do_if_with_index'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
			an_array2: ARRAY [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (5), 2, 6, 4, 1>>)
			create an_array2.make (1, 5)
			a_list1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 2, 0, 4, 0>>, an_array2)
				-- Empty list.
			create a_list1.make
			create an_array2.make (0, 1)
			a_list1.do_if_with_index (agent an_array2.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, an_array2)
		end

	test_there_exists is
			-- Test feature `there_exists'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			assert ("there_exists1", a_list1.there_exists (agent INTEGER_.is_even))
			create a_list1.make_from_array (<<INTEGER_.to_integer (1), 3, 5>>)
			assert ("there_dont_exist1", not a_list1.there_exists (agent INTEGER_.is_even))
				-- Empty list.
			create a_list1.make
			assert ("there_dont_exist2", not a_list1.there_exists (agent INTEGER_.is_even))
		end

	test_for_all is
			-- Test feature `for_all'.
		local
			a_list1: DS_BILINKED_LIST [INTEGER]
		do
			create a_list1.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			assert ("not_for_all1", not a_list1.for_all (agent INTEGER_.is_even))
			create a_list1.make_from_array (<<INTEGER_.to_integer (2), 4, 6>>)
			assert ("for_all1", a_list1.for_all (agent INTEGER_.is_even))
				-- Empty list.
			create a_list1.make
			assert ("for_all2", a_list1.for_all (agent INTEGER_.is_even))
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
