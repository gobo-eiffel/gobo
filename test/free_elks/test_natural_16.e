indexing

	description:

		"Test features of class NATURAL_16"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_NATURAL_16

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_default_create
			test_less_than
			test_less_equal
			test_greater_than
			test_greater_equal
			test_out
			test_item
			test_set_item___fail_ise
			test_to_reference
			test_make_from_reference___fail_ise
			test_infix_plus
			test_infix_minus
			test_infix_times
			test_infix_divide
			test_infix_div
			test_infix_mod
			test_infix_power
			test_prefix_plus
			test_to_character
			test_to_real_32
			test_to_real_64
			test_as_natural_8
			test_as_natural_16
			test_as_natural_32
			test_as_natural_64
			test_as_integer_8
			test_as_integer_16
			test_as_integer_32
			test_as_integer_64
			test_bit_and
			test_bit_or
			test_bit_xor
			test_bit_not
			test_bit_shift_left
			test_bit_shift_right
			test_convert
		end

	test_default_create is
			-- Test feature 'default_create'.
		local
			i: NATURAL_16
		do
			assert ("default", i = 0)
		end

	test_less_than is
			-- Test feature 'infix "<"'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 1
			i2 := 2
			assert ("less_than1", i1 < i2)
			i1 := 10
			i2 := 8
			assert ("not_less_than1", not (i1 < i2))
			i1 := 5
			i2 := 5
			assert ("not_less_than2", not (i1 < i2))
		end

	test_less_equal is
			-- Test feature 'infix "<="'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 1
			i2 := 2
			assert ("less_equal1", i1 <= i2)
			i1 := 10
			i2 := 8
			assert ("not_less_equal", not (i1 <= i2))
			i1 := 5
			i2 := 5
			assert ("less_equal2", i1 <= i2)
		end

	test_greater_than is
			-- Test feature 'infix ">"'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 1
			i2 := 2
			assert ("not_greater_than1", not (i1 > i2))
			i1 := 10
			i2 := 8
			assert ("greater_than1", i1 > i2)
			i1 := 5
			i2 := 5
			assert ("not_greater_than2", not (i1 > i2))
		end

	test_greater_equal is
			-- Test feature 'infix ">="'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 1
			i2 := 2
			assert ("not_greater_equal1", not (i1 >= i2))
			i1 := 10
			i2 := 8
			assert ("greater_equal1", i1 >= i2)
			i1 := 5
			i2 := 5
			assert ("greater_equal2", i1 >= i2)
		end

	test_out is
			-- Test feature 'out'.
		local
			i: NATURAL_16
			l_out: STRING
		do
			i := 5
			l_out := i.out
			assert ("not_void1", l_out /= Void)
			assert ("string_type1", l_out.same_type (""))
			assert_equal ("five", "5", l_out)
			assert ("new_string1", l_out /= i.out)
			i := 10
			l_out := i.out
			assert ("not_void2", l_out /= Void)
			assert ("string_type2", l_out.same_type (""))
			assert_equal ("ten", "10", l_out)
			assert ("new_string2", l_out /= i.out)
			i := 0
			l_out := i.out
			assert ("not_void3", l_out /= Void)
			assert ("string_type3", l_out.same_type (""))
			assert_equal ("min_value", "0", l_out)
			assert ("new_string3", l_out /= i.out)
			i := 65535
			l_out := i.out
			assert ("not_void4", l_out /= Void)
			assert ("string_type4", l_out.same_type (""))
			assert_equal ("max_value", "65535", l_out)
			assert ("new_string4", l_out /= i.out)
		end

	test_item is
			-- Test feature 'item'.
		local
			i: NATURAL_16
		do
			i := 5
			assert ("item1", i.item = 5)
			i := 10
			assert ("item2", i.item = 10)
			assert ("item3", ({NATURAL_16} 25).item = 25)
			assert ("item4", ({NATURAL_16} 100).item = 100)
		end

	test_set_item___fail_ise is
			-- Test feature 'set_item'.
			-- Does not work with ISE Eiffel.
		local
			i: NATURAL_16
		do
			i.set_item (5)
			assert ("item1", i = 5)
			i.set_item (10)
			assert ("item2", i = 10)
				-- We get a new "5" at each call (it's an expanded type).
				-- So setting the 'item' of one occurrence of "5" does not
				-- change the 'item' of the next occurrence of "5".
			({NATURAL_16} 5).set_item (10)
			assert ("item3", (5).item = 5)
				-- Setting the 'item' of the result of a function does not
				-- set the 'item' of the result of the next call of this
				-- function.
			({NATURAL_16} 5 + {NATURAL_16} 6).set_item (100)
			assert ("item4", ({NATURAL_16} 5 + {NATURAL_16} 6).item = 11)
		end

	test_to_reference is
			-- Test feature 'to_reference'.
		local
			i: NATURAL_16
			iref: NATURAL_16_REF
		do
			i := 5
			iref := i.to_reference
			assert ("not_void1", iref /= Void)
			assert ("item1", iref.item = 5)
			i := 10
			iref := i.to_reference
			assert ("not_void2", iref /= Void)
			assert ("item2", iref.item = 10)
		end

	test_make_from_reference___fail_ise is
			-- Test feature 'make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			i: NATURAL_16
			iref: NATURAL_16_REF
		do
			create iref
			iref.set_item (5)
			create i.make_from_reference (iref)
			assert ("item1", i = 5)
			create iref
			iref.set_item (10)
			create i.make_from_reference (iref)
			assert ("item2", i = 10)
		end

	test_infix_plus is
			-- Test feature 'infix "+"'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 2
			i2 := 5
			i3 := 7
			assert ("plus1", i1 + i2 = i3)
		end

	test_infix_minus is
			-- Test feature 'infix "-"'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 5
			i2 := 2
			i3 := 3
			assert ("minus1", i1 - i2 = i3)
		end

	test_infix_times is
			-- Test feature 'infix "*"'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 5
			i2 := 2
			i3 := 10
			assert ("times1", i1 * i2 = i3)
		end

	test_infix_divide is
			-- Test feature 'infix "/"'.
		local
			i1, i2: NATURAL_16
			d1: DOUBLE
		do
			i1 := 10
			i2 := 2
			d1 := 5.0
			assert ("divide1", i1 / i2 = d1)
		end

	test_infix_div is
			-- Test feature 'infix "//"'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 9
			i2 := 2
			i3 := 4
			assert ("div1", i1 // i2 = i3)
		end

	test_infix_mod is
			-- Test feature 'infix "\\"'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 11
			i2 := 3
			i3 := 2
			assert ("mod1", i1 \\ i2 = i3)
		end

	test_infix_power is
			-- Test feature 'infix "^"'.
		local
			i: NATURAL_16
			d1, d2: DOUBLE
		do
			i := 9
			d1 := 0.5
			d2 := 3.0
			assert ("power1", i ^ d1 = d2)
			i := 2
			d1 := 3.0
			d2 := 8.0
			assert ("power2", i ^ d1 = d2)
		end

	test_prefix_plus is
			-- Test feature 'prefix "+"'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 5
			i2 := 5
			assert ("plus1", +i1 = i2)
		end

	test_to_character is
			-- Test feature 'to_character'.
		local
			i: NATURAL_16
			c: CHARACTER
		do
			i := 97
			c := 'a'
			assert ("to_character1", i.to_character = c)
		end

	test_to_real_32 is
			-- Test feature 'to_real_32'.
		local
			i: NATURAL_16
			r: REAL
		do
			i := 2
			r := 2.0
			assert ("to_real_32_1", i.to_real_32 = r)
		end

	test_to_real_64 is
			-- Test feature 'to_real_64'.
		local
			i: NATURAL_16
			d: DOUBLE
		do
			i := 2
			d := 2.0
			assert ("to_real_64_1", i.to_real_64 = d)
		end

	test_as_natural_8 is
			-- Test feature 'as_natural_8'.
		local
			i1: NATURAL_16
			i2: NATURAL_8
		do
			i1 := 5
			i2 := {NATURAL_8} 5
			assert ("as_natural_8_1", i1.as_natural_8 = i2)
		end

	test_as_natural_16 is
			-- Test feature 'as_natural_16'.
		local
			i1: NATURAL_16
			i2: NATURAL_16
		do
			i1 := 5
			i2 := {NATURAL_16} 5
			assert ("as_natural_16_1", i1.as_natural_16 = i2)
		end

	test_as_natural_32 is
			-- Test feature 'as_natural_32'.
		local
			i1: NATURAL_16
			i2: NATURAL_32
		do
			i1 := 5
			i2 := {NATURAL_32} 5
			assert ("as_natural_32_1", i1.as_natural_32 = i2)
		end

	test_as_natural_64 is
			-- Test feature 'as_natural_64'.
		local
			i1: NATURAL_16
			i2: NATURAL_64
		do
			i1 := 5
			i2 := {NATURAL_64} 5
			assert ("as_natural_64_1", i1.as_natural_64 = i2)
		end

	test_as_integer_8 is
			-- Test feature 'as_integer_8'.
		local
			i1: NATURAL_16
			i2: INTEGER_8
		do
			i1 := 5
			i2 := {INTEGER_8} 5
			assert ("as_integer_8_1", i1.as_integer_8 = i2)
		end

	test_as_integer_16 is
			-- Test feature 'as_integer_16'.
		local
			i1: NATURAL_16
			i2: INTEGER_16
		do
			i1 := 5
			i2 := {INTEGER_16} 5
			assert ("as_integer_16_1", i1.as_integer_16 = i2)
		end

	test_as_integer_32 is
			-- Test feature 'as_integer_32'.
		local
			i1: NATURAL_16
			i2: INTEGER
		do
			i1 := 5
			i2 := {INTEGER} 5
			assert ("as_integer_32_1", i1.as_integer_32 = i2)
		end

	test_as_integer_64 is
			-- Test feature 'as_integer_64'.
		local
			i1: NATURAL_16
			i2: INTEGER_64
		do
			i1 := 5
			i2 := {INTEGER_64} 5
			assert ("as_integer_64_1", i1.as_integer_64 = i2)
		end

	test_bit_and is
			-- Test feature 'bit_and'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 5 -- 0000000000000101
			i2 := 4 -- 0000000000000100
			i3 := 4 -- 0000000000000100
			assert ("bit_and1", i1.bit_and (i2) = i3)
			i1 := 5 --     0000000000000101
			i2 := 65531 -- 1111111111111011
			i3 := 1 --     0000000000000001
			assert ("bit_and2", i1.bit_and (i2) = i3)
		end

	test_bit_or is
			-- Test feature 'bit_or'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 5 -- 0000000000000101
			i2 := 4 -- 0000000000000100
			i3 := 5 -- 0000000000000101
			assert ("bit_or1", i1.bit_or (i2) = i3)
			i1 := 5 --     0000000000000101
			i2 := 65531 -- 1111111111111011
			i3 := 65535 -- 1111111111111111
			assert ("bit_or2", i1.bit_or (i2) = i3)
		end

	test_bit_xor is
			-- Test feature 'bit_xor'.
		local
			i1, i2, i3: NATURAL_16
		do
			i1 := 5 -- 0000000000000101
			i2 := 4 -- 0000000000000100
			i3 := 1 -- 0000000000000001
			assert ("bit_xor1", i1.bit_xor (i2) = i3)
			i1 := 5 --     0000000000000101
			i2 := 65531 -- 1111111111111011
			i3 := 65534 -- 1111111111111110
			assert ("bit_xor2", i1.bit_xor (i2) = i3)
		end

	test_bit_not is
			-- Test feature 'bit_not'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 5 --     0000000000000101
			i2 := 65530 -- 1111111111111010
			assert ("bit_not1", i1.bit_not = i2)
			i1 := 65534 -- 11111111111111110
			i2 := 1 --     00000000000000001
			assert ("bit_not2", i1.bit_not = i2)
		end

	test_bit_shift_left is
			-- Test feature 'bit_shift_left'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 5 --  0000000000000101
			i2 := 10 -- 0000000000001010
			assert ("bit_shift_left1", i1.bit_shift_left (1) = i2)
			i1 := 65531 -- 1111111111111011
			i2 := 65526 -- 1111111111110110
			assert ("bit_shift_left2", i1.bit_shift_left (1) = i2)
			i1 := 32767 -- 1111111111111111
			i2 := 65534 -- 1111111111111110
			assert ("bit_shift_left3", i1.bit_shift_left (1) = i2)
			i1 := 32768 -- 1000000000000000
			i2 := 0 --     0000000000000000
			assert ("bit_shift_left4", i1.bit_shift_left (1) = i2)
		end

	test_bit_shift_right is
			-- Test feature 'bit_shift_right'.
		local
			i1, i2: NATURAL_16
		do
			i1 := 5 -- 0000000000000101
			i2 := 2 -- 0000000000000010
			assert ("bit_shift_right1", i1.bit_shift_right (1) = i2)
			i1 := 65531 -- 1111111111111011
			i2 := 32765 -- 0111111111111101
			assert ("bit_shift_right2", i1.bit_shift_right (1) = i2)
		end

	test_convert is
			-- Test conversion.
		local
			i: NATURAL_16
			iref: NATURAL_16_REF
		do
				-- Convert to.
			i := 5
			iref := i
			assert ("not_void1", iref /= Void)
			assert ("item1", iref.item = 5)
			i := 10
			iref := i
			assert ("not_void2", iref /= Void)
			assert ("item2", iref.item = 10)
				-- Convert from.
			create iref
			iref.set_item (5)
			i := iref
			assert ("item3", i = 5)
			create iref
			iref.set_item (10)
			i := iref
			assert ("item4", i = 10)
		end

end
