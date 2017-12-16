note

	description:

		"Test features of class BOOL_STRING"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BOOL_STRING

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make
			-- Test feature 'make'.
		local
			bs: BOOL_STRING
		do
			create bs.make (2)
			assert ("count", bs.count = 2)
			assert ("item1", bs.item (1) = False)
			assert ("item2", bs.item (2) = False)
		end

	test_all_true
			-- Test feature 'all_true'.
		local
			bs: BOOL_STRING
		do
			create bs.make (2)
			bs.all_true
			assert ("item1", bs.item (1) = True)
			assert ("item2", bs.item (2) = True)
		end

	test_all_false
			-- Test feature 'all_false'.
		local
			bs: BOOL_STRING
		do
			create bs.make (2)
			bs.all_true
			bs.all_false
			assert ("item1", bs.item (1) = False)
			assert ("item2", bs.item (2) = False)
		end

	test_conjuncted
			-- Test feature 'conjuncted alias "and"'.
		local
			bs1, bs2, bs3: BOOL_STRING
		do
			create bs1.make (2)
			create bs2.make (2)
			bs1.put (True, 1)
			bs2.put (True, 2)
			bs3 := bs1 and bs2
			assert ("item1", bs3.item (1) = False)
			assert ("item2", bs3.item (2) = False)
		end

	test_disjuncted
			-- Test feature 'disjuncted alias "or"'.
		local
			bs1, bs2, bs3: BOOL_STRING
		do
			create bs1.make (2)
			create bs2.make (2)
			bs1.put (True, 1)
			bs2.put (True, 2)
			bs3 := bs1 or bs2
			assert ("item1", bs3.item (1) = True)
			assert ("item2", bs3.item (2) = True)
		end

	test_disjuncted_exclusive
			-- Test feature 'disjuncted_exclusive alias "xor"'.
		local
			bs1, bs2, bs3: BOOL_STRING
		do
			create bs1.make (2)
			create bs2.make (2)
			bs1.put (True, 1)
			bs2.put (True, 2)
			bs3 := bs1 xor bs2
			assert ("item1", bs3.item (1) = True)
			assert ("item2", bs3.item (2) = True)
		end

	test_negated
			-- Test feature 'negated alias "not"'.
		local
			bs1, bs2: BOOL_STRING
		do
			create bs1.make (2)
			bs1.put (True, 1)
			bs2 := not bs1
			assert ("item1", bs2.item (1) = False)
			assert ("item2", bs2.item (2) = True)
		end

	test_right_shifted
			-- Test feature 'right_shifted'.
		local
			bs1, bs2: BOOL_STRING
		do
			create bs1.make (4)
			bs1.all_true
			bs1.put (False, 2)
			bs2 := bs1.right_shifted (1)
			assert ("item1", bs2.item (1) = False)
			assert ("item2", bs2.item (2) = True)
			assert ("item3", bs2.item (3) = False)
			assert ("item4", bs2.item (4) = True)
		end

	test_left_shifted
			-- Test feature 'left_shifted'.
		local
			bs1, bs2: BOOL_STRING
		do
			create bs1.make (4)
			bs1.all_true
			bs1.put (False, 3)
			bs2 := bs1.left_shifted (1)
			assert ("item1", bs2.item (1) = True)
			assert ("item2", bs2.item (2) = False)
			assert ("item3", bs2.item (3) = True)
			assert ("item4", bs2.item (4) = False)
		end

end
