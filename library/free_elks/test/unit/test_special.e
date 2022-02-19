note

	description:

		"Test features of class SPECIAL"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_SPECIAL

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make_filled_1
			-- Test feature 'make_filled'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (17, 5)
			assert ("not_void", sp1 /= Void)
			assert_integers_equal ("count", 5, sp1.count)
		end

	test_make_filled_2
			-- Test feature 'make_filled'.
		local
			sp1: SPECIAL [STRING]
		do
			create sp1.make_filled ("gobo", 2)
			assert ("not_void", sp1 /= Void)
			assert_integers_equal ("count", 2, sp1.count)
		end

	test_make_filled_3
			-- Test feature 'make_filled'.
		local
			sp1: SPECIAL [STRING]
		do
			create sp1.make_filled ("eiffel", 0)
			assert ("not_void", sp1 /= Void)
			assert_integers_equal ("count", 0, sp1.count)
		end

	test_count_1
			-- Test feature 'count'.
		local
			sp1: SPECIAL [BOOLEAN]
		do
			create sp1.make_filled (True, 10)
			assert_integers_equal ("count", 10, sp1.count)
		end

	test_count_2
			-- Test feature 'count'.
		local
			sp1: SPECIAL [ANY]
		do
			create sp1.make_filled ("gobo", 12)
			assert_integers_equal ("count", 12, sp1.count)
		end

	test_count_3
			-- Test feature 'count'.
		local
			sp1: SPECIAL [ANY]
		do
			create sp1.make_filled ("eiffel", 0)
			assert_integers_equal ("count", 0, sp1.count)
		end

	test_capacity_1
			-- Test feature 'capacity'.
		local
			sp1: SPECIAL [BOOLEAN]
		do
			create sp1.make_filled (True, 10)
			assert_integers_equal ("capacity", 10, sp1.capacity)
		end

	test_capacity_2
			-- Test feature 'capacity'.
		local
			sp1: SPECIAL [ANY]
		do
			create sp1.make_filled ("gobo", 12)
			assert_integers_equal ("capacity", 12, sp1.capacity)
		end

	test_capacity_3
			-- Test feature 'capacity'.
		local
			sp1: SPECIAL [ANY]
		do
			create sp1.make_filled ("eiffel", 0)
			assert_integers_equal ("capacity", 0, sp1.capacity)
		end

	test_lower_1
			-- Test feature 'lower'.
		local
			sp1: SPECIAL [CHARACTER]
		do
			create sp1.make_filled ('z', 10)
			assert_integers_equal ("lower", 0, sp1.lower)
		end

	test_lower_2
			-- Test feature 'lower'.
		local
			sp1: SPECIAL [STRING]
		do
			create sp1.make_filled ("gobo", 12)
			assert_integers_equal ("lower", 0, sp1.lower)
		end

	test_lower_3
			-- Test feature 'lower'.
		local
			sp1: SPECIAL [STRING]
		do
			create sp1.make_filled ("eiffel", 0)
			assert_integers_equal ("lower", 0, sp1.lower)
		end

	test_upper_1
			-- Test feature 'upper'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (17, 5)
			assert_integers_equal ("upper", 4, sp1.upper)
		end

	test_upper_2
			-- Test feature 'upper'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (18, 0)
			assert_integers_equal ("upper", -1, sp1.upper)
		end

	test_upper_3
			-- Test feature 'upper'.
		local
			sp1: SPECIAL [ANY]
		do
			create sp1.make_filled ("eiffel", 7)
			assert_integers_equal ("upper", 6, sp1.upper)
		end

	test_item_address_1
			-- Test feature 'item_address'.
		local
			sp1: SPECIAL [INTEGER_32]
		do
			create sp1.make_filled (17, 3)
			assert ("item_address", sp1.item_address (2) = sp1.base_address + 2 * {PLATFORM}.integer_32_bytes)
		end

	test_item_address_2
			-- Test feature 'item_address'.
		local
			sp1: SPECIAL [STRING]
		do
			create sp1.make_filled ("gobo", 4)
			assert ("item_address", sp1.item_address (1) = sp1.base_address + {PLATFORM}.pointer_bytes)
		end

	test_item_1
			-- Test feature 'item'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (17, 4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			assert_integers_equal ("item_0", 5, sp1.item (0))
			assert_integers_equal ("item_1", 17, sp1.item (1))
			assert_integers_equal ("item_2", 7, sp1.item (2))
			assert_integers_equal ("item_3", 17, sp1.item (3))
		end

	test_item_2
			-- Test feature 'item'.
		local
			sp1: SPECIAL [detachable STRING]
		do
			create sp1.make_filled (Void, 3)
			sp1.put ("foo", 1)
			sp1.put ("bar", 2)
			assert ("item_0", sp1.item (0) = Void)
			assert_equal ("item_1", "foo", sp1.item (1))
			assert_equal ("item_2", "bar", sp1.item (2))
		end

	test_alias_bracket_1
			-- Test feature 'alias "[]"'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (17, 4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			assert_integers_equal ("item_0", 5, sp1 [0])
			assert_integers_equal ("item_1", 17, sp1 [1])
			assert_integers_equal ("item_2", 7, sp1 [2])
			assert_integers_equal ("item_3", 17, sp1 [3])
		end

	test_alias_bracket_2
			-- Test feature 'alias "[]"'.
		local
			sp1: SPECIAL [detachable STRING]
		do
			create sp1.make_filled (Void, 3)
			sp1.put ("foo", 1)
			sp1.put ("bar", 2)
			assert ("item_0", sp1 [0] = Void)
			assert_equal ("item_1", "foo", sp1 [1])
			assert_equal ("item_2", "bar", sp1 [2])
		end

	test_index_of_1
			-- Test feature 'index_of'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			sp1.put (5, 3)
			assert_integers_equal ("index_1", -1, sp1.index_of (8, 0))
			assert_integers_equal ("index_2", -1, sp1.index_of (5, 10))
			assert_integers_equal ("index_3", 0, sp1.index_of (5, 0))
			assert_integers_equal ("index_4", 3, sp1.index_of (5, 1))
			assert_integers_equal ("index_5", 1, sp1.index_of (0, 0))
		end

	test_index_of_2
			-- Test feature 'index_of'.
		local
			sp1: SPECIAL [detachable STRING]
		do
			create sp1.make_filled (Void, 3)
			sp1.put ("foo", 1)
			sp1.put ("bar", 2)
			assert_integers_equal ("index_1", 0, sp1.index_of (Void, 0))
			assert_integers_equal ("index_2", -1, sp1.index_of ("gobo", 0))
			assert_integers_equal ("index_3", -1, sp1.index_of ("foo", 2))
			assert_integers_equal ("index_4", -1, sp1.index_of ("foo", 3))
			assert_integers_equal ("index_5", 1, sp1.index_of ("foo", 1))
			assert_integers_equal ("index_6", 2, sp1.index_of ("bar", 0))
		end

	test_same_items_1
			-- Test feature 'index_of'.
		local
			sp1, sp2: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 4)
			create sp2.make_filled (0, 6)
			assert ("same_items_1", sp1.same_items (sp2, 0, 0, 4))
			sp2.put (5, 4)
			assert ("same_items_2", sp1.same_items (sp2, 0, 0, 4))
			sp2.put (9, 2)
			assert ("not_same_items_1", not sp1.same_items (sp2, 0, 0, 4))
			assert ("not_same_items_2", not sp1.same_items (sp2, 0, 0, 3))
			assert ("same_items_3", sp1.same_items (sp2, 0, 0, 2))
			assert ("same_items_4", sp1.same_items (sp2, 0, 0, 1))
			assert ("same_items_5", sp1.same_items (sp2, 0, 0, 0))
			sp1.put (9, 2)
			assert ("same_items_6", sp1.same_items (sp2, 0, 0, 4))
			assert ("same_items_7", sp1.same_items (sp1, 0, 0, 4))
			assert ("same_items_8", sp2.same_items (sp2, 0, 0, 4))
		end

	test_same_items_2
			-- Test feature 'index_of'.
		local
			sp1, sp2: SPECIAL [detachable STRING]
			s1, s2: STRING
		do
			create sp1.make_filled (Void, 3)
			create sp2.make_filled (Void, 2)
			assert ("same_items_1", sp1.same_items (sp2, 0, 0, 2))
			s1 := "foo"
			s2 := "bar"
			sp1.put (s1, 0)
			assert ("not_same_items_1", not sp1.same_items (sp2, 0, 0, 2))
			assert ("not_same_items_2", not sp1.same_items (sp2, 0, 0, 1))
			assert ("same_items_2", sp1.same_items (sp2, 0, 0, 0))
			sp2.put ("foo", 0)
			assert ("not_same_items_3", not sp1.same_items (sp2, 0, 0, 1))
			sp2.put (s2, 0)
			assert ("not_same_items_4", not sp1.same_items (sp2, 0, 0, 1))
			sp2.put (s1, 0)
			assert ("same_items_3", sp1.same_items (sp2, 0, 0, 2))
			sp2.put (s2, 1)
			assert ("same_items_4", sp1.same_items (sp1, 0, 0, 2))
			assert ("same_items_5", sp2.same_items (sp2, 0, 0, 2))
		end

	test_valid_index_1
			-- Test feature 'valid_index'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			assert ("not_valid_1", not sp1.valid_index (-1))
			assert ("valid_1", sp1.valid_index (0))
			assert ("valid_2", sp1.valid_index (1))
			assert ("not_valid_2", not sp1.valid_index (2))
		end

	test_valid_index_2
			-- Test feature 'valid_index'.
		local
			sp1: SPECIAL [detachable STRING]
		do
			create sp1.make_filled (Void, 3)
			assert ("not_valid_1", not sp1.valid_index (-1))
			assert ("valid_1", sp1.valid_index (0))
			assert ("valid_2", sp1.valid_index (1))
			assert ("valid_3", sp1.valid_index (2))
			assert ("not_valid_2", not sp1.valid_index (3))
		end

	test_put_1
			-- Test feature 'put'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			sp1.put (7, 0)
			assert_integers_equal ("put_1", 7, sp1.item (0))
			assert_integers_equal ("put_2", 0, sp1.item (1))
			sp1.put (9, 1)
			assert_integers_equal ("put_3", 7, sp1.item (0))
			assert_integers_equal ("put_4", 9, sp1.item (1))
			sp1.put (34, 1)
			assert_integers_equal ("put_5", 34, sp1.item (1))
		end

	test_put_2
			-- Test feature 'put'.
		local
			sp1: SPECIAL [detachable STRING]
			s1, s2: STRING
		do
			create sp1.make_filled (Void, 2)
			s1 := "gobo"
			s2 := "bar"
			sp1.put (s1, 0)
			assert_same ("put_1", s1, sp1.item (0))
			assert_same ("put_2", Void, sp1.item (1))
			sp1.put (s2, 1)
			assert_same ("put_3", s1, sp1.item (0))
			assert_same ("put_4", s2, sp1.item (1))
		end

	test_put_3
			-- Test feature 'put'.
		local
			sp1: SPECIAL [detachable ANY]
			s1: STRING
		do
			create sp1.make_filled (Void, 3)
			s1 := "gobo"
			sp1.put (s1, 1)
			sp1.put (5, 2)
			assert_same ("put_1", Void, sp1.item (0))
			assert_same ("put_2", s1, sp1.item (1))
			assert_equal ("put_3", 5, sp1.item (2))
		end

	test_fill_with_1
			-- Test feature 'fill_with'.
		local
			sp1: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 4)
			sp1.fill_with (8, 1, 2)
			assert_integers_equal ("fill_1", 0, sp1.item (0))
			assert_integers_equal ("fill_2", 8, sp1.item (1))
			assert_integers_equal ("fill_3", 8, sp1.item (2))
			assert_integers_equal ("fill_4", 0, sp1.item (3))
			sp1.fill_with (5, 0, 3)
			assert_integers_equal ("fill_5", 5, sp1.item (0))
			assert_integers_equal ("fill_6", 5, sp1.item (1))
			assert_integers_equal ("fill_7", 5, sp1.item (2))
			assert_integers_equal ("fill_8", 5, sp1.item (3))
		end

	test_fill_with_2
			-- Test feature 'fill_with'.
		local
			sp1: SPECIAL [detachable STRING]
			s: STRING
		do
			create sp1.make_filled (Void, 3)
			s := "gobo"
			sp1.fill_with (s, 1, 1)
			assert_same ("fill_1", Void, sp1.item (0))
			assert_same ("fill_2", s, sp1.item (1))
			assert_same ("fill_3", Void, sp1.item (2))
			s := "bar"
			sp1.fill_with (s, 0, 2)
			assert_same ("fill_4", s, sp1.item (0))
			assert_same ("fill_5", s, sp1.item (1))
			assert_same ("fill_6", s, sp1.item (2))
		end

	test_copy_data_1
			-- Test feature 'copy_data'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
		do
			create sp1.make_filled ('z', 4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			create sp2.make_filled ('%U', 6)
			sp2.copy_data (sp1, 0, 1, 3)
			assert_characters_equal ("copied_1", '%U', sp2.item (0))
			assert_characters_equal ("copied_2", 'a', sp2.item (1))
			assert_characters_equal ("copied_3", 'b', sp2.item (2))
			assert_characters_equal ("copied_4", 'c', sp2.item (3))
			assert_characters_equal ("copied_5", '%U', sp2.item (4))
			assert_characters_equal ("copied_6", '%U', sp2.item (5))
			sp2.copy_data (sp2, 1, 0, 3)
			assert_characters_equal ("copied_7", 'a', sp2.item (0))
			assert_characters_equal ("copied_8", 'b', sp2.item (1))
			assert_characters_equal ("copied_9", 'c', sp2.item (2))
			assert_characters_equal ("copied_10", 'c', sp2.item (3))
			assert_characters_equal ("copied_11", '%U', sp2.item (4))
			assert_characters_equal ("copied_12", '%U', sp2.item (5))
		end

	test_copy_data_2
			-- Test feature 'copy_data'.
		local
			sp1, sp2: SPECIAL [detachable STRING]
			s1, s2: STRING
		do
			create sp1.make_filled (Void, 3)
			s1 := "foo"
			s2 := "bar"
			sp1.put (s1, 0)
			sp1.put (s2, 1)
			create sp2.make_filled (Void, 3)
			sp2.copy_data (sp1, 0, 0, 2)
			assert_same ("copied_1", s1, sp2.item (0))
			assert_same ("copied_2", s2, sp2.item (1))
			assert_same ("copied_3", Void, sp2.item (2))
			sp2.copy_data (sp2, 0, 2, 1)
			assert_same ("copied_4", s1, sp2.item (0))
			assert_same ("copied_5", s2, sp2.item (1))
			assert_same ("copied_6", s1, sp2.item (2))
		end

	test_move_data_1
			-- Test feature 'move_data'.
		local
			sp1: SPECIAL [CHARACTER]
		do
			create sp1.make_filled ('z', 4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp1.move_data (0, 1, 2)
			assert_characters_equal ("moved_1", 'a', sp1.item (0))
			assert_characters_equal ("moved_2", 'a', sp1.item (1))
			assert_characters_equal ("moved_3", 'b', sp1.item (2))
			assert_characters_equal ("moved_4", 'd', sp1.item (3))
			sp1.move_data (1, 1, 3)
			assert_characters_equal ("moved_5", 'a', sp1.item (0))
			assert_characters_equal ("moved_6", 'a', sp1.item (1))
			assert_characters_equal ("moved_7", 'b', sp1.item (2))
			assert_characters_equal ("moved_8", 'd', sp1.item (3))
			sp1.move_data (2, 1, 2)
			assert_characters_equal ("moved_9", 'a', sp1.item (0))
			assert_characters_equal ("moved_10", 'b', sp1.item (1))
			assert_characters_equal ("moved_11", 'd', sp1.item (2))
			assert_characters_equal ("moved_12", 'd', sp1.item (3))
		end

	test_move_data_2
			-- Test feature 'move_data'.
		local
			sp1: SPECIAL [detachable STRING]
			s1, s2: STRING
		do
			create sp1.make_filled (Void, 3)
			s1 := "foo"
			s2 := "bar"
			sp1.put (s1, 0)
			sp1.put (s2, 1)
			sp1.move_data (0, 0, 2)
			assert_same ("moved_1", s1, sp1.item (0))
			assert_same ("moved_2", s2, sp1.item (1))
			assert_same ("moved_3", Void, sp1.item (2))
			sp1.move_data (0, 1, 2)
			assert_same ("moved_4", s1, sp1.item (0))
			assert_same ("moved_5", s1, sp1.item (1))
			assert_same ("moved_6", s2, sp1.item (2))
			sp1.move_data (1, 0, 2)
			assert_same ("moved_7", s1, sp1.item (0))
			assert_same ("moved_8", s2, sp1.item (1))
			assert_same ("moved_9", s2, sp1.item (2))
		end

	test_aliased_resized_area_with_default_1
			-- Test feature 'aliased_resized_area_with_default'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
		do
			create sp1.make_filled ('z', 4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp2 := sp1.aliased_resized_area_with_default ('%U', 6)
			assert_integers_equal ("count", 6, sp2.count)
			assert_characters_equal ("resized_1", 'a', sp2.item (0))
			assert_characters_equal ("resized_2", 'b', sp2.item (1))
			assert_characters_equal ("resized_3", 'c', sp2.item (2))
			assert_characters_equal ("resized_4", 'd', sp2.item (3))
			assert_characters_equal ("resized_5", '%U', sp2.item (4))
			assert_characters_equal ("resized_6", '%U', sp2.item (5))
		end

	test_aliased_resized_area_with_default_2
			-- Test feature 'aliased_resized_area_with_default'.
		local
			sp1, sp2: SPECIAL [detachable STRING]
			s1, s2, s3: STRING
		do
			create sp1.make_filled (Void, 3)
			s1 := "gobo"
			s2 := "foo"
			s3 := "bar"
			sp1.put (s1, 0)
			sp1.put (s2, 1)
			sp1.put (s3, 2)
			sp2 := sp1.aliased_resized_area_with_default (Void, 4)
			assert_integers_equal ("count", 4, sp2.count)
			assert_same ("resized_1", s1, sp2.item (0))
			assert_same ("resized_2", s2, sp2.item (1))
			assert_same ("resized_3", s3, sp2.item (2))
			assert_same ("resized_4", Void, sp2.item (3))
		end

	test_deep_copy_1
			-- Test feature 'deep_copy'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
		do
			create sp1.make_filled ('z', 4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			create sp2.make_filled ('z', 4)
			sp2.deep_copy (sp1)
			assert_integers_equal ("count", 4, sp2.count)
			assert_characters_equal ("deep_copy_0", 'a', sp2.item (0))
			assert_characters_equal ("deep_copy_1", 'b', sp2.item (1))
			assert_characters_equal ("deep_copy_2", 'c', sp2.item (2))
			assert_characters_equal ("deep_copy_3", 'd', sp2.item (3))
		end

	test_deep_copy_2
			-- Test feature 'deep_copy'.
		local
			sp1, sp2: SPECIAL [detachable STRING]
			s1, s2, s3: STRING
		do
			create sp1.make_filled (Void, 3)
			s1 := "gobo"
			s2 := "foo"
			s3 := "bar"
			sp1.put (s1, 0)
			sp1.put (s2, 1)
			sp1.put (s3, 2)
			create sp2.make_filled (Void, 3)
			sp2.deep_copy (sp1)
			assert_integers_equal ("count", 3, sp2.count)
			assert_strings_equal ("deep_copy_0a", s1, sp2.item (0))
			assert_not_same ("deep_copy_0b", s1, sp2.item (0))
			assert_strings_equal ("deep_copy_1a", s2, sp2.item (1))
			assert_not_same ("deep_copy_1b", s2, sp2.item (1))
			assert_strings_equal ("deep_copy_2a", s3, sp2.item (2))
			assert_not_same ("deep_copy_2b", s3, sp2.item (2))
		end

	test_copy_basic_expanded_1
			-- Test feature 'copy' with basic expanded types.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			b: BOOLEAN
		do
				-- `sp1' has more items than `sp2'.
				-- ISE's behavior:
				-- * All items of `sp2' will be copied to `sp1'.
				-- * The other items in `sp1' will not be changed.
				-- * The 'count' and 'capacity' in `sp1' will not change.
				-- * It violates 'copy's postcondition "is_equal".
			create sp1.make_empty (10)
			sp1.extend ('a')
			sp1.extend ('b')
			sp1.extend ('c')
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_characters_equal ("sp1_item0_1", 'a', sp1.item (0))
			assert_characters_equal ("sp1_item1_1", 'b', sp1.item (1))
			assert_characters_equal ("sp1_item2_1", 'c', sp1.item (2))
			create sp2.make_empty (5)
			sp2.extend ('x')
			sp2.extend ('y')
			assert_integers_equal ("sp2_capacity_1", 5, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 2, sp2.count)
			assert_characters_equal ("sp2_item0_1", 'x', sp2.item (0))
			assert_characters_equal ("sp2_item1_1", 'y', sp2.item (1))
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_2", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 3, sp1.count)
			assert_characters_equal ("sp1_item0_2", 'x', sp1.item (0))
			assert_characters_equal ("sp1_item1_2", 'y', sp1.item (1))
			assert_characters_equal ("sp1_item2_2", 'c', sp1.item (2))
		end

	test_copy_basic_expanded_2
			-- Test feature 'copy' with basic expanded types.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			b: BOOLEAN
		do
				-- `sp1' has less items than `sp2'.
				-- ISE's behavior:
				-- * All items of `sp1' will be replaced by the first items in `sp2'.
				-- * The 'count' and 'capacity' in `sp1' will not change.
				-- * It violates 'copy's postcondition "is_equal".
			create sp1.make_empty (5)
			sp1.extend ('a')
			sp1.extend ('b')
			assert_integers_equal ("sp1_capacity_1", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 2, sp1.count)
			assert_characters_equal ("sp1_item0_1", 'a', sp1.item (0))
			assert_characters_equal ("sp1_item1_1", 'b', sp1.item (1))
			create sp2.make_empty (10)
			sp2.extend ('x')
			sp2.extend ('y')
			sp2.extend ('z')
			assert_integers_equal ("sp2_capacity_1", 10, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 3, sp2.count)
			assert_characters_equal ("sp2_item0_1", 'x', sp2.item (0))
			assert_characters_equal ("sp2_item1_1", 'y', sp2.item (1))
			assert_characters_equal ("sp2_item2_1", 'z', sp2.item (2))
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_2", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 2, sp1.count)
			assert_characters_equal ("sp1_item0_2", 'x', sp1.item (0))
			assert_characters_equal ("sp1_item1_2", 'y', sp1.item (1))
		end

	test_copy_reference_1
			-- Test feature 'copy' with reference types.
		local
			sp1, sp2: SPECIAL [STRING]
			a, b, c: STRING
			x, y: STRING
			l_assert: BOOLEAN
		do
				-- `sp1' has more items than `sp2'.
				-- All items of `sp2' will be copied to `sp1'.
				-- The other items in `sp1' will not be changed.
				-- The 'count' and 'capacity' in `sp1' will not change.
			a := "a"
			b := "b"
			c := "c"
			x := "x"
			y := "y"
			create sp1.make_empty (10)
			sp1.extend (a)
			sp1.extend (b)
			sp1.extend (c)
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_same ("sp1_item0_1", a, sp1.item (0))
			assert_same ("sp1_item1_1", b, sp1.item (1))
			assert_same ("sp1_item2_1", c, sp1.item (2))
			create sp2.make_empty (5)
			sp2.extend (x)
			sp2.extend (y)
			assert_integers_equal ("sp2_capacity_1", 5, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 2, sp2.count)
			assert_same ("sp2_item0_1", x, sp2.item (0))
			assert_same ("sp2_item1_1", y, sp2.item (1))
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			l_assert := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			l_assert := {ISE_RUNTIME}.check_assert (l_assert)
			assert_integers_equal ("sp1_capacity_2", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 3, sp1.count)
			assert_same ("sp1_item0_2", x, sp1.item (0))
			assert_same ("sp1_item1_2", y, sp1.item (1))
			assert_same ("sp1_item2_2", c, sp1.item (2))
		end

	test_copy_reference_2
			-- Test feature 'copy' with reference types.
		local
			sp1, sp2: SPECIAL [STRING]
			a, b: STRING
			x, y, z: STRING
			l_assert: BOOLEAN
		do
				-- `sp1' has less items than `sp2'.
				-- All items of `sp1' will be replaced by the first items in `sp2'.
				-- The 'count' and 'capacity' in `sp1' will not change.
			a := "a"
			b := "b"
			x := "x"
			y := "y"
			z := "z"
			create sp1.make_empty (5)
			sp1.extend (a)
			sp1.extend (b)
			assert_integers_equal ("sp1_capacity_1", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 2, sp1.count)
			assert_same ("sp1_item0_1", a, sp1.item (0))
			assert_same ("sp1_item1_1", b, sp1.item (1))
			create sp2.make_empty (10)
			sp2.extend (x)
			sp2.extend (y)
			sp2.extend (z)
			assert_integers_equal ("sp2_capacity_1", 10, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 3, sp2.count)
			assert_same ("sp2_item0_1", x, sp2.item (0))
			assert_same ("sp2_item1_1", y, sp2.item (1))
			assert_same ("sp2_item2_1", z, sp2.item (2))
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			l_assert := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			l_assert := {ISE_RUNTIME}.check_assert (l_assert)
			assert_integers_equal ("sp1_capacity_2", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 2, sp1.count)
			assert_same ("sp1_item0_2", x, sp1.item (0))
			assert_same ("sp1_item1_2", y, sp1.item (1))
		end

	test_copy_non_basic_expanded_1
			-- Test feature 'copy' with non-basic expanded types.
		local
			sp1, sp2: SPECIAL [ZZ]
			z: ZZ
			b: BOOLEAN
		do
				-- `sp1' has more items than `sp2'.
				-- All items of `sp2' will be copied to `sp1'.
				-- The other items in `sp1' will not be changed.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (10)
			z.set_attr (1)
			z.set_copy_count (25)
			sp1.extend (z)
			z.set_attr (2)
			z.set_copy_count (25)
			sp1.extend (z)
			z.set_attr (3)
			z.set_copy_count (25)
			sp1.extend (z)
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_integers_equal ("sp1_item0_1", 1, sp1.item (0).attr)
			assert_integers_equal ("sp1_item1_1", 2, sp1.item (1).attr)
			assert_integers_equal ("sp1_item2_1", 3, sp1.item (2).attr)
			create sp2.make_empty (5)
			z.set_attr (7)
			z.set_copy_count (25)
			sp2.extend (z)
			z.set_attr (8)
			z.set_copy_count (25)
			sp2.extend (z)
			assert_integers_equal ("sp2_capacity_1", 5, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 2, sp2.count)
			assert_integers_equal ("sp2_item0_1", 7, sp2.item (0).attr)
			assert_integers_equal ("sp2_item1_1", 8, sp2.item (1).attr)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_2", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 3, sp1.count)
			assert_integers_equal ("sp1_item0_2", 7, sp1.item (0).attr)
			assert_integers_equal ("sp1_copy_count0_2", 1, sp1.item (0).copy_count)
			assert_integers_equal ("sp1_item1_2", 8, sp1.item (1).attr)
			assert_integers_equal ("sp1_copy_count1_2", 1, sp1.item (1).copy_count)
			assert_integers_equal ("sp1_item2_2", 3, sp1.item (2).attr)
		end

	test_copy_non_basic_expanded_2
			-- Test feature 'copy' with non-basic expanded types.
		local
			sp1, sp2: SPECIAL [ZZ]
			z: ZZ
			b: BOOLEAN
		do
				-- `sp1' has less items than `sp2'.
				-- All items of `sp1' will be replaced by the first items in `sp2'.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (5)
			z.set_attr (1)
			z.set_copy_count (25)
			sp1.extend (z)
			z.set_attr (2)
			z.set_copy_count (25)
			sp1.extend (z)
			assert_integers_equal ("sp1_capacity_1", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 2, sp1.count)
			assert_integers_equal ("sp1_item0_1", 1, sp1.item (0).attr)
			assert_integers_equal ("sp1_item1_1", 2, sp1.item (1).attr)
			create sp2.make_empty (10)
			z.set_attr (7)
			z.set_copy_count (25)
			sp2.extend (z)
			z.set_attr (8)
			z.set_copy_count (25)
			sp2.extend (z)
			z.set_attr (9)
			z.set_copy_count (25)
			sp2.extend (z)
			assert_integers_equal ("sp2_capacity_1", 10, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 3, sp2.count)
			assert_integers_equal ("sp2_item0_1", 7, sp2.item (0).attr)
			assert_integers_equal ("sp2_item1_1", 8, sp2.item (1).attr)
			assert_integers_equal ("sp2_item2_1", 9, sp2.item (2).attr)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_2", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 2, sp1.count)
			assert_integers_equal ("sp1_item0_2", 7, sp1.item (0).attr)
			assert_integers_equal ("sp1_copy_count0_2", 1, sp1.item (0).copy_count)
			assert_integers_equal ("sp1_item1_2", 8, sp1.item (1).attr)
			assert_integers_equal ("sp1_copy_count1_2", 1, sp1.item (1).copy_count)
		end

	test_deep_copy_basic_expanded
			-- Test feature 'deep_copy' with basic expanded types.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			b: BOOLEAN
		do
				-- `sp1' has more items than `sp2'.
				-- All items of `sp2' will be copied to `sp1'.
				-- The other items in `sp1' will not be changed.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (10)
			sp1.extend ('a')
			sp1.extend ('b')
			sp1.extend ('c')
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_characters_equal ("sp1_item0_1", 'a', sp1.item (0))
			assert_characters_equal ("sp1_item1_1", 'b', sp1.item (1))
			assert_characters_equal ("sp1_item2_1", 'c', sp1.item (2))
			create sp2.make_empty (5)
			sp2.extend ('x')
			sp2.extend ('y')
			assert_integers_equal ("sp2_capacity_1", 5, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 2, sp2.count)
			assert_characters_equal ("sp2_item0_1", 'x', sp2.item (0))
			assert_characters_equal ("sp2_item1_1", 'y', sp2.item (1))
				-- The following call to 'deep_copy' violates the
				-- postcondition "is_equal" of 'copy'.
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.deep_copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_2", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 3, sp1.count)
			assert_characters_equal ("sp1_item0_2", 'x', sp1.item (0))
			assert_characters_equal ("sp1_item1_2", 'y', sp1.item (1))
			assert_characters_equal ("sp1_item2_2", 'c', sp1.item (2))
				-- `sp1' has less items than `sp2'.
				-- All items of `sp1' will be replaced by the first items in `sp2'.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (5)
			sp1.extend ('a')
			sp1.extend ('b')
			assert_integers_equal ("sp1_capacity_3", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_3", 2, sp1.count)
			assert_characters_equal ("sp1_item0_3", 'a', sp1.item (0))
			assert_characters_equal ("sp1_item1_3", 'b', sp1.item (1))
			create sp2.make_empty (10)
			sp2.extend ('x')
			sp2.extend ('y')
			sp2.extend ('z')
			assert_integers_equal ("sp2_capacity_3", 10, sp2.capacity)
			assert_integers_equal ("sp2_count_3", 3, sp2.count)
			assert_characters_equal ("sp2_item0_3", 'x', sp2.item (0))
			assert_characters_equal ("sp2_item1_3", 'y', sp2.item (1))
			assert_characters_equal ("sp2_item2_3", 'z', sp2.item (2))
				-- The following call to 'deep_copy' violates the
				-- postcondition "is_equal" of 'copy'.
			b := {ISE_RUNTIME}.check_assert (False)
			sp1.deep_copy (sp2)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp1_capacity_4", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_4", 2, sp1.count)
			assert_characters_equal ("sp1_item0_4", 'x', sp1.item (0))
			assert_characters_equal ("sp1_item1_4", 'y', sp1.item (1))
		end

	test_deep_copy_reference
			-- Test feature 'deep_copy' with reference types.
		local
			sp1, sp2: SPECIAL [STRING]
			a, b, c: STRING
			x, y, z: STRING
			l_assert: BOOLEAN
		do
			a := "a"
			b := "b"
			c := "c"
			x := "x"
			y := "y"
			z := "z"
				-- `sp1' has more items than `sp2'.
				-- A twin of all items of `sp2' will be deep copied to `sp1'.
				-- The other items in `sp1' will not be changed.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (10)
			sp1.extend (a)
			sp1.extend (b)
			sp1.extend (c)
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_same ("sp1_item0_1", a, sp1.item (0))
			assert_same ("sp1_item1_1", b, sp1.item (1))
			assert_same ("sp1_item2_1", c, sp1.item (2))
			create sp2.make_empty (5)
			sp2.extend (x)
			sp2.extend (y)
			assert_integers_equal ("sp2_capacity_1", 5, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 2, sp2.count)
			assert_same ("sp2_item0_1", x, sp2.item (0))
			assert_same ("sp2_item1_1", y, sp2.item (1))
				-- The following call to 'deep_copy' violates the
				-- postcondition "is_equal" of 'copy'.
			l_assert := {ISE_RUNTIME}.check_assert (False)
			sp1.deep_copy (sp2)
			l_assert := {ISE_RUNTIME}.check_assert (l_assert)
			assert_integers_equal ("sp1_capacity_2", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_2", 3, sp1.count)
			assert_not_same ("sp1_item0_2a", x, sp1.item (0))
			assert_strings_equal ("sp1_item0_2n", x, sp1.item (0))
			assert_not_same ("sp1_item1_2a", y, sp1.item (1))
			assert_strings_equal ("sp1_item1_2b", y, sp1.item (1))
			assert_same ("sp1_item2_2", c, sp1.item (2))
				-- `sp1' has less items than `sp2'.
				-- All items of `sp1' will be replaced by a twin of the first items in `sp2'.
				-- The 'count' and 'capacity' in `sp1' will not change.
			create sp1.make_empty (5)
			sp1.extend (a)
			sp1.extend (b)
			assert_integers_equal ("sp1_capacity_3", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_3", 2, sp1.count)
			assert_same ("sp1_item0_3", a, sp1.item (0))
			assert_same ("sp1_item1_3", b, sp1.item (1))
			create sp2.make_empty (10)
			sp2.extend (x)
			sp2.extend (y)
			sp2.extend (z)
			assert_integers_equal ("sp2_capacity_3", 10, sp2.capacity)
			assert_integers_equal ("sp2_count_3", 3, sp2.count)
			assert_same ("sp2_item0_3", x, sp2.item (0))
			assert_same ("sp2_item1_3", y, sp2.item (1))
			assert_same ("sp2_item2_3", z, sp2.item (2))
				-- The following call to 'deep_copy' violates the
				-- postcondition "is_equal" of 'copy'.
			l_assert := {ISE_RUNTIME}.check_assert (False)
			sp1.deep_copy (sp2)
			l_assert := {ISE_RUNTIME}.check_assert (l_assert)
			assert_integers_equal ("sp1_capacity_4", 5, sp1.capacity)
			assert_integers_equal ("sp1_count_4", 2, sp1.count)
			assert_not_same ("sp1_item0_4a", x, sp1.item (0))
			assert_strings_equal ("sp1_item0_4b", x, sp1.item (0))
			assert_not_same ("sp1_item1_4a", y, sp1.item (1))
			assert_strings_equal ("sp1_item1_4b", y, sp1.item (1))
		end

	test_twin_basic_expanded
			-- Test feature 'twin' with basic expanded types.
		local
			sp1, sp2: SPECIAL [CHARACTER]
		do
				-- 'twin' sets the capacity of the new object to
				-- the same value as 'count', which may be different
				-- from the capacity of the original object.
			create sp1.make_empty (10)
			sp1.extend ('a')
			sp1.extend ('b')
			sp1.extend ('c')
			assert_integers_equal ("sp1_capacity_1", 10, sp1.capacity)
			assert_integers_equal ("sp1_count_1", 3, sp1.count)
			assert_characters_equal ("sp1_item0_1", 'a', sp1.item (0))
			assert_characters_equal ("sp1_item1_1", 'b', sp1.item (1))
			assert_characters_equal ("sp1_item2_1", 'c', sp1.item (2))
			sp2 := sp1.twin
			assert_integers_equal ("sp2_capacity_1", 3, sp2.capacity)
			assert_integers_equal ("sp2_count_1", 3, sp2.count)
			assert_characters_equal ("sp2_item0_1", 'a', sp2.item (0))
			assert_characters_equal ("sp2_item1_1", 'b', sp2.item (1))
			assert_characters_equal ("sp2_item2_1", 'c', sp2.item (2))
		end

end
