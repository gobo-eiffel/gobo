indexing

	description:

		"Test semantics of octal integer manifest constants"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_OCTAL_CONSTANT

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_generating_type is
			-- Test the generating type of octal integer manifest constants.
			-- The general rule when there is not hint about its type of an integer
			-- manifest constant is that if the value is representable as an INTEGER_32
			-- then its type is INTEGER_32. Otherwise if the value is representable as
			-- an INTEGER_64 then its type is INTEGER_64. Otherwise if the value is
			-- representable as a NATURAL_64 then its type is NATURAL_64.
		do
			assert_strings_equal ("one_digit_1", "INTEGER_32", (0c1).generating_type.out)
			assert_strings_equal ("one_digit_2", "INTEGER_32", (0c7).generating_type.out)
			assert_strings_equal ("one_digit_negative_1", "INTEGER_32", (-0c1).generating_type.out)
			assert_strings_equal ("one_digit_negative_2", "INTEGER_32", (-0c7).generating_type.out)
				-- 0c177 = {INTEGER_8}.Max_value
			assert_strings_equal ("three_digit_1", "INTEGER_32", (0c177).generating_type.out)
				-- 0c200 = {INTEGER_8}.Max_value + 1
			assert_strings_equal ("three_digit_3", "INTEGER_32", (0c200).generating_type.out)
				-- 0c377 = {NATURAL_8}.Max_value
			assert_strings_equal ("three_digit_4", "INTEGER_32", (0c377).generating_type.out)
				-- 0c400 = {NATURAL_8}.Max_value + 1
			assert_strings_equal ("three_digit_5", "INTEGER_32", (0c400).generating_type.out)
			assert_strings_equal ("three_digit_negative_1", "INTEGER_32", (-0c111).generating_type.out)
				-- -0c200 = {INTEGER_8}.Min_value
			assert_strings_equal ("three_digit_negative_2", "INTEGER_32", (-0c200).generating_type.out)
				-- -0c201 = {INTEGER_8}.Min_value - 1
			assert_strings_equal ("three_digit_negative_3", "INTEGER_32", (-0c201).generating_type.out)
				-- -0c377 = -{NATURAL_8}.Max_value
			assert_strings_equal ("three_digit_negative_4", "INTEGER_32", (-0c377).generating_type.out)
			assert_strings_equal ("five_digit_1", "INTEGER_32", (0c11111).generating_type.out)
				-- 0c77777 = {INTEGER_16}.Max_value
			assert_strings_equal ("five_digit_2", "INTEGER_32", (0c77777).generating_type.out)
				-- 0c100000 = {INTEGER_16}.Max_value + 1
			assert_strings_equal ("six_digit_1", "INTEGER_32", (0c100000).generating_type.out)
				-- 0c177777 = {NATURAL_16}.Max_value
			assert_strings_equal ("six_digit_2", "INTEGER_32", (0c177777).generating_type.out)
				-- 0c200000 = {NATURAL_16}.Max_value + 1
			assert_strings_equal ("six_digit_3", "INTEGER_32", (0c200000).generating_type.out)
				-- -0c100000 = {INTEGER_16}.Min_value
			assert_strings_equal ("six_digit_negative_1", "INTEGER_32", (-0c100000).generating_type.out)
				-- -0c100001 = {INTEGER_16}.Min_value - 1
			assert_strings_equal ("six_digit_negative_2", "INTEGER_32", (-0c100001).generating_type.out)
				-- -0c177777 = -{NATURAL_16}.Max_value
			assert_strings_equal ("six_digit_negative_3", "INTEGER_32", (-0c177777).generating_type.out)
			assert_strings_equal ("eleven_digit_1", "INTEGER_32", (0c11111111111).generating_type.out)
				-- 0c17777777777 = {INTEGER_32}.Max_value
			assert_strings_equal ("eleven_digit_2", "INTEGER_32", (0c17777777777).generating_type.out)
				-- 0c20000000000 = {INTEGER_32}.Max_value + 1
			assert_strings_equal ("eleven_digit_3", "INTEGER_64", (0c20000000000).generating_type.out)
				-- 0c37777777777 = {NATURAL_32}.Max_value
			assert_strings_equal ("eleven_digit_4", "INTEGER_64", (0c37777777777).generating_type.out)
				-- 0c40000000000 = {NATURAL_32}.Max_value + 1
			assert_strings_equal ("eleven_digit_5", "INTEGER_64", (0c40000000000).generating_type.out)
			assert_strings_equal ("eleven_digit_negative_1", "INTEGER_32", (-0c11111111111).generating_type.out)
				-- -0c20000000000 = {INTEGER_32}.Min_value
			assert_strings_equal ("eleven_digit_negative_2", "INTEGER_32", (-0c20000000000).generating_type.out)
				-- -0c20000000001 = {INTEGER_32}.Min_value - 1
			assert_strings_equal ("eleven_digit_negative_3", "INTEGER_64", (-0c20000000001).generating_type.out)
				-- -0c37777777777 = -{NATURAL_32}.Max_value
			assert_strings_equal ("eleven_digit_negative_4", "INTEGER_64", (-0c37777777777).generating_type.out)
			assert_strings_equal ("twentyone_digit_1", "INTEGER_64", (0c111111111111111111111).generating_type.out)
				-- 0c777777777777777777777 = {INTEGER_64}.Max_value
			assert_strings_equal ("twentyone_digit_2", "INTEGER_64", (0c777777777777777777777).generating_type.out)
				-- 0c1000000000000000000000 = {INTEGER_64}.Max_value + 1
			assert_strings_equal ("twentytwo_digit_1", "NATURAL_64", (0c1000000000000000000000).generating_type.out)
				-- 0c1777777777777777777777 = {NATURAL_64}.Max_value
			assert_strings_equal ("twentytwo_digit_2", "NATURAL_64", (0c1777777777777777777777).generating_type.out)
				-- -0c1000000000000000000000 = {INTEGER_64}.Min_value
			assert_strings_equal ("twentytwo_digit_negative_1", "INTEGER_64", (-0c1000000000000000000000).generating_type.out)
		end

	test_value is
			-- Test the value of octal integer manifest constants.
		do
			assert_equal ("one_digit_1", {INTEGER_32} 1, 0c1)
			assert_equal ("one_digit_2", {INTEGER_32} 7, 0c7)
			assert_equal ("one_digit_negative_1", {INTEGER_32} -1, -0c1)
			assert_equal ("one_digit_negative_2", {INTEGER_32} -7, -0c7)
				-- 0c177 = {INTEGER_8}.Max_value
			assert_equal ("three_digit_1", {INTEGER_32} 127, 0c177)
				-- 0c200 = {INTEGER_8}.Max_value + 1
			assert_equal ("three_digit_3", {INTEGER_32} 128, 0c200)
				-- 0c377 = {NATURAL_8}.Max_value
			assert_equal ("three_digit_4", {INTEGER_32} 255, 0c377)
				-- 0c400 = {NATURAL_8}.Max_value + 1
			assert_equal ("three_digit_5", {INTEGER_32} 256, 0c400)
			assert_equal ("three_digit_negative_1", {INTEGER_32} -73, -0c111)
				-- -0c200 = {INTEGER_8}.Min_value
			assert_equal ("three_digit_negative_2", {INTEGER_32} -128, -0c200)
				-- -0c201 = {INTEGER_8}.Min_value - 1
			assert_equal ("three_digit_negative_3", {INTEGER_32} -129, -0c201)
				-- -0c377 = -{NATURAL_8}.Max_value
			assert_equal ("three_digit_negative_4", {INTEGER_32} -255, -0c377)
			assert_equal ("five_digit_1", {INTEGER_32} 4681, 0c11111)
				-- 0c77777 = {INTEGER_16}.Max_value
			assert_equal ("five_digit_2", {INTEGER_32} 32767, 0c77777)
				-- 0c100000 = {INTEGER_16}.Max_value + 1
			assert_equal ("six_digit_1", {INTEGER_32} 32768, 0c100000)
				-- 0c177777 = {NATURAL_16}.Max_value
			assert_equal ("six_digit_2", {INTEGER_32} 65535, 0c177777)
				-- 0c200000 = {NATURAL_16}.Max_value + 1
			assert_equal ("six_digit_3", {INTEGER_32} 65536, 0c200000)
				-- -0c100000 = {INTEGER_16}.Min_value
			assert_equal ("six_digit_negative_1", {INTEGER_32} -32768, -0c100000)
				-- -0c100001 = {INTEGER_16}.Min_value - 1
			assert_equal ("six_digit_negative_2", {INTEGER_32} -32769, -0c100001)
				-- -0c177777 = -{NATURAL_16}.Max_value
			assert_equal ("six_digit_negative_3", {INTEGER_32} -65535, -0c177777)
			assert_equal ("eleven_digit_1", {INTEGER_32} 1227133513, 0c11111111111)
				-- 0c17777777777 = {INTEGER_32}.Max_value
			assert_equal ("eleven_digit_2", {INTEGER_32} 2147483647, 0c17777777777)
				-- 0c20000000000 = {INTEGER_32}.Max_value + 1
			assert_equal ("eleven_digit_3", {INTEGER_64} 2147483648, 0c20000000000)
				-- 0c37777777777 = {NATURAL_32}.Max_value
			assert_equal ("eleven_digit_4", {INTEGER_64} 4294967295, 0c37777777777)
				-- 0c40000000000 = {NATURAL_32}.Max_value + 1
			assert_equal ("eleven_digit_5", {INTEGER_64} 4294967296, 0c40000000000)
			assert_equal ("eleven_digit_negative_1", {INTEGER_32} -1227133513, -0c11111111111)
				-- -0c20000000000 = {INTEGER_32}.Min_value
			assert_equal ("eleven_digit_negative_2", {INTEGER_32} -2147483648, -0c20000000000)
				-- -0c20000000001 = {INTEGER_32}.Min_value - 1
			assert_equal ("eleven_digit_negative_3", {INTEGER_64} -2147483649, -0c20000000001)
				-- -0c37777777777 = -{NATURAL_32}.Max_value
			assert_equal ("eleven_digit_negative_4", {INTEGER_64} -4294967295, -0c37777777777)
			assert_equal ("twentyone_digit_1", {INTEGER_64} 1317624576693539401, 0c111111111111111111111)
				-- 0c777777777777777777777 = {INTEGER_64}.Max_value
			assert_equal ("twentyone_digit_2", {INTEGER_64} 9223372036854775807, 0c777777777777777777777)
				-- 0c1000000000000000000000 = {INTEGER_64}.Max_value + 1
			assert_equal ("twentytwo_digit_1", {NATURAL_64} 9223372036854775808, 0c1000000000000000000000)
				-- 0c1777777777777777777777 = {NATURAL_64}.Max_value
			assert_equal ("twentytwo_digit_2", {NATURAL_64} 18446744073709551615, 0c1777777777777777777777)
				-- -0c1000000000000000000000 = {INTEGER_64}.Min_value
			assert_equal ("twentytwo_digit_negative_1", {INTEGER_64} -9223372036854775808, -0c1000000000000000000000)
		end

	test_underscore is
			-- Test the value of octal integer manifest constants with underscores.
		do
			assert_equal ("underscore_1", 0c1234, 0c12_34)
		end

	test_letter_case is
			-- Test the value of octal integer manifest constants with different letter-case.
		do
			assert_equal ("letter_case_1", 0c123, 0C123)
		end

	test_integer_8_context is
			-- Test the value of octal integer manifest constants
			-- with a context expecting an "INTEGER_8".
		local
			i: INTEGER_8
		do
			i := 0c177
			assert_equal ("integer_8_1", {INTEGER_8} 127, i)
			i := -0c200
			assert_equal ("integer_8_2", {INTEGER_8} -128, i)
			i := 0c077
			assert_equal ("integer_8_3", {INTEGER_8} 63, i)
		end

	test_integer_8_constant is
			-- Test the value of octal integer manifest constants
			-- declared in constant attributes.
		do
			assert_equal ("integer_8_1", {INTEGER_8} 1, cc2)
			assert_equal ("integer_8_2", {INTEGER_8} -1, cc3)
			assert_equal ("integer_8_3", {INTEGER_8} 1, cc4)
		end

feature {NONE} -- Implementation

	cc2: INTEGER_8 = {INTEGER_16} 0c1
			-- Even though INTEGER_16 does not conform nor convert to INTEGER_8,
			-- ISE compiler accepts this code. It looks like it's because it
			-- ignores the cast type of the manifest constant when it comes to
			-- determine the value of the constant attribute.

	cc3: INTEGER_8 = -0c1
			-- Valie representable as an INTEGER_8: -1

	cc4: INTEGER_8 = 0c1
			-- Value representable as an INTEGER_8: 1

end
