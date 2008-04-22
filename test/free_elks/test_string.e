indexing

	description:

		"Test features of class STRING"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_STRING

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_is_integer is
			-- test feature 'is_integer'.
		local
			s: STRING
		do
				-- Note: There is a bug in VE 4.0 (build 4001).
				-- STRING.is_integer (the precondition of STRING.to_integer)
				-- returns false when the number of characters in `a_string'
				-- is greater than PLATFORM.Maximum_integer.out.count. So
				-- "00000000000000000000000000000000065" is not considered
				-- as an integer even though it is valid according to ELKS 2001.
			s := "00000000000000000000000000000000065"
			assert ("is_integer1", s.is_integer)
			assert_integers_equal ("to_integer1", 65, s.to_integer)
		end

end
