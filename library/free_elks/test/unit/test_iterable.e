note

	description:

		"Test features of class ITERABLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2015, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ITERABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_new_cursor_renaming
			-- Test when 'new_cursor' is renamed.
		local
			l_iterable: MY_ITERABLE [INTEGER]
		do
			create l_iterable.make (10, 20)
			assert_integers_equal ("renamed_new_cursor", 10, l_iterable.foo)
		end

end
