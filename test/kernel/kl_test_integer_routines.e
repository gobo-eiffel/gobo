indexing

	description:

		"Test features of KL_INTEGER_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_INTEGER_ROUTINES

inherit
	
	KL_TEST_CASE

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM

feature -- Test

	test_power is
			-- Test `power'.
		do
			assert_integers_equal ("zero_zero", 1, INTEGER_.power (0, 0))
			assert_integers_equal ("zero_power", 0, INTEGER_.power (0, 5))
			assert_integers_equal ("power_zero", 1, INTEGER_.power (5, 0))

			assert_integers_equal ("one", 12, INTEGER_.power (12, 1))
			assert_integers_equal ("odd", 8, INTEGER_.power (2, 3))
			assert_integers_equal ("even", 5764801, INTEGER_.power (7, 8))

			assert_integers_equal ("negative_one", -12, INTEGER_.power (-12, 1))
			assert_integers_equal ("negative_odd", -8,  INTEGER_.power (-2, 3))
			assert_integers_equal ("negative_even", 5764801,  INTEGER_.power (-7, 8))
		end

	test_bit_operations is
			-- Test bit operations.
		do
			assert_integers_equal ("one or four", 5, INTEGER_.bit_or (1, 4))
			assert_integers_equal ("two and  four", 2, INTEGER_.bit_and (2, 6))
			assert_integers_equal ("one shift left 4", 16, INTEGER_.bit_shift_left (1, 4))
			assert_integers_equal ("shift left on negative argument", -18760, INTEGER_.bit_shift_left (-2345, 3))
			assert_integers_equal ("shift left on minimum integer", 0, INTEGER_.bit_shift_left (Platform.Minimum_integer, 31))
			assert_integers_equal ("shift left on maximum integer", -2, INTEGER_.bit_shift_left (Platform.Maximum_integer, 1))
			assert_integers_equal ("zero shift left on maximum integer", Platform.Maximum_integer, INTEGER_.bit_shift_left (Platform.Maximum_integer, 0))
			assert_integers_equal ("16 shift right 4", 1, INTEGER_.bit_shift_right (16, 4))
			assert_integers_equal ("shift right on negative argument", -300, INTEGER_.bit_shift_right (-2400, 3))
			assert_integers_equal ("shift right on minimum integer", Platform.Minimum_integer // 2, INTEGER_.bit_shift_right (Platform.Minimum_integer, 1))
			assert_integers_equal ("zero shift right on minimum integer", Platform.Minimum_integer, INTEGER_.bit_shift_right (Platform.Minimum_integer, 0))
			assert_integers_equal ("shift right on maximum integer", 0, INTEGER_.bit_shift_right (Platform.Maximum_integer, 31))
		end

	test_is_even is
			-- Test `is_even'.
		do
			assert ("zero", INTEGER_.is_even (0))
			assert ("even", INTEGER_.is_even (124))
			assert ("odd", not INTEGER_.is_even (17))

			assert ("negative_even", INTEGER_.is_even (-124))
			assert ("negative_odd", not INTEGER_.is_even (-17))
		end

end
