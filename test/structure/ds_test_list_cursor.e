indexing

	description:

		"Test features of class DS_LIST_CURSOR"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TEST_LIST_CURSOR

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

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

	set_up is 
			-- Create fixture objects.
		do
			create empty_alist.make (10)
			create empty_llist.make
			create empty_blist.make
			create singleton_alist.make_from_array (<<1>>)
			create singleton_llist.make_from_array (<<1>>)
			create singleton_blist.make_from_array (<<1>>)
			create doubleton_alist.make_from_array (<<1, 2>>)
			create doubleton_llist.make_from_array (<<1, 2>>)
			create doubleton_blist.make_from_array (<<1, 2>>)
			create triplet_alist.make_from_array (<<1, 2, 3>>)
			create triplet_llist.make_from_array (<<1, 2, 3>>)
			create triplet_blist.make_from_array (<<1, 2, 3>>)
		end

	tear_down is
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

-- Testable features of DS_LIST_CURSOR

-- From Class DS_CURSOR [G]:
-- 
-- 	copy (other: [like Current] DS_LIST_CURSOR [G])
-- 	go_to (other: [like Current] DS_LIST_CURSOR [G])
-- 	is_equal (other: [like Current] DS_LIST_CURSOR [G]): BOOLEAN
-- 	is_valid: BOOLEAN
-- 	item: G
-- 	off: BOOLEAN
-- 	same_position (other: [like Current] DS_LIST_CURSOR [G]): BOOLEAN
-- 	valid_cursor (other: [like Current] DS_LIST_CURSOR [G]): BOOLEAN
-- 
-- From Class DS_LINEAR_CURSOR [G]:
-- 
-- 	after: BOOLEAN
-- 	forth
-- 	go_after
-- 	is_first: BOOLEAN
-- 	search_forth (v: G)
-- 	start
-- 
-- From Class DS_BILINEAR_CURSOR [G]:
-- 
-- 	back
-- 	before: BOOLEAN
-- 	finish
-- 	go_before
-- 	is_last: BOOLEAN
-- 	search_back (v: G)
-- 
-- From Class DS_DYNAMIC_CURSOR [G]:
-- 
-- 	replace (v: G)
-- 	swap (other: DS_DYNAMIC_CURSOR [G])
-- 
-- From Class DS_LIST_CURSOR [G]:
-- 
-- 	append_left (other: DS_LINEAR [G])
-- 	append_right (other: DS_LINEAR [G])
-- 	container: DS_LIST [G]
-- 	extend_left (other: DS_LINEAR [G])
-- 	extend_right (other: DS_LINEAR [G])
-- 	force_left (v: G)
-- 	force_right (v: G)
-- 	go_i_th (i: INTEGER)
-- 	index: INTEGER
-- 	prune_left (n: INTEGER)
-- 	prune_right (n: INTEGER)
-- 	put_left (v: G)
-- 	put_right (v: G)
-- 	remove
-- 	remove_left
-- 	remove_right
-- 	valid_index (i: INTEGER): BOOLEAN

	test_for_defect_in_linked_list is
			-- Demonstrate defect in DS_LINKED_LIST.cursor_back
			-- by call back on a cursor for which is_first is true.
			-- (ericb 02/07/05: this bug is now fixed.)
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_LINKED_LIST [INTEGER]} a_list.make_from_array (<<1, 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_for_defect_in_bilinked_list is
			-- Verify that the defect is not present in DS_BILINKED_LIST.
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_BILINKED_LIST [INTEGER]} a_list.make_from_array (<<1, 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_for_defect_in_arrayed_list is
			-- Verify that the defect is not present in DS_ARRAYED_LIST.
		local
			a_list: DS_LIST [INTEGER]
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			create {DS_ARRAYED_LIST [INTEGER]} a_list.make_from_array (<<1, 2>>)
			a_cursor := a_list.new_cursor
			a_list.start
			a_cursor.start
			a_cursor.forth
			a_cursor.back
			assert ("not_before", not a_cursor.before)
		end

	test_is_first is
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

	test_back is
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

	check_is_first_on_list (a_list: DS_LIST[INTEGER]) is
			-- Test feature `is_first'.
		require
			a_list_not_void: a_list /= Void
		local
			a_cursor: DS_LIST_CURSOR [INTEGER]
		do
			a_cursor := a_list.new_cursor
			assert ("before", a_cursor.before)
			assert ("not first", not a_cursor.is_first)
			a_cursor.forth
			assert ("after xor first", a_cursor.after /= a_cursor.is_first)
			if not a_cursor.after then
				a_cursor.forth
				assert ("not first", not a_cursor.is_first)
			end
			a_cursor.start
			assert ("start: after xor first", a_cursor.after /= a_cursor.is_first)
		end

	check_back_on_list (a_list: DS_LIST [INTEGER]) is
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

 	check_back (a_cursor: DS_LIST_CURSOR [INTEGER]) is
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
			assert ("not after", not a_cursor.after)
			assert ("non-empty list: was after equivalent last", size > 0 implies was_after = a_cursor.is_last)
			assert ("non-empty list: was first equivalent before", size > 0 implies was_first = a_cursor.before)
			assert ("empty list: before", size = 0 implies was_after and a_cursor.before)
			assert ("index reduced by one", a_cursor.index = old_index - 1)
			a_cursor.forth
			assert ("same index", a_cursor.index = old_index)
			assert ("same item", not a_cursor.after implies a_cursor.item = old_item)
			assert ("same after", a_cursor.after = was_after)
			assert ("same first", a_cursor.is_first = was_first)
		end

end
