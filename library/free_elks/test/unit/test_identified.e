note

	description:

		"Test features of class IDENTIFIED"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_IDENTIFIED

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_id_object
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
