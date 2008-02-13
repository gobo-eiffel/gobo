indexing

	description:

		"Test features of class KL_DOUBLE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_DOUBLE_ROUTINES

inherit

	KL_TEST_CASE

create

	make_default

feature -- Test

	test_nth_root is
			-- Test feature `nth_root'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_integers_equal ("nth_root1", 1, r.truncated_to_integer (r.nth_root (1.0, 1.0)))
			assert_integers_equal ("nth_root2", 0, r.truncated_to_integer (r.nth_root (0.0, 1.0)))
		end

	test_log is
			-- Test feature `log'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_integers_equal ("log_1", 0, r.truncated_to_integer (r.log (1.0)))
		end

	test_log2 is
			-- Test feature `log2'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_integers_equal ("log2_1", 1, r.truncated_to_integer (r.log2 (2.0)))
			assert_integers_equal ("log2_2", 10, r.truncated_to_integer (r.log2 (1024)))
		end

	test_log10 is
			-- Test feature `log10'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
				-- Use values truncated to integer to avoid possible
				-- precision problems when comparing double values.
			assert_integers_equal ("log10_1", 0, r.truncated_to_integer (r.log10 (1.0)))
			assert_integers_equal ("log10_2", 1, r.truncated_to_integer (r.log10 (10.0)))
		end

	test_floor_to_integer is
			-- Test feature `floor_to_integer'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
			assert_integers_equal ("positive", 123, r.floor_to_integer (123.183))
			assert_integers_equal ("positive_exact", 123, r.floor_to_integer (123.0))
			assert_integers_equal ("zero", 0, r.floor_to_integer (0.0))
			assert_integers_equal ("negative", -47, r.floor_to_integer (-46.0001))
			assert_integers_equal ("negative_exact", -47, r.floor_to_integer (-47.0))
		end

	test_rounded_to_integer is
			-- Test feature `rounded_to_integer'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
			assert_integers_equal ("positive1", 123, r.rounded_to_integer (123.183))
			assert_integers_equal ("positive2", 123, r.rounded_to_integer (123.49))
			assert_integers_equal ("positive3", 124, r.rounded_to_integer (123.5))
			assert_integers_equal ("positive_exact", 123, r.rounded_to_integer (123.0))
			assert_integers_equal ("zero", 0, r.rounded_to_integer (0.0))
			assert_integers_equal ("negative1", -46, r.rounded_to_integer (-46.0001))
			assert_integers_equal ("negative2", -46, r.rounded_to_integer (-46.49))
			assert_integers_equal ("negative3", -47, r.rounded_to_integer (-46.5))
			assert_integers_equal ("negative_exact", -47, r.rounded_to_integer (-47.0))
		end

	test_plus_infinity is
			-- Test feature `plus_infinity'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
			assert ("positive", r.plus_infinity > 0)
			assert ("infinity1", r.plus_infinity - 1 = r.plus_infinity)
		end

	test_minus_infinity is
			-- Test feature `minus_infinity'.
		local
			r: KL_DOUBLE_ROUTINES
		do
			create r
			assert ("negative", r.minus_infinity < 0)
			assert ("infinity1", r.minus_infinity + 1 = r.minus_infinity)
		end

end
