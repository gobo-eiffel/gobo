indexing

	description:

		"Test features of class TUPLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_TUPLE

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_labels
			test_count
			test_boolean_item
			test_character_8_item
			test_integer_item
			test_reference_item
			test_item
			test_is_boolean_item
			test_is_character_8_item
			test_is_integer_item
			test_is_reference_item
			test_put_boolean
			test_put_integer
			test_put_reference
			test_put
			test_object_comparison
			test_valid_type_for_index
			test_boxed_items
			test_twin
			test_deep_twin
		end

	test_labels is
			-- Test labeled tuples.
		local
			t1: TUPLE [l1: INTEGER; l2: STRING]
			s1: STRING
		do
			s1 := "gobo"
			t1 := [5, s1]
			assert ("t1_not_void", t1 /= Void)
			assert_integers_equal ("l1", 5, t1.l1)
			assert_same ("l2", s1, t1.l2)
		end

	test_count is
			-- Test feature 'count'.
		local
			t: TUPLE
			t1: TUPLE [STRING]
			t2: TUPLE [i, j: INTEGER]
		do
			t := []
			assert_integers_equal ("t_zero", 0, t.count)
			t1 := ["gobo"]
			assert_integers_equal ("t1_one", 1, t1.count)
			t := t1
			assert_integers_equal ("t_one", 1, t.count)
			t2 := [2, 3]
			assert_integers_equal ("t2_two", 2, t2.count)
		end

	test_boolean_item is
			-- Test feature 'boolean_item'.
		local
			t: TUPLE [STRING, BOOLEAN]
		do
			t := ["gobo", True]
			assert_booleans_equal ("true", True, t.boolean_item (2))
		end

	test_character_8_item is
			-- Test feature 'character_8_item'.
		local
			c: CHARACTER_8
			t: TUPLE [STRING, CHARACTER_8]
		do
			c := 'c'
			t := ["gobo", c]
			assert_characters_equal ("c", c, t.character_8_item (2))
		end

	test_integer_item is
			-- Test feature 'integer_tem'.
		local
			t: TUPLE [STRING, INTEGER]
		do
			t := ["gobo", 5]
			assert_integers_equal ("five", 5, t.integer_item (2))
		end

	test_reference_item is
			-- Test feature 'reference_item'.
		local
			s: STRING
			t: TUPLE [STRING]
		do
			s := "gobo"
			t := [s]
			assert_same ("gobo", s, t.reference_item (1))
		end

	test_item is
			-- Test feature 'item'.
		local
			s: STRING
			t: TUPLE [STRING, INTEGER, BOOLEAN]
		do
			s := "gobo"
			t := [s, 5, True]
			assert_same ("gobo", s, t.item (1))
			assert_equal ("five", 5, t.item (2))
			assert_equal ("true", True, t.item (3))
		end

	test_is_boolean_item is
			-- Test feature 'is_boolean_item'.
		local
			t: TUPLE [BOOLEAN, ANY]
		do
			create t
			assert ("is_boolean_item", t.is_boolean_item (1))
		end

	test_is_character_8_item is
			-- Test feature 'is_character_8_item'.
		local
			t: TUPLE [CHARACTER_8, ANY]
		do
			create t
			assert ("is_character_8_item", t.is_character_8_item (1))
		end

	test_is_integer_item is
			-- Test feature 'is_integer_item'.
		local
			t: TUPLE [INTEGER, ANY]
		do
			create t
			assert ("is_integer_item", t.is_integer_item (1))
		end

	test_is_reference_item is
			-- Test feature 'is_reference_item'.
		local
			t: TUPLE [INTEGER, ANY]
		do
			create t
			assert ("is_reference_item", t.is_reference_item (2))
		end

	test_put_boolean is
			-- Test feature 'put_boolean'.
		local
			t: TUPLE [ANY, BOOLEAN, ANY]
		do
			create t
			t.put_boolean (True, 2)
			assert_booleans_equal ("true", True, t.boolean_item (2))
		end

	test_put_integer is
			-- Test feature 'put_integer'.
		local
			t: TUPLE [ANY, INTEGER, ANY]
		do
			create t
			t.put_integer (5, 2)
			assert_integers_equal ("five", 5, t.integer_item (2))
		end

	test_put_reference is
			-- Test feature 'put_reference'.
		local
			t: TUPLE [ANY, STRING, ANY]
			s: STRING
		do
			create t
			s := "gobo"
			t.put_reference (s, 2)
			assert_same ("gobo", s, t.reference_item (2))
		end

	test_put is
			-- Test feature 'put'.
		local
			t: TUPLE [INTEGER, STRING, BOOLEAN]
			s: STRING
		do
			create t
			s := "gobo"
			t.put (5, 1)
			t.put (s, 2)
			t.put (True, 3)
			assert_integers_equal ("five", 5, t.integer_item (1))
			assert_same ("gobo", s, t.reference_item (2))
			assert_booleans_equal ("true", True, t.boolean_item (3))
		end

	test_object_comparison is
			-- Test feature 'object_comparison'.
		local
			t: TUPLE [ANY, STRING, ANY]
		do
			create t
			t.compare_objects
			assert ("object_comparison", t.object_comparison)
		end

	test_valid_type_for_index is
			-- Test feature 'valid_type_for_index'.
		local
			t: TUPLE [COMPARABLE]
			s: STRING
			a: ARRAY [ANY]
		do
			create t
			s := "gobo"
			assert ("valid1", t.valid_type_for_index (s, 1))
			create a.make (1, 1)
			assert ("not_valid1", not t.valid_type_for_index (a, 1))
		end

	test_boxed_items is
			-- Test that the access to the items of the tuple
			-- is correctly done, with boxing of expanded
			-- objects to reference when necessary.
		local
			t1: TUPLE [l1: ANY; l2: INTEGER]
			b: ANY
			t2: TUPLE [l1: ANY; l2: INTEGER]
			s1: STRING
		do
			b := 'b'
			t1 := ['b', 5]
			assert ("t1a_not_void", t1 /= Void)
				-- Here accessing the first item should box the
				-- character 'b' to a reference object.
			assert_equal ("l1a", b, t1.l1)
			assert_integers_equal ("l2a", 5, t1.l2)
				-- Now use a polymorphic tuple.
			s1 := "gobo"
			t2 := [s1, 6]
			assert ("t2b_not_void", t2 /= Void)
			assert_same ("l1b", s1, t2.l1)
			assert_integers_equal ("l2b", 6, t2.l2)
			t2 := ['b', 7]
			assert ("t2c_not_void", t2 /= Void)
			assert_equal ("l1c", b, t2.l1)
			assert_integers_equal ("l2c", 7, t2.l2)
		end

	test_twin is
			-- Test feature 'twin'.
		local
			t1, t2: TUPLE [s: STRING; i: INTEGER]
		do
			t1 := ["gobo", 2]
			t2 := t1.twin
			assert_not_same ("twin1", t1, t2)
			assert_same ("same_string1", t1.s, t2.s)
			assert_integers_equal ("same_integer1", t1.i, t2.i)
		end

	test_deep_twin is
			-- Test feature 'deep_twin'.
		local
			t1, t2: TUPLE [s: STRING; i: INTEGER]
		do
			t1 := ["gobo", 2]
			t2 := t1.deep_twin
			assert_not_same ("deep_twin1", t1, t2)
			assert_not_same ("not_same_string1", t1.s, t2.s)
			assert_strings_equal ("equal_string1", t1.s, t2.s)
			assert_integers_equal ("equal_integer1", t1.i, t2.i)
		end

end
