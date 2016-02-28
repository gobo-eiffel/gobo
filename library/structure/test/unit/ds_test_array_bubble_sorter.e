note

	description:

		"Test features of class DS_ARRAY_BUBBLE_SORTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_ARRAY_BUBBLE_SORTER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_ARRAY_BUBBLE_SORTER [INTEGER]
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
			a_sorter: DS_ARRAY_BUBBLE_SORTER [INTEGER]
			empty: ARRAY [INTEGER]
		do
			create empty.make_filled (0, 1, 0)
			create a_comparator.make
			create a_sorter.make (a_comparator)
			assert ("sorted1", a_sorter.sorted (empty))
			assert ("sorted2", a_sorter.sorted (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>))
			assert ("not_sorted1", not a_sorter.sorted (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>))
			assert ("not_sorted2", not a_sorter.sorted (<<INTEGER_.to_integer (4), 3, 2, 1>>))
		end

	test_reverse_sorted
			-- Test feature `reverse_sorted'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_ARRAY_BUBBLE_SORTER [INTEGER]
			empty: ARRAY [INTEGER]
		do
			create empty.make_filled (0, 1, 0)
			create a_comparator.make
			create a_sorter.make (a_comparator)
			assert ("reverse_sorted1", a_sorter.reverse_sorted (empty))
			assert ("not_reverse_sorted1", not a_sorter.reverse_sorted (<<INTEGER_.to_integer (1), 2, 3, 4, 5>>))
			assert ("not_reverse_sorted2", not a_sorter.reverse_sorted (<<INTEGER_.to_integer (1), 3, 5, 4, 2>>))
			assert ("reverse_sorted2", a_sorter.reverse_sorted (<<INTEGER_.to_integer (4), 3, 2, 1>>))
		end

	test_sort
			-- Test feature `sort'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_ARRAY_BUBBLE_SORTER [INTEGER]
			empty: ARRAY [INTEGER]
			an_array: ARRAY [INTEGER]
		do
			create empty.make_filled (0, 1, 0)
			create a_comparator.make
			create a_sorter.make (a_comparator)
				-- Sort empty array.
			assert ("sorted1", a_sorter.sorted (empty))
			a_sorter.sort (empty)
			assert ("sorted2", a_sorter.sorted (empty))
				-- Sort already sorted array.
			an_array := <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>
			assert ("sorted3", a_sorter.sorted (an_array))
			a_sorter.sort (an_array)
			assert ("sorted4", a_sorter.sorted (an_array))
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>, an_array)
				-- Sort unsorted array.
			an_array := <<INTEGER_.to_integer (1), 3, 5, 4, 2>>
			assert ("not_sorted1", not a_sorter.sorted (an_array))
			a_sorter.sort (an_array)
			assert ("sorted5", a_sorter.sorted (an_array))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 3, 4, 5>>, an_array)
				-- Sort reverse sorted array.
			an_array := <<INTEGER_.to_integer (4), 3, 2, 1>>
			assert ("not_sorted2", not a_sorter.sorted (an_array))
			a_sorter.sort (an_array)
			assert ("sorted6", a_sorter.sorted (an_array))
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 3, 4>>, an_array)
		end

	test_reverse_sort
			-- Test feature `reverse_sort'.
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_ARRAY_BUBBLE_SORTER [INTEGER]
			empty: ARRAY [INTEGER]
			an_array: ARRAY [INTEGER]
		do
			create empty.make_filled (0, 1, 0)
			create a_comparator.make
			create a_sorter.make (a_comparator)
				-- Reverse sort empty array.
			assert ("reverse_sorted1", a_sorter.reverse_sorted (empty))
			a_sorter.reverse_sort (empty)
			assert ("reverse_sorted2", a_sorter.reverse_sorted (empty))
				-- Reverse sort sorted array.
			an_array := <<INTEGER_.to_integer (1), 2, 3, 4, 5, 6>>
			assert ("not_reverse_sorted1", not a_sorter.reverse_sorted (an_array))
			a_sorter.reverse_sort (an_array)
			assert ("reverse_sorted3", a_sorter.reverse_sorted (an_array))
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (6), 5, 4, 3, 2, 1>>, an_array)
				-- Reverse sort unsorted array.
			an_array := <<INTEGER_.to_integer (1), 3, 5, 4, 2>>
			assert ("not_reverse_sorted2", not a_sorter.reverse_sorted (an_array))
			a_sorter.reverse_sort (an_array)
			assert ("reverse_sorted4", a_sorter.reverse_sorted (an_array))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (5), 4, 3, 2, 1>>, an_array)
				-- Reverse sort already reverse sorted array.
			an_array := <<INTEGER_.to_integer (4), 3, 2, 1>>
			assert ("reverse_sorted5", a_sorter.reverse_sorted (an_array))
			a_sorter.reverse_sort (an_array)
			assert ("reverse_sorted6", a_sorter.reverse_sorted (an_array))
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (4), 3, 2, 1>>, an_array)
		end

end
