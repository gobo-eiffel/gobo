note

	description:

		"Test features of class DS_RED_BLACK_TREE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2011, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_RED_BLACK_TREE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_red_black_tree
			-- Test the basic table features of binary search tree.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_tree: DS_RED_BLACK_TREE [INTEGER, INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
			assert ("empty1", l_tree.is_empty)
				--
			l_tree.put_new (1, -1)
			l_tree.put_new (2, 2)
			l_tree.put_new (3, -3)
			l_tree.put_new (4, 4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (3), 1, 2, 4>>, l_tree.to_array)
			assert ("has_-1", l_tree.has (-1))
			assert ("not_has_1", not l_tree.has (1))
			assert ("has_2", l_tree.has (2))
			assert ("has_-3", l_tree.has (-3))
			assert ("has_4", l_tree.has (4))
			assert ("not_has_5", not l_tree.has (5))
			l_tree.replace (-1, -1)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (3), -1, 2, 4>>, l_tree.to_array)
			assert ("item_at_-1_is_-1", l_tree.item (-1) = -1)
			l_tree.put (-3, -3)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (-3), -1, 2, 4>>, l_tree.to_array)
			assert ("item_at_-3_is_-3", l_tree.item (-3) = -3)
			l_tree.remove (2)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (-3), -1, 4>>, l_tree.to_array)
			assert ("not_has_2", not l_tree.has (2))
			l_tree.wipe_out
			assert ("empty2", l_tree.is_empty)
		end

	test_red_black_tree_cursor
			-- Test the cursor implementation for binary search trees.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			l_tree: DS_RED_BLACK_TREE [INTEGER, INTEGER]
			l_cursor_1: DS_BINARY_SEARCH_TREE_CURSOR [INTEGER, INTEGER]
			l_cursor_2: DS_BINARY_SEARCH_TREE_CURSOR [INTEGER, INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_cursor_1 := l_tree.new_cursor
			assert ("before1", l_cursor_1.before)
				--
			l_tree.put_new (1, 1)
			l_tree.put_new (2, 2)
			l_tree.put_new (3, 3)
			l_tree.put_new (4, 4)
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
			l_tree.put_new (1, 1)
			l_tree.put_new (2, 2)
			l_tree.put_new (3, 3)
			l_tree.put_new (4, 4)
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
			-- Test with Void keys.
		local
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
			assert ("not_has_void_1", not l_tree.has (Void))
			l_tree.force (2, "2")
			l_tree.force (3, "3")
			l_tree.force (4, "4")
			l_tree.force (5, "5")
			l_tree.force (6, "6")
			assert ("not_has_void_2", not l_tree.has (Void))
			l_tree.force (0, Void)
			assert ("has_void_1", l_tree.has (Void))
			l_tree.force (1, "1")
			l_tree.remove (Void)
			assert ("not_has_void_3", not l_tree.has (Void))
			l_tree.remove (Void)
			assert ("not_has_void_4", not l_tree.has (Void))
			l_tree.remove ("2")
			l_tree.remove ("6")
			l_tree.remove ("1")
			l_tree.remove ("3")
			l_tree.remove ("5")
			l_tree.remove ("4")
			l_tree.remove ("4")
		end

	test_do_all
			-- Test feature 'do_all'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "one")
			l_tree.put_new (2, "two")
			l_tree.put_new (3, "three")
			l_tree.put_new (4, "four")
			l_tree.put_new (5, "five")
			create l_list.make (5)
			l_tree.do_all (agent l_list.force_last)
			assert_iarrays_same ("items", <<INTEGER_.to_integer (5), 4, 1, 3, 2>>, l_list.to_array)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (0)
			l_tree.do_all (agent l_list.force_last)
			assert ("empty", l_list.is_empty)
		end

	test_do_all_with_index
			-- Test feature 'do_all_with_index'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "one")
			l_tree.put_new (2, "two")
			l_tree.put_new (3, "three")
			l_tree.put_new (4, "four")
			l_tree.put_new (5, "five")
			create l_list.make (5)
				--
			l_tree.do_all_with_index (agent l_list.put)
			assert_iarrays_same ("items", <<INTEGER_.to_integer (5), 4, 1, 3, 2>>, l_list.to_array)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (5)
			l_tree.do_all_with_index (agent l_list.put)
			assert ("empty", l_list.is_empty)
		end

	test_do_all_with_key
			-- Test feature 'do_all_with_key'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "11")
			l_tree.put_new (2, "22")
			l_tree.put_new (3, "33")
			l_tree.put_new (4, "44")
			l_tree.put_new (5, "55")
			create l_list.make (5)
				--
			l_tree.do_all_with_key (agent add_key_to_array (?, ?, l_list))
			assert_iarrays_same ("keys", <<INTEGER_.to_integer (11), 22, 33, 44, 55>>, l_list.to_array)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (5)
			l_tree.do_all_with_key (agent add_key_to_array (?, ?, l_list))
			assert ("empty", l_list.is_empty)
		end

	test_do_if
			-- Test feature 'do_if'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "one")
			l_tree.put_new (2, "two")
			l_tree.put_new (3, "three")
			l_tree.put_new (4, "four")
			l_tree.put_new (5, "five")
			create l_list.make (5)
				--
			l_tree.do_if (agent l_list.force_last, agent INTEGER_.is_even)
			assert_iarrays_same ("items", <<INTEGER_.to_integer (4), 2>>, l_list.to_array)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (5)
			l_tree.do_if (agent l_list.force_last, agent INTEGER_.is_even)
			assert ("empty", l_list.is_empty)
		end

	test_do_if_with_index
			-- Test feature 'do_if_with_index'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: ARRAY [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "1")
			l_tree.put_new (2, "2")
			l_tree.put_new (3, "3")
			l_tree.put_new (0, "4")
			l_tree.put_new (5, "5")
			create l_list.make_filled (0, 1, 5)
				--
			l_tree.do_if_with_index (agent l_list.put, agent same_integers)
			assert_iarrays_same ("items", <<INTEGER_.to_integer (1), 2, 3, 0, 5>>, l_list)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make_filled (0, 1, 5)
			l_tree.do_if_with_index (agent l_list.put, agent same_integers)
			assert_iarrays_same ("empty", <<INTEGER_.to_integer (0), 0, 0, 0, 0>>, l_list)
		end

	test_do_if_with_key
			-- Test feature 'do_if_with_key'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
				--
			l_tree.put_new (1, "11")
			l_tree.put_new (2, "12")
			l_tree.put_new (3, "21")
			l_tree.put_new (4, "22")
			l_tree.put_new (5, "33")
			create l_list.make (5)
				--
			l_tree.do_if_with_key (agent add_key_to_array (?, ?, l_list), agent key_starts_with (?, ?, '1'))
			assert_iarrays_same ("keys", <<INTEGER_.to_integer (11), 12>>, l_list.to_array)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (5)
			l_tree.do_if_with_key (agent add_key_to_array (?, ?, l_list), agent key_starts_with (?, ?, '1'))
			assert ("empty", l_list.is_empty)
		end

	test_there_exists
			-- Test feature 'there_exists'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
			l_tree.put_new (1, "one")
			l_tree.put_new (2, "two")
			l_tree.put_new (3, "three")
			l_tree.put_new (4, "four")
			l_tree.put_new (5, "five")
			assert ("there_exists", l_tree.there_exists (agent INTEGER_.is_even))
				--
			create l_comparator.make
			create l_tree.make (l_comparator)
			l_tree.put_new (1, "one")
			l_tree.put_new (3, "three")
			l_tree.put_new (5, "five")
			assert ("not_there_exists", not l_tree.there_exists (agent INTEGER_.is_even))
				-- Empty tree.
			create l_tree.make (l_comparator)
			assert ("empty", not l_tree.there_exists (agent INTEGER_.is_even))
		end

	test_for_all
			-- Test feature 'for_all'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_RED_BLACK_TREE [INTEGER, STRING]
		do
			create l_comparator.make
			create l_tree.make (l_comparator)
			l_tree.put_new (1, "one")
			l_tree.put_new (2, "two")
			l_tree.put_new (3, "three")
			l_tree.put_new (4, "four")
			l_tree.put_new (5, "five")
			assert ("not_for_all", not l_tree.for_all (agent INTEGER_.is_even))
				--
			create l_comparator.make
			create l_tree.make (l_comparator)
			l_tree.put_new (2, "two")
			l_tree.put_new (4, "four")
			l_tree.put_new (6, "six")
			assert ("for_all", l_tree.for_all (agent INTEGER_.is_even))
				-- Empty tree.
			create l_tree.make (l_comparator)
			assert ("empty", l_tree.for_all (agent INTEGER_.is_even))
		end

	test_copy
			-- Test features based on `copy'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree_1, l_tree_2: DS_RED_BLACK_TREE [INTEGER, STRING]
		do
			create l_comparator.make
			create l_tree_1.make (l_comparator)
			l_tree_1.put_new (1, "one")
			l_tree_1.put_new (2, "two")
			l_tree_1.put_new (3, "three")
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

feature {NONE} -- Implementation

	same_integers (i, j: INTEGER): BOOLEAN
			-- Is `i' equal to `j'?
			-- (Used as agent to test iterators.)
		do
			Result := (i = j)
		ensure
			definition: Result = (i = j)
		end

	add_key_to_array (a_item: INTEGER; a_key: STRING; a_array: DS_ARRAYED_LIST [INTEGER])
			-- Add `a_key' to `a_array'.
			-- (Used as agent to test iterators.)
		require
			a_key_not_void: a_key /= Void
			a_key_is_integer: a_key.is_integer
			a_array_not_void: a_array /= Void
		do
			a_array.force_last (a_key.to_integer)
		end

	key_starts_with (a_item: INTEGER; a_key: STRING; a_character: CHARACTER): BOOLEAN
			-- Does `a_key' have `a_character' as first character?
			-- (Used as agent to test iterators.)
		require
			a_key_not_void: a_key /= Void
			a_key_is_not_empty: not a_key.is_empty
		do
			Result := a_key.item (1) = a_character
		end

end
