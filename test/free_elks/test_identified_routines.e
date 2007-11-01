indexing

	description:

		"Test features of class IDENTIFIED_ROUTINES"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_IDENTIFIED_ROUTINES

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_eif_id_object
		end

	test_eif_id_object is
			-- Test feature 'eif_id_object'.
		local
			ir: IDENTIFIED_ROUTINES
			i: INTEGER
			s: STRING
		do
			create ir
			s := "gobo"
			i := ir.eif_object_id (s)
			assert_same ("object1", s, ir.eif_id_object (i))
		end

end
