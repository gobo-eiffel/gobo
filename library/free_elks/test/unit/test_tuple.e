note

	description:

		"Test features of class TUPLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_TUPLE

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_labels
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

	test_polymorphic_labels
			-- Test polymorphic labeled tuples.
		local
			t1: TUPLE [l1: ANY]
			s1: STRING
			a1: ARRAY [CHARACTER]
			a2: ARRAY [detachable STRING]
			l_expected: ANY
			i: INTEGER
		do
			from i := 1 until i > 3 loop
				inspect i
				when 1 then
					s1 := "gobo"
					t1 := [s1]
					l_expected := s1
				when 2 then
					create a1.make_filled ('%U', 1, 1)
					t1 := [a1]
					l_expected := a1
				else
					create a2.make_filled (Void, 1, 1)
					t1 := [a2]
					l_expected := a2
				end
				assert ("t1_not_void", t1 /= Void)
				assert_same ("l1", l_expected, t1.l1)
				i := i + 1
			end
		end

	test_label_setters
			-- Test labeled tuple setters.
		local
			t1: TUPLE [l1: INTEGER; l2: STRING]
			s1, s2: STRING
		do
			s1 := "gobo"
			t1 := [5, s1]
			assert ("t1_not_void", t1 /= Void)
			assert_integers_equal ("l1a", 5, t1.l1)
			assert_same ("l2a", s1, t1.l2)
			t1.l1 := 6
			assert_integers_equal ("l1b", 6, t1.l1)
			s2 := "foo"
			t1.l2 := s2
			assert_same ("l2b", s2, t1.l2)
		end

	test_polymorphic_label_setters
			-- Test polymorphic labeled tuple setters.
		local
			t1: TUPLE [l1: ANY; l2: CHARACTER]
			s1: STRING
			a1: ARRAY [CHARACTER]
			a2: ARRAY [detachable STRING]
			i: INTEGER
		do
			from i := 1 until i > 3 loop
				inspect i
				when 1 then
					s1 := "gobo"
					t1 := [s1, 'a']
				when 2 then
					create a1.make_filled ('%U', 1, 1)
					t1 := [a1, 'a']
				else
					create a2.make_filled (Void, 1, 1)
					t1 := ['z', 'a']
				end
				assert ("t1_not_void", t1 /= Void)
				assert_characters_equal ("l2a", 'a', t1.l2)
				t1.l2 := 'b'
				assert_characters_equal ("l2b", 'b', t1.l2)
				i := i + 1
			end
		end

	test_count
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

	test_boolean_item
			-- Test feature 'boolean_item'.
		local
			t: TUPLE [STRING, BOOLEAN]
		do
			t := ["gobo", True]
			assert_booleans_equal ("true", True, t.boolean_item (2))
		end

	test_character_8_item
			-- Test feature 'character_8_item'.
		local
			c: CHARACTER_8
			t: TUPLE [STRING, CHARACTER_8]
		do
			c := 'c'
			t := ["gobo", c]
			assert_characters_equal ("c", c, t.character_8_item (2))
		end

	test_integer_item
			-- Test feature 'integer_tem'.
		local
			t: TUPLE [STRING, INTEGER]
		do
			t := ["gobo", 5]
			assert_integers_equal ("five", 5, t.integer_item (2))
		end

	test_reference_item
			-- Test feature 'reference_item'.
		local
			s: STRING
			t: TUPLE [STRING]
		do
			s := "gobo"
			t := [s]
			assert_same ("gobo", s, t.reference_item (1))
		end

	test_item
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

	test_is_boolean_item
			-- Test feature 'is_boolean_item'.
		local
			t: TUPLE [BOOLEAN, ANY]
		do
			create t
			assert ("is_boolean_item", t.is_boolean_item (1))
		end

	test_is_character_8_item
			-- Test feature 'is_character_8_item'.
		local
			t: TUPLE [CHARACTER_8, ANY]
		do
			create t
			assert ("is_character_8_item", t.is_character_8_item (1))
		end

	test_is_integer_item
			-- Test feature 'is_integer_item'.
		local
			t: TUPLE [INTEGER, ANY]
		do
			create t
			assert ("is_integer_item", t.is_integer_item (1))
		end

	test_is_reference_item
			-- Test feature 'is_reference_item'.
		local
			t: TUPLE [INTEGER, ANY]
		do
			create t
			assert ("is_reference_item", t.is_reference_item (2))
		end

	test_put_boolean
			-- Test feature 'put_boolean'.
		local
			t: TUPLE [ANY, BOOLEAN, ANY]
		do
			create t
			t.put_boolean (True, 2)
			assert_booleans_equal ("true", True, t.boolean_item (2))
		end

	test_put_integer
			-- Test feature 'put_integer'.
		local
			t: TUPLE [ANY, INTEGER, ANY]
		do
			create t
			t.put_integer (5, 2)
			assert_integers_equal ("five", 5, t.integer_item (2))
		end

	test_put_reference
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

	test_put
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

	test_object_comparison
			-- Test feature 'object_comparison'.
		local
			t: TUPLE [ANY, STRING, ANY]
		do
			create t
			t.compare_objects
			assert ("object_comparison", t.object_comparison)
		end

	test_valid_type_for_index
			-- Test feature 'valid_type_for_index'.
		local
			t: TUPLE [COMPARABLE]
			s: STRING
			a: ARRAY [detachable ANY]
		do
			create t
			s := "gobo"
			assert ("valid1", t.valid_type_for_index (s, 1))
			create a.make_filled (Void, 1, 1)
			assert ("not_valid1", not t.valid_type_for_index (a, 1))
		end

	test_boxed_items
			-- Test that the access to the items of the tuple
			-- is correctly done, with boxing of expanded
			-- objects to reference when necessary.
		local
			t1: TUPLE [l1: ANY; l2: INTEGER]
			b: ANY
			t2: TUPLE [l1: ANY; l2: INTEGER]
			s1: STRING
		do
			if not eiffel_compiler.is_ise then
					-- Does not work with ISE Eiffel.
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
		end

	test_twin
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

	test_deep_twin
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

	test_plus
			-- Test feature 'plus'.
		local
			t1: TUPLE [BOOLEAN, STRING]
			t2: TUPLE [INTEGER, STRING]
			t: TUPLE [BOOLEAN, STRING, INTEGER, STRING]
			s1, s2: STRING
		do
				-- First, make sure that the result type is alive.
			t := [False, "", 0, ""]
			s1 := "gobo"
			s2 := "eiffel"
			t1 := [True, s1]
			t2 := [5, s2]
			if not attached {TUPLE [b: BOOLEAN; s1: STRING; i: INTEGER; s2: STRING]} (t1 + t2) as t3 then
				assert ("tuple_type", False)
			else
				assert ("tuple_type", True)
				assert_true ("b", t3.b)
				assert_same ("s1", s1, t3.s1)
				assert_integers_equal ("i", 5, t3.i)
				assert_same ("s2", s2, t3.s2)
			end
		end

	test_standard_copy_1
			-- Test feature 'standard_copy'.
			-- Copy tuple with expanded item whose
			-- 'copy' routine has been redefined.
			-- Does not work with ISE Eiffel.
		local
			t1, t2: TUPLE [z: ZZ]
			z: ZZ
		do
			if not eiffel_compiler.is_ise then
				z.set_attr (5)
				z.set_copy_count (25)
				t1 := [z]
				assert_integers_equal ("t1_value_1", 5, t1.z.attr)
				z.set_attr (10)
				z.set_copy_count (25)
				t2 := [z]
				assert_integers_equal ("t2_value_1", 10, t2.z.attr)
				t2.standard_copy (t1)
				assert_integers_equal ("t2_value_2", 5, t2.z.attr)
				assert_integers_equal ("t2_copy_count_2", 1, t2.z.copy_count)
			end
		end

end
