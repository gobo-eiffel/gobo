note

	description:

		"Test features of KL_INTEGER_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class KL_TEST_INTEGER_ROUTINES

inherit

	KL_TEST_CASE

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_SHARED_PLATFORM

create

	make_default

feature -- Test

	test_div
			-- Test feature `div'.
		do
				-- Zero.
			assert_integers_equal ("div1", 0, INTEGER_.div (0, 1))
			assert_integers_equal ("div2", 0, INTEGER_.div (0, 10))
			assert_integers_equal ("div3", 0, INTEGER_.div (0, -10))
				-- Positive.
			assert_integers_equal ("div101", 21, INTEGER_.div (21, 1))
			assert_integers_equal ("div102", 1, INTEGER_.div (21, 21))
			assert_integers_equal ("div103", 2, INTEGER_.div (21, 10))
			assert_integers_equal ("div104", Platform.Maximum_integer, INTEGER_.div (Platform.Maximum_integer, 1))
			assert_integers_equal ("div105", 1, INTEGER_.div (Platform.Maximum_integer, Platform.Maximum_integer))
			assert_integers_equal ("div106", 2, INTEGER_.div (21, 9))
			assert_integers_equal ("div201", -21, INTEGER_.div (21, -1))
			assert_integers_equal ("div202", -1, INTEGER_.div (21, -21))
			assert_integers_equal ("div203", -2, INTEGER_.div (21, -10))
			assert_integers_equal ("div204", -Platform.Maximum_integer, INTEGER_.div (Platform.Maximum_integer, -1))
			assert_integers_equal ("div205", 0, INTEGER_.div (Platform.Maximum_integer, Platform.Minimum_integer))
				-- Negative.
			assert_integers_equal ("div301", -21, INTEGER_.div (-21, 1))
			assert_integers_equal ("div302", -1, INTEGER_.div (-21, 21))
			assert_integers_equal ("div303", -2, INTEGER_.div (-21, 10))
			assert_integers_equal ("div304", Platform.Minimum_integer, INTEGER_.div (Platform.Minimum_integer, 1))
			assert_integers_equal ("div305", -1, INTEGER_.div (Platform.Minimum_integer, Platform.Maximum_integer))
			assert_integers_equal ("div306", -2, INTEGER_.div (-21, 9))
			assert_integers_equal ("div401", 21, INTEGER_.div (-21, -1))
			assert_integers_equal ("div402", 1, INTEGER_.div (-21, -21))
			assert_integers_equal ("div403", 2, INTEGER_.div (-21, -10))
			assert_integers_equal ("div404", 1, INTEGER_.div (Platform.Minimum_integer, Platform.Minimum_integer))
		end

	test_mod
			-- Test feature `mod'.
		do
				-- Zero.
			assert_integers_equal ("mod1", 0, INTEGER_.mod (0, 1))
			assert_integers_equal ("mod2", 0, INTEGER_.mod (0, 10))
			assert_integers_equal ("mod3", 0, INTEGER_.mod (0, -10))
				-- Positive.
			assert_integers_equal ("mod101", 0, INTEGER_.mod (21, 1))
			assert_integers_equal ("mod102", 0, INTEGER_.mod (21, 21))
			assert_integers_equal ("mod103", 1, INTEGER_.mod (21, 10))
			assert_integers_equal ("mod104", 0, INTEGER_.mod (Platform.Maximum_integer, 1))
			assert_integers_equal ("mod105", 0, INTEGER_.mod (Platform.Maximum_integer, Platform.Maximum_integer))
			assert_integers_equal ("mod106", 3, INTEGER_.mod (21, 9))
			assert_integers_equal ("mod201", 0, INTEGER_.mod (21, -1))
			assert_integers_equal ("mod202", 0, INTEGER_.mod (21, -21))
			assert_integers_equal ("mod203", 1, INTEGER_.mod (21, -10))
			assert_integers_equal ("mod204", 0, INTEGER_.mod (Platform.Maximum_integer, -1))
			assert_integers_equal ("mod205", Platform.Maximum_integer, INTEGER_.mod (Platform.Maximum_integer, Platform.Minimum_integer))
				-- Negative.
			assert_integers_equal ("mod301", 0, INTEGER_.mod (-21, 1))
			assert_integers_equal ("mod302", 0, INTEGER_.mod (-21, 21))
			assert_integers_equal ("mod303", -1, INTEGER_.mod (-21, 10))
			assert_integers_equal ("mod304", 0, INTEGER_.mod (Platform.Minimum_integer, 1))
			assert_integers_equal ("mod305", -1, INTEGER_.mod (Platform.Minimum_integer, Platform.Maximum_integer))
			assert_integers_equal ("mod306", -3, INTEGER_.mod (-21, 9))
			assert_integers_equal ("mod401", 0, INTEGER_.mod (-21, -1))
			assert_integers_equal ("mod402", 0, INTEGER_.mod (-21, -21))
			assert_integers_equal ("mod403", -1, INTEGER_.mod (-21, -10))
			assert_integers_equal ("mod404", 0, INTEGER_.mod (Platform.Minimum_integer, Platform.Minimum_integer))
		end

	test_power
			-- Test feature `power'.
		do
				-- Zero.
			assert_integers_equal ("zero_zero", 1, INTEGER_.power (0, 0))
			assert_integers_equal ("zero_power", 0, INTEGER_.power (0, 5))
			assert_integers_equal ("power_zero", 1, INTEGER_.power (5, 0))
				-- Positive.
			assert_integers_equal ("one", 12, INTEGER_.power (12, 1))
			assert_integers_equal ("odd", 8, INTEGER_.power (2, 3))
			assert_integers_equal ("even", 5764801, INTEGER_.power (7, 8))
				-- Negative.
			assert_integers_equal ("negative_one", -12, INTEGER_.power (-12, 1))
			assert_integers_equal ("negative_odd", -8,  INTEGER_.power (-2, 3))
			assert_integers_equal ("negative_even", 5764801,  INTEGER_.power (-7, 8))
		end

	test_bit_or
			-- Test feature `bit_or'.
		do
				-- 00000000000000000000000000000001 = 1
				-- 00000000000000000000000000000100 = 4
				-- 00000000000000000000000000000101 = 5
			assert_integers_equal ("bit_or1", 5, INTEGER_.bit_or (1, 4))
		end

	test_bit_and
			-- Test feature `bit_and'.
		do
				-- 00000000000000000000000000000010 = 2
				-- 00000000000000000000000000000110 = 6
				-- 00000000000000000000000000000010 = 2
			assert_integers_equal ("bit_and1", 2, INTEGER_.bit_and (2, 6))
		end

	test_bit_not
			-- Test feature `bit_not'.
		do
				-- 00000000000000000000000000000010 = 2
				-- 11111111111111111111111111111101 = -3
			assert_integers_equal ("bit_not1", -3, INTEGER_.bit_not (2))
		end

	test_bit_shift_left
			-- Test feature `bit_shift_left'.
		do
				-- 00000000000000000000000000000001 = 1
				-- 00000000000000000000000000010000 = 16
			assert_integers_equal ("bit_shift_left1", 16, INTEGER_.bit_shift_left (1, 4))
				-- 11111111111111111111011011010111 = -2345
				-- 11111111111111111011011010111000 = -18760
			assert_integers_equal ("bit_shift_left2", -18760, INTEGER_.bit_shift_left (-2345, 3))
				-- 10000000000000000000000000000000 = Minimum_integer
				-- 00000000000000000000000000000000 = 0
			assert_integers_equal ("bit_shift_left3", 0, INTEGER_.bit_shift_left (Platform.Minimum_integer, 31))
				-- 01111111111111111111111111111111 = Maximum_integer
				-- 11111111111111111111111111111110 = -2
			assert_integers_equal ("bit_shift_left4", -2, INTEGER_.bit_shift_left (Platform.Maximum_integer, 1))
				-- 01111111111111111111111111111111 = Maximum_integer
				-- 01111111111111111111111111111111 = Maximum_integer
			assert_integers_equal ("bit_shift_left5", Platform.Maximum_integer, INTEGER_.bit_shift_left (Platform.Maximum_integer, 0))
		end

	test_bit_shift_right
			-- Test feature `bit_shift_right'.
		do
				-- 00000000000000000000000000010000 = 16
				-- 00000000000000000000000000000001 = 1
			assert_integers_equal ("bit_shift_right1", 1, INTEGER_.bit_shift_right (16, 4))
				-- 11111111111111111111011010100000 = -2400
				-- 11111111111111111111111011010100 = -300
			assert_integers_equal ("bit_shift_right2", -300, INTEGER_.bit_shift_right (-2400, 3))
				-- 10000000000000000000000000000000 = Minimum_integer
				-- 11000000000000000000000000000000 = Minimum_integer // 2
			assert_integers_equal ("bit_shift_right3", Platform.Minimum_integer // 2, INTEGER_.bit_shift_right (Platform.Minimum_integer, 1))
				-- 10000000000000000000000000000000 = Minimum_integer
				-- 10000000000000000000000000000000 = Minimum_integer
			assert_integers_equal ("bit_shift_right4", Platform.Minimum_integer, INTEGER_.bit_shift_right (Platform.Minimum_integer, 0))
				-- 00000000000000000000000000000000 = 0
				-- 01111111111111111111111111111111 = Maximum_integer
			assert_integers_equal ("bit_shift_right5", 0, INTEGER_.bit_shift_right (Platform.Maximum_integer, 31))
		end

	test_is_even
			-- Test `is_even'.
		do
				-- Zero.
			assert ("zero", INTEGER_.is_even (0))
				-- Positive.
			assert ("even", INTEGER_.is_even (124))
			assert ("odd", not INTEGER_.is_even (17))
				-- Negative.
			assert ("negative_even", INTEGER_.is_even (-124))
			assert ("negative_odd", not INTEGER_.is_even (-17))
		end

end
