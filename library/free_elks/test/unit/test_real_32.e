note

	description:

		"Test features of class REAL_32"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_REAL_32

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_default_create
			-- Test feature 'default_create'.
		local
			r: REAL_32
		do
			assert ("default", r = {REAL_32} 0.0)
		end

	test_equality_with_nan
			-- Test '=' expression with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_is_equal1", r1 = r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_is_equal2", r1 = r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("is_equal1", r1 = r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_is_equal3", a1 = a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_is_equal4", a1 = a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("is_equal2", a1 = a2)
		end

	test_non_equality_with_nan
			-- Test '/=' expression with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_true ("not_is_equal1", r1 /= r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_true ("not_is_equal2", r1 /= r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("is_equal1", r1 /= r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_true ("not_is_equal3", a1 /= a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_true ("not_is_equal4", a1 /= a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_false ("is_equal2", a1 /= a2)
		end

	test_object_equality_with_nan
			-- Test '~' expression with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_is_equal1", r1 ~ r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_is_equal2", r1 ~ r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("is_equal1", r1 ~ r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_is_equal3", a1 ~ a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_is_equal4", a1 ~ a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("is_equal2", a1 ~ a2)
		end

	test_non_object_equality_with_nan
			-- Test '/~' expression with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_true ("not_is_equal1", r1 /~ r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_true ("not_is_equal2", r1 /~ r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("is_equal1", r1 /~ r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_true ("not_is_equal3", a1 /~ a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_true ("not_is_equal4", a1 /~ a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_false ("is_equal2", a1 /~ a2)
		end

	test_is_equal_with_nan
			-- Test feature 'is_equal' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_is_equal1", r1.is_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_is_equal2", r1.is_equal (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("is_equal1", r1.is_equal (r2))
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_is_equal3", a1.is_equal (a2))
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_is_equal4", a1.is_equal (a2))
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("is_equal2", a1.is_equal (a2))
		end

	test_standard_is_equal_with_nan
			-- Test feature 'standard_is_equal' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: ANY
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_standard_is_equal1", r1.standard_is_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_standard_is_equal2", r1.standard_is_equal (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("standard_is_equal1", r1.standard_is_equal (r2))
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_standard_is_equal3", a1.standard_is_equal (a2))
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_standard_is_equal4", a1.standard_is_equal (a2))
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("standard_is_equal2", a1.standard_is_equal (a2))
		end

	test_is_less
			-- Test feature 'is_less alias "<"'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("less_than1", r1 < r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("not_less_than1", not (r1 < r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("not_less_than2", not (r1 < r2))
		end

	test_is_less_with_nan
			-- Test feature 'is_less alias "<"' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: COMPARABLE
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_true ("less_than1", r1 < r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_less_than1", r1 < r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_less_than2", r1 < r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_true ("less_than2", a1 < a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_less_than3", a1 < a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_false ("not_less_than4", a1 < a2)
		end

	test_is_less_equal
			-- Test feature 'is_less_equal alias "<="'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("less_equal1", r1 <= r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("not_less_equal", not (r1 <= r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("less_equal2", r1 <= r2)
		end

	test_is_less_equal_with_nan
			-- Test feature 'is_less_equal alias "<="' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: COMPARABLE
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_true ("less_equal1", r1 <= r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_less_equal1", r1 <= r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("less_equal2", r1 <= r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_true ("less_equal3", a1 <= a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_false ("not_less_equal2", a1 <= a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("less_equal_4", a1 <= a2)
		end

	test_is_greater
			-- Test feature 'is_greater alias ">"'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("not_greater_than1", not (r1 > r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("greater_than1", r1 > r2)
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("not_greater_than2", not (r1 > r2))
		end

	test_is_greater_with_nan
			-- Test feature 'is_greater alias ">"' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: COMPARABLE
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_than1", r1 > r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_true ("greater_than1", r1 > r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_greater_than2", r1 > r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_greater_than3", a1 > a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_true ("greater_than_than2", a1 > a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_false ("not_greater_than4", a1 > a2)
		end

	test_is_greater_equal
			-- Test feature 'is_greater_equal alias ">="'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("not_greater_equal1", not (r1 >= r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("greater_equal1", r1 >= r2)
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("greater_equal2", r1 >= r2)
		end

	test_is_greater_equal_with_nan
			-- Test feature 'is_greater_equal alias ">="' with NaN.
		local
			r1, r2: REAL_32
			a1, a2: COMPARABLE
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_equal1", r1 >= r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_true ("greater_equal1", r1 >= r2)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_true ("greater_equal2", r1 >= r2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32} 2.7
			assert_false ("not_greater_equal2", a1 >= a2)
			a1 := {REAL_32} 10.9
			a2 := {REAL_32}.nan
			assert_true ("greater_equal3", a1 >= a2)
			a1 := {REAL_32}.nan
			a2 := {REAL_32}.nan
			assert_true ("greater_equal4", a1 >= a2)
		end

	test_ieee_is_equal
			-- Test feature 'ieee_is_equal'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert_false ("not_equal1", r1.ieee_is_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert_false ("not_equal2", r1.ieee_is_equal (r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert_true ("equal1", r1.ieee_is_equal (r2))
		end

	test_ieee_is_equal_with_nan
			-- Test feature 'ieee_is_equal' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_equal1", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_equal2", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_equal3", r1.ieee_is_less_equal (r2))
		end

	test_ieee_is_less
			-- Test feature 'ieee_is_less'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert_true ("less_than1", r1.ieee_is_less (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert_false ("not_less_than1", r1.ieee_is_less (r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert_false ("not_less_than2", r1.ieee_is_less (r2))
		end

	test_ieee_is_less_with_nan
			-- Test feature 'ieee_is_less' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_less_than1", r1.ieee_is_less (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_less_than2", r1.ieee_is_less (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_less_than3", r1.ieee_is_less (r2))
		end

	test_ieee_is_less_equal
			-- Test feature 'ieee_is_less_equal'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert_true ("less_equal1", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert_false ("not_less_equal", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert_true ("less_equal2", r1.ieee_is_less_equal (r2))
		end

	test_ieee_is_less_equal_with_nan
			-- Test feature 'ieee_is_less_equal' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_less_equal1", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_less_equal2", r1.ieee_is_less_equal (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_less_equal3", r1.ieee_is_less_equal (r2))
		end

	test_ieee_is_greater
			-- Test feature 'ieee_is_greater'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_than1", r1.ieee_is_greater (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert_true ("greater_than1", r1.ieee_is_greater (r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert_false ("not_greater_than2", r1.ieee_is_greater (r2))
		end

	test_ieee_is_greater_with_nan
			-- Test feature 'ieee_is_greater' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_than1", r1.ieee_is_greater (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_greater_than2", r1.ieee_is_greater (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_greater_than3", r1.ieee_is_greater (r2))
		end

	test_ieee_is_greater_equal
			-- Test feature 'ieee_is_greater_equal'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_equal1", r1.ieee_is_greater_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert_true ("greater_equal1", r1.ieee_is_greater_equal (r2))
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert_true ("greater_equal2", r1.ieee_is_greater_equal (r2))
		end

	test_ieee_is_greater_equal_with_nan
			-- Test feature 'ieee_is_greater_equal' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert_false ("not_greater_equal1", r1.ieee_is_greater_equal (r2))
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert_false ("not_greater_equal2", r1.ieee_is_greater_equal (r2))
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert_false ("not_greater_equal3", r1.ieee_is_greater_equal (r2))
		end

	test_ieee_maximum_number_equal
			-- Test feature 'ieee_maximum_number'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("ieee_maximum_number1", r1.ieee_maximum_number (r2) = r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("ieee_maximum_number2", r1.ieee_maximum_number (r2) = r1)
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("ieee_maximum_number3", r1.ieee_maximum_number (r2) = r1)
		end

	test_ieee_maximum_number_with_nan
			-- Test feature 'ieee_maximum_number' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert ("ieee_maximum_number1", r1.ieee_maximum_number (r2) = r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert ("ieee_maximum_number2", r1.ieee_maximum_number (r2) = r1)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert ("ieee_maximum_number3", r1.ieee_maximum_number (r2) = r1)
		end

	test_ieee_minimum_number_equal
			-- Test feature 'ieee_minimum_number'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 1.5
			r2 := {REAL_32} 2.7
			assert ("ieee_minimum_number1", r1.ieee_minimum_number (r2) = r1)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32} 8.2
			assert ("ieee_minimum_number2", r1.ieee_minimum_number (r2) = r2)
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 5.4
			assert ("ieee_minimum_number3", r1.ieee_minimum_number (r2) = r1)
		end

	test_ieee_minimum_number_with_nan
			-- Test feature 'ieee_minimum_number' with NaN.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32}.nan
			r2 := {REAL_32} 2.7
			assert ("ieee_minimum_number1", r1.ieee_minimum_number (r2) = r2)
			r1 := {REAL_32} 10.9
			r2 := {REAL_32}.nan
			assert ("ieee_minimum_number2", r1.ieee_minimum_number (r2) = r1)
			r1 := {REAL_32}.nan
			r2 := {REAL_32}.nan
			assert ("ieee_minimum_number3", r1.ieee_minimum_number (r2) = r1)
		end

	test_out
			-- Test feature 'out'.
		local
			r: REAL_32
			l_out: STRING
		do
			r := {REAL_32} 10.9
			l_out := r.out
			assert ("not_void1", l_out /= Void)
			assert ("string_type1", l_out.same_type (""))
			assert_equal ("value1", "10.9", l_out)
			assert ("new_string1", l_out /= r.out)
			r := {REAL_32} -10.9
			l_out := r.out
			assert ("not_void2", l_out /= Void)
			assert ("string_type2", l_out.same_type (""))
			assert_equal ("value2", "-10.9", l_out)
			assert ("new_string2", l_out /= r.out)
		end

	test_item
			-- Test feature 'item'.
		local
			r: REAL_32
		do
			r := {REAL_32} 5.4
			assert ("item1", r.item = {REAL_32} 5.4)
			r := {REAL_32} -10.9
			assert ("item2", r.item = {REAL_32} -10.9)
			assert ("item3", ({REAL_32} 25.2).item = {REAL_32} 25.2)
			assert ("item4", ({REAL_32} -100.0).item = {REAL_32} -100.0)
		end

	test_set_item___fail_ise
			-- Test feature 'set_item'.
			-- Does not work with ISE Eiffel.
		local
			r: REAL_32
		do
			if not eiffel_compiler.is_ise then
				r.set_item ({REAL_32} 5.4)
				assert ("item1", r = {REAL_32} 5.4)
				r.set_item ({REAL_32} -10.9)
				assert ("item2", r = {REAL_32} -10.9)
					-- We get a new "5.5" at each call (it's an expanded type).
					-- So setting the 'item' of one occurrence of "5.5" does not
					-- change the 'item' of the next occurrence of "5.5".
				({REAL_32} 5.5).set_item ({REAL_32} -10.3)
				assert ("item3", (5.5).item = {REAL_32} 5.5)
					-- Setting the 'item' of the result of a function does not
					-- set the 'item' of the result of the next call of this
					-- function.
				({REAL_32} 4.4 + {REAL_32} 6.5).set_item ({REAL_32} -11.5)
				assert ("item4", ({REAL_32} 4.4 + {REAL_32} 6.1).item = {REAL_32} 10.5)
			end
		end

	test_to_reference
			-- Test feature 'to_reference'.
		local
			r: REAL_32
			rref: REAL_32_REF
		do
			r := {REAL_32} 5.3
			rref := r.to_reference
			assert ("not_void1", rref /= Void)
			assert ("item1", rref.item = {REAL_32} 5.3)
			r := {REAL_32} -10.2
			rref := r.to_reference
			assert ("not_void2", rref /= Void)
			assert ("item2", rref.item = {REAL_32} -10.2)
		end

	test_make_from_reference___fail_ise
			-- Test feature 'make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			r: REAL_32
			rref: REAL_32_REF
		do
			if not eiffel_compiler.is_ise then
				create rref
				rref.set_item ({REAL_32} 5.7)
				create r.make_from_reference (rref)
				assert ("item1", r = {REAL_32} 5.7)
				create rref
				rref.set_item ({REAL_32} -10.1)
				create r.make_from_reference (rref)
				assert ("item2", r = {REAL_32} -10.1)
			end
		end

	test_plus
			-- Test feature 'plus alias "+"'.
		local
			r1, r2, r3, r4: REAL_32
		do
			r1 := {REAL_32} 4.4
			r2 := {REAL_32} 6.1
			r3 := {REAL_32} 10.5
				-- Need to use `r4' otherwise ISE 5.7.0414 fails
				-- to work in frozen mode. Still does not work in
				-- finalized mode.
			-- assert ("plus1", r1 + r2 = r3)
			r4 := r1 + r2
			assert ("plus1", r4 = r3)
		end

	test_minus
			-- Test feature 'minus alias "-"'.
		local
			r1, r2, r3: REAL_32
		do
			r1 := {REAL_32} 5.5
			r2 := {REAL_32} 2.2
			r3 := {REAL_32} 3.3
			assert ("minus1", r1 - r2 = r3)
		end

	test_product
			-- Test feature 'product alias "*"'.
		local
			r1, r2, r3: REAL_32
		do
			r1 := {REAL_32} 5.4
			r2 := {REAL_32} 2.0
			r3 := {REAL_32} 10.8
			assert ("times1", r1 * r2 = r3)
		end

	test_quotient
			-- Test feature 'quotient alias "/"'.
		local
			r1, r2, r3: REAL_32
		do
			r1 := {REAL_32} 10.4
			r2 := {REAL_32} 2.0
			r3 := {REAL_32} 5.2
			assert ("divide1", r1 / r2 = r3)
		end

	test_power
			-- Test feature 'power alias "^"'.
		local
			r1: REAL_32
			r2, r3: REAL_64
		do
			r1 := {REAL_32} 9.0
			r2 := 0.5
			r3 := 3.0
			assert ("power1", r1 ^ r2 = r3)
			r1 := {REAL_32} 2.0
			r2 := 3.0
			r3 := 8.0
			assert ("power2", r1 ^ r2 = r3)
		end

	test_opposite
			-- Test feature 'opposite alias "-"'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 5.1
			r2 := {REAL_32} -5.1
			assert ("minus1", -r1 = r2)
		end

	test_identity
			-- Test feature 'identity alias "+"'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 5.9
			r2 := {REAL_32} 5.9
			assert ("plus1", +r1 = r2)
		end

	test_truncated_to_integer
			-- Test feature 'truncated_to_integer'.
		local
			r: REAL_32
			i: INTEGER_32
		do
			r := {REAL_32} 97.8
			i := 97
			assert ("truncated_to_integer1", r.truncated_to_integer = i)
		end

	test_truncated_to_integer_64
			-- Test feature 'truncated_to_integer_64'.
		local
			r: REAL_32
			i: INTEGER_64
		do
			r := {REAL_32} 97.8
			i := 97
			assert ("truncated_to_integer_64_1", r.truncated_to_integer_64 = i)
		end

	test_to_double
			-- Test feature 'to_double'.
		local
			r: REAL_32
			d: REAL_64
		do
			r := {REAL_32} 10.0
			d := 10.0
			assert ("to_double1", r.to_double = d)
		end

	test_ceiling_real_32
			-- Test feature 'ceiling_real_32'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 7.8
			r2 := {REAL_32} 8.0
			assert ("ceiling_real_32_1", r1.ceiling_real_32 = r2)
		end

	test_floor_real_32
			-- Test feature 'floor_real_32'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 7.8
			r2 := {REAL_32} 7.0
			assert ("floor_real_32_1", r1.floor_real_32 = r2)
		end

	test_abs
			-- Test feature 'abs'.
		local
			r1, r2: REAL_32
		do
			r1 := {REAL_32} 7.8
			r2 := {REAL_32} 7.8
			assert ("abs1", r1.abs = r2)
			r1 := {REAL_32} -9.1
			r2 := {REAL_32} 9.1
			assert ("abs1", r1.abs = r2)
		end

	test_convert
			-- Test conversion.
		local
			r: REAL_32
			rref: REAL_32_REF
		do
				-- Convert to.
			r := {REAL_32} 5.3
			rref := r
			assert ("not_void1", rref /= Void)
			assert ("item1", rref.item = {REAL_32} 5.3)
			r := {REAL_32} -10.2
			rref := r
			assert ("not_void2", rref /= Void)
			assert ("item2", rref.item = {REAL_32} -10.2)
				-- Convert from.
			create rref
			rref.set_item ({REAL_32} 5.1)
			r := rref
			assert ("item3", r = {REAL_32} 5.1)
			create rref
			rref.set_item ({REAL_32} -10.6)
			r := rref
			assert ("item4", r = {REAL_32} -10.6)
		end

end
