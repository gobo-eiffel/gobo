note

	description:

		"Test features of class FUNCTION"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_FUNCTION

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_item_qualified1
			-- Test feature 'item' with a closed qualified target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 1 open, 0 closed.
			a.put ('g', 1)
			p1 := agent a.item
			assert_characters_equal ("item1", 'g', p1.item ([1]))
				-- 1 open, 0 closed.
			a.put ('a', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item2", 'a', p1.item ([1]))
				-- 0 open, 1 closed.
			a.put ('z', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item3", 'z', p2.item ([]))
				-- 0 open, 1 closed.
			a.put ('x', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item4", 'x', p2.item (Void))
				-- Pass too many operands.
			a.put ('b', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item5", 'b', p1.item ([1, "gobo"]))
				-- Polymorphic agent.
			a.put ('f', 1)
			p3 := agent a.item (?)
			assert_characters_equal ("item6", 'f', p3.item ([1, "gobo"]))
			a.put ('h', 1)
			p3 := agent a.item (1)
			assert_characters_equal ("item7", 'h', p3.item ([5, "gobo"]))
		end

	test_item_qualified2
			-- Test feature 'item' with a closed qualified target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make_filled ('%U', 2)
			a.put ('g', 1)
				-- 1 open, 0 closed.
			p1 := agent a.item
			assert_characters_equal ("item1", 'g', p1.item ([1]))
				-- 1 open, 0 closed.
			a.put ('a', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item2", 'a', p1.item ([1]))
				-- 0 open, 1 closed.
			a.put ('z', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item3", 'z', p2.item ([]))
				-- 0 open, 1 closed.
			a.put ('x', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item4", 'x', p2.item (Void))
				-- Pass too many operands.
			a.put ('b', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item5", 'b', p1.item ([1, "gobo"]))
				-- Polymorphic agent.
			a.put ('f', 1)
			p3 := agent a.item (?)
			assert_characters_equal ("item6", 'f', p3.item ([1, "gobo"]))
			a.put ('h', 1)
			p3 := agent a.item (1)
			assert_characters_equal ("item7", 'h', p3.item ([5, "gobo"]))
		end

	test_item_qualified3
			-- Test feature 'item' with a closed qualified target
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
			b: TO_SPECIAL [ANY]
			b1: ARRAY [CHARACTER]
			b2: ARRAY [STRING]
			p4: FUNCTION [ANY, TUPLE [ANY], ANY]
		do
				-- 1 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('g', 1)
			p1 := agent a.item
			assert_characters_equal ("item1a", 'g', p1.item ([1]))
			a := "h"
			p1 := agent a.item
			assert_characters_equal ("item1b", 'h', p1.item ([1]))
				-- 1 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('a', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item2a", 'a', p1.item ([1]))
			a := "b"
			p1 := agent a.item (?)
			assert_characters_equal ("item2b", 'b', p1.item ([1]))
				-- 0 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('z', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item3a", 'z', p2.item ([]))
			a := "y"
			p2 := agent a.item (1)
			assert_characters_equal ("item3b", 'y', p2.item ([]))
				-- 0 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('x', 1)
			p2 := agent a.item (1)
			assert_characters_equal ("item4a", 'x', p2.item (Void))
			a := "w"
			p2 := agent a.item (1)
			assert_characters_equal ("item4b", 'w', p2.item (Void))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('b', 1)
			p1 := agent a.item (?)
			assert_characters_equal ("item5a", 'b', p1.item ([1, "gobo"]))
			a := "c"
			p1 := agent a.item (?)
			assert_characters_equal ("item5b", 'c', p1.item ([1, "gobo"]))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('x', 1)
			p3 := agent a.item (?)
			assert_characters_equal ("item6a", 'x', p3.item ([1, "gobo"]))
			a.put ('y', 1)
			p3 := agent a.item (1)
			assert_characters_equal ("item7a", 'y', p3.item ([5, "gobo"]))
			a := "z"
			p3 := agent a.item (?)
			assert_characters_equal ("item6b", 'z', p3.item ([1, "gobo"]))
			a.put ('j', 1)
			p3 := agent a.item (1)
			assert_characters_equal ("item7b", 'j', p3.item ([5, "gobo"]))
				-- Polymorphic agent with boxing.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('f', 1)
			p4 := agent a.item (?)
			assert_equal ("item8a", 'f', p4.item ([1, "gobo"]))
			a := "e"
			p4 := agent a.item (?)
			assert_equal ("item8b", 'e', p4.item ([1, "gobo"]))
			if not eiffel_compiler.is_ise then
					-- Does not work with ISE 6.3.
				create b1.make (1, 1)
				b1.put ('p', 1)
				b := b1
				p4 := agent b.item (?)
				assert_equal ("item9a", 'p', p4.item ([1, "gobo"]))
				b := "q"
				p4 := agent b.item (?)
				assert_equal ("item9b", 'q', p4.item ([1, "gobo"]))
			end
			create b2.make (1, 1)
			b2.put ("gobo", 1)
			b := b2
			p4 := agent b.item (?)
			assert_equal ("item9c", "gobo", p4.item ([1, 'd']))
		end

	test_item_labeled_tuple1
			-- Test feature 'item' with a closed qualified target
			-- which appears to be a labeled tuple.
		local
			t1: TUPLE [l1: INTEGER; l2: CHARACTER]
			t2: TUPLE [INTEGER, CHARACTER, STRING]
			p1: FUNCTION [ANY, TUPLE, INTEGER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE [TUPLE [INTEGER, CHARACTER]], CHARACTER]
			p4: FUNCTION [ANY, TUPLE, CHARACTER]
		do
				-- 0 open, 1 closed.
			t1 := [5, 'g']
			p1 := agent t1.l1
			assert_integers_equal ("item1", 5, p1.item ([]))
				-- 0 open, 1 closed.
			t1 := [4, 'g']
			p1 := agent t1.l1
			assert_integers_equal ("item2", 4, p1.item (Void))
				-- 0 open, 1 closed.
			t1 := [5, 'g']
			p2 := agent t1.l2
			assert_characters_equal ("item3", 'g', p2.item ([]))
				-- 0 open, 1 closed.
			t1 := [5, 'a']
			p2 := agent t1.l2
			assert_characters_equal ("item4", 'a', p2.item (Void))
				-- 1 open, 0 closed.
			t1 := [5, 'z']
			p3 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			assert_characters_equal ("item5", 'z', p3.item ([t1]))
				-- Pass too many operands.
			t1 := [7, 'g']
			p1 := agent t1.l1
			assert_integers_equal ("item6", 7, p1.item (["gobo"]))
				-- Polymorphic target.
			p3 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			t1 := [7, 'x']
			assert_characters_equal ("item7", 'x', p3.item ([t1]))
			t2 := [7, 'w', "gobo"]
			assert_characters_equal ("item8", 'w', p3.item ([t2]))
				-- Polymorphic agent.
			t1 := [7, 'd']
			p4 := agent t1.l2
			assert_characters_equal ("item9", 'd', p4.item ([t1, "gobo"]))
			p4 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			t2 := [7, 'h', "foo"]
			assert_characters_equal ("item10", 'h', p4.item ([t2, "gobo"]))
		end

	test_item_typed1
			-- Test feature 'item' with an open target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 2 open, 0 closed.
			a.put ('g', 1)
			p1 := agent {ARRAY [CHARACTER]}.item (?)
			assert_characters_equal ("item1", 'g', p1.item ([a, 1]))
				-- 2 open, 0 closed.
			a.put ('h', 1)
			p1 := agent {ARRAY [CHARACTER]}.item
			assert_characters_equal ("item2", 'h', p1.item ([a, 1]))
				-- 1 open, 1 closed.
			a.put ('z', 1)
			p2 := agent {ARRAY [CHARACTER]}.item (1)
			assert_characters_equal ("item3", 'z', p2.item ([a]))
				-- Pass too many operands.
			a.put ('d', 1)
			p1 := agent {ARRAY [CHARACTER]}.item
			assert_characters_equal ("item4", 'd', p1.item ([a, 1, "gobo"]))
				-- Polymorphic agent.
			a.put ('t', 1)
			p3 := agent {ARRAY [CHARACTER]}.item
			assert_characters_equal ("item5", 't', p3.item ([a, 1, "gobo"]))
			a.put ('f', 1)
			p3 := agent {ARRAY [CHARACTER]}.item (1)
			assert_characters_equal ("item6", 'f', p3.item ([a, 5, "gobo"]))
		end

	test_item_typed2
			-- Test feature 'item' with an open target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [SPECIAL [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [SPECIAL [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make_filled ('%U', 2)
				-- 2 open, 0 closed.
			a.put ('g', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item (?)
			assert_characters_equal ("item1", 'g', p1.item ([a, 1]))
				-- 2 open, 0 closed.
			a.put ('h', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item2", 'h', p1.item ([a, 1]))
				-- 1 open, 1 closed.
			a.put ('z', 1)
			p2 := agent {SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item3", 'z', p2.item ([a]))
				-- Pass too many operands.
			a.put ('d', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item4", 'd', p1.item ([a, 1, "gobo"]))
				-- Polymorphic agent.
			a.put ('t', 1)
			p3 := agent {SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item5", 't', p3.item ([a, 1, "gobo"]))
			a.put ('f', 1)
			p3 := agent {SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item6", 'f', p3.item ([a, 5, "gobo"]))
		end

	test_item_typed3
			-- Test feature 'item' with an open target,
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [TO_SPECIAL [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [TO_SPECIAL [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('g', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item (?)
			assert_characters_equal ("item1a", 'g', p1.item ([a, 1]))
			a := "p"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item (?)
			assert_characters_equal ("item1b", 'p', p1.item ([a, 1]))
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('h', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item2a", 'h', p1.item ([a, 1]))
			a := "g"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item2b", 'g', p1.item ([a, 1]))
				-- 1 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('z', 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item3b", 'z', p2.item ([a]))
			a := "x"
			p2 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item3a", 'x', p2.item ([a]))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('d', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item4a", 'd', p1.item ([a, 1, "gobo"]))
			a := "c"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item4b", 'c', p1.item ([a, 1, "gobo"]))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('t', 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item5a", 't', p3.item ([a, 1, "gobo"]))
			a.put ('f', 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item6a", 'f', p3.item ([a, 5, "gobo"]))
			a := "u"
			p3 := agent {TO_SPECIAL [CHARACTER]}.item
			assert_characters_equal ("item5b", 'u', p3.item ([a, 1, "gobo"]))
			a := "e"
			p3 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			assert_characters_equal ("item6b", 'e', p3.item ([a, 5, "gobo"]))
		end

	test_item_unqualified1
			-- Test feature 'item' with a closed unqualified target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER], INTEGER], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
			p4: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 1 open, 1 closed.
			a.put ('g', 1)
			p1 := agent f (a, ?)
			assert_characters_equal ("item1", 'g', p1.item ([1]))
				-- 2 open, 0 closed.
			a.put ('a', 1)
			p2 := agent f
			assert_characters_equal ("item2", 'a', p2.item ([a, 1]))
				-- 2 open, 0 closed.
			a.put ('z', 1)
			p2 := agent f (?, ?)
			assert_characters_equal ("item3", 'z', p2.item ([a, 1]))
				-- 0 open, 2 closed.
			a.put ('w', 1)
			p3 := agent f (a, 1)
			assert_characters_equal ("item4", 'w', p3.item ([]))
				-- 0 open, 2 closed.
			a.put ('b', 1)
			p3 := agent f (a, 1)
			assert_characters_equal ("item5", 'b', p3.item (Void))
				-- Pass too many operands.
			a.put ('g', 1)
			p1 := agent f (a, ?)
			assert_characters_equal ("item6", 'g', p1.item ([1, "gobo"]))
				-- Polymorphic agent.
			a.put ('t', 1)
			p4 := agent f (a, ?)
			assert_characters_equal ("item7", 't', p4.item ([1, "gobo"]))
			a.put ('f', 1)
			p4 := agent f (a, 1)
			assert_characters_equal ("item8", 'f', p4.item ([5, "gobo"]))
		end

	test_item_attribute1
			-- Test feature 'item' with an agent on attribute.
		local
			s: STRING
			p1: FUNCTION [ANY, TUPLE, INTEGER]
			p2: FUNCTION [ANY, TUPLE [STRING], INTEGER]
			p3: FUNCTION [ANY, TUPLE, INTEGER]
		do
				-- Qualified attribute.
			s := "gobo"
			p1 := agent s.count
			assert_integers_equal ("item1", 4, p1.item ([]))
				-- Open target.
			p2 := agent {STRING}.count
			assert_integers_equal ("item2", 3, p2.item (["foo"]))
				-- Unqualified attribute.
			attr := 10
			p3 := agent attr
			assert_integers_equal ("item3", 10, p3.item ([]))
		end

	test_item_do_function_inline_agent1
			-- Test feature 'item' with an inline agent with a do-function as associated feature.
		local
			s: STRING
			p1: FUNCTION [ANY, TUPLE, INTEGER]
			p2: FUNCTION [ANY, TUPLE [INTEGER], INTEGER]
		do
				-- 0 open operand, 1 closed operand.
			s := "gobo"
			p1 := agent (a: STRING): INTEGER do Result := 2 * a.count end (s)
			assert_integers_equal ("item1", 8, p1.item ([]))
				-- 1 open operand, 0 closed operand.
			p2 := agent (a: INTEGER): INTEGER do Result := 3 * a end
			assert_integers_equal ("item2", 6, p2.item ([2]))
		end

	test_call_qualified1
			-- Test feature 'call' with a closed qualified target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 1 open, 0 closed.
			a.put ('g', 1)
			p1 := agent a.item
			p1.call ([1])
			assert_characters_equal ("last_result1", 'g', p1.last_result)
				-- 1 open, 0 closed.
			a.put ('a', 1)
			p1 := agent a.item (?)
			p1.call ([1])
			assert_characters_equal ("last_result2", 'a', p1.last_result)
				-- 0 open, 1 closed.
			a.put ('z', 1)
			p2 := agent a.item (1)
			p2.call ([])
			assert_characters_equal ("last_result3", 'z', p2.last_result)
				-- 0 open, 1 closed.
			a.put ('x', 1)
			p2 := agent a.item (1)
			p2.call (Void)
			assert_characters_equal ("last_result4", 'x', p2.last_result)
				-- Pass too many operands.
			a.put ('b', 1)
			p1 := agent a.item (?)
			p1.call ([1, "gobo"])
			assert_characters_equal ("last_result5", 'b', p1.last_result)
				-- Polymorphic agent.
			a.put ('f', 1)
			p3 := agent a.item (?)
			p3.call ([1, "gobo"])
			assert_characters_equal ("last_result6", 'f', p3.last_result)
			a.put ('h', 1)
			p3 := agent a.item (1)
			p3.call ([5, "gobo"])
			assert_characters_equal ("last_result7", 'h', p3.last_result)
		end

	test_call_qualified2
			-- Test feature 'call' with a closed qualified target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make_filled ('%U', 2)
			a.put ('g', 1)
				-- 1 open, 0 closed.
			p1 := agent a.item
			p1.call ([1])
			assert_characters_equal ("last_result1", 'g', p1.last_result)
				-- 1 open, 0 closed.
			a.put ('a', 1)
			p1 := agent a.item (?)
			p1.call ([1])
			assert_characters_equal ("last_result2", 'a', p1.last_result)
				-- 0 open, 1 closed.
			a.put ('z', 1)
			p2 := agent a.item (1)
			p2.call ([])
			assert_characters_equal ("last_result3", 'z', p2.last_result)
				-- 0 open, 1 closed.
			a.put ('x', 1)
			p2 := agent a.item (1)
			p2.call (Void)
			assert_characters_equal ("last_result4", 'x', p2.last_result)
				-- Pass too many operands.
			a.put ('b', 1)
			p1 := agent a.item (?)
			p1.call ([1, "gobo"])
			assert_characters_equal ("last_result5", 'b', p1.last_result)
				-- Polymorphic agent.
			a.put ('f', 1)
			p3 := agent a.item (?)
			p3.call ([1, "gobo"])
			assert_characters_equal ("last_result6", 'f', p3.last_result)
			a.put ('h', 1)
			p3 := agent a.item (1)
			p3.call ([5, "gobo"])
			assert_characters_equal ("last_result7", 'h', p3.last_result)
		end

	test_call_qualified3
			-- Test feature 'call' with a closed qualified target
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
				-- 1 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('g', 1)
			p1 := agent a.item
			p1.call ([1])
			assert_characters_equal ("last_result1a", 'g', p1.last_result)
			a := "h"
			p1 := agent a.item
			p1.call ([1])
			assert_characters_equal ("last_result1b", 'h', p1.last_result)
				-- 1 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('a', 1)
			p1 := agent a.item (?)
			p1.call ([1])
			assert_characters_equal ("last_result2a", 'a', p1.last_result)
			a := "b"
			p1 := agent a.item (?)
			p1.call ([1])
			assert_characters_equal ("last_result2b", 'b', p1.last_result)
				-- 0 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('z', 1)
			p2 := agent a.item (1)
			p2.call ([])
			assert_characters_equal ("last_result3a", 'z', p2.last_result)
			a := "y"
			p2 := agent a.item (1)
			p2.call ([])
			assert_characters_equal ("last_result3b", 'y', p2.last_result)
				-- 0 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('x', 1)
			p2 := agent a.item (1)
			p2.call (Void)
			assert_characters_equal ("last_result4a", 'x', p2.last_result)
			a := "w"
			p2 := agent a.item (1)
			p2.call (Void)
			assert_characters_equal ("last_result4b", 'w', p2.last_result)
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('b', 1)
			p1 := agent a.item (?)
			p1.call ([1, "gobo"])
			assert_characters_equal ("last_result5a", 'b', p1.last_result)
			a := "c"
			p1 := agent a.item (?)
			p1.call ([1, "gobo"])
			assert_characters_equal ("last_result5b", 'c', p1.last_result)
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('f', 1)
			p3 := agent a.item (?)
			p3.call ([1, "gobo"])
			assert_characters_equal ("last_result6a", 'f', p3.last_result)
			a.put ('h', 1)
			p3 := agent a.item (1)
			p3.call ([5, "gobo"])
			assert_characters_equal ("last_result7a", 'h', p3.last_result)
			a := "e"
			p3 := agent a.item (?)
			p3.call ([1, "gobo"])
			assert_characters_equal ("last_result6b", 'e', p3.last_result)
			a.put ('j', 1)
			p3 := agent a.item (1)
			p3.call ([5, "gobo"])
			assert_characters_equal ("last_result7b", 'j', p3.last_result)
		end

	test_call_labeled_tuple1
			-- Test feature 'call' with a closed qualified target
			-- which appears to be a labeled tuple.
		local
			t1: TUPLE [l1: INTEGER; l2: CHARACTER]
			t2: TUPLE [INTEGER, CHARACTER, STRING]
			p1: FUNCTION [ANY, TUPLE, INTEGER]
			p2: FUNCTION [ANY, TUPLE, CHARACTER]
			p3: FUNCTION [ANY, TUPLE [TUPLE [INTEGER, CHARACTER]], CHARACTER]
			p4: FUNCTION [ANY, TUPLE, CHARACTER]
		do
				-- 0 open, 1 closed.
			t1 := [5, 'g']
			p1 := agent t1.l1
			p1.call ([])
			assert_integers_equal ("last_result1", 5, p1.last_result)
				-- 0 open, 1 closed.
			t1 := [4, 'g']
			p1 := agent t1.l1
			p1.call (Void)
			assert_integers_equal ("last_result2", 4, p1.last_result)
				-- 0 open, 1 closed.
			t1 := [5, 'g']
			p2 := agent t1.l2
			p2.call ([])
			assert_characters_equal ("last_result3", 'g', p2.last_result)
				-- 0 open, 1 closed.
			t1 := [5, 'a']
			p2 := agent t1.l2
			p2.call (Void)
			assert_characters_equal ("last_result4", 'a', p2.last_result)
				-- 1 open, 0 closed.
			t1 := [5, 'z']
			p3 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			p3.call ([t1])
			assert_characters_equal ("last_result5", 'z', p3.last_result)
				-- Pass too many operands.
			t1 := [7, 'g']
			p1 := agent t1.l1
			p1.call (["gobo"])
			assert_integers_equal ("last_result6", 7, p1.last_result)
				-- Polymorphic target.
			p3 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			t1 := [7, 'x']
			p3.call ([t1])
			assert_characters_equal ("last_result7", 'x', p3.last_result)
			t2 := [7, 'w', "gobo"]
			p3.call ([t2])
			assert_characters_equal ("last_result8", 'w', p3.last_result)
				-- Polymorphic agent.
			t1 := [7, 'd']
			p4 := agent t1.l2
			p4.call ([t1, "gobo"])
			assert_characters_equal ("last_result9", 'd', p4.last_result)
			p4 := agent {TUPLE [l1: INTEGER; l2: CHARACTER]}.l2
			t2 := [7, 'h', "foo"]
			p4.call ([t2, "gobo"])
			assert_characters_equal ("last_result10", 'h', p4.last_result)
		end

	test_call_typed1
			-- Test feature 'call' with an open target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 2 open, 0 closed.
			a.put ('g', 1)
			p1 := agent {ARRAY [CHARACTER]}.item (?)
			p1.call ([a, 1])
			assert_characters_equal ("last_result1", 'g', p1.last_result)
				-- 2 open, 0 closed.
			a.put ('h', 1)
			p1 := agent {ARRAY [CHARACTER]}.item
			p1.call ([a, 1])
			assert_characters_equal ("last_result2", 'h', p1.last_result)
				-- 1 open, 1 closed.
			a.put ('z', 1)
			p2 := agent {ARRAY [CHARACTER]}.item (1)
			p2.call ([a])
			assert_characters_equal ("last_result3", 'z', p2.last_result)
				-- Pass too many operands.
			a.put ('d', 1)
			p1 := agent {ARRAY [CHARACTER]}.item
			p1.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result4", 'd', p1.last_result)
				-- Polymorphic agent.
			a.put ('t', 1)
			p3 := agent {ARRAY [CHARACTER]}.item
			p3.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result5", 't', p3.last_result)
			a.put ('f', 1)
			p3 := agent {ARRAY [CHARACTER]}.item (1)
			p3.call ([a, 5, "gobo"])
			assert_characters_equal ("last_result6", 'f', p3.last_result)
		end

	test_call_typed2
			-- Test feature 'call' with an open target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [SPECIAL [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [SPECIAL [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make_filled ('%U', 2)
				-- 2 open, 0 closed.
			a.put ('g', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item (?)
			p1.call ([a, 1])
			assert_characters_equal ("last_result1", 'g', p1.last_result)
				-- 2 open, 0 closed.
			a.put ('h', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item
			p1.call ([a, 1])
			assert_characters_equal ("last_result2", 'h', p1.last_result)
				-- 1 open, 1 closed.
			a.put ('z', 1)
			p2 := agent {SPECIAL [CHARACTER]}.item (1)
			p2.call ([a])
			assert_characters_equal ("last_result3", 'z', p2.last_result)
				-- Pass too many operands.
			a.put ('d', 1)
			p1 := agent {SPECIAL [CHARACTER]}.item
			p1.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result4", 'd', p1.last_result)
				-- Polymorphic agent.
			a.put ('t', 1)
			p3 := agent {SPECIAL [CHARACTER]}.item
			p3.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result5", 't', p3.last_result)
			a.put ('f', 1)
			p3 := agent {SPECIAL [CHARACTER]}.item (1)
			p3.call ([a, 5, "gobo"])
			assert_characters_equal ("last_result6", 'f', p3.last_result)
		end

	test_call_typed3
			-- Test feature 'call' with an open target,
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [TO_SPECIAL [CHARACTER], INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [TO_SPECIAL [CHARACTER]], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
		do
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('g', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item (?)
			p1.call ([a, 1])
			assert_characters_equal ("last_result1a", 'g', p1.last_result)
			a := "p"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item (?)
			p1.call ([a, 1])
			assert_characters_equal ("last_result1b", 'p', p1.last_result)
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('h', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			p1.call ([a, 1])
			assert_characters_equal ("last_result2a", 'h', p1.last_result)
			a := "g"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			p1.call ([a, 1])
			assert_characters_equal ("last_result2b", 'g', p1.last_result)
				-- 1 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('z', 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			p2.call ([a])
			assert_characters_equal ("last_result3a", 'z', p2.last_result)
			a := "x"
			p2 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			p2.call ([a])
			assert_characters_equal ("last_result3b", 'x', p2.last_result)
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('d', 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			p1.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result4a", 'd', p1.last_result)
			a := "c"
			p1 := agent {TO_SPECIAL [CHARACTER]}.item
			p1.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result4b", 'c', p1.last_result)
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			a.put ('t', 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.item
			p3.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result5a", 't', p3.last_result)
			a.put ('f', 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			p3.call ([a, 5, "gobo"])
			assert_characters_equal ("last_result6a", 'f', p3.last_result)
			a := "u"
			p3 := agent {TO_SPECIAL [CHARACTER]}.item
			p3.call ([a, 1, "gobo"])
			assert_characters_equal ("last_result5b", 'u', p3.last_result)
			a := "e"
			p3 := agent {TO_SPECIAL [CHARACTER]}.item (1)
			p3.call ([a, 5, "gobo"])
			assert_characters_equal ("last_result6b", 'e', p3.last_result)
		end

	test_call_unqualified1
			-- Test feature 'call' with a closed unqualified target.
		local
			a: ARRAY [CHARACTER]
			p1: FUNCTION [ANY, TUPLE [INTEGER], CHARACTER]
			p2: FUNCTION [ANY, TUPLE [ARRAY [CHARACTER], INTEGER], CHARACTER]
			p3: FUNCTION [ANY, TUPLE, CHARACTER]
			p4: FUNCTION [ANY, TUPLE, CHARACTER]
		do
			create a.make (1, 1)
				-- 1 open, 1 closed.
			a.put ('g', 1)
			p1 := agent f (a, ?)
			p1.call ([1])
			assert_characters_equal ("last_result1", 'g', p1.last_result)
				-- 2 open, 0 closed.
			a.put ('a', 1)
			p2 := agent f
			p2.call ([a, 1])
			assert_characters_equal ("last_result2", 'a', p2.last_result)
				-- 2 open, 0 closed.
			a.put ('z', 1)
			p2 := agent f (?, ?)
			p2.call ([a, 1])
			assert_characters_equal ("last_result3", 'z', p2.last_result)
				-- 0 open, 2 closed.
			a.put ('w', 1)
			p3 := agent f (a, 1)
			p3.call ([])
			assert_characters_equal ("last_result4", 'w', p3.last_result)
				-- 0 open, 2 closed.
			a.put ('b', 1)
			p3 := agent f (a, 1)
			p3.call (Void)
			assert_characters_equal ("last_result5", 'b', p3.last_result)
				-- Pass too many operands.
			a.put ('g', 1)
			p1 := agent f (a, ?)
			p1.call ([1, "gobo"])
			assert_characters_equal ("last_result6", 'g', p1.last_result)
				-- Polymorphic agent.
			a.put ('t', 1)
			p4 := agent f (a, ?)
			p4.call ([1, "gobo"])
			assert_characters_equal ("last_result7", 't', p4.last_result)
			a.put ('f', 1)
			p4 := agent f (a, 1)
			p4.call ([5, "gobo"])
			assert_characters_equal ("last_result8", 'f', p4.last_result)
		end

	test_call_attribute1
			-- Test feature 'call' with an agent on attribute.
		local
			s: STRING
			p1: FUNCTION [ANY, TUPLE, INTEGER]
			p2: FUNCTION [ANY, TUPLE [STRING], INTEGER]
			p3: FUNCTION [ANY, TUPLE, INTEGER]
		do
				-- Qualified attribute.
			s := "gobo"
			p1 := agent s.count
			p1.call ([])
			assert_integers_equal ("last_result1", 4, p1.last_result)
				-- Open target.
			p2 := agent {STRING}.count
			p2.call (["foo"])
			assert_integers_equal ("last_result2", 3, p2.last_result)
				-- Unqualified attribute.
			attr := 13
			p3 := agent attr
			p3.call ([])
			assert_integers_equal ("last_result3", 13, p3.last_result)
		end

	test_is_target_closed
			-- Test feature 'is_target_closed'.
		local
			s: STRING
			p1: FUNCTION [ANY, TUPLE [STRING], INTEGER]
			p2: FUNCTION [ANY, TUPLE, INTEGER]
		do
			p1 := agent {STRING}.count
			assert ("is_open", not p1.is_target_closed)
			s := "gobo"
			p2 := agent s.count
			assert ("is_closed", p2.is_target_closed)
		end

	test_set_target
			-- Test feature 'set_target'.
		local
			s1, s2: STRING
			p: FUNCTION [ANY, TUPLE, INTEGER]
		do
			if not eiffel_compiler.is_ise then
					-- Does not work with ISE 6.3.7.4337.
					-- See ISE bug report [EiffelBase #14734] submitted on 2008/08/14.
				s1 := "gobo"
				p := agent s1.count
				s2 := "foo"
				p.set_target (s2)
				assert_integers_equal ("s2", 3, p.item ([]))
			end
		end

	test_boxed_operands
			-- Test that the access to the items of the tuple argument
			-- of 'item' is correctly done, with boxing of expanded
			-- objects to reference when necessary.
		local
			p1: FUNCTION [ANY, TUPLE [ANY, INTEGER], BOOLEAN]
			p2: FUNCTION [ANY, TUPLE [ANY, ANY], BOOLEAN]
			t: TUPLE [ANY, INTEGER]
		do
			if not eiffel_compiler.is_ise then
					-- Does not work with ISE.
				p1 := agent g
					-- Here the call to 'item' will have to box the
					-- character 'b' to a reference object when passing
					-- it to 'g'.
				assert_booleans_equal ("item1", False, p1.item (['b', 3]))
					-- Now use a polymorphic tuple argument.
				p1 := agent g
				t := ["gobo", 6]
				assert_booleans_equal ("item2", False, p1.item (t))
				t := ['b', 8]
				assert_booleans_equal ("item3", False, p1.item (t))
					-- Now test unboxing.
				p2 := agent g
				assert_booleans_equal ("item4", False, p2.item (["gobo", 2]))
				p2 := agent g
				t := ["gobo", 6]
				assert_booleans_equal ("item5", False, p2.item (t))
				p2 := agent h
				assert_booleans_equal ("item6", False, p2.item (["gobo", 2]))
				assert_booleans_equal ("item7", False, p2.item (t))
			end
		end

	test_boxed_result
			-- Test that the access to the items of the tuple argument
			-- of 'item' is correctly done, with boxing of expanded
			-- objects to reference when necessary.
		local
			p1: FUNCTION [ANY, TUPLE [ANY, INTEGER], ANY]
			l_false: ANY
			arr: ARRAY [ANY]
			s: STRING
		do
			l_false := False
			s := "gobo"
			create arr.make (1, 1)
			arr.put (s, 1)
			p1 := agent g
			assert_equal ("item1", l_false, p1.item ([arr, 6]))
			p1 := agent {ARRAY [ANY]}.item
			assert_same ("item2", s, p1.item ([arr, 1]))
		end

feature {NONE} -- Implementation

	f (a: ARRAY [CHARACTER]; i: INTEGER): CHARACTER
			-- Item at index `i' in `a'
		require
			a_not_void: a /= Void
			valid_index: a.valid_index (i)
		do
			Result := a.item (i)
		ensure
			definition: Result = a.item (i)
		end

	g (a: ANY; i: INTEGER): BOOLEAN
			-- Do `a' and `i' have the same `out' object?
		require
			a_not_void: a /= Void
		do
			Result := a.out = i.out
		end

	h (a: ANY; i: ANY): BOOLEAN
			-- Do `a' and `i' have the same `out' object?
		require
			a_not_void: a /= Void
			i_not_void: i /= Void
		do
			Result := a.out = i.out
		end

	attr: INTEGER
			-- An attribute

end
