indexing

	description:

		"Test features of class CHARACTER"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_CHARACTER

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

feature -- Test

	test_default_create is
			-- Test feature `default_create'
		local
			c: CHARACTER
		do
			assert ("default", c = '%U')
		end

	test_less_than is
			-- Test feature `infix "<"'.
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

	test_less_equal is
			-- Test feature `infix "<="'.
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

	test_greater_than is
			-- Test feature `infix ">"'.
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

	test_greater_equal is
			-- Test feature `infix ">="'.
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
