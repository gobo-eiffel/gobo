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

end
