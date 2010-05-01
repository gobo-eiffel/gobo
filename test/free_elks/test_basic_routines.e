note

	description:

		"Test features of class BASIC_ROUTINES"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BASIC_ROUTINES

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_charconv is
			-- Test feature 'charconv'.
		local
			br: BASIC_ROUTINES
			i: INTEGER
			c: CHARACTER
		do
			create br
			i := 97
			c := 'a'
			assert ("charconv1", br.charconv (i) = c)
			i := 1124
			c := 'd'
			assert ("charconv2", br.charconv (i) = c)
		end

	test_bottom_int_div is
			-- Test feature 'bottom_int_div'.
		local
			br: BASIC_ROUTINES
			i1, i2, i3: INTEGER
		do
			create br
			i1 := 9
			i2 := 2
			i3 := 4
			assert ("div1", br.bottom_int_div (i1, i2) = i3)
			i1 := 21
			i2 := -10
			i3 := -3
			assert ("div2", br.bottom_int_div (i1, i2) = i3)
			i1 := -21
			i2 := 9
			i3 := -3
			assert ("div3", br.bottom_int_div (i1, i2) = i3)
			i1 := -21
			i2 := -9
			i3 := 2
			assert ("div4", br.bottom_int_div (i1, i2) = i3)
			i1 := 8
			i2 := 2
			i3 := 4
			assert ("div5", br.bottom_int_div (i1, i2) = i3)
			i1 := 20
			i2 := -10
			i3 := -2
			assert ("div6", br.bottom_int_div (i1, i2) = i3)
			i1 := -27
			i2 := 9
			i3 := -3
			assert ("div7", br.bottom_int_div (i1, i2) = i3)
			i1 := -27
			i2 := -9
			i3 := 3
			assert ("div8", br.bottom_int_div (i1, i2) = i3)
		end

	test_up_int_div is
			-- Test feature 'up_int_div'.
		local
			br: BASIC_ROUTINES
			i1, i2, i3: INTEGER
		do
			create br
			i1 := 9
			i2 := 2
			i3 := 5
			assert ("div1", br.up_int_div (i1, i2) = i3)
			i1 := 21
			i2 := -10
			i3 := -2
			assert ("div2", br.up_int_div (i1, i2) = i3)
			i1 := -21
			i2 := 9
			i3 := -2
			assert ("div3", br.up_int_div (i1, i2) = i3)
			i1 := -21
			i2 := -9
			i3 := 3
			assert ("div4", br.up_int_div (i1, i2) = i3)
			i1 := 8
			i2 := 2
			i3 := 4
			assert ("div5", br.up_int_div (i1, i2) = i3)
			i1 := 20
			i2 := -10
			i3 := -2
			assert ("div6", br.up_int_div (i1, i2) = i3)
			i1 := -27
			i2 := 9
			i3 := -3
			assert ("div7", br.up_int_div (i1, i2) = i3)
			i1 := -27
			i2 := -9
			i3 := 3
			assert ("div8", br.up_int_div (i1, i2) = i3)
		end

end
