indexing

	description:

		"Test features of class DS_LIST"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TEST_LIST

inherit

	TS_TEST_CASE

feature -- Test

	test_list1 is
			-- Test features of DS_LIST.
		local
			a_list: DS_LIST [INTEGER]
		do
			create {DS_LINKED_LIST [INTEGER]} a_list.make
			assert ("a_list_not_void1", a_list /= Void)
			assert ("a_list_empty1", a_list.is_empty)
			assert ("a_list_before1", a_list.before)
			assert ("a_list_extendible1", a_list.extendible (10))
			check_integer_list1 (a_list)
			create {DS_BILINKED_LIST [INTEGER]} a_list.make_equal
			assert ("a_list_not_void2", a_list /= Void)
			assert ("a_list_empty2", a_list.is_empty)
			assert ("a_list_before2", a_list.before)
			assert ("a_list_extendible2", a_list.extendible (10))
			check_integer_list1 (a_list)
			create {DS_ARRAYED_LIST [INTEGER]} a_list.make (10)
			assert ("a_list_not_void3", a_list /= Void)
			assert ("a_list_empty3", a_list.is_empty)
			assert ("a_list_before3", a_list.before)
			assert ("a_list_extendible3", a_list.extendible (10))
			check_integer_list1 (a_list)
		end

feature {NONE} -- Implementation

	check_integer_list1 (a_list: DS_LIST [INTEGER]) is
			-- Test features of list `a_list'.
		require
			a_list_not_void: a_list /= Void
			a_list_empty: a_list.is_empty
			a_list_before: a_list.before
			extendible: a_list.extendible (10)
		local
			i: INTEGER
			other: DS_LINKED_LIST [INTEGER]
		do
			a_list.put_first (2)
			assert_integers_equal ("count1", 1, a_list.count)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (2)>>, a_list.to_array)
			assert ("before1", a_list.before)

			from i := 3 until i > 10 loop
				a_list.put_last (i)
				i := i + 1
			end
			assert_integers_equal ("count2", 9, a_list.count)
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (2), 3, 4, 5, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert ("before2", a_list.before)

			a_list.force_first (1)
			assert_integers_equal ("count3", 10, a_list.count)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert ("before3", a_list.before)

			a_list.start
			assert_integers_equal ("index1", 1, a_list.index)
			a_list.search_forth (5)
			assert_integers_equal ("index2", 5, a_list.index)
			assert_integers_equal ("item1", 5, a_list.item_for_iteration)

			a_list.force_left (44)
			assert_integers_equal ("count4", 11, a_list.count)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 3, 4, 44, 5, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index3", 6, a_list.index)
			assert_integers_equal ("item2", 5, a_list.item_for_iteration)
			a_list.force_right (55)
			assert_integers_equal ("count5", 12, a_list.count)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 3, 4, 44, 5, 55, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index4", 6, a_list.index)
			assert_integers_equal ("item3", 5, a_list.item_for_iteration)

			a_list.remove_at
			assert_integers_equal ("count6", 11, a_list.count)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 3, 4, 44, 55, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index5", 6, a_list.index)
			assert_integers_equal ("item4", 55, a_list.item_for_iteration)

			create other.make
			other.put_last (66)
			other.put_last (77)
			a_list.append_right (other)
			assert_integers_equal ("count7", 13, a_list.count)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 3, 4, 44, 55, 66, 77, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index6", 6, a_list.index)
			assert_integers_equal ("item5", 55, a_list.item_for_iteration)

			from a_list.start until a_list.after or else a_list.item_for_iteration = 6 loop
				a_list.forth
			end
			assert_integers_equal ("index7", 9, a_list.index)
			assert_integers_equal ("item6", 6, a_list.item_for_iteration)

			create other.make
			other.put_last (88)
			other.put_last (99)
			a_list.append_left (other)
			assert_integers_equal ("count8", 15, a_list.count)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (1), 2, 3, 4, 44, 55, 66, 77, 88, 99, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index8", 11, a_list.index)
			assert_integers_equal ("item7", 6, a_list.item_for_iteration)

			a_list.force (3, 5)
			assert_integers_equal ("count9", 16, a_list.count)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (1), 2, 3, 4, 3, 44, 55, 66, 77, 88, 99, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index8", 12, a_list.index)
			assert_integers_equal ("item7", 6, a_list.item_for_iteration)

			a_list.delete (3)
			assert_integers_equal ("count10", 14, a_list.count)
			assert_iarrays_same ("items10", <<INTEGER_.to_integer (1), 2, 4, 44, 55, 66, 77, 88, 99, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert ("after1", a_list.after)

			a_list.go_i_th (5)
			assert_integers_equal ("index9", 5, a_list.index)
			assert_integers_equal ("item8", 55, a_list.item_for_iteration)

			a_list.remove (5)
			assert_integers_equal ("count11", 13, a_list.count)
			assert_iarrays_same ("items11", <<INTEGER_.to_integer (1), 2, 4, 44, 66, 77, 88, 99, 6, 7, 8, 9, 10>>, a_list.to_array)
			assert_integers_equal ("index10", 5, a_list.index)
			assert_integers_equal ("item9", 66, a_list.item_for_iteration)
			assert_iarrays_same ("cloned_items1", <<INTEGER_.to_integer (1), 2, 4, 44, 66, 77, 88, 99, 6, 7, 8, 9, 10>>, a_list.cloned_object.to_array)

			a_list.wipe_out
			assert ("is_empty1", a_list.is_empty)
			assert ("after2", a_list.after)
		end

end
