note

	description:

		"Test features of class DS_LIST_CURSOR"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_LIST_CURSOR

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

create

	make_default

feature -- Fixture

	empty_alist: DS_ARRAYED_LIST [INTEGER]
	empty_llist: DS_LINKED_LIST [INTEGER]
	empty_blist: DS_BILINKED_LIST [INTEGER]
	singleton_alist: DS_ARRAYED_LIST [INTEGER]
	singleton_llist: DS_LINKED_LIST [INTEGER]
	singleton_blist: DS_BILINKED_LIST [INTEGER]
	doubleton_alist: DS_ARRAYED_LIST [INTEGER]
	doubleton_llist: DS_LINKED_LIST [INTEGER]
	doubleton_blist: DS_BILINKED_LIST [INTEGER]
	triplet_alist: DS_ARRAYED_LIST [INTEGER]
	triplet_llist: DS_LINKED_LIST [INTEGER]
	triplet_blist: DS_BILINKED_LIST [INTEGER]

	set_up
			-- Create fixture objects.
		do
			create empty_alist.make (10)
			create empty_llist.make
			create empty_blist.make
			create singleton_alist.make_from_array (<<INTEGER_.to_integer (1)>>)
			create singleton_llist.make_from_array (<<INTEGER_.to_integer (1)>>)
			create singleton_blist.make_from_array (<<INTEGER_.to_integer (1)>>)
			create doubleton_alist.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			create doubleton_llist.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			create doubleton_blist.make_from_array (<<INTEGER_.to_integer (1), 2>>)
			create triplet_alist.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
			create triplet_llist.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
			create triplet_blist.make_from_array (<<INTEGER_.to_integer (1), 2, 3>>)
		end

	tear_down
			-- Release fixture objects for GC.
		do
			singleton_alist := Void
			singleton_llist := Void
			singleton_blist := Void
			doubleton_alist := Void
			doubleton_llist := Void
			doubleton_blist := Void
			triplet_alist := Void
			triplet_llist := Void
			triplet_blist := Void
		end

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
