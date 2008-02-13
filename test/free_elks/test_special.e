indexing

	description:

		"Test features of class SPECIAL"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_SPECIAL

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make is
			-- Test feature 'make'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (5)
			assert ("not_void1", sp1 /= Void)
			assert_integers_equal ("count1", 5, sp1.count)
			create sp2.make (2)
			assert ("not_void2", sp2 /= Void)
			assert_integers_equal ("count2", 2, sp2.count)
			create sp2.make (0)
			assert ("not_void3", sp2 /= Void)
			assert_integers_equal ("count3", 0, sp2.count)
		end

	test_count is
			-- Test feature 'count'.
		local
			sp1: SPECIAL [BOOLEAN]
			sp2: SPECIAL [ANY]
		do
			create sp1.make (10)
			assert_integers_equal ("count1", 10, sp1.count)
			create sp2.make (12)
			assert_integers_equal ("count2", 12, sp2.count)
			create sp2.make (0)
			assert_integers_equal ("count3", 0, sp2.count)
		end

	test_capacity is
			-- Test feature 'capacity'.
		local
			sp1: SPECIAL [BOOLEAN]
			sp2: SPECIAL [ANY]
		do
			create sp1.make (10)
			assert_integers_equal ("capacity1", 10, sp1.capacity)
			create sp2.make (12)
			assert_integers_equal ("capacity2", 12, sp2.capacity)
			create sp2.make (0)
			assert_integers_equal ("capacity3", 0, sp2.capacity)
		end

	test_lower is
			-- Test feature 'lower'.
		local
			sp1: SPECIAL [CHARACTER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (10)
			assert_integers_equal ("lower1", 0, sp1.lower)
			create sp2.make (12)
			assert_integers_equal ("lower2", 0, sp2.lower)
			create sp2.make (0)
			assert_integers_equal ("lower3", 0, sp1.lower)
		end

	test_upper is
			-- Test feature 'upper'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [ANY]
		do
			create sp1.make (5)
			assert_integers_equal ("upper1", 4, sp1.upper)
			create sp1.make (0)
			assert_integers_equal ("upper2", -1, sp1.upper)
			create sp2.make (7)
			assert_integers_equal ("upper3", 6, sp2.upper)
		end

	test_item_address is
			-- Test feature 'item_address'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
			l_platform: PLATFORM
		do
			create l_platform
			create sp1.make (3)
			assert ("item_address1", sp1.item_address (2) = sp1.base_address + 2 * l_platform.Integer_bytes)
			create sp2.make (4)
			assert ("item_address2", sp2.item_address (1) = sp2.base_address + l_platform.Pointer_bytes)
		end

	test_item is
			-- Test feature 'item'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			assert_integers_equal ("item1", 5, sp1.item (0))
			assert_integers_equal ("item2", 0, sp1.item (1))
			assert_integers_equal ("item3", 7, sp1.item (2))
			assert_integers_equal ("item4", 0, sp1.item (3))
			create sp2.make (3)
			sp2.put ("foo", 1)
			sp2.put ("bar", 2)
			assert ("item5", sp2.item (0) = Void)
			assert_equal ("item6", "foo", sp2.item (1))
			assert_equal ("item7", "bar", sp2.item (2))
		end

	test_alias_bracket is
			-- Test feature 'alias "[]"'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			assert_integers_equal ("item1", 5, sp1 [0])
			assert_integers_equal ("item2", 0, sp1 [1])
			assert_integers_equal ("item3", 7, sp1 [2])
			assert_integers_equal ("item4", 0, sp1 [3])
			create sp2.make (3)
			sp2.put ("foo", 1)
			sp2.put ("bar", 2)
			assert ("item5", sp2 [0] = Void)
			assert_equal ("item6", "foo", sp2 [1])
			assert_equal ("item7", "bar", sp2 [2])
		end

	test_infix_at is
			-- Test feature 'infx "@"'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			assert_integers_equal ("item1", 5, sp1 @ 0)
			assert_integers_equal ("item2", 0, sp1 @ 1)
			assert_integers_equal ("item3", 7, sp1 @ 2)
			assert_integers_equal ("item4", 0, sp1 @ 3)
			create sp2.make (3)
			sp2.put ("foo", 1)
			sp2.put ("bar", 2)
			assert ("item5", sp2 @ 0 = Void)
			assert_equal ("item6", "foo", sp2 @ 1)
			assert_equal ("item7", "bar", sp2 @ 2)
		end

	test_index_of is
			-- Test feature 'index_of'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			sp1.put (5, 0)
			sp1.put (7, 2)
			sp1.put (5, 3)
			assert_integers_equal ("index1", -1, sp1.index_of (8, 0))
			assert_integers_equal ("index2", -1, sp1.index_of (5, 10))
			assert_integers_equal ("index3", 0, sp1.index_of (5, 0))
			assert_integers_equal ("index4", 3, sp1.index_of (5, 1))
			assert_integers_equal ("index5", 1, sp1.index_of (0, 0))
			create sp2.make (3)
			sp2.put ("foo", 1)
			sp2.put ("bar", 2)
			assert_integers_equal ("index6", 0, sp2.index_of (Void, 0))
			assert_integers_equal ("index7", -1, sp2.index_of ("gobo", 0))
			assert_integers_equal ("index8", -1, sp2.index_of ("foo", 2))
			assert_integers_equal ("index9", -1, sp2.index_of ("foo", 3))
			assert_integers_equal ("index10", 1, sp2.index_of ("foo", 1))
			assert_integers_equal ("index11", 2, sp2.index_of ("bar", 0))
		end

	test_all_default is
			-- Test feature 'index_of'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			assert ("all_default1", sp1.all_default (3))
			sp1.put (5, 2)
			assert ("not_all_default1", not sp1.all_default (3))
			assert ("not_all_default2", not sp1.all_default (2))
			assert ("all_default2", sp1.all_default (1))
			assert ("all_default3", sp1.all_default (0))
			create sp2.make (3)
			assert ("all_default3", sp2.all_default (2))
			sp2.put ("gobo", 2)
			assert ("not_all_default3", not sp2.all_default (2))
			assert ("all_default4", sp2.all_default (1))
			assert ("all_default5", sp2.all_default (0))
		end

	test_same_items is
			-- Test feature 'index_of'.
		local
			sp1, sp2: SPECIAL [INTEGER]
			sp3, sp4: SPECIAL [STRING]
			s1, s2: STRING
		do
			create sp1.make (4)
			create sp2.make (6)
			assert ("same_items1", sp1.same_items (sp2, 3))
			sp2.put (5, 4)
			assert ("same_items2", sp1.same_items (sp2, 3))
			sp2.put (9, 2)
			assert ("not_same_items1", not sp1.same_items (sp2, 3))
			assert ("not_same_items2", not sp1.same_items (sp2, 2))
			assert ("same_items3", sp1.same_items (sp2, 1))
			assert ("same_items4", sp1.same_items (sp2, 0))
			assert ("same_items5", sp1.same_items (sp2, -1))
			sp1.put (9, 2)
			assert ("same_items6", sp1.same_items (sp2, 3))
			assert ("same_items7", sp1.same_items (sp1, 3))
			assert ("same_items8", sp2.same_items (sp2, 3))
			create sp3.make (3)
			create sp4.make (2)
			assert ("same_items9", sp3.same_items (sp4, 1))
			s1 := "foo"
			s2 := "bar"
			sp3.put (s1, 0)
			assert ("not_same_items3", not sp3.same_items (sp4, 1))
			assert ("not_same_items4", not sp3.same_items (sp4, 0))
			assert ("same_items10", sp3.same_items (sp4, -1))
			sp4.put ("foo", 0)
			assert ("not_same_items5", not sp3.same_items (sp4, 0))
			sp4.put (s2, 0)
			assert ("not_same_items6", not sp3.same_items (sp4, 0))
			sp4.put (s1, 0)
			assert ("same_items11", sp3.same_items (sp4, 1))
			sp4.put (s2, 1)
			assert ("same_items12", sp3.same_items (sp3, 1))
			assert ("same_items13", sp4.same_items (sp4, 1))
		end

	test_valid_index is
			-- Test feature 'valid_index'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (2)
			assert ("not_valid1", not sp1.valid_index (-1))
			assert ("valid1", sp1.valid_index (0))
			assert ("valid2", sp1.valid_index (1))
			assert ("not_valid2", not sp1.valid_index (2))
			create sp2.make (3)
			assert ("not_valid3", not sp2.valid_index (-1))
			assert ("valid3", sp2.valid_index (0))
			assert ("valid4", sp2.valid_index (1))
			assert ("valid5", sp2.valid_index (2))
			assert ("not_valid4", not sp2.valid_index (3))
		end

	test_put is
			-- Test feature 'put'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
			s1, s2: STRING
			sp3: SPECIAL [ANY]
		do
			create sp1.make (2)
			sp1.put (7, 0)
			assert_integers_equal ("put1", 7, sp1.item (0))
			assert_integers_equal ("put2", 0, sp1.item (1))
			sp1.put (9, 1)
			assert_integers_equal ("put3", 7, sp1.item (0))
			assert_integers_equal ("put4", 9, sp1.item (1))
			sp1.put (34, 1)
			assert_integers_equal ("put5", 34, sp1.item (1))
			create sp2.make (2)
			s1 := "gobo"
			s2 := "bar"
			sp2.put (s1, 0)
			assert_same ("put6", s1, sp2.item (0))
			assert_same ("put7", Void, sp2.item (1))
			sp2.put (s2, 1)
			assert_same ("put8", s1, sp2.item (0))
			assert_same ("put9", s2, sp2.item (1))
			create sp3.make (3)
			s1 := "gobo"
			sp3.put (s1, 1)
			sp3.put (5, 2)
			assert_same ("put10", Void, sp3.item (0))
			assert_same ("put11", s1, sp3.item (1))
			assert_equal ("put12", 5, sp3.item (2))
		end

	test_fill_with is
			-- Test feature 'fill_with'.
		local
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
			s: STRING
		do
			create sp1.make (4)
			sp1.fill_with (8, 1, 2)
			assert_integers_equal ("fill1", 0, sp1.item (0))
			assert_integers_equal ("fill2", 8, sp1.item (1))
			assert_integers_equal ("fill3", 8, sp1.item (2))
			assert_integers_equal ("fill4", 0, sp1.item (3))
			sp1.fill_with (5, 0, 3)
			assert_integers_equal ("fill5", 5, sp1.item (0))
			assert_integers_equal ("fill6", 5, sp1.item (1))
			assert_integers_equal ("fill7", 5, sp1.item (2))
			assert_integers_equal ("fill8", 5, sp1.item (3))
			create sp2.make (3)
			s := "gobo"
			sp2.fill_with (s, 1, 1)
			assert_same ("fill1", Void, sp2.item (0))
			assert_same ("fill2", s, sp2.item (1))
			assert_same ("fill3", Void, sp2.item (2))
			s := "bar"
			sp2.fill_with (s, 0, 2)
			assert_same ("fill5", s, sp2.item (0))
			assert_same ("fill6", s, sp2.item (1))
			assert_same ("fill7", s, sp2.item (2))
		end

	test_copy_data is
			-- Test feature 'copy_data'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			sp3, sp4: SPECIAL [STRING]
			s1, s2: STRING
		do
			create sp1.make (4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			create sp2.make (6)
			sp2.copy_data (sp1, 0, 1, 3)
			assert_characters_equal ("copied1", '%U', sp2.item (0))
			assert_characters_equal ("copied2", 'a', sp2.item (1))
			assert_characters_equal ("copied3", 'b', sp2.item (2))
			assert_characters_equal ("copied4", 'c', sp2.item (3))
			assert_characters_equal ("copied5", '%U', sp2.item (4))
			assert_characters_equal ("copied6", '%U', sp2.item (5))
			sp2.copy_data (sp2, 1, 0, 3)
			assert_characters_equal ("copied7", 'a', sp2.item (0))
			assert_characters_equal ("copied8", 'b', sp2.item (1))
			assert_characters_equal ("copied9", 'c', sp2.item (2))
			assert_characters_equal ("copied10", 'c', sp2.item (3))
			assert_characters_equal ("copied11", '%U', sp2.item (4))
			assert_characters_equal ("copied12", '%U', sp2.item (5))
			create sp3.make (3)
			s1 := "foo"
			s2 := "bar"
			sp3.put (s1, 0)
			sp3.put (s2, 1)
			create sp4.make (3)
			sp4.copy_data (sp3, 0, 0, 2)
			assert_same ("copied13", s1, sp4.item (0))
			assert_same ("copied14", s2, sp4.item (1))
			assert_same ("copied15", Void, sp4.item (2))
			sp4.copy_data (sp4, 0, 2, 1)
			assert_same ("copied16", s1, sp4.item (0))
			assert_same ("copied17", s2, sp4.item (1))
			assert_same ("copied18", s1, sp4.item (2))
		end

	test_move_data is
			-- Test feature 'move_data'.
		local
			sp1: SPECIAL [CHARACTER]
			sp2: SPECIAL [STRING]
			s1, s2: STRING
		do
			create sp1.make (4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp1.move_data (0, 1, 2)
			assert_characters_equal ("moved1", 'a', sp1.item (0))
			assert_characters_equal ("moved2", 'a', sp1.item (1))
			assert_characters_equal ("moved3", 'b', sp1.item (2))
			assert_characters_equal ("moved4", 'd', sp1.item (3))
			sp1.move_data (1, 1, 3)
			assert_characters_equal ("moved5", 'a', sp1.item (0))
			assert_characters_equal ("moved6", 'a', sp1.item (1))
			assert_characters_equal ("moved7", 'b', sp1.item (2))
			assert_characters_equal ("moved8", 'd', sp1.item (3))
			sp1.move_data (2, 1, 2)
			assert_characters_equal ("moved9", 'a', sp1.item (0))
			assert_characters_equal ("moved10", 'b', sp1.item (1))
			assert_characters_equal ("moved11", 'd', sp1.item (2))
			assert_characters_equal ("moved12", 'd', sp1.item (3))
			create sp2.make (3)
			s1 := "foo"
			s2 := "bar"
			sp2.put (s1, 0)
			sp2.put (s2, 1)
			sp2.move_data (0, 0, 2)
			assert_same ("moved13", s1, sp2.item (0))
			assert_same ("moved14", s2, sp2.item (1))
			assert_same ("moved15", Void, sp2.item (2))
			sp2.move_data (0, 1, 2)
			assert_same ("moved16", s1, sp2.item (0))
			assert_same ("moved17", s1, sp2.item (1))
			assert_same ("moved18", s2, sp2.item (2))
			sp2.move_data (1, 0, 2)
			assert_same ("moved19", s1, sp2.item (0))
			assert_same ("moved20", s2, sp2.item (1))
			assert_same ("moved21", s2, sp2.item (2))
		end

	test_clear_all is
			-- Test feature 'clear_all'.
		local
			sp1: SPECIAL [CHARACTER]
			sp2: SPECIAL [STRING]
		do
			create sp1.make (4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp1.clear_all
			assert_characters_equal ("cleared1", '%U', sp1.item (0))
			assert_characters_equal ("cleared2", '%U', sp1.item (1))
			assert_characters_equal ("cleared3", '%U', sp1.item (2))
			assert_characters_equal ("cleared4", '%U', sp1.item (3))
			create sp2.make (3)
			sp2.put ("gobo", 0)
			sp2.put ("foo", 1)
			sp2.put ("bar", 2)
			sp2.clear_all
			assert_same ("cleared5", Void, sp2.item (0))
			assert_same ("cleared6", Void, sp2.item (1))
			assert_same ("cleared7", Void, sp2.item (2))
		end

	test_resized_area is
			-- Test feature 'resized_area'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			sp3, sp4: SPECIAL [STRING]
			s1, s2, s3: STRING
		do
			create sp1.make (4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp2 := sp1.resized_area (6)
			assert ("not_void1", sp2 /= Void)
			assert ("new1", sp2 /= sp1)
			assert_integers_equal ("count1", 6, sp2.count)
			assert_characters_equal ("resized1", 'a', sp2.item (0))
			assert_characters_equal ("resized2", 'b', sp2.item (1))
			assert_characters_equal ("resized3", 'c', sp2.item (2))
			assert_characters_equal ("resized4", 'd', sp2.item (3))
			assert_characters_equal ("resized5", '%U', sp2.item (4))
			assert_characters_equal ("resized6", '%U', sp2.item (5))
			create sp3.make (3)
			s1 := "gobo"
			s2 := "foo"
			s3 := "bar"
			sp3.put (s1, 0)
			sp3.put (s2, 1)
			sp3.put (s3, 2)
			sp4 := sp3.resized_area (4)
			assert ("new1", sp4 /= sp3)
			assert_integers_equal ("count2", 4, sp4.count)
			assert_same ("resized7", s1, sp4.item (0))
			assert_same ("resized8", s2, sp4.item (1))
			assert_same ("resized9", s3, sp4.item (2))
			assert_same ("resized10", Void, sp4.item (3))
		end

	test_aliased_resized_area is
			-- Test feature 'aliased_resized_area'.
		local
			sp1, sp2: SPECIAL [CHARACTER]
			sp3, sp4: SPECIAL [STRING]
			s1, s2, s3: STRING
		do
			create sp1.make (4)
			sp1.put ('a', 0)
			sp1.put ('b', 1)
			sp1.put ('c', 2)
			sp1.put ('d', 3)
			sp2 := sp1.aliased_resized_area (6)
			assert_integers_equal ("count1", 6, sp2.count)
			assert_characters_equal ("resized1", 'a', sp2.item (0))
			assert_characters_equal ("resized2", 'b', sp2.item (1))
			assert_characters_equal ("resized3", 'c', sp2.item (2))
			assert_characters_equal ("resized4", 'd', sp2.item (3))
			assert_characters_equal ("resized5", '%U', sp2.item (4))
			assert_characters_equal ("resized6", '%U', sp2.item (5))
			create sp3.make (3)
			s1 := "gobo"
			s2 := "foo"
			s3 := "bar"
			sp3.put (s1, 0)
			sp3.put (s2, 1)
			sp3.put (s3, 2)
			sp4 := sp3.aliased_resized_area (4)
			assert_integers_equal ("count2", 4, sp4.count)
			assert_same ("resized7", s1, sp4.item (0))
			assert_same ("resized8", s2, sp4.item (1))
			assert_same ("resized9", s3, sp4.item (2))
			assert_same ("resized10", Void, sp4.item (3))
		end

end
