note

	description:

		"Test semantics of hexadecimal integer manifest constants"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_HEXADECIMAL_CONSTANT

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_generating_type
			-- Test the generating type of hexadecimal integer manifest constants.
			-- The general rule when there is not hint about its type of an integer
			-- manifest constant is that if the value is representable as an INTEGER_32
			-- then its type is INTEGER_32. Otherwise if the value is representable as
			-- an INTEGER_64 then its type is INTEGER_64. Otherwise if the value is
			-- representable as a NATURAL_64 then its type is NATURAL_64. In case of
			-- hexadecimal values this is more subtle because ISE considers for example
			-- that 0xFFFFFFFF is representable as an INTEGER_32 (with value -1), but
			-- here its type will nevertheless be INTEGER_64.
		do
			assert_strings_equal ("one_digit_1", "INTEGER_32", (0x1).generating_type.out)
			assert_strings_equal ("one_digit_2", "INTEGER_32", (0xF).generating_type.out)
			assert_strings_equal ("one_digit_negative_1", "INTEGER_32", (-0x1).generating_type.out)
			assert_strings_equal ("one_digit_negative_2", "INTEGER_32", (-0xF).generating_type.out)
			assert_strings_equal ("two_digit_1", "INTEGER_32", (0x11).generating_type.out)
				-- 0x7F = {INTEGER_8}.Max_value
			assert_strings_equal ("two_digit_2", "INTEGER_32", (0x7F).generating_type.out)
				-- 0x80 = {INTEGER_8}.Max_value + 1
			assert_strings_equal ("two_digit_3", "INTEGER_32", (0x80).generating_type.out)
				-- 0xFF = {NATURAL_8}.Max_value
			assert_strings_equal ("two_digit_4", "INTEGER_32", (0xFF).generating_type.out)
			assert_strings_equal ("two_digit_negative_1", "INTEGER_32", (-0x11).generating_type.out)
				-- -0x80 = {INTEGER_8}.Min_value
			assert_strings_equal ("two_digit_negative_2", "INTEGER_32", (-0x80).generating_type.out)
				-- -0x81 = {INTEGER_8}.Min_value - 1
			assert_strings_equal ("two_digit_negative_3", "INTEGER_32", (-0x81).generating_type.out)
				-- -0xFF = -{NATURAL_8}.Max_value
			assert_strings_equal ("two_digit_negative_4", "INTEGER_32", (-0xFF).generating_type.out)
				-- 0x100 = {NATURAL_8}.Max_value + 1
			assert_strings_equal ("three_digit_1", "INTEGER_32", (0x100).generating_type.out)
			assert_strings_equal ("three_digit_2", "INTEGER_32", (0x111).generating_type.out)
			assert_strings_equal ("three_digit_3", "INTEGER_32", (0xFFF).generating_type.out)
			assert_strings_equal ("three_digit_negative_1", "INTEGER_32", (-0x111).generating_type.out)
			assert_strings_equal ("three_digit_negative_2", "INTEGER_32", (-0xFFF).generating_type.out)
			assert_strings_equal ("four_digit_1", "INTEGER_32", (0x1111).generating_type.out)
				-- 0x7FFF = {INTEGER_16}.Max_value
			assert_strings_equal ("four_digit_2", "INTEGER_32", (0x7FFF).generating_type.out)
				-- 0x8000 = {INTEGER_16}.Max_value + 1
			assert_strings_equal ("four_digit_3", "INTEGER_32", (0x8000).generating_type.out)
				-- 0xFFFF = {NATURAL_16}.Max_value
			assert_strings_equal ("four_digit_4", "INTEGER_32", (0xFFFF).generating_type.out)
			assert_strings_equal ("four_digit_negative_1", "INTEGER_32", (-0x1111).generating_type.out)
				-- -0x8000 = {INTEGER_16}.Min_value
			assert_strings_equal ("four_digit_negative_2", "INTEGER_32", (-0x8000).generating_type.out)
				-- -0x8001 = {INTEGER_16}.Min_value - 1
			assert_strings_equal ("four_digit_negative_3", "INTEGER_32", (-0x8001).generating_type.out)
				-- -0xFFFF = -{NATURAL_16}.Max_value
			assert_strings_equal ("four_digit_negative_4", "INTEGER_32", (-0xFFFF).generating_type.out)
				-- 0x10000 = {NATURAL_16}.Max_value + 1
			assert_strings_equal ("five_digit_1", "INTEGER_32", (0x10000).generating_type.out)
			assert_strings_equal ("five_digit_2", "INTEGER_32", (0x11111).generating_type.out)
			assert_strings_equal ("five_digit_3", "INTEGER_32", (0xFFFFF).generating_type.out)
			assert_strings_equal ("five_digit_negative_1", "INTEGER_32", (-0x11111).generating_type.out)
			assert_strings_equal ("five_digit_negative_2", "INTEGER_32", (-0xFFFFF).generating_type.out)
			assert_strings_equal ("eight_digit_1", "INTEGER_32", (0x11111111).generating_type.out)
				-- 0x7FFFFFFF = {INTEGER_32}.Max_value
			assert_strings_equal ("eight_digit_2", "INTEGER_32", (0x7FFFFFFF).generating_type.out)
				-- 0x80000000 = {INTEGER_32}.Max_value + 1
			assert_strings_equal ("eight_digit_3", "INTEGER_64", (0x80000000).generating_type.out)
				-- 0xFFFFFFFF = {NATURAL_32}.Max_value
			assert_strings_equal ("eight_digit_4", "INTEGER_64", (0xFFFFFFFF).generating_type.out)
			assert_strings_equal ("eight_digit_negative_1", "INTEGER_32", (-0x11111111).generating_type.out)
				-- -0x80000000 = {INTEGER_32}.Min_value
			assert_strings_equal ("eight_digit_negative_2", "INTEGER_32", (-0x80000000).generating_type.out)
				-- -0x80000001 = {INTEGER_32}.Min_value - 1
			assert_strings_equal ("eight_digit_negative_3", "INTEGER_64", (-0x80000001).generating_type.out)
				-- -0xFFFFFFFF = -{NATURAL_32}.Max_value
			assert_strings_equal ("eight_digit_negative_4", "INTEGER_64", (-0xFFFFFFFF).generating_type.out)
				-- 0x100000000 = {NATURAL_32}.Max_value + 1
			assert_strings_equal ("nine_digit_1", "INTEGER_64", (0x100000000).generating_type.out)
			assert_strings_equal ("nine_digit_2", "INTEGER_64", (0x111111111).generating_type.out)
			assert_strings_equal ("nine_digit_3", "INTEGER_64", (0xFFFFFFFFF).generating_type.out)
			assert_strings_equal ("nine_digit_negative_1", "INTEGER_64", (-0x111111111).generating_type.out)
			assert_strings_equal ("nine_digit_negative_2", "INTEGER_64", (-0xFFFFFFFFF).generating_type.out)
			assert_strings_equal ("sixteen_digit_1", "INTEGER_64", (0x1111111111111111).generating_type.out)
				-- 0x7FFFFFFFFFFFFFFF = {INTEGER_64}.Max_value
			assert_strings_equal ("sixteen_digit_2", "INTEGER_64", (0x7FFFFFFFFFFFFFFF).generating_type.out)
				-- 0x8000000000000000 = {INTEGER_64}.Max_value + 1
			assert_strings_equal ("sixteen_digit_3", "NATURAL_64", (0x8000000000000000).generating_type.out)
				-- 0xFFFFFFFFFFFFFFFF = {NATURAL_64}.Max_value
			assert_strings_equal ("sixteen_digit_4", "NATURAL_64", (0xFFFFFFFFFFFFFFFF).generating_type.out)
			assert_strings_equal ("sixteen_digit_negative_1", "INTEGER_64", (-0x1111111111111111).generating_type.out)
				-- -0x8000000000000000 = {INTEGER_64}.Min_value
			assert_strings_equal ("sixteen_digit_negative_2", "INTEGER_64", (-0x8000000000000000).generating_type.out)
		end

	test_value
			-- Test the value of hexadecimal integer manifest constants.
		do
			assert_equal ("one_digit_1", {INTEGER_32} 1, 0x1)
			assert_equal ("one_digit_2", {INTEGER_32} 15, 0xF)
			assert_equal ("one_digit_negative_1", {INTEGER_32} -1, -0x1)
			assert_equal ("one_digit_negative_2", {INTEGER_32} -15, -0xF)
			assert_equal ("two_digit_1", {INTEGER_32} 17, 0x11)
				-- 0x7F = {INTEGER_8}.Max_value
			assert_equal ("two_digit_2", {INTEGER_32} 127, 0x7F)
				-- 0x80 = {INTEGER_8}.Max_value + 1
			assert_equal ("two_digit_3", {INTEGER_32} 128, 0x80)
				-- 0xFF = {NATURAL_8}.Max_value
			assert_equal ("two_digit_4", {INTEGER_32} 255, 0xFF)
			assert_equal ("two_digit_negative_1", {INTEGER_32} -17, -0x11)
				-- -0x80 = {INTEGER_8}.Min_value
			assert_equal ("two_digit_negative_2", {INTEGER_32} -128, -0x80)
				-- -0x81 = {INTEGER_8}.Min_value - 1
			assert_equal ("two_digit_negative_3", {INTEGER_32} - 129, -0x81)
				-- -0xFF = -{NATURAL_8}.Max_value
			assert_equal ("two_digit_negative_4", {INTEGER_32} -255, -0xFF)
				-- 0x100 = {NATURAL_8}.Max_value + 1
			assert_equal ("three_digit_1", {INTEGER_32} 256, 0x100)
			assert_equal ("three_digit_2", {INTEGER_32} 273, 0x111)
			assert_equal ("three_digit_3", {INTEGER_32} 4095, 0xFFF)
			assert_equal ("three_digit_negative_1", {INTEGER_32} -273, -0x111)
			assert_equal ("three_digit_negative_2", {INTEGER_32} -4095, -0xFFF)
			assert_equal ("four_digit_1", {INTEGER_32} 4369, 0x1111)
				-- 0x7FFF = {INTEGER_16}.Max_value
			assert_equal ("four_digit_2", {INTEGER_32} 32767, 0x7FFF)
				-- 0x8000 = {INTEGER_16}.Max_value + 1
			assert_equal ("four_digit_3", {INTEGER_32} 32768, 0x8000)
				-- 0xFFFF = {NATURAL_16}.Max_value
			assert_equal ("four_digit_4", {INTEGER_32} 65535, 0xFFFF)
			assert_equal ("four_digit_negative_1", {INTEGER_32} -4369, -0x1111)
				-- -0x8000 = {INTEGER_16}.Min_value
			assert_equal ("four_digit_negative_2", {INTEGER_32} -32768, -0x8000)
				-- -0x8001 = {INTEGER_16}.Min_value - 1
			assert_equal ("four_digit_negative_3", {INTEGER_32} -32769, -0x8001)
				-- -0xFFFF = -{NATURAL_16}.Max_value
			assert_equal ("four_digit_negative_4", {INTEGER_32} -65535, -0xFFFF)
				-- 0x10000 = {NATURAL_16}.Max_value + 1
			assert_equal ("five_digit_1", {INTEGER_32} 65536, 0x10000)
			assert_equal ("five_digit_2", {INTEGER_32} 69905, 0x11111)
			assert_equal ("five_digit_3", {INTEGER_32} 1048575, 0xFFFFF)
			assert_equal ("five_digit_negative_1", {INTEGER_32} -69905, -0x11111)
			assert_equal ("five_digit_negative_2", {INTEGER_32} -1048575, -0xFFFFF)
			assert_equal ("eight_digit_1", {INTEGER_32} 286331153, 0x11111111)
				-- 0x7FFFFFFF = {INTEGER_32}.Max_value
			assert_equal ("eight_digit_2", {INTEGER_32} 2147483647, 0x7FFFFFFF)
				-- 0x80000000 = {INTEGER_32}.Max_value + 1
			assert_equal ("eight_digit_3", {INTEGER_64} 2147483648, 0x80000000)
				-- 0xFFFFFFFF = {NATURAL_32}.Max_value
			assert_equal ("eight_digit_4", {INTEGER_64} 4294967295, 0xFFFFFFFF)
			assert_equal ("eight_digit_negative_1", {INTEGER_32} -286331153, -0x11111111)
				-- -0x80000000 = {INTEGER_32}.Min_value
			assert_equal ("eight_digit_negative_2", {INTEGER_32} -2147483648, -0x80000000)
				-- -0x80000001 = {INTEGER_32}.Min_value - 1
			assert_equal ("eight_digit_negative_3", {INTEGER_64} -2147483649, -0x80000001)
				-- -0xFFFFFFFF = -{NATURAL_32}.Max_value
			assert_equal ("eight_digit_negative_4", {INTEGER_64} -4294967295, -0xFFFFFFFF)
				-- 0x100000000 = {NATURAL_32}.Max_value + 1
			assert_equal ("nine_digit_1", {INTEGER_64} 4294967296, 0x100000000)
			assert_equal ("nine_digit_2", {INTEGER_64} 4581298449, 0x111111111)
			assert_equal ("nine_digit_3", {INTEGER_64} 68719476735, 0xFFFFFFFFF)
			assert_equal ("nine_digit_negative_1", {INTEGER_64} -4581298449, -0x111111111)
			assert_equal ("nine_digit_negative_2", {INTEGER_64} -68719476735, -0xFFFFFFFFF)
			assert_equal ("sixteen_digit_1", {INTEGER_64} 1229782938247303441, 0x1111111111111111)
				-- 0x7FFFFFFFFFFFFFFF = {INTEGER_64}.Max_value
			assert_equal ("sixteen_digit_2", {INTEGER_64} 9223372036854775807, 0x7FFFFFFFFFFFFFFF)
				-- 0x8000000000000000 = {INTEGER_64}.Max_value + 1
			assert_equal ("sixteen_digit_3", {NATURAL_64} 9223372036854775808, 0x8000000000000000)
				-- 0xFFFFFFFFFFFFFFFF = {NATURAL_64}.Max_value
			assert_equal ("sixteen_digit_4", {NATURAL_64} 18446744073709551615, 0xFFFFFFFFFFFFFFFF)
			assert_equal ("sixteen_digit_negative_1", {INTEGER_64} -1229782938247303441, -0x1111111111111111)
				-- -0x8000000000000000 = {INTEGER_64}.Min_value
			assert_equal ("sixteen_digit_negative_2", {INTEGER_64} -9223372036854775808, -0x8000000000000000)
		end

	test_underscore
			-- Test the value of hexadecimal integer manifest constants with underscores.
		do
			assert_equal ("underscore_1", 0x1234, 0x12_34)
		end

	test_letter_case
			-- Test the value of hexadecimal integer manifest constants with different letter-case.
		do
			assert_equal ("letter_case_1", 0xAA, 0xaa)
			assert_equal ("letter_case_2", 0xBB, 0Xbb)
			assert_equal ("letter_case_3", 0xCC, 0xCc)
		end

	test_integer_8_type
			-- Test the value of hexadecimal integer manifest constants
			-- with the type cast "INTEGER_8".
		do
			assert_equal ("integer_8_1", {INTEGER_8} -1, {INTEGER_8} 0xFF)
			assert_equal ("integer_8_2", {INTEGER_8} -1, {INTEGER_8} -0x01)
			assert_equal ("integer_8_3", {INTEGER_8} -1, {INTEGER_8} 0x00FF)
			assert_equal ("integer_8_4", {INTEGER_8} -128, {INTEGER_8} 0x80)
		end

	test_integer_8_context
			-- Test the value of hexadecimal integer manifest constants
			-- with a context expecting an "INTEGER_8".
		local
			i: INTEGER_8
		do
			i := 0xFF
			assert_equal ("integer_8_1", {INTEGER_8} -1, i)
			i := -0x01
			assert_equal ("integer_8_2", {INTEGER_8} -1, i)
			i := 0x00FF
			assert_equal ("integer_8_3", {INTEGER_8} -1, i)
			i := 0x80
			assert_equal ("integer_8_4", {INTEGER_8} -128, i)
		end

	test_integer_8_constant
			-- Test the value of hexadecimal integer manifest constants
			-- declared in constant attributes.
		do
			assert_equal ("integer_8_1",{INTEGER_16} 255, cc1)
			assert_equal ("integer_8_2", {INTEGER_8} 1, cc2)
			assert_equal ("integer_8_3", {INTEGER_8} -1, cc3)
			assert_equal ("integer_8_4", {INTEGER_8} 1, cc4)
		end

feature {NONE} -- Implementation

	cc1: INTEGER_16 = {INTEGER_8} 0xFF
			-- Even though ISE considers that '{INTEGER_8} 0xFF' is equal to -1,
			-- the value of `cc1' will be 255
			--
			-- Note that writting '{INTEGER_8} 255' instead of '{INTEGER_8} 0xFF'
			-- will be rejected by ISE compiler because 255 is not representable
			-- as an INTEGER_8. So the compiler checks the validity of the manifest
			-- constant, but just ignores what it just checked when it comes to
			-- determine the value of the constant attribute.

	cc2: INTEGER_8 = {INTEGER_16} 0x01
			-- Even though INTEGER_16 does not conform nor convert to INTEGER_8,
			-- ISE compiler accepts this code. It looks like it's because it
			-- ignores the cast type of the manifest constant when it comes to
			-- determine the value of the constant attribute.

	cc3: INTEGER_8 = 0xFF
			-- ISE considers 0xFF as representable as an INTEGER_8: -1

	cc4: INTEGER_8 = 0x01
			-- Value representable as an INTEGER_8: 1

end
