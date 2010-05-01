note

	description:

		"Test features of class DS_SPARSE_SET"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_SPARSE_SET

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_sparse_set1 is
			-- Test features of DS_SPARSE_SET.
		local
			a_set: DS_SPARSE_SET [INTEGER]
		do
			create {DS_HASH_SET [INTEGER]} a_set.make (10)
			assert ("not_void1", a_set /= Void)
			assert ("empty1", a_set.is_empty)
			assert_integers_equal ("capacity", 10, a_set.capacity)
			check_integer_set1 (a_set)
			create {DS_MULTIARRAYED_HASH_SET [INTEGER]} a_set.make_with_chunk_size (10, 2)
			assert ("not_void1", a_set /= Void)
			assert ("empty1", a_set.is_empty)
			assert_integers_equal ("capacity", 10, a_set.capacity)
			check_integer_set1 (a_set)
		end

feature {NONE} -- Implementation

	check_integer_set1 (a_set: DS_SPARSE_SET [INTEGER]) is
			-- Test features of set `a_set'.
		require
			a_set_not_void: a_set /= Void
			a_set_empty: a_set.is_empty
		do
			a_set.put (1)
			a_set.force (2)
			a_set.put_new (3)
			a_set.force_new (4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4>>, a_set.to_array)
			assert ("has_1", a_set.has (1))
			assert ("has_2", a_set.has (2))
			assert ("has_3", a_set.has (3))
			assert ("has_4", a_set.has (4))
			assert ("not_has_5", not a_set.has (5))
			a_set.remove (3)
			assert ("not_has_3", not a_set.has (3))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 4>>, a_set.to_array)
			a_set.force_last (10)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 4, 10>>, a_set.to_array)
			a_set.put (5)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 5, 4, 10>>, a_set.to_array)
			a_set.remove (10)
			a_set.put (6)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 5, 4, 6>>, a_set.to_array)
			a_set.remove (6)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 5, 4>>, a_set.to_array)
			a_set.put (7)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 5, 4, 7>>, a_set.to_array)
			
			a_set.wipe_out
			assert ("empty2", a_set.is_empty)
			a_set.put (8)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (8)>>, a_set.to_array)
			a_set.put (8)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (8)>>, a_set.to_array)
		end

end
