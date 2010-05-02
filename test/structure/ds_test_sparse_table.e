note

	description:

		"Test features of class DS_SPARSE_TABLE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_TEST_SPARSE_TABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_sparse_table1
			-- Test features of DS_SPARSE_TABLE.
		local
			a_table: DS_SPARSE_TABLE [INTEGER, INTEGER]
		do
			create {DS_HASH_TABLE [INTEGER, INTEGER]} a_table.make (10)
			assert ("not_void1", a_table /= Void)
			assert ("empty1", a_table.is_empty)
			assert_integers_equal ("capacity", 10, a_table.capacity)
			check_integer_table1 (a_table)
			create {DS_MULTIARRAYED_HASH_TABLE [INTEGER, INTEGER]} a_table.make_with_chunk_size (10, 2)
			assert ("not_void1", a_table /= Void)
			assert ("empty1", a_table.is_empty)
			assert_integers_equal ("capacity", 10, a_table.capacity)
			check_integer_table1 (a_table)
		end

feature {NONE} -- Implementation

	check_integer_table1 (a_table: DS_SPARSE_TABLE [INTEGER, INTEGER])
			-- Test features of set `a_table'.
		require
			a_table_not_void: a_table /= Void
			a_table_empty: a_table.is_empty
		do
			a_table.put (1, 1)
			a_table.force (2, 2)
			a_table.put_new (3, 3)
			a_table.force_new (4, 4)
			assert_iarrays_same ("items1", <<INTEGER_.to_integer (1), 2, 3, 4>>, a_table.to_array)
			assert ("has_1", a_table.has (1))
			assert ("has_2", a_table.has (2))
			assert ("has_3", a_table.has (3))
			assert ("has_4", a_table.has (4))
			assert ("not_has_5", not a_table.has (5))
			a_table.remove (3)
			assert ("not_has_3", not a_table.has (3))
			assert_iarrays_same ("items2", <<INTEGER_.to_integer (1), 2, 4>>, a_table.to_array)
			a_table.force_last (10, 10)
			assert_iarrays_same ("items3", <<INTEGER_.to_integer (1), 2, 4, 10>>, a_table.to_array)
			a_table.put (5, 5)
			assert_iarrays_same ("items4", <<INTEGER_.to_integer (1), 2, 5, 4, 10>>, a_table.to_array)
			a_table.remove (10)
			a_table.put (6, 6)
			assert_iarrays_same ("items5", <<INTEGER_.to_integer (1), 2, 5, 4, 6>>, a_table.to_array)
			a_table.remove (6)
			assert_iarrays_same ("items6", <<INTEGER_.to_integer (1), 2, 5, 4>>, a_table.to_array)
			a_table.put (7, 7)
			assert_iarrays_same ("items7", <<INTEGER_.to_integer (1), 2, 5, 4, 7>>, a_table.to_array)
			a_table.wipe_out
			assert ("empty2", a_table.is_empty)
			a_table.put (8, 8)
			assert_iarrays_same ("items8", <<INTEGER_.to_integer (8)>>, a_table.to_array)
			a_table.put (8, 8)
			assert_iarrays_same ("items9", <<INTEGER_.to_integer (8)>>, a_table.to_array)
		end

end
