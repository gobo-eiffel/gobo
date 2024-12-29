note

	description:

		"Test features of class COMPARABLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"

class TEST_COMPARABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_is_equal1
			-- Test feature `is_equal'.
		local
			a_comparable: COMPARABLE
		do
			a_comparable := "bar"
			assert ("is_equal1", a_comparable.is_equal ("bar"))
			assert ("not_is_equal1", not a_comparable.is_equal ("foo"))
			assert ("not_is_equal2", not a_comparable.is_equal ("ba"))
			assert ("not_is_equal3", not a_comparable.is_equal ("bart"))
			a_comparable := ""
			assert ("is_equal2", a_comparable.is_equal (""))
			assert ("not_is_equal4", not a_comparable.is_equal ("foo"))
		end

	test_is_equal2
			-- Test feature `is_equal'.
		local
			a_comparable: INTEGER
		do
			a_comparable := 10
			assert ("is_equal1", a_comparable.is_equal (10))
			assert ("not_is_equal1", not a_comparable.is_equal (5))
			assert ("not_is_equal2", not a_comparable.is_equal (11))
			assert ("not_is_equal3", not a_comparable.is_equal (0))
		end

	test_is_less1
			-- Test feature `is_less alias "<"'.
		local
			a_comparable, a_comparable2: COMPARABLE
		do
			a_comparable := "foo"
			a_comparable2 := "bar"
			assert ("not_less1", not (a_comparable < a_comparable2))
			assert ("not_less2", not (a_comparable < a_comparable))
			assert ("less1", a_comparable2 < a_comparable)
			a_comparable := "fo"
			a_comparable2 := "foo"
			assert ("less2", a_comparable < a_comparable2)
			assert ("not_less3", not (a_comparable2 < a_comparable))
			a_comparable := ""
			a_comparable2 := "foo"
			assert ("less3", a_comparable < a_comparable2)
			assert ("not_less4", not (a_comparable2 < a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert ("not_less5", not (a_comparable < a_comparable2))
			assert ("not_less6", not (a_comparable2 < a_comparable))
		end

	test_is_less2
			-- Test feature `is_less alias "<"'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 10
			a_comparable2 := 5
			assert ("not_less1", not (a_comparable < a_comparable2))
			assert ("not_less2", not (a_comparable < a_comparable))
			assert ("less1", a_comparable2 < a_comparable)
			a_comparable := 3
			a_comparable2 := 4
			assert ("less2", a_comparable < a_comparable2)
			assert ("not_less3", not (a_comparable2 < a_comparable))
			a_comparable := 0
			a_comparable2 := 12
			assert ("less3", a_comparable < a_comparable2)
			assert ("not_less4", not (a_comparable2 < a_comparable))
			a_comparable := 6
			a_comparable2 := 6
			assert ("not_less5", not (a_comparable < a_comparable2))
			assert ("not_less6", not (a_comparable2 < a_comparable))
		end

	test_is_less_equal1
			-- Test feature `is_less_equal alias "<="'.
		local
			a_comparable, a_comparable2: COMPARABLE
		do
			a_comparable := "foo"
			a_comparable2 := "bar"
			assert ("not_less1", not (a_comparable <= a_comparable2))
			assert ("less1", a_comparable <= a_comparable)
			assert ("less2", a_comparable2 <= a_comparable)
			a_comparable := "fo"
			a_comparable2 := "foo"
			assert ("less3", a_comparable <= a_comparable2)
			assert ("not_less3", not (a_comparable2 <= a_comparable))
			a_comparable := ""
			a_comparable2 := "foo"
			assert ("less4", a_comparable <= a_comparable2)
			assert ("not_less4", not (a_comparable2 <= a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert ("less5", a_comparable <= a_comparable2)
			assert ("less6", a_comparable2 <= a_comparable)
		end

	test_is_less_equal2
			-- Test feature `is_less_equal alias "<="'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 10
			a_comparable2 := 5
			assert ("not_less1", not (a_comparable <= a_comparable2))
			assert ("less1", a_comparable <= a_comparable)
			assert ("less2", a_comparable2 <= a_comparable)
			a_comparable := 3
			a_comparable2 := 4
			assert ("less3", a_comparable <= a_comparable2)
			assert ("not_less3", not (a_comparable2 <= a_comparable))
			a_comparable := 0
			a_comparable2 := 12
			assert ("less4", a_comparable <= a_comparable2)
			assert ("not_less4", not (a_comparable2 <= a_comparable))
			a_comparable := 6
			a_comparable2 := 6
			assert ("less5", a_comparable <= a_comparable2)
			assert ("less6", a_comparable2 <= a_comparable)
		end

	test_is_greater1
			-- Test feature `is_greater alias ">"'.
		local
			a_comparable, a_comparable2: COMPARABLE
		do
			a_comparable := "bar"
			a_comparable2 := "foo"
			assert ("not_greater1", not (a_comparable > a_comparable2))
			assert ("not_greater2", not (a_comparable > a_comparable))
			assert ("greater1", a_comparable2 > a_comparable)
			a_comparable := "foo"
			a_comparable2 := "fo"
			assert ("greater2", a_comparable > a_comparable2)
			assert ("not_greater3", not (a_comparable2 > a_comparable))
			a_comparable := "foo"
			a_comparable2 := ""
			assert ("greater3", a_comparable > a_comparable2)
			assert ("not_greater4", not (a_comparable2 > a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert ("not_greater5", not (a_comparable > a_comparable2))
			assert ("not_greater6", not (a_comparable2 > a_comparable))
		end

	test_is_greater2
			-- Test feature `is_greater alias ">"'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 5
			a_comparable2 := 10
			assert ("not_greater1", not (a_comparable > a_comparable2))
			assert ("not_greater2", not (a_comparable > a_comparable))
			assert ("greater1", a_comparable2 > a_comparable)
			a_comparable := 4
			a_comparable2 := 3
			assert ("greater2", a_comparable > a_comparable2)
			assert ("not_greater3", not (a_comparable2 > a_comparable))
			a_comparable := 5
			a_comparable2 := 0
			assert ("greater3", a_comparable > a_comparable2)
			assert ("not_greater4", not (a_comparable2 > a_comparable))
			a_comparable := 6
			a_comparable2 := 6
			assert ("not_greater5", not (a_comparable > a_comparable2))
			assert ("not_greater6", not (a_comparable2 > a_comparable))
		end

	test_is_greater_equal1
			-- Test feature `is_greater_equal alias ">="'.
		local
			a_comparable, a_comparable2: COMPARABLE
		do
			a_comparable := "bar"
			a_comparable2 := "foo"
			assert ("not_greater1", not (a_comparable >= a_comparable2))
			assert ("greater1", a_comparable >= a_comparable)
			assert ("greater2", a_comparable2 >= a_comparable)
			a_comparable := "foo"
			a_comparable2 := "fo"
			assert ("greater3", a_comparable >= a_comparable2)
			assert ("not_greater3", not (a_comparable2 >= a_comparable))
			a_comparable := "foo"
			a_comparable2 := ""
			assert ("greater4", a_comparable >= a_comparable2)
			assert ("not_greater4", not (a_comparable2 >= a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert ("greater5", a_comparable >= a_comparable2)
			assert ("greater6", a_comparable2 >= a_comparable)
		end

	test_is_greater_equal2
			-- Test feature `is_greater_equal alias ">="'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 5
			a_comparable2 := 10
			assert ("not_greater1", not (a_comparable >= a_comparable2))
			assert ("greater1", a_comparable >= a_comparable)
			assert ("greater2", a_comparable2 >= a_comparable)
			a_comparable := 4
			a_comparable2 := 3
			assert ("greater3", a_comparable >= a_comparable2)
			assert ("not_greater3", not (a_comparable2 >= a_comparable))
			a_comparable := 12
			a_comparable2 := 0
			assert ("greater4", a_comparable >= a_comparable2)
			assert ("not_greater4", not (a_comparable2 >= a_comparable))
			a_comparable := 6
			a_comparable2 := 6
			assert ("greater5", a_comparable >= a_comparable2)
			assert ("greater6", a_comparable2 >= a_comparable)
		end

	test_min1
			-- Test feature `min'.
		local
			a_comparable, a_comparable2: STRING
		do
			a_comparable := "bar"
			a_comparable2 := "foo"
			assert_same ("min1", a_comparable, a_comparable.min (a_comparable2))
			assert_same ("min2", a_comparable, a_comparable.min (a_comparable))
			assert_same ("min3", a_comparable, a_comparable2.min (a_comparable))
			a_comparable := "foo"
			a_comparable2 := ""
			assert_same ("min4", a_comparable2, a_comparable.min (a_comparable2))
			assert_same ("min5", a_comparable2, a_comparable2.min (a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert_same ("min6", a_comparable, a_comparable.min (a_comparable2))
			assert_same ("min7", a_comparable2, a_comparable2.min (a_comparable))
		end

	test_min2
			-- Test feature `min'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 5
			a_comparable2 := 10
			assert_integers_equal ("min1", a_comparable, a_comparable.min (a_comparable2))
			assert_integers_equal ("min2", a_comparable, a_comparable.min (a_comparable))
			assert_integers_equal ("min3", a_comparable, a_comparable2.min (a_comparable))
			a_comparable := 8
			a_comparable2 := 0
			assert_integers_equal ("min4", a_comparable2, a_comparable.min (a_comparable2))
			assert_integers_equal ("min5", a_comparable2, a_comparable2.min (a_comparable))
			a_comparable := 3
			a_comparable2 := 3
			assert_integers_equal ("min6", a_comparable, a_comparable.min (a_comparable2))
			assert_integers_equal ("min7", a_comparable2, a_comparable2.min (a_comparable))
		end

	test_max1
			-- Test feature `max'.
		local
			a_comparable, a_comparable2: STRING
		do
			a_comparable := "foo"
			a_comparable2 := "bar"
			assert_same ("max1", a_comparable, a_comparable.max (a_comparable2))
			assert_same ("max2", a_comparable, a_comparable.max (a_comparable))
			assert_same ("max3", a_comparable, a_comparable2.max (a_comparable))
			a_comparable := ""
			a_comparable2 := "foo"
			assert_same ("max4", a_comparable2, a_comparable.max (a_comparable2))
			assert_same ("max5", a_comparable2, a_comparable2.max (a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert_same ("max6", a_comparable, a_comparable.max (a_comparable2))
			assert_same ("max7", a_comparable2, a_comparable2.max (a_comparable))
		end

	test_max2
			-- Test feature `max'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 10
			a_comparable2 := 5
			assert_integers_equal ("max1", a_comparable, a_comparable.max (a_comparable2))
			assert_integers_equal ("max2", a_comparable, a_comparable.max (a_comparable))
			assert_integers_equal ("max3", a_comparable, a_comparable2.max (a_comparable))
			a_comparable := 0
			a_comparable2 := 12
			assert_integers_equal ("max4", a_comparable2, a_comparable.max (a_comparable2))
			assert_integers_equal ("max5", a_comparable2, a_comparable2.max (a_comparable))
			a_comparable := 4
			a_comparable2 := 4
			assert_integers_equal ("max6", a_comparable, a_comparable.max (a_comparable2))
			assert_integers_equal ("max7", a_comparable2, a_comparable2.max (a_comparable))
		end

	test_three_way_comparison1
			-- Test feature `three_way_comparison'.
		local
			a_comparable, a_comparable2: COMPARABLE
		do
			a_comparable := "foo"
			a_comparable2 := "bar"
			assert_integers_equal ("compare1", 1, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare2", 0, a_comparable.three_way_comparison (a_comparable))
			assert_integers_equal ("compare3", -1, a_comparable2.three_way_comparison (a_comparable))
			a_comparable := ""
			a_comparable2 := "foo"
			assert_integers_equal ("compare4", -1, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare5", 1, a_comparable2.three_way_comparison (a_comparable))
			a_comparable := "foo"
			a_comparable2 := "foo"
			assert_integers_equal ("compare6", 0, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare7", 0, a_comparable2.three_way_comparison (a_comparable))
		end

	test_three_way_comparison2
			-- Test feature `three_way_comparison'.
		local
			a_comparable, a_comparable2: INTEGER
		do
			a_comparable := 10
			a_comparable2 := 5
			assert_integers_equal ("compare1", 1, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare2", 0, a_comparable.three_way_comparison (a_comparable))
			assert_integers_equal ("compare3", -1, a_comparable2.three_way_comparison (a_comparable))
			a_comparable := 0
			a_comparable2 := 4
			assert_integers_equal ("compare4", -1, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare5", 1, a_comparable2.three_way_comparison (a_comparable))
			a_comparable := 7
			a_comparable2 := 7
			assert_integers_equal ("compare6", 0, a_comparable.three_way_comparison (a_comparable2))
			assert_integers_equal ("compare7", 0, a_comparable2.three_way_comparison (a_comparable))
		end

end
