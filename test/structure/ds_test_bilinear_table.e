indexing

	description:

		"Test features of class DS_BILINEAR_TABLE"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_BILINEAR_TABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_bilinear_table is
			-- Test the basic table features of binary search tree.
		do
			do_test_bilinear_table (new_binary_search_tree)
			do_test_bilinear_table (new_avl_tree)
			do_test_bilinear_table (new_red_black_tree)
		end

	test_bilinear_table_cursor is
			-- Test the cursor implementation for binary search trees.
		do
			do_test_bilinear_table_cursor (new_binary_search_tree)
			do_test_bilinear_table_cursor (new_avl_tree)
			do_test_bilinear_table_cursor (new_red_black_tree)
		end

	test_do_all is
			-- Test feature 'do_all'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_do_all_with_index is
			-- Test feature 'do_all_with_index'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_do_all_with_key is
			-- Test feature 'do_all_with_key'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_do_if is
			-- Test feature 'do_if'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_do_if_with_index is
			-- Test feature 'do_if_with_index'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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
			create l_list.make (1, 5)
				--
			l_tree.do_if_with_index (agent l_list.put, agent same_integers)
			assert_iarrays_same ("items", <<INTEGER_.to_integer (1), 2, 3, 0, 5>>, l_list)
				-- Empty tree.
			create l_tree.make (l_comparator)
			create l_list.make (1, 5)
			l_tree.do_if_with_index (agent l_list.put, agent same_integers)
			assert_iarrays_same ("empty", <<INTEGER_.to_integer (0), 0, 0, 0, 0>>, l_list)
		end

	test_do_if_with_key is
			-- Test feature 'do_if_with_key'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_there_exists is
			-- Test feature 'there_exists'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

	test_for_all is
			-- Test feature 'for_all'.
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [STRING]
			l_tree: DS_AVL_TREE [INTEGER, STRING]
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

feature {NONE} -- Test

	do_test_bilinear_table (a_bilinear_table: DS_BILINEAR_TABLE [INTEGER, INTEGER]) is
			-- Test the basic table features.
		require
			a_bilinear_table_not_void: a_bilinear_table /= Void
			a_bilinear_table_is_empty: a_bilinear_table.is_empty
		do
			a_bilinear_table.put_new (1, -1)
			a_bilinear_table.put_new (2, 2)
			a_bilinear_table.put_new (3, -3)
			a_bilinear_table.put_new (4, 4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (3), 1, 2, 4>>, a_bilinear_table.to_array)
			assert ("has_-1", a_bilinear_table.has (-1))
			assert ("not_has_1", not a_bilinear_table.has (1))
			assert ("has_2", a_bilinear_table.has (2))
			assert ("has_-3", a_bilinear_table.has (-3))
			assert ("has_4", a_bilinear_table.has (4))
			assert ("not_has_5", not a_bilinear_table.has (5))
			a_bilinear_table.replace (-1, -1)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (3), -1, 2, 4>>, a_bilinear_table.to_array)
			assert ("item_at_-1_is_-1", a_bilinear_table.item (-1) = -1)
			a_bilinear_table.put (-3, -3)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (-3), -1, 2, 4>>, a_bilinear_table.to_array)
			assert ("item_at_-3_is_-3", a_bilinear_table.item (-3) = -3)
			a_bilinear_table.remove (2)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (-3), -1, 4>>, a_bilinear_table.to_array)
			assert ("not_has_2", not a_bilinear_table.has (2))
			a_bilinear_table.wipe_out
			assert ("empty2", a_bilinear_table.is_empty)
		end

	do_test_bilinear_table_cursor (a_bilinear_table: DS_BILINEAR_TABLE [INTEGER, INTEGER]) is
			-- Test the cursor implementation of the bilinear table.
		require
			a_bilinear_table_not_void: a_bilinear_table /= Void
			a_bilinear_table_is_empty: a_bilinear_table.is_empty
		local
			l_cursor_1: DS_BILINEAR_TABLE_CURSOR [INTEGER, INTEGER]
			l_cursor_2: DS_BILINEAR_CURSOR [INTEGER]
			l_cursor_3: DS_BILINEAR_CURSOR [INTEGER]
		do
			l_cursor_1 := a_bilinear_table.new_cursor
			assert ("before1", l_cursor_1.before)
				--
			a_bilinear_table.put_new (1, 1)
			a_bilinear_table.put_new (2, 2)
			a_bilinear_table.put_new (3, 3)
			a_bilinear_table.put_new (4, 4)
				--
			l_cursor_2 := a_bilinear_table.new_cursor
			assert ("before2", l_cursor_2.before)
				--
			l_cursor_1.forth
			assert ("is_1", l_cursor_1.item = 1)
			l_cursor_2.start
			l_cursor_3 := l_cursor_1
			assert ("same_position", l_cursor_2 ~ l_cursor_3)
				--
			l_cursor_2.finish
			assert ("is_4", l_cursor_2.item = 4)
			a_bilinear_table.remove (4)
			assert ("after1", l_cursor_2.after)
			a_bilinear_table.remove (1)
			assert ("is_2", l_cursor_1.item = 2)
			a_bilinear_table.remove (2)
			a_bilinear_table.remove (3)
			assert ("after2", l_cursor_1.after)
				--
			a_bilinear_table.put_new (1, 1)
			a_bilinear_table.put_new (2, 2)
			a_bilinear_table.put_new (3, 3)
			a_bilinear_table.put_new (4, 4)
			l_cursor_1.start
			l_cursor_2.finish
			a_bilinear_table.wipe_out
			assert ("after3", l_cursor_1.after)
			assert ("after4", l_cursor_2.after)
				--
			l_cursor_1 := a_bilinear_table.new_cursor
			l_cursor_1.start
			assert ("after5", l_cursor_1.after)
			l_cursor_1.finish
			assert ("before3", l_cursor_1.before)
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

	add_key_to_array (a_item: INTEGER; a_key: STRING; a_array: DS_ARRAYED_LIST [INTEGER]) is
			-- Add `a_key' to `a_array'.
			-- (Used as agent to test iterators.)
		require
			a_key_not_void: a_key /= Void
			a_key_is_integer: a_key.is_integer
			a_array_not_void: a_array /= Void
		do
			a_array.force_last (a_key.to_integer)
		end

	key_starts_with (a_item: INTEGER; a_key: STRING; a_character: CHARACTER): BOOLEAN is
			-- Does `a_key' have `a_character' as first character?
			-- (Used as agent to test iterators.)
		require
			a_key_not_void: a_key /= Void
			a_key_is_not_empty: not a_key.is_empty
		do
			Result := a_key.item (1) = a_character
		end

feature {NONE} -- Factory

	new_binary_search_tree: DS_BINARY_SEARCH_TREE [INTEGER, INTEGER] is
			-- New binary search tree
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			new_tree_not_void: Result /= Void
			new_tree_is_empty: Result.is_empty
		end

	new_avl_tree: DS_AVL_TREE [INTEGER, INTEGER] is
			-- New avl tree
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			new_tree_not_void: Result /= Void
			new_tree_is_empty: Result.is_empty
		end

	new_red_black_tree: DS_RED_BLACK_TREE [INTEGER, INTEGER] is
			-- New red-black tree
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		do
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			new_tree_not_void: Result /= Void
			new_tree_is_empty: Result.is_empty
		end

end
