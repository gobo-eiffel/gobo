note

	description:

		"Test features of class IDENTIFIED_ROUTINES"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_IDENTIFIED_ROUTINES

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_eif_id_object
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

-- Routines not implemented in ISE 19.12.
--	test_eif_current_object_id
--			-- Test feature 'eif_current_object_id'.
--		local
--			ir: IDENTIFIED_ROUTINES
--			o: IDENTIFIED_ROUTINES
--			i: INTEGER
--		do
--			create ir
--			create o
--			i := o.eif_current_object_id
--			assert_same ("object1", o, ir.eif_id_object (i))
--		end

--	test_eif_is_object_id_of_current
--			-- Test feature 'eif_is_object_id_of_current'.
--		local
--			ir: IDENTIFIED_ROUTINES
--			o: IDENTIFIED_ROUTINES
--			i: INTEGER
--		do
--			create ir
--			create o
--			i := ir.eif_object_id (o)
--			assert_true ("object1", o.eif_is_object_id_of_current (i))
--		end

--	test_eif_is_object_id_of_current_expanded
--			-- Test feature 'eif_is_object_id_of_current' on expanded.
--		local
--			o: EE
--			i: INTEGER
--		do
--			i := o.eif_current_object_id
--			assert_false ("object1", o.eif_is_object_id_of_current (i))
--		end

end
