indexing

	description:

		"Test features of class IDENTIFIED"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_IDENTIFIED

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_id_object
		end

	test_id_object is
			-- Test feature 'id_object'.
		local
			l_identified: IDENTIFIED
			i: INTEGER
		do
			create l_identified
			i := l_identified.object_id
			assert_same ("object1", l_identified, l_identified.id_object (i))
		end

end
