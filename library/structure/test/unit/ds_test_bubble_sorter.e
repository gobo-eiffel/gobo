note

	description:

		"Test features of class DS_BUBBLE_SORTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_BUBBLE_SORTER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_BUBBLE_SORTER [INTEGER]
		do
			create a_comparator.make
			assert ("a_comparator_not_void", a_comparator /= Void)
			create a_sorter.make (a_comparator)
			assert ("a_sorter_not_void", a_sorter /= Void)
			assert_same ("comparator_set", a_comparator, a_sorter.comparator)
		end

	test_sorted
			-- Test feature `sorted'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_BUBBLE_SORTER [INTEGER]
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			create a_comparator.make
			create a_sorter.make (a_comparator)
			create a_list.make (0)
			assert ("sorted1", a_sorter.sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			assert ("sorted2", a_sorter.sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>)
			assert ("not_sorted1", not a_sorter.sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (4), 3, 2, 1>>)
			assert ("not_sorted2", not a_sorter.sorted (a_list))
		end

	test_reverse_sorted
			-- Test feature `reverse_sorted'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_BUBBLE_SORTER [INTEGER]
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			create a_comparator.make
			create a_sorter.make (a_comparator)
			create a_list.make (0)
			assert ("reverse_sorted1", a_sorter.reverse_sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>)
			assert ("not_reverse_sorted1", not a_sorter.reverse_sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>)
			assert ("not_reverse_sorted2", not a_sorter.reverse_sorted (a_list))
			create a_list.make_from_array (<<INTEGER_.to_integer (4), 3, 2, 1>>)
			assert ("reverse_sorted2", a_sorter.reverse_sorted (a_list))
		end

	test_sort
			-- Test feature `sort'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_BUBBLE_SORTER [INTEGER]
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			create a_comparator.make
			create a_sorter.make (a_comparator)
				-- Sort empty list.
			create a_list.make (0)
			assert ("sorted1", a_sorter.sorted (a_list))
			a_sorter.sort (a_list)
			assert ("sorted2", a_sorter.sorted (a_list))
				-- Sort already sorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>)
			assert ("sorted3", a_sorter.sorted (a_list))
			a_sorter.sort (a_list)
			assert ("sorted4", a_sorter.sorted (a_list))
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>, a_list.to_array)
				-- Sort unsorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>)
			assert ("not_sorted1", not a_sorter.sorted (a_list))
			a_sorter.sort (a_list)
			assert ("sorted5", a_sorter.sorted (a_list))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 3, 4, 5>>, a_list.to_array)
				-- Sort reverse sorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (4), 3, 2, 1>>)
			assert ("not_sorted2", not a_sorter.sorted (a_list))
			a_sorter.sort (a_list)
			assert ("sorted6", a_sorter.sorted (a_list))
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 3, 4>>, a_list.to_array)
		end

	test_reverse_sort
			-- Test feature `reverse_sort'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_BUBBLE_SORTER [INTEGER]
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			create a_comparator.make
			create a_sorter.make (a_comparator)
				-- Reverse sort empty list.
			create a_list.make (0)
			assert ("reverse_sorted1", a_sorter.reverse_sorted (a_list))
			a_sorter.reverse_sort (a_list)
			assert ("reverse_sorted2", a_sorter.reverse_sorted (a_list))
				-- Reverse sort sorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>)
			assert ("not_reverse_sorted1", not a_sorter.reverse_sorted (a_list))
			a_sorter.reverse_sort (a_list)
			assert ("reverse_sorted3", a_sorter.reverse_sorted (a_list))
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (6), 5, 4, 3, 2, 1>>, a_list.to_array)
				-- Reverse sort unsorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>)
			assert ("not_reverse_sorted2", not a_sorter.reverse_sorted (a_list))
			a_sorter.reverse_sort (a_list)
			assert ("reverse_sorted4", a_sorter.reverse_sorted (a_list))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, a_list.to_array)
				-- Reverse sort already reverse sorted list.
			create a_list.make_from_array (<<INTEGER_.to_integer (4), 3, 2, 1>>)
			assert ("reverse_sorted5", a_sorter.reverse_sorted (a_list))
			a_sorter.reverse_sort (a_list)
			assert ("reverse_sorted6", a_sorter.reverse_sorted (a_list))
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (4), 3, 2, 1>>, a_list.to_array)
		end

end
