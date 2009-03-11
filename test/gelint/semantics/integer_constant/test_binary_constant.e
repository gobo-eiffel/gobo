indexing

	description:

		"Test semantics of binary integer manifest constants"

	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BINARY_CONSTANT

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_generating_type is
			-- Test the generating type of binary integer manifest constants.
			-- The general rule when there is no hint about the type of an integer
			-- manifest constant is that if the value is representable as an
			-- INTEGER_32 then its type is INTEGER_32. Otherwise if the value is
			-- representable as an INTEGER_64 then its type is INTEGER_64. Otherwise
			-- if the value is representable as a NATURAL_64 then its type is
			-- NATURAL_64. In case of binary values this is more subtle because
			-- ISE considers for example that 0b11111111111111111111111111111111
			-- is representable as an INTEGER_32 (with value -1), but here its type
			-- will nevertheless be INTEGER_64.
		do
			assert_strings_equal ("one_digit_1", "INTEGER_32", (0b1).generating_type.out)
			assert_strings_equal ("one_digit_negative_1", "INTEGER_32", (-0b1).generating_type.out)
			assert_strings_equal ("two_digit_1", "INTEGER_32", (0b11).generating_type.out)
			assert_strings_equal ("two_digit_negative_1", "INTEGER_32", (-0b11).generating_type.out)
				-- 0b01111111 = {INTEGER_8}.Max_value
			assert_strings_equal ("eight_digit_1", "INTEGER_32", (0b01111111).generating_type.out)
				-- 0b10000000 = {INTEGER_8}.Max_value + 1
			assert_strings_equal ("eight_digit_2", "INTEGER_32", (0b10000000).generating_type.out)
				-- 0b11111111 = {NATURAL_8}.Max_value
			assert_strings_equal ("eight_digit_3", "INTEGER_32", (0b11111111).generating_type.out)
			assert_strings_equal ("eight_digit_negative_1", "INTEGER_32", (-0b01000001).generating_type.out)
				-- -0b10000000 = {INTEGER_8}.Min_value
			assert_strings_equal ("eight_digit_negative_2", "INTEGER_32", (-0b10000000).generating_type.out)
				-- -0b10000001 = {INTEGER_8}.Min_value - 1
			assert_strings_equal ("eight_digit_negative_3", "INTEGER_32", (-0b10000001).generating_type.out)
				-- -0b11111111 = -{NATURAL_8}.Max_value
			assert_strings_equal ("eight_digit_negative_4", "INTEGER_32", (-0b11111111).generating_type.out)
				-- 0b100000000 = {NATURAL_8}.Max_value + 1
			assert_strings_equal ("nine_digit_1", "INTEGER_32", (0b100000000).generating_type.out)
			assert_strings_equal ("nine_digit_negative_1", "INTEGER_32", (-0b111111111).generating_type.out)
			assert_strings_equal ("sixteen_digit_1", "INTEGER_32", (0b0100000000000001).generating_type.out)
				-- 0b0111111111111111 = {INTEGER_16}.Max_value
			assert_strings_equal ("sixteen_digit_2", "INTEGER_32", (0b0111111111111111).generating_type.out)
				-- 0b1000000000000000 = {INTEGER_16}.Max_value + 1
			assert_strings_equal ("sixteen_digit_3", "INTEGER_32", (0b1000000000000000).generating_type.out)
				-- 0b1111111111111111 = {NATURAL_16}.Max_value
			assert_strings_equal ("sixteen_digit_4", "INTEGER_32", (0b1111111111111111).generating_type.out)
			assert_strings_equal ("sixteen_digit_negative_1", "INTEGER_32", (-0b0100000000000001).generating_type.out)
				-- -0b1000000000000000 = {INTEGER_16}.Min_value
			assert_strings_equal ("sixteen_digit_negative_2", "INTEGER_32", (-0b1000000000000000).generating_type.out)
				-- -0b1000000000000001 = {INTEGER_16}.Min_value - 1
			assert_strings_equal ("sixteen_digit_negative_3", "INTEGER_32", (-0b1000000000000001).generating_type.out)
				-- -0b1111111111111111 = -{NATURAL_16}.Max_value
			assert_strings_equal ("sixteen_digit_negative_4", "INTEGER_32", (-0b1111111111111111).generating_type.out)
				-- 0b10000000000000000 = {NATURAL_16}.Max_value + 1
			assert_strings_equal ("seventeen_digit_1", "INTEGER_32", (0b10000000000000000).generating_type.out)
			assert_strings_equal ("seventeen_digit_2", "INTEGER_32", (0b01000000000000001).generating_type.out)
			assert_strings_equal ("seventeen_digit_3", "INTEGER_32", (0b11111111111111111).generating_type.out)
			assert_strings_equal ("seventeen_digit_negative_1", "INTEGER_32", (-0b01000000000000001).generating_type.out)
			assert_strings_equal ("seventeen_digit_negative_2", "INTEGER_32", (-0b11111111111111111).generating_type.out)
			assert_strings_equal ("thirtytwo_digit_1", "INTEGER_32", (0b01000000000000000000000000000001).generating_type.out)
				-- 0b01111111111111111111111111111111 = {INTEGER_32}.Max_value
			assert_strings_equal ("thirtytwo_digit_2", "INTEGER_32", (0b01111111111111111111111111111111).generating_type.out)
				-- 0b10000000000000000000000000000000 = {INTEGER_32}.Max_value + 1
			assert_strings_equal ("thirtytwo_digit_3", "INTEGER_64", (0b10000000000000000000000000000000).generating_type.out)
				-- 0b11111111111111111111111111111111 = {NATURAL_32}.Max_value
			assert_strings_equal ("thirtytwo_digit_4", "INTEGER_64", (0b11111111111111111111111111111111).generating_type.out)
			assert_strings_equal ("thirtytwo_digit_negative_1", "INTEGER_32", (-0b01000000000000000000000000000001).generating_type.out)
				-- -0b10000000000000000000000000000000 = {INTEGER_32}.Min_value
			assert_strings_equal ("thirtytwo_digit_negative_2", "INTEGER_32", (-0b10000000000000000000000000000000).generating_type.out)
				-- -0b10000000000000000000000000000001 = {INTEGER_32}.Min_value - 1
			assert_strings_equal ("thirtytwo_digit_negative_3", "INTEGER_64", (-0b10000000000000000000000000000001).generating_type.out)
				-- -0b11111111111111111111111111111111 = -{NATURAL_32}.Max_value
			assert_strings_equal ("thirtytwo_digit_negative_4", "INTEGER_64", (-0b11111111111111111111111111111111).generating_type.out)
				-- 0b100000000000000000000000000000000 = {NATURAL_32}.Max_value + 1
			assert_strings_equal ("thirtythree_digit_1", "INTEGER_64", (0b100000000000000000000000000000000).generating_type.out)
			assert_strings_equal ("thirtythree_digit_2", "INTEGER_64", (0b010000000000000000000000000000001).generating_type.out)
			assert_strings_equal ("thirtythree_digit_3", "INTEGER_64", (0b111111111111111111111111111111111).generating_type.out)
			assert_strings_equal ("thirtythree_digit_negative_1", "INTEGER_64", (-0b010000000000000000000000000000001).generating_type.out)
			assert_strings_equal ("thirtythree_digit_negative_2", "INTEGER_64", (-0b111111111111111111111111111111111).generating_type.out)
			assert_strings_equal ("sixtyfour_digit_1", "INTEGER_64", (0b0100000000000000000000000000000000000000000000000000000000000001).generating_type.out)
				-- 0b0111111111111111111111111111111111111111111111111111111111111111 = {INTEGER_64}.Max_value
			assert_strings_equal ("sixtyfour_digit_2", "INTEGER_64", (0b0111111111111111111111111111111111111111111111111111111111111111).generating_type.out)
				-- 0b1000000000000000000000000000000000000000000000000000000000000000 = {INTEGER_64}.Max_value + 1
			assert_strings_equal ("sixtyfour_digit_3", "NATURAL_64", (0b1000000000000000000000000000000000000000000000000000000000000000).generating_type.out)
				-- 0b1111111111111111111111111111111111111111111111111111111111111111 = {NATURAL_64}.Max_value
			assert_strings_equal ("sixtyfour_digit_4", "NATURAL_64", (0b1111111111111111111111111111111111111111111111111111111111111111).generating_type.out)
			assert_strings_equal ("sixtyfour_digit_negative_1", "INTEGER_64", (-0b0100000000000000000000000000000000000000000000000000000000000001).generating_type.out)
				-- -0b1000000000000000000000000000000000000000000000000000000000000000 = {INTEGER_64}.Min_value
			assert_strings_equal ("sixtyfour_digit_negative_2", "INTEGER_64", (-0b1000000000000000000000000000000000000000000000000000000000000000).generating_type.out)
		end

	test_value is
			-- Test the value of binary integer manifest constants.
		do
			assert_equal ("one_digit_1", {INTEGER_32} 1, 0b1)
			assert_equal ("one_digit_negative_1", {INTEGER_32} -1, -0b1)
			assert_equal ("two_digit_1", {INTEGER_32} 3, 0b11)
			assert_equal ("two_digit_negative_1", {INTEGER_32} -3, -0b11)
				-- 0b01111111 = {INTEGER_8}.Max_value
			assert_equal ("eight_digit_1", {INTEGER_32} 127, 0b01111111)
				-- 0b10000000 = {INTEGER_8}.Max_value + 1
			assert_equal ("eight_digit_2", {INTEGER_32} 128, 0b10000000)
				-- 0b11111111 = {NATURAL_8}.Max_value
			assert_equal ("eight_digit_3", {INTEGER_32} 255, 0b11111111)
			assert_equal ("eight_digit_negative_1", {INTEGER_32} -65, -0b01000001)
				-- -0b10000000 = {INTEGER_8}.Min_value
			assert_equal ("eight_digit_negative_2", {INTEGER_32} -128, -0b10000000)
				-- -0b10000001 = {INTEGER_8}.Min_value - 1
			assert_equal ("eight_digit_negative_3", {INTEGER_32} -129, -0b10000001)
				-- -0b11111111 = -{NATURAL_8}.Max_value
			assert_equal ("eight_digit_negative_4", {INTEGER_32} -255, -0b11111111)
				-- 0b100000000 = {NATURAL_8}.Max_value + 1
			assert_equal ("nine_digit_1", {INTEGER_32} 256, 0b100000000)
			assert_equal ("nine_digit_negative_1", {INTEGER_32} -511, -0b111111111)
			assert_equal ("sixteen_digit_1", {INTEGER_32} 16385, 0b0100000000000001)
				-- 0b0111111111111111 = {INTEGER_16}.Max_value
			assert_equal ("sixteen_digit_2", {INTEGER_32} 32767, 0b0111111111111111)
				-- 0b1000000000000000 = {INTEGER_16}.Max_value + 1
			assert_equal ("sixteen_digit_3", {INTEGER_32} 32768, 0b1000000000000000)
				-- 0b1111111111111111 = {NATURAL_16}.Max_value
			assert_equal ("sixteen_digit_4", {INTEGER_32} 65535, 0b1111111111111111)
			assert_equal ("sixteen_digit_negative_1", {INTEGER_32} -16385, -0b0100000000000001)
				-- -0b1000000000000000 = {INTEGER_16}.Min_value
			assert_equal ("sixteen_digit_negative_2", {INTEGER_32} -32768, -0b1000000000000000)
				-- -0b1000000000000001 = {INTEGER_16}.Min_value - 1
			assert_equal ("sixteen_digit_negative_3", {INTEGER_32} -32769, -0b1000000000000001)
				-- -0b1111111111111111 = -{NATURAL_16}.Max_value
			assert_equal ("sixteen_digit_negative_4", {INTEGER_32} -65535, -0b1111111111111111)
				-- 0b10000000000000000 = {NATURAL_16}.Max_value + 1
			assert_equal ("seventeen_digit_1", {INTEGER_32} 65536, 0b10000000000000000)
			assert_equal ("seventeen_digit_2", {INTEGER_32} 32769, 0b01000000000000001)
			assert_equal ("seventeen_digit_3", {INTEGER_32} 131071, 0b11111111111111111)
			assert_equal ("seventeen_digit_negative_1", {INTEGER_32} -32769, -0b01000000000000001)
			assert_equal ("seventeen_digit_negative_2", {INTEGER_32} -131071, -0b11111111111111111)
			assert_equal ("thirtytwo_digit_1", {INTEGER_32} 1073741825, 0b01000000000000000000000000000001)
				-- 0b01111111111111111111111111111111 = {INTEGER_32}.Max_value
			assert_equal ("thirtytwo_digit_2", {INTEGER_32} 2147483647, 0b01111111111111111111111111111111)
				-- 0b10000000000000000000000000000000 = {INTEGER_32}.Max_value + 1
			assert_equal ("thirtytwo_digit_3", {INTEGER_64} 2147483648, 0b10000000000000000000000000000000)
				-- 0b11111111111111111111111111111111 = {NATURAL_32}.Max_value
			assert_equal ("thirtytwo_digit_4", {INTEGER_64} 4294967295, 0b11111111111111111111111111111111)
			assert_equal ("thirtytwo_digit_negative_1", {INTEGER_32} -1073741825, -0b01000000000000000000000000000001)
				-- -0b10000000000000000000000000000000 = {INTEGER_32}.Min_value
			assert_equal ("thirtytwo_digit_negative_2", {INTEGER_32} -2147483648, -0b10000000000000000000000000000000)
				-- -0b10000000000000000000000000000001 = {INTEGER_32}.Min_value - 1
			assert_equal ("thirtytwo_digit_negative_3", {INTEGER_64} -2147483649, -0b10000000000000000000000000000001)
				-- -0b11111111111111111111111111111111 = -{NATURAL_32}.Max_value
			assert_equal ("thirtytwo_digit_negative_4", {INTEGER_64} -4294967295, -0b11111111111111111111111111111111)
				-- 0b100000000000000000000000000000000 = {NATURAL_32}.Max_value + 1
			assert_equal ("thirtythree_digit_1", {INTEGER_64} 4294967296, 0b100000000000000000000000000000000)
			assert_equal ("thirtythree_digit_2", {INTEGER_64} 2147483649, 0b010000000000000000000000000000001)
			assert_equal ("thirtythree_digit_3", {INTEGER_64} 8589934591, 0b111111111111111111111111111111111)
			assert_equal ("thirtythree_digit_negative_1", {INTEGER_64} -2147483649, -0b010000000000000000000000000000001)
			assert_equal ("thirtythree_digit_negative_2", {INTEGER_64} -8589934591, -0b111111111111111111111111111111111)
			assert_equal ("sixtyfour_digit_1", {INTEGER_64} 4611686018427387905, 0b0100000000000000000000000000000000000000000000000000000000000001)
				-- 0b0111111111111111111111111111111111111111111111111111111111111111 = {INTEGER_64}.Max_value
			assert_equal ("sixtyfour_digit_2", {INTEGER_64} 9223372036854775807, 0b0111111111111111111111111111111111111111111111111111111111111111)
				-- 0b1000000000000000000000000000000000000000000000000000000000000000 = {INTEGER_64}.Max_value + 1
			assert_equal ("sixtyfour_digit_3", {NATURAL_64} 9223372036854775808, 0b1000000000000000000000000000000000000000000000000000000000000000)
				-- 0b1111111111111111111111111111111111111111111111111111111111111111 = {NATURAL_64}.Max_value
			assert_equal ("sixtyfour_digit_4", {NATURAL_64} 18446744073709551615, 0b1111111111111111111111111111111111111111111111111111111111111111)
			assert_equal ("sixtyfour_digit_negative_1", {INTEGER_64} -4611686018427387905, -0b0100000000000000000000000000000000000000000000000000000000000001)
				-- -0b1000000000000000000000000000000000000000000000000000000000000000 = {INTEGER_64}.Min_value
			assert_equal ("sixtyfour_digit_negative_2", {INTEGER_64} -9223372036854775808, -0b1000000000000000000000000000000000000000000000000000000000000000)
		end

	test_underscore is
			-- Test the value of binary integer manifest constants with underscores.
		do
			assert_equal ("underscore_1", 0b1010, 0b10_10)
		end

	test_letter_case is
			-- Test the value of binary integer manifest constants with different letter-case.
		do
			assert_equal ("letter_case_1", 0b10, 0B10)
		end

	test_integer_8_type is
			-- Test the value of binary integer manifest constants
			-- with the type cast "INTEGER_8".
		do
			assert_equal ("integer_8_1", {INTEGER_8} -1, {INTEGER_8} 0b11111111)
			assert_equal ("integer_8_2", {INTEGER_8} -1, {INTEGER_8} -0b1)
			assert_equal ("integer_8_3", {INTEGER_8} -1, {INTEGER_8} 0b0000000011111111)
			assert_equal ("integer_8_4", {INTEGER_8} -128, {INTEGER_8} 0b10000000)
		end

	test_integer_8_context is
			-- Test the value of binary integer manifest constants
			-- with a context expecting an "INTEGER_8".
		local
			i: INTEGER_8
		do
			i := 0b11111111
			assert_equal ("integer_8_1", {INTEGER_8} -1, i)
			i := -0b1
			assert_equal ("integer_8_2", {INTEGER_8} -1, i)
			i := 0b0000000011111111
			assert_equal ("integer_8_3", {INTEGER_8} -1, i)
			i := 0b10000000
			assert_equal ("integer_8_4", {INTEGER_8} -128, i)
		end

	test_integer_8_constant is
			-- Test the value of binary integer manifest constants
			-- declared in constant attributes.
		do
			assert_equal ("integer_8_1",{INTEGER_16} 255, cc1)
			assert_equal ("integer_8_2", {INTEGER_8} 1, cc2)
			assert_equal ("integer_8_3", {INTEGER_8} -1, cc3)
			assert_equal ("integer_8_4", {INTEGER_8} 1, cc4)
		end

feature {NONE} -- Implementation

	cc1: INTEGER_16 = {INTEGER_8} 0b11111111
			-- Even though ISE considers that '{INTEGER_8} 0b11111111' is equal to -1,
			-- the value of `cc1' will be 255
			--
			-- Note that writting '{INTEGER_8} 255' instead of '{INTEGER_8} 0b11111111'
			-- will be rejected by ISE compiler because 255 is not representable
			-- as an INTEGER_8. So the compiler checks the validity of the manifest
			-- constant, but just ignores what it just checked when it comes to 
			-- determine the value of the constant attribute.

	cc2: INTEGER_8 = {INTEGER_16} 0b1
			-- Even though INTEGER_16 does not conform nor convert to INTEGER_8,
			-- ISE compiler accepts this code. It looks like it's because it
			-- ignores the cast type of the manifest constant when it comes to
			-- determine the value of the constant attribute.

	cc3: INTEGER_8 = 0b11111111
			-- ISE considers 0b11111111 as representable as an INTEGER_8: -1

	cc4: INTEGER_8 = 0b1
			-- Value representable as an INTEGER_8: 1

end
