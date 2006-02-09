indexing

	description:

		"Test features of class REAL"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_REAL

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
			test_infix_power
			test_prefix_minus
			test_prefix_plus
			test_truncated_to_integer
			test_truncated_to_integer_64
			test_to_double
			test_ceiling_real_32
			test_floor_real_32
			test_abs
			test_convert
		end

	test_default_create is
			-- Test feature 'default_create'.
		local
			r: REAL
		do
			assert ("default", r = {REAL} 0.0)
		end

	test_less_than is
			-- Test feature 'infix "<"'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 1.5
			r2 := {REAL} 2.7
			assert ("less_than1", r1 < r2)
			r1 := {REAL} 10.9
			r2 := {REAL} 8.2
			assert ("not_less_than1", not (r1 < r2))
			r1 := {REAL} 5.4
			r2 := {REAL} 5.4
			assert ("not_less_than2", not (r1 < r2))
		end

	test_less_equal is
			-- Test feature 'infix "<="'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 1.5
			r2 := {REAL} 2.7
			assert ("less_equal1", r1 <= r2)
			r1 := {REAL} 10.9
			r2 := {REAL} 8.2
			assert ("not_less_equal", not (r1 <= r2))
			r1 := {REAL} 5.4
			r2 := {REAL} 5.4
			assert ("less_equal2", r1 <= r2)
		end

	test_greater_than is
			-- Test feature 'infix ">"'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 1.5
			r2 := {REAL} 2.7
			assert ("not_greater_than1", not (r1 > r2))
			r1 := {REAL} 10.9
			r2 := {REAL} 8.2
			assert ("greater_than1", r1 > r2)
			r1 := {REAL} 5.4
			r2 := {REAL} 5.4
			assert ("not_greater_than2", not (r1 > r2))
		end

	test_greater_equal is
			-- Test feature 'infix ">="'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 1.5
			r2 := {REAL} 2.7
			assert ("not_greater_equal1", not (r1 >= r2))
			r1 := {REAL} 10.9
			r2 := {REAL} 8.2
			assert ("greater_equal1", r1 >= r2)
			r1 := {REAL} 5.4
			r2 := {REAL} 5.4
			assert ("greater_equal2", r1 >= r2)
		end

	test_out is
			-- Test feature 'out'.
		local
			r: REAL
			l_out: STRING
		do
			r := {REAL} 10.9
			l_out := r.out
			assert ("not_void1", l_out /= Void)
			assert ("string_type1", l_out.same_type (""))
			assert_equal ("value1", "10.9", l_out)
			assert ("new_string1", l_out /= r.out)
			r := {REAL} -10.9
			l_out := r.out
			assert ("not_void2", l_out /= Void)
			assert ("string_type2", l_out.same_type (""))
			assert_equal ("value2", "-10.9", l_out)
			assert ("new_string2", l_out /= r.out)
		end

	test_item is
			-- Test feature 'item'.
		local
			r: REAL
		do
			r := {REAL} 5.4
			assert ("item1", r.item = {REAL} 5.4)
			r := {REAL} -10.9
			assert ("item2", r.item = {REAL} -10.9)
			assert ("item3", ({REAL} 25.2).item = {REAL} 25.2)
			assert ("item4", ({REAL} -100.0).item = {REAL} -100.0)
		end

	test_set_item___fail_ise is
			-- Test feature 'set_item'.
			-- Does not work with ISE Eiffel.
		local
			r: REAL
		do
			r.set_item ({REAL} 5.4)
			assert ("item1", r = {REAL} 5.4)
			r.set_item ({REAL} -10.9)
			assert ("item2", r = {REAL} -10.9)
				-- We get a new "5.5" at each call (it's an expanded type).
				-- So setting the 'item' of one occurrence of "5.5" does not
				-- change the 'item' of the next occurrence of "5.5".
			({REAL} 5.5).set_item ({REAL} -10.3)
			assert ("item3", (5.5).item = {REAL} 5.5)
				-- Setting the 'item' of the result of a function does not
				-- set the 'item' of the result of the next call of this
				-- function.
			({REAL} 4.4 + {REAL} 6.5).set_item ({REAL} -11.5)
			assert ("item4", ({REAL} 4.4 + {REAL} 6.5).item = {REAL} 10.9)
		end

	test_to_reference is
			-- Test feature 'to_reference'.
		local
			r: REAL
			rref: REAL_REF
		do
			r := {REAL} 5.3
			rref := r.to_reference
			assert ("not_void1", rref /= Void)
			assert ("item1", rref.item = {REAL} 5.3)
			r := {REAL} -10.2
			rref := r.to_reference
			assert ("not_void2", rref /= Void)
			assert ("item2", rref.item = {REAL} -10.2)
		end

	test_make_from_reference___fail_ise is
			-- Test feature 'make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			r: REAL
			rref: REAL_REF
		do
			create rref
			rref.set_item ({REAL} 5.7)
			create r.make_from_reference (rref)
			assert ("item1", r = {REAL} 5.7)
			create rref
			rref.set_item ({REAL} -10.1)
			create r.make_from_reference (rref)
			assert ("item2", r = {REAL} -10.1)
		end

	test_infix_plus is
			-- Test feature 'infix "+"'.
		local
			r1, r2, r3, r4: REAL
		do
			r1 := {REAL} 4.4
			r2 := {REAL} 6.5
			r3 := {REAL} 10.9
				-- Need to use `r4' otherwise ISE 5.7.0414 fails
				-- to work in frozen mode. Still does not work in
				-- finalized mode.
			-- assert ("plus1", r1 + r2 = r3)
			r4 := r1 + r2
			assert ("plus1", r4 = r3)
		end

	test_infix_minus is
			-- Test feature 'infix "-"'.
		local
			r1, r2, r3: REAL
		do
			r1 := {REAL} 5.5
			r2 := {REAL} 2.2
			r3 := {REAL} 3.3
			assert ("minus1", r1 - r2 = r3)
		end

	test_infix_times is
			-- Test feature 'infix "*"'.
		local
			r1, r2, r3: REAL
		do
			r1 := {REAL} 5.4
			r2 := {REAL} 2.0
			r3 := {REAL} 10.8
			assert ("times1", r1 * r2 = r3)
		end

	test_infix_divide is
			-- Test feature 'infix "/"'.
		local
			r1, r2, r3: REAL
		do
			r1 := {REAL} 10.4
			r2 := {REAL} 2.0
			r3 := {REAL} 5.2
			assert ("divide1", r1 / r2 = r3)
		end

	test_infix_power is
			-- Test feature 'infix "^"'.
		local
			r1: REAL
			r2, r3: DOUBLE
		do
			r1 := {REAL} 9.0
			r2 := 0.5
			r3 := 3.0
			assert ("power1", r1 ^ r2 = r3)
			r1 := {REAL} 2.0
			r2 := 3.0
			r3 := 8.0
			assert ("power2", r1 ^ r2 = r3)
		end

	test_prefix_minus is
			-- Test feature 'prefix "-"'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 5.1
			r2 := {REAL} -5.1
			assert ("minus1", -r1 = r2)
		end

	test_prefix_plus is
			-- Test feature 'prefix "+"'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 5.9
			r2 := {REAL} 5.9
			assert ("plus1", +r1 = r2)
		end

	test_truncated_to_integer is
			-- Test feature 'truncated_to_integer'.
		local
			r: REAL
			i: INTEGER
		do
			r := {REAL} 97.8
			i := 97
			assert ("truncated_to_integer1", r.truncated_to_integer = i)
		end

	test_truncated_to_integer_64 is
			-- Test feature 'truncated_to_integer_64'.
		local
			r: REAL
			i: INTEGER_64
		do
			r := {REAL} 97.8
			i := 97
			assert ("truncated_to_integer_64_1", r.truncated_to_integer_64 = i)
		end

	test_to_double is
			-- Test feature 'to_double'.
		local
			r: REAL
			d: DOUBLE
		do
			r := {REAL} 10.0
			d := 10.0
			assert ("to_double1", r.to_double = d)
		end

	test_ceiling_real_32 is
			-- Test feature 'ceiling_real_32'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 7.8
			r2 := {REAL} 8.0
			assert ("ceiling_real_32_1", r1.ceiling_real_32 = r2)
		end

	test_floor_real_32 is
			-- Test feature 'floor_real_32'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 7.8
			r2 := {REAL} 7.0
			assert ("floor_real_32_1", r1.floor_real_32 = r2)
		end

	test_abs is
			-- Test feature 'abs'.
		local
			r1, r2: REAL
		do
			r1 := {REAL} 7.8
			r2 := {REAL} 7.8
			assert ("abs1", r1.abs = r2)
			r1 := {REAL} -9.1
			r2 := {REAL} 9.1
			assert ("abs1", r1.abs = r2)
		end

	test_convert is
			-- Test conversion.
		local
			r: REAL
			rref: REAL_REF
		do
				-- Convert to.
			r := {REAL} 5.3
			rref := r
			assert ("not_void1", rref /= Void)
			assert ("item1", rref.item = {REAL} 5.3)
			r := {REAL} -10.2
			rref := r
			assert ("not_void2", rref /= Void)
			assert ("item2", rref.item = {REAL} -10.2)
				-- Convert from.
			create rref
			rref.set_item ({REAL} 5.1)
			r := rref
			assert ("item3", r = {REAL} 5.1)
			create rref
			rref.set_item ({REAL} -10.6)
			r := rref
			assert ("item4", r = {REAL} -10.6)
		end

end
