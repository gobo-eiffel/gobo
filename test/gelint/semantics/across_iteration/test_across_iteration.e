note

	description:

		"Test semantics of across iterations"

	copyright: "Copyright (c) 2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ACROSS_ITERATION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_across_instruction
			-- Test a simple across instruction.
		local
			bb: BB [INTEGER]
			i: INTEGER
		do
			i := 0
			create bb.make (<<1, 2, 3, 4, 5>>)
			across
				bb
			as
				c
			loop
				i := i + 1
				assert_integers_equal ("item_" + i.out, i, c.item)
			end
			assert_integers_equal ("count", 5, i)
		end
		
	test_across_instruction_with_from_and_useless_until
			-- Test across instruction with 'from' and a useless 'until' parts.
		local
			bb: BB [INTEGER]
			i: INTEGER
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			across
				bb
			as
				c
			from
				i := 0
			until
				c.item = 8
			loop
				i := i + 1
				assert_integers_equal ("item_" + i.out, i, c.item)
			end
			assert_integers_equal ("count", 5, i)
		end

	test_across_instruction_with_from_and_until
			-- Test across instruction with 'from' and 'until' parts.
		local
			bb: BB [INTEGER]
			i: INTEGER
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			across
				bb
			as
				c
			from
				i := 0
			until
				c.item = 3
			loop
				i := i + 1
				assert_integers_equal ("item_" + i.out, i, c.item)
			end
			assert_integers_equal ("count", 2, i)
		end

	test_across_instruction_with_object_test
			-- Test a across instruction with an object-test.
		local
			bb: BB [detachable STRING]
			i: INTEGER
		do
			i := 0
			create bb.make (<<"a", "bb", Void, "dddd">>)
			across
				bb
			as
				c
			until
				not attached c.item as s
			loop
				i := i + 1
				assert_integers_equal ("item_" + i.out, i, s.count)
			end
			assert_integers_equal ("count", 2, i)
		end
		
	test_across_all_expression
			-- Test a simple across all expression.
		local
			bb: BB [INTEGER]
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			assert ("all_positive", across bb as c all c.item > 0 end)
			assert ("not_all_4", not across bb as c all c.item = 4 end)
		end

	test_across_all_expression_with_until
			-- Test across all expression with until part.
		local
			bb: BB [INTEGER]
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			assert ("all_less_3", across bb as c until c.item = 4 all c.item <= 3 end)
			assert ("not_all_4", not across bb as c until c.index = 10 all c.item = 4 end)
		end

	test_across_all_expression_with_object_test
			-- Test a across all expression with an object-test.
		local
			bb: BB [detachable STRING]
		do
			create bb.make (<<"a", "bb", Void, "d">>)
			assert ("all_count", across bb as c until not attached c.item as s all s.count = c.index end)
		end
		
	test_across_some_expression
			-- Test a simple across some expression.
		local
			bb: BB [INTEGER]
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			assert ("some_4", across bb as c some c.item = 4 end)
			assert ("not_some_8", not across bb as c some c.item = 8 end)
		end

	test_across_some_expression_with_until
			-- Test across some expression with until part.
		local
			bb: BB [INTEGER]
		do
			create bb.make (<<1, 2, 3, 4, 5>>)
			assert ("some_4", across bb as c until c.index = 10 some c.item = 4 end)
			assert ("not_some_4", not across bb as c until c.index = 3 some c.item = 4 end)
		end

	test_across_some_expression_with_object_test
			-- Test a across some expression with an object-test.
		local
			bb: BB [detachable STRING]
		do
			create bb.make (<<"a", "bb", Void, "d">>)
			assert ("not_some_count", not across bb as c until not attached c.item as s some s.count /= c.index end)
		end
		
end
