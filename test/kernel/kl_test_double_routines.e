indexing

	description:

		"Test features of class KL_DOUBLE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_DOUBLE_ROUTINES

inherit

	KL_TEST_CASE

feature -- Test

	test_nth_root is
			-- Test feature `nth_root'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_equal ("nth_root (1.0, 1.0)", 1, r.nth_root (1.0, 1.0).truncated_to_integer)
			assert_equal ("nth_root (0.0, 1.0)", 0, r.nth_root (0.0, 1.0).truncated_to_integer)
		end

	test_log is
			-- Test feature `log'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_equal ("log (1.0)", 0, r.log (1.0).truncated_to_integer)
		end

	test_log2 is
			-- Test feature `log2'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_equal ("log2 (2)", 1, r.log2 (2.0).truncated_to_integer)
			assert_equal ("log2 (1024)", 10, r.log2 (1024).truncated_to_integer)
		end

	test_log10 is
			-- Test feature `log10'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_equal ("log10 (1.0)", 0, r.log10 (1.0).truncated_to_integer)
			assert_equal ("log10 (10.0)", 1, r.log10 (10.0).truncated_to_integer)
		end

end
