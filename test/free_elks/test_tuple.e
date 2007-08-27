indexing

	description:

		"Test features of class TUPLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
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
