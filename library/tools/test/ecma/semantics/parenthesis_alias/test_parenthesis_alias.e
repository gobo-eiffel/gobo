note

	description:

		"Test semantics of parenthesis alias"

	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PARENTHESIS_ALIAS

inherit

	TS_TEST_CASE
		redefine
			make_default
		end

	DD
		redefine
			do_test_precursor
		end

create

	make_default

feature {NONE} -- Initialization

	make_default
			-- <Precursor>
		do
			create attribute_bb
			create attribute_cc
			precursor
		end

feature -- Test

	test_local_variable
			-- Test parenthesis alias with local variables.
		local
			bb: BB
			cc: CC
		do
			create bb
			assert ("local_1", bb (1))
			create cc
			cc (2)
			assert ("local_2", cc.item = 2)
		end

	test_formal_argument
			-- Test parenthesis alias with formal arguments.
		local
			bb: BB
			cc: CC
		do
			create bb
			create cc
			do_test_formal_argument (bb, cc)
		end

	test_object_test_local
			-- Test parenthesis alias with object-test locals.
		local
			bb: detachable BB
			cc: detachable CC
		do
			create bb
			if attached bb as l_bb then
				assert ("local_1", l_bb (1))
			else
				assert ("bb_not_attached", False)
			end
			create cc
			if attached cc as l_cc then
				l_cc (8)
				assert ("local_2", l_cc.item = 8)
			else
				assert ("cc_not_attached", False)
			end
		end

	test_across_cursor
			-- Test parenthesis alias with across cursors.
		local
			bb: BB
			cc: CC
		do
			create bb
			across bb as l_bb loop
				assert ("cursor_1", l_bb (1))
			end
			create cc
			across cc as l_cc loop
				l_cc (9)
				assert ("cursor_2", l_cc.item = 9)
			end
		end

-- Not supported by ISE 14.05.9.4181
--	test_tuple_label
--			-- Test parenthesis alias with tuple labels.
--		local
--			l_tuple: TUPLE [bb: BB; cc: CC]
--			bb: BB
--			cc: CC
--		do
--			create bb
--			create cc
--			l_tuple := [bb, cc]
--			assert ("label_1", l_tuple.bb (1))
--			l_tuple.cc (9)
--			assert ("label_2", l_tuple.cc.item = 9)
--		end

	test_attribute
			-- Test parenthesis alias with attributes.
		do
			assert ("attribute_1", attribute_bb (1))
			attribute_cc (3)
			assert ("attribute_2", attribute_cc.item = 3)
		end

	test_function
			-- Test parenthesis alias with functions.
		do
			assert ("function_1", function_bb (1))
			function_cc (4)
			assert ("function_2", function_cc.item = 4)
		end

	test_precursor
			-- Test parenthesis alias with precursor.
		local
			bb: BB
		do
			bb := do_test_precursor
		end

	test_qualified_attribute
			-- Test parenthesis alias with qualified attributes.
		local
			aa: like Current
		do
			aa := Current
			assert ("qualified_attribute_1", aa.attribute_bb (1))
			aa.attribute_cc (5)
			assert ("qualified_attribute_2", aa.attribute_cc.item = 5)
		end

	test_qualified_function
			-- Test parenthesis alias with qualified functions.
		local
			aa: like Current
		do
			aa := Current
			assert ("qualified_function_1", aa.function_bb (1))
			aa.function_cc (6)
			assert ("qualified_function_2", aa.function_cc.item = 6)
		end

	test_static_calls
			-- Test parenthesis alias with non-object calls.
		do
			assert ("static_call_1", {like Current}.ttt (1))
			{like Current}.uuu (11)
			assert ("static_call_2", {like Current}.uuu.f_item = 11)
		end
		
feature -- Implementation

	attribute_bb: BB

	attribute_cc: CC

	function_bb: BB
		do
			create Result
		end

	function_cc: CC
		once
			create Result
		end

	do_test_formal_argument (bb: BB; cc: CC)
		do
			assert ("argument_1", bb (1))
			cc (7)
			assert ("argument_2", cc.item = 7)
		end

	do_test_precursor: BB
		do
			assert ("precursor_1", precursor (1))
			create Result
		end

	ttt: STRING_8 = "ttt"
	
	uuu: STRING_32 = "uuu"
	
end
