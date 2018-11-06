note

	description:

		"Test features of class DS_LIST_CURSOR"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_LIST_CURSOR

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_for_defect_in_linked_list
			-- Demonstrate defect in DS_LINKED_LIST.cursor_back
			-- by call back on a cursor for which is_first is true.
			-- (ericb 02/07/05: this bug is now fixed.)
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_LINKED_LIST [INTEGER]} a_list.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_for_defect_in_bilinked_list
			-- Verify that the defect is not present in DS_BILINKED_LIST.
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_BILINKED_LIST [INTEGER]} a_list.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_for_defect_in_arrayed_list
			-- Verify that the defect is not present in DS_ARRAYED_LIST.
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_ARRAYED_LIST [INTEGER]} a_list.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_is_first
			-- Test feature `is_first'.
		do
			check_is_first_on_list (empty_alist)
			check_is_first_on_list (empty_llist)
			check_is_first_on_list (empty_blist)
			check_is_first_on_list (singleton_alist)
			check_is_first_on_list (singleton_llist)
			check_is_first_on_list (singleton_blist)
			check_is_first_on_list (doubleton_alist)
			check_is_first_on_list (doubleton_llist)
			check_is_first_on_list (doubleton_blist)
			check_is_first_on_list (triplet_alist)
			check_is_first_on_list (triplet_llist)
			check_is_first_on_list (triplet_blist)
		end

	test_back
			-- Test feature `back'.
		do
			check_back_on_list (empty_alist)
			check_back_on_list (empty_llist)
			check_back_on_list (empty_blist)
			check_back_on_list (singleton_alist)
			check_back_on_list (singleton_llist)
			check_back_on_list (singleton_blist)
			check_back_on_list (doubleton_alist)
			check_back_on_list (doubleton_llist)
			check_back_on_list (doubleton_blist)
			check_back_on_list (triplet_alist)
			check_back_on_list (triplet_llist)
			check_back_on_list (triplet_blist)
		end

feature {NONE} -- Fixture

	empty_alist: DS_ARRAYED_LIST [INTEGER]
			-- Empty arrayed list
		do
			create Result.make (10)
		ensure
			empty_alist_not_void: Result /= Void
		end
		
	empty_llist: DS_LINKED_LIST [INTEGER]
			-- Empty linked list
		do
			create Result.make
		ensure
			empty_llist_not_void: Result /= Void
		end
		
	empty_blist: DS_BILINKED_LIST [INTEGER]
			-- Empty bi-linked list
		do
			create Result.make
		ensure
			empty_blist_not_void: Result /= Void
		end
		
	singleton_alist: DS_ARRAYED_LIST [INTEGER]
			-- Arrayed list with one item
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1)>>)
		ensure
			singleton_alist_not_void: Result /= Void
			one_item: Result.count = 1
		end
		
	singleton_llist: DS_LINKED_LIST [INTEGER]
			-- Linked list with one item
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1)>>)
		ensure
			singleton_llist_not_void: Result /= Void
			one_item: Result.count = 1
		end
		
	singleton_blist: DS_BILINKED_LIST [INTEGER]
			-- Bi-linked list with one item
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1)>>)
		ensure
			singleton_blist_not_void: Result /= Void
			one_item: Result.count = 1
		end
		
	doubleton_alist: DS_ARRAYED_LIST [INTEGER]
			-- Arrayed list with two items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2>>)
		ensure
			doubleton_alist_not_void: Result /= Void
			two_items: Result.count = 2
		end
		
	doubleton_llist: DS_LINKED_LIST [INTEGER]
			-- Linked list with two items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2>>)
		ensure
			doubleton_llist_not_void: Result /= Void
			two_items: Result.count = 2
		end
		
	doubleton_blist: DS_BILINKED_LIST [INTEGER]
			-- Bi-linked list with two items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2>>)
		ensure
			doubleton_blist_not_void: Result /= Void
			two_items: Result.count = 2
		end
		
	triplet_alist: DS_ARRAYED_LIST [INTEGER]
			-- Arrayed list with three items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
		ensure
			triplet_alist_not_void: Result /= Void
			three_items: Result.count = 3
		end
		
	triplet_llist: DS_LINKED_LIST [INTEGER]
			-- Linked list with three items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
		ensure
			triplet_llist_not_void: Result /= Void
			three_items: Result.count = 3
		end
		
	triplet_blist: DS_BILINKED_LIST [INTEGER]
			-- Bi-linked list with three items
		do
			create Result.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
		ensure
			triplet_blist_not_void: Result /= Void
			three_items: Result.count = 3
		end
		
feature {NONE} -- Implementation

	check_is_first_on_list (a_list: DS_LIST [INTEGER])
			-- Test feature `is_first'.
		require
			a_list_not_void: a_list /= Void
		local
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			a_cursor := a_list.new_cursor
			assert ("before", a_cursor.before)
			assert ("not_first", not a_cursor.is_first)
			a_cursor.forth
			assert ("after_xor_first", a_cursor.after /= a_cursor.is_first)
			if not a_cursor.after then
				a_cursor.forth
				assert ("not_first", not a_cursor.is_first)
			end
			a_cursor.start
			assert ("start_after_xor_first", a_cursor.after /= a_cursor.is_first)
		end

	check_back_on_list (a_list: DS_LIST [INTEGER])
			-- Test feature `back'.
		require
			a_list_not_void: a_list /= Void
		local
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			a_cursor := a_list.new_cursor
			a_cursor.start
			assert ("not_before1", not a_cursor.before)
			check_back (a_cursor)
			a_cursor.finish
			if not a_cursor.before then
				check_back (a_cursor)
			end
			a_cursor.go_after
			assert ("not_before1", not a_cursor.before)
			check_back (a_cursor)
		end

 	check_back (a_cursor: DS_LIST_CURSOR [INTEGER])
			-- Test feature `back'.
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_not_before: not a_cursor.before
		local
			was_first: BOOLEAN
			was_after: BOOLEAN
			old_index: INTEGER
			old_item: INTEGER
			size: INTEGER
		do
			size := a_cursor.container.count
			was_after := a_cursor.after
			was_first := a_cursor.is_first
			old_index := a_cursor.index
			if not a_cursor.after then
				old_item := a_cursor.item
			end
			a_cursor.back
			assert ("not_after", not a_cursor.after)
				-- Non-empty list: was after equivalent last.
			assert ("was_after", size > 0 implies was_after = a_cursor.is_last)
				-- Non-empty list: was first equivalent before.
			assert ("was_first", size > 0 implies was_first = a_cursor.before)
				-- Empty list: before.
			assert ("before", size = 0 implies was_after and a_cursor.before)
			assert ("index_reduced_by_one", a_cursor.index = old_index - 1)
			a_cursor.forth
			assert ("same_index", a_cursor.index = old_index)
			assert ("same_item", not a_cursor.after implies a_cursor.item = old_item)
			assert ("same_after", a_cursor.after = was_after)
			assert ("same_first", a_cursor.is_first = was_first)
		end

end
