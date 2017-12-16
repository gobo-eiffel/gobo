note

	description:

		"Test features of class CHARACTER"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_CHARACTER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_default_create
			-- Test feature 'default_create'.
		local
			c: CHARACTER
		do
			assert ("default", c = '%U')
		end

	test_is_less
			-- Test feature 'is_less alias "<"'.
		local
			c1, c2: CHARACTER
		do
			c1 := 'a'
			c2 := 'b'
			assert ("less_than1", c1 < c2)
			c1 := 'c'
			c2 := 'b'
			assert ("not_less_than1", not (c1 < c2))
			c1 := 'z'
			c2 := 'z'
			assert ("not_less_than2", not (c1 < c2))
		end

	test_is_less_equal
			-- Test feature 'is_less_equal alias "<="'.
		local
			c1, c2: CHARACTER
		do
			c1 := 'a'
			c2 := 'b'
			assert ("less_equal1", c1 <= c2)
			c1 := 'c'
			c2 := 'b'
			assert ("not_less_equal", not (c1 <= c2))
			c1 := 'z'
			c2 := 'z'
			assert ("less_equal2", c1 <= c2)
		end

	test_is_greater
			-- Test feature 'is_greater alias ">"'.
		local
			c1, c2: CHARACTER
		do
			c1 := 'a'
			c2 := 'b'
			assert ("not_greater_than1", not (c1 > c2))
			c1 := 'c'
			c2 := 'b'
			assert ("greater_than1", c1 > c2)
			c1 := 'z'
			c2 := 'z'
			assert ("not_greater_than2", not (c1 > c2))
		end

	test_is_greater_equal
			-- Test feature 'is_greater_equal alias ">="'.
		local
			c1, c2: CHARACTER
		do
			c1 := 'a'
			c2 := 'b'
			assert ("not_greater_equal1", not (c1 >= c2))
			c1 := 'c'
			c2 := 'b'
			assert ("greater_equal1", c1 >= c2)
			c1 := 'z'
			c2 := 'z'
			assert ("greater_equal2", c1 >= c2)
		end

end
