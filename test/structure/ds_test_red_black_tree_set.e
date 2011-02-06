note

	description:

		"Test features of class DS_RED_BLACK_TREE_SET"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2011, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_RED_BLACK_TREE_SET

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_red_black_tree_set
			-- Test features of DS_RED_BLACK_TREE_SET.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			assert ("empty1", l_set.is_empty)
			l_set.put (1)
			l_set.force (2)
			l_set.put_new (3)
			l_set.force_new (4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4>>, l_set.to_array)
			assert ("has_1", l_set.has (1))
			assert ("has_2", l_set.has (2))
			assert ("has_3", l_set.has (3))
			assert ("has_4", l_set.has (4))
			assert ("not_has_5", not l_set.has (5))
			l_set.remove (3)
			assert ("not_has_3", not l_set.has (3))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 4>>, l_set.to_array)
			l_set.force_last (10)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 4, 10>>, l_set.to_array)
			l_set.put (5)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 4, 5, 10>>, l_set.to_array)
			l_set.remove (10)
			l_set.put (6)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 4, 5, 6>>, l_set.to_array)
			l_set.remove (6)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 4, 5>>, l_set.to_array)
			l_set.put (7)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 4, 5, 7>>, l_set.to_array)
			l_set.wipe_out
			assert ("empty2", l_set.is_empty)
			l_set.put (8)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (8)>>, l_set.to_array)
			l_set.put (8)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (8)>>, l_set.to_array)
		end

	test_red_black_tree_set_cursor
			-- Test the cursor implementation for binary search trees.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_tree: DS_RED_BLACK_TREE_SET [INTEGER]
			l_cursor_1: DS_BINARY_SEARCH_TREE_SET_CURSOR [INTEGER]
			l_cursor_2: DS_BINARY_SEARCH_TREE_SET_CURSOR [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_cursor_1 := l_tree.new_cursor
			assert ("before1", l_cursor_1.before)
				--
			l_tree.put_new (1)
			l_tree.put_new (2)
			l_tree.put_new (3)
			l_tree.put_new (4)
				--
			l_cursor_2 := l_tree.new_cursor
			assert ("before2", l_cursor_2.before)
				--
			l_cursor_1.forth
			assert ("is_1", l_cursor_1.item = 1)
			l_cursor_2.start
			assert ("same_position", l_cursor_1.same_position (l_cursor_2))
				--
			l_cursor_2.finish
			assert ("is_4", l_cursor_2.item = 4)
			l_tree.remove (4)
			assert ("after1", l_cursor_2.after)
			l_tree.remove (1)
			assert ("is_2", l_cursor_1.item = 2)
			l_tree.remove (2)
			l_tree.remove (3)
			assert ("after2", l_cursor_1.after)
				--
			l_tree.put_new (1)
			l_tree.put_new (2)
			l_tree.put_new (3)
			l_tree.put_new (4)
			l_cursor_1.start
			l_cursor_2.finish
			l_tree.wipe_out
			assert ("after3", l_cursor_1.after)
			assert ("after4", l_cursor_2.after)
				--
			create l_tree.make (l_comparator)
			l_cursor_1 := l_tree.new_cursor
			l_cursor_1.start
			assert ("after5", l_cursor_1.after)
			l_cursor_1.finish
			assert ("before3", l_cursor_1.before)
		end

	test_void
			-- Test with Void items.
		local
			l_set: DS_RED_BLACK_TREE_SET [STRING]
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			assert ("not_has_void_1", not l_set.has_void)
			assert ("not_has_void_2", not l_set.has (Void))
			l_set.force ("2")
			l_set.force ("3")
			l_set.force ("4")
			l_set.force ("5")
			l_set.force ("6")
			assert ("not_has_void_3", not l_set.has_void)
			assert ("not_has_void_4", not l_set.has (Void))
			l_set.force (Void)
			assert ("has_void_1", l_set.has_void)
			assert ("has_void_2", l_set.has (Void))
			l_set.force ("1")
			l_set.remove (Void)
			assert ("not_has_void_5", not l_set.has_void)
			assert ("not_has_void_6", not l_set.has (Void))
			l_set.remove (Void)
			assert ("not_has_void_7", not l_set.has_void)
			assert ("not_has_void_8", not l_set.has (Void))
			l_set.remove ("2")
			l_set.remove ("6")
			l_set.remove ("1")
			l_set.remove ("3")
			l_set.remove ("5")
			l_set.remove ("4")
			l_set.remove ("4")
		end

	test_do_all
			-- Test feature 'do_all'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (1)
			l_set.force_last (2)
			l_set.force_last (3)
			l_set.force_last (4)
			l_set.force_last (5)
			create l_list.make (5)
			l_set.do_all (agent l_list.force_first)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, l_list.to_array)
				-- Empty set.
			create l_set.make (l_comparator)
			create l_list.make (0)
			l_set.do_all (agent l_list.force_first)
			assert ("empty1", l_list.is_empty)
		end

	test_do_all_with_index
			-- Test feature 'do_all_with_index'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_array: ARRAY [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (5)
			l_set.force_last (4)
			l_set.force_last (3)
			l_set.force_last (2)
			l_set.force_last (1)
			create l_array.make_filled (0, 0, 6)
			l_set.do_all_with_index (agent l_array.put)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (0), 1, 2, 3, 4, 5, 0>>, l_array)
				-- Empty set.
			create l_set.make (l_comparator)
			create l_array.make_filled (0, 0, 1)
			l_set.do_all_with_index (agent l_array.put)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, l_array)
		end

	test_do_if
			-- Test feature 'do_if'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (1)
			l_set.force_last (2)
			l_set.force_last (3)
			l_set.force_last (4)
			l_set.force_last (5)
			create l_list.make (5)
			l_set.do_if (agent l_list.force_first, agent INTEGER_.is_even)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (4), 2>>, l_list.to_array)
				-- Empty set.
			create l_set.make (l_comparator)
			create l_list.make (0)
			l_set.do_if (agent l_list.force_first, agent INTEGER_.is_even)
			assert ("empty1", l_list.is_empty)
		end

	test_do_if_with_index
			-- Test feature 'do_if_with_index'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_array: ARRAY [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (5)
			l_set.force_last (2)
			l_set.force_last (6)
			l_set.force_last (4)
			l_set.force_last (1)
			create l_array.make_filled (0, 1, 5)
			l_set.do_if_with_index (agent l_array.put, agent same_integers)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 0, 0, 0>>, l_array)
				-- Empty set.
			create l_set.make (l_comparator)
			create l_array.make_filled (0, 0, 1)
			l_set.do_if_with_index (agent l_array.put, agent same_integers)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (0), 0>>, l_array)
		end

	test_there_exists
			-- Test feature 'there_exists'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (1)
			l_set.force_last (2)
			l_set.force_last (3)
			l_set.force_last (4)
			l_set.force_last (5)
			assert ("there_exists1", l_set.there_exists (agent INTEGER_.is_even))
			create l_set.make (l_comparator)
			l_set.force_last (1)
			l_set.force_last (3)
			l_set.force_last (5)
			assert ("there_dont_exist1", not l_set.there_exists (agent INTEGER_.is_even))
				-- Empty set.
			create l_set.make (l_comparator)
			assert ("there_dont_exist2", not l_set.there_exists (agent INTEGER_.is_even))
		end

	test_for_all
			-- Test feature 'for_all'.
		local
			l_set: DS_RED_BLACK_TREE_SET [INTEGER]
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create l_set.make (l_comparator)
			l_set.force_last (1)
			l_set.force_last (2)
			l_set.force_last (3)
			l_set.force_last (4)
			l_set.force_last (5)
			assert ("not_for_all1", not l_set.for_all (agent INTEGER_.is_even))
			create l_set.make (l_comparator)
			l_set.force_last (2)
			l_set.force_last (4)
			l_set.force_last (6)
			assert ("for_all1", l_set.for_all (agent INTEGER_.is_even))
				-- Empty set.
			create l_set.make (l_comparator)
			assert ("for_all2", l_set.for_all (agent INTEGER_.is_even))
		end

	test_copy
			-- Test features based on `copy'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree_1, l_tree_2: DS_RED_BLACK_TREE_SET [STRING]
		do
			create l_comparator.make
			create l_tree_1.make (l_comparator)
			l_tree_1.put_new ("one")
			l_tree_1.put_new ("two")
			l_tree_1.put_new ("three")
			l_tree_2 := l_tree_1.twin
			assert ("l_tree_1_count1", l_tree_1.count = 3)
			assert ("is_equal1", l_tree_1.is_equal (l_tree_2))
			l_tree_2.remove ("one")
			assert ("l_tree_1_count2", l_tree_1.count = 3)
			assert ("not_is_equal1", not l_tree_1.is_equal (l_tree_2))
			l_tree_2.copy (l_tree_1)
			assert ("l_tree_1_count3", l_tree_1.count = 3)
			assert ("is_equal2", l_tree_1.is_equal (l_tree_2))
		end

	test_set_operations
			-- Test set features.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_tree_1, l_tree_2, l_tree_3: DS_RED_BLACK_TREE_SET [INTEGER]
		do
			create l_comparator.make
			create l_tree_1.make (l_comparator)
			create l_tree_2.make (l_comparator)
			l_tree_1.put_new (1)
			l_tree_1.put_new (2)
			l_tree_1.put_new (3)
			l_tree_1.put_new (4)
			l_tree_2.put_new (2)
			l_tree_2.put_new (3)
			assert ("is_subset1", l_tree_2.is_subset (l_tree_1))
			assert ("is_superset1", l_tree_1.is_superset (l_tree_2))
			l_tree_3 := l_tree_1.subtraction (l_tree_2)
			assert ("is_disjoint1", l_tree_3.is_disjoint (l_tree_2))
			assert ("is_disjoint2", l_tree_2.is_disjoint (l_tree_3))
			assert ("count1", l_tree_2.count = 2)
			assert ("count1", l_tree_3.count = 2)
			l_tree_1.subtract (l_tree_2)
			assert ("is_disjoint3", l_tree_1.is_disjoint (l_tree_2))
			assert ("is_disjoint4", l_tree_2.is_disjoint (l_tree_1))
			assert ("count3", l_tree_1.count = 2)
			l_tree_3 := l_tree_1.union (l_tree_2)
			assert ("is_subset2", l_tree_2.is_subset (l_tree_3))
			assert ("count4", l_tree_3.count = 4)
			l_tree_1.merge (l_tree_2)
			assert ("is_subset3", l_tree_2.is_subset (l_tree_1))
			assert ("count5", l_tree_1.count = 4)
			l_tree_3 := l_tree_3.intersection (l_tree_2)
			assert ("is_equal1", l_tree_3.is_equal (l_tree_2))
			assert ("count6", l_tree_3.count = 2)
			l_tree_3 := l_tree_1.twin
			assert ("count7", l_tree_3.count = 4)
			l_tree_3.intersect (l_tree_2)
			assert ("is_equal2", l_tree_3.is_equal (l_tree_2))
			assert ("count8", l_tree_3.count = 2)
			l_tree_3 := l_tree_1.symdifference (l_tree_2)
			assert ("is_disjoint5", l_tree_3.is_disjoint (l_tree_2))
			assert ("count9", l_tree_3.count = 2)
			l_tree_1.symdif (l_tree_2)
			assert ("is_disjoint6", l_tree_1.is_disjoint (l_tree_2))
			assert ("count10", l_tree_1.count = 2)
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
