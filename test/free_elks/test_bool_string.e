indexing

	description:

		"Test features of class BOOL_STRING"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BOOL_STRING

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_make
			test_all_true
			test_all_false
			test_infix_and
			test_infix_or
			test_infix_xor
			test_prefix_not
			test_right_shifted
			test_left_shifted
		end

	test_make is
			-- Test feature 'make'.
		local
			bs: BOOL_STRING
		do
			create bs.make (2)
			assert ("count", bs.count = 2)
			assert ("item1", bs.item (1) = False)
			assert ("item2", bs.item (2) = False)
		end

	test_all_true is
			-- Test feature 'all_true'.
		local
			bs: BOOL_STRING
		do
			create bs.make (2)
			bs.all_true
			assert ("item1", bs.item (1) = True)
			assert ("item2", bs.item (2) = True)
		end

	test_all_false is
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

	test_infix_and is
			-- Test feature 'infix "and"'.
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

	test_infix_or is
			-- Test feature 'infix "or"'.
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

	test_infix_xor is
			-- Test feature 'infix "xor"'.
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

	test_prefix_not is
			-- Test feature 'prefix "not"'.
		local
			bs1, bs2: BOOL_STRING
		do
			create bs1.make (2)
			bs1.put (True, 1)
			bs2 := not bs1
			assert ("item1", bs2.item (1) = False)
			assert ("item2", bs2.item (2) = True)
		end

	test_right_shifted is
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

	test_left_shifted is
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
