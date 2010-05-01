note

	description:

		"Test semantics of decimal integer manifest constants"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_DECIMAL_CONSTANT

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_generating_type is
			-- Test the generating type of decimal integer manifest constants.
			-- The general rule when there is not hint about its type of an integer
			-- manifest constant is that if the value is representable as an INTEGER_32
			-- then its type is INTEGER_32. Otherwise if the value is representable as
			-- an INTEGER_64 then its type is INTEGER_64. Otherwise if the value is
			-- representable as a NATURAL_64 then its type is NATURAL_64.
		do
			assert_strings_equal ("one_digit_1", "INTEGER_32", (1).generating_type.out)
			assert_strings_equal ("one_digit_negative_1", "INTEGER_32", (-1).generating_type.out)
				-- 127 = {INTEGER_8}.Max_value
			assert_strings_equal ("three_digit_1", "INTEGER_32", (127).generating_type.out)
				-- 128 = {INTEGER_8}.Max_value + 1
			assert_strings_equal ("three_digit_2", "INTEGER_32", (128).generating_type.out)
				-- 255 = {NATURAL_8}.Max_value
			assert_strings_equal ("three_digit_3", "INTEGER_32", (255).generating_type.out)
				-- 256 = {NATURAL_8}.Max_value + 1
			assert_strings_equal ("three_digit_4", "INTEGER_32", (256).generating_type.out)
			assert_strings_equal ("three_digit_negative_1", "INTEGER_32", (-120).generating_type.out)
				-- -128 = {INTEGER_8}.Min_value
			assert_strings_equal ("three_digit_negative_2", "INTEGER_32", (-128).generating_type.out)
				-- -129 = {INTEGER_8}.Min_value - 1
			assert_strings_equal ("three_digit_negative_3", "INTEGER_32", (-129).generating_type.out)
				-- -255 = -{NATURAL_8}.Max_value
			assert_strings_equal ("three_digit_negative_4", "INTEGER_32", (-255).generating_type.out)
				-- 32767 = {INTEGER_16}.Max_value
			assert_strings_equal ("five_digit_1", "INTEGER_32", (32767).generating_type.out)
				-- 32768 = {INTEGER_16}.Max_value + 1
			assert_strings_equal ("five_digit_2", "INTEGER_32", (32768).generating_type.out)
				-- 65535 = {NATURAL_16}.Max_value
			assert_strings_equal ("five_digit_3", "INTEGER_32", (65535).generating_type.out)
				-- 65536 = {NATURAL_16}.Max_value + 1
			assert_strings_equal ("five_digit_4", "INTEGER_32", (65536).generating_type.out)
			assert_strings_equal ("five_digit_negative_1", "INTEGER_32", (-11111).generating_type.out)
				-- -32768 = {INTEGER_16}.Min_value
			assert_strings_equal ("five_digit_negative_2", "INTEGER_32", (-32768).generating_type.out)
				-- -32769 = {INTEGER_16}.Min_value - 1
			assert_strings_equal ("five_digit_negative_3", "INTEGER_32", (-32769).generating_type.out)
				-- -65535 = -{NATURAL_16}.Max_value
			assert_strings_equal ("five_digit_negative_4", "INTEGER_32", (-65535).generating_type.out)
			assert_strings_equal ("ten_digit_1", "INTEGER_32", (1111111111).generating_type.out)
				-- 2147483647 = {INTEGER_32}.Max_value
			assert_strings_equal ("ten_digit_2", "INTEGER_32", (2147483647).generating_type.out)
				-- 2147483648 = {INTEGER_32}.Max_value + 1
			assert_strings_equal ("ten_digit_3", "INTEGER_64", (2147483648).generating_type.out)
				-- 4294967295 = {NATURAL_32}.Max_value
			assert_strings_equal ("ten_digit_4", "INTEGER_64", (4294967295).generating_type.out)
				-- 4294967295 = {NATURAL_32}.Max_value + 1
			assert_strings_equal ("ten_digit_5", "INTEGER_64", (4294967296).generating_type.out)
			assert_strings_equal ("ten_digit_negative_1", "INTEGER_32", (-1111111111).generating_type.out)
				-- -2147483648 = {INTEGER_32}.Min_value
			assert_strings_equal ("ten_digit_negative_2", "INTEGER_32", (-2147483648).generating_type.out)
				-- -2147483649 = {INTEGER_32}.Min_value - 1
			assert_strings_equal ("ten_digit_negative_3", "INTEGER_64", (-2147483649).generating_type.out)
				-- -4294967295 = -{NATURAL_32}.Max_value
			assert_strings_equal ("ten_digit_negative_4", "INTEGER_64", (-4294967295).generating_type.out)
			assert_strings_equal ("nineteen_digit_1", "INTEGER_64", (1111111111111111111).generating_type.out)
				-- 9223372036854775807 = {INTEGER_64}.Max_value
			assert_strings_equal ("nineteen_digit_2", "INTEGER_64", (9223372036854775807).generating_type.out)
				-- 9223372036854775808 = {INTEGER_64}.Max_value + 1
			assert_strings_equal ("nineteen_digit_3", "NATURAL_64", (9223372036854775808).generating_type.out)
				-- 18446744073709551615 = {NATURAL_64}.Max_value
			assert_strings_equal ("twenty_digit_4", "NATURAL_64", (18446744073709551615).generating_type.out)
				-- -9223372036854775808 = {INTEGER_64}.Min_value
			assert_strings_equal ("nineteen_digit_negative_1", "INTEGER_64", (-9223372036854775808).generating_type.out)
		end

	test_value is
			-- Test the value of decimal integer manifest constants.
		do
			assert_equal ("one_digit_1", {INTEGER_32} 1, 1)
			assert_equal ("one_digit_negative_1", {INTEGER_32} -1, -1)
				-- 127 = {INTEGER_8}.Max_value
			assert_equal ("three_digit_1", {INTEGER_32} 127, 127)
				-- 128 = {INTEGER_8}.Max_value + 1
			assert_equal ("three_digit_2", {INTEGER_32} 128, 128)
				-- 255 = {NATURAL_8}.Max_value
			assert_equal ("three_digit_3", {INTEGER_32} 255, 255)
				-- 256 = {NATURAL_8}.Max_value + 1
			assert_equal ("three_digit_4", {INTEGER_32} 256, 256)
			assert_equal ("three_digit_negative_1", {INTEGER_32} -120, -120)
				-- -128 = {INTEGER_8}.Min_value
			assert_equal ("three_digit_negative_2", {INTEGER_32} -128, -128)
				-- -129 = {INTEGER_8}.Min_value - 1
			assert_equal ("three_digit_negative_3", {INTEGER_32} -129, -129)
				-- -255 = -{NATURAL_8}.Max_value
			assert_equal ("three_digit_negative_4", {INTEGER_32} -255, -255)
				-- 32767 = {INTEGER_16}.Max_value
			assert_equal ("five_digit_1", {INTEGER_32} 32767, 32767)
				-- 32768 = {INTEGER_16}.Max_value + 1
			assert_equal ("five_digit_2", {INTEGER_32} 32768, 32768)
				-- 65535 = {NATURAL_16}.Max_value
			assert_equal ("five_digit_3", {INTEGER_32} 65535, 65535)
				-- 65536 = {NATURAL_16}.Max_value + 1
			assert_equal ("five_digit_4", {INTEGER_32} 65536, 65536)
			assert_equal ("five_digit_negative_1", {INTEGER_32} -11111, -11111)
				-- -32768 = {INTEGER_16}.Min_value
			assert_equal ("five_digit_negative_2", {INTEGER_32} -32768, -32768)
				-- -32769 = {INTEGER_16}.Min_value - 1
			assert_equal ("five_digit_negative_3", {INTEGER_32} -32769, -32769)
				-- -65535 = -{NATURAL_16}.Max_value
			assert_equal ("five_digit_negative_4", {INTEGER_32} -65535, -65535)
			assert_equal ("ten_digit_1", {INTEGER_32} 1111111111, 1111111111)
				-- 2147483647 = {INTEGER_32}.Max_value
			assert_equal ("ten_digit_2", {INTEGER_32} 2147483647, 2147483647)
				-- 2147483648 = {INTEGER_32}.Max_value + 1
			assert_equal ("ten_digit_3", {INTEGER_64} 2147483648, 2147483648)
				-- 4294967295 = {NATURAL_32}.Max_value
			assert_equal ("ten_digit_4", {INTEGER_64} 4294967295, 4294967295)
				-- 4294967295 = {NATURAL_32}.Max_value + 1
			assert_equal ("ten_digit_5", {INTEGER_64} 4294967296, 4294967296)
			assert_equal ("ten_digit_negative_1", {INTEGER_32} -1111111111, -1111111111)
				-- -2147483648 = {INTEGER_32}.Min_value
			assert_equal ("ten_digit_negative_2", {INTEGER_32} -2147483648, -2147483648)
				-- -2147483649 = {INTEGER_32}.Min_value - 1
			assert_equal ("ten_digit_negative_3", {INTEGER_64} -2147483649, -2147483649)
				-- -4294967295 = -{NATURAL_32}.Max_value
			assert_equal ("ten_digit_negative_4", {INTEGER_64} -4294967295, -4294967295)
			assert_equal ("nineteen_digit_1", {INTEGER_64} 1111111111111111111, 1111111111111111111)
				-- 9223372036854775807 = {INTEGER_64}.Max_value
			assert_equal ("nineteen_digit_2", {INTEGER_64} 9223372036854775807, 9223372036854775807)
				-- 9223372036854775808 = {INTEGER_64}.Max_value + 1
			assert_equal ("nineteen_digit_3", {NATURAL_64} 9223372036854775808, 9223372036854775808)
				-- 18446744073709551615 = {NATURAL_64}.Max_value
			assert_equal ("twenty_digit_4", {NATURAL_64} 18446744073709551615, 18446744073709551615)
				-- -9223372036854775808 = {INTEGER_64}.Min_value
			assert_equal ("nineteen_digit_negative_1", {INTEGER_64} -9223372036854775808, -9223372036854775808)
		end

	test_underscore is
			-- Test the value of decimal integer manifest constants with underscores.
		do
			assert_equal ("underscore_1", 1234, 12_34)
		end

	test_integer_8_context is
			-- Test the value of decimal integer manifest constants
			-- with a context expecting an "INTEGER_8".
		local
			i: INTEGER_8
		do
			i := 127
			assert_equal ("integer_8_1", {INTEGER_8} 127, i)
			i := -128
			assert_equal ("integer_8_2", {INTEGER_8} -128, i)
			i := 00065
			assert_equal ("integer_8_3", {INTEGER_8} 65, i)
		end

	test_integer_8_constant is
			-- Test the value of decimal integer manifest constants
			-- declared in constant attributes.
		do
			assert_equal ("integer_8_1", {INTEGER_8} 1, cc2)
			assert_equal ("integer_8_2", {INTEGER_8} -1, cc3)
			assert_equal ("integer_8_3", {INTEGER_8} 1, cc4)
		end

feature {NONE} -- Implementation

	cc2: INTEGER_8 = {INTEGER_16} 1
			-- Even though INTEGER_16 does not conform nor convert to INTEGER_8,
			-- ISE compiler accepts this code. It looks like it's because it
			-- ignores the cast type of the manifest constant when it comes to
			-- determine the value of the constant attribute.

	cc3: INTEGER_8 = -1
			-- Value representable as an INTEGER_8: -1

	cc4: INTEGER_8 = 1
			-- Value representable as an INTEGER_8: 1

end
