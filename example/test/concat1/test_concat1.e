indexing

	description:

		"Test features of class CONCAT1"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_CONCAT1

inherit

	TS_TEST_CASE

feature -- Test

	test_concat is
			-- Test feature `concat'.
		local
			c: CONCAT1
		do
			create c.make
			assert_equal ("to+to", "toto", c.concat ("to", "to"))
			assert_equal ("foo+bar", "foobar", c.concat ("foo", "bar"))
		end

end
