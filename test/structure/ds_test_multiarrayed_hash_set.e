indexing

	description:

		"Test features of class DS_MULTIARRAYED_HASH_SET"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_TEST_MULTIARRAYED_HASH_SET

inherit

	TS_TEST_CASE

feature -- Test

	test_hash_set1 is
			-- Test features of DS_MULTIARRAYED_HASH_SET.
		local
			a_set: DS_MULTIARRAYED_HASH_SET [INTEGER]
		do
			create a_set.make_with_chunk_size (10, 2)
			assert ("empty1", a_set.is_empty)
			assert_integers_equal ("capacity", 10, a_set.capacity)
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
