indexing

	description:

		"Test features of class PROCEDURE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PROCEDURE

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_call_qualified1
			test_call_qualified2
			test_call_qualified3
			test_call_typed1
			test_call_typed2
			test_call_typed3
			test_call_unqualified1
		end

	test_call_qualified1 is
			-- Test feature 'call' with a closed qualified target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE]
			p4: PROCEDURE [ANY, TUPLE]
		do
			create a.make (1, 1)
				-- 1 open, 1 closed.
			p1 := agent a.put (?, 1)
			p1.call (['g'])
			assert_characters_equal ("call1", 'g', a.item (1))
				-- 2 open, 0 closed.
			p2 := agent a.put
			p2.call (['a', 1])
			assert_characters_equal ("call2", 'a', a.item (1))
				-- 2 open, 0 closed.
			p2 := agent a.put (?, ?)
			p2.call (['z', 1])
			assert_characters_equal ("call3", 'z', a.item (1))
				-- 0 open, 2 closed.
			p3 := agent a.put ('w', 1)
			p3.call ([])
			assert_characters_equal ("call4", 'w', a.item (1))
				-- 0 open, 2 closed.
			p3 := agent a.put ('b', 1)
			p3.call (Void)
			assert_characters_equal ("call5", 'b', a.item (1))
				-- Pass too many operands.
			p1 := agent a.put (?, 1)
			p1.call (['p', "gobo"])
			assert_characters_equal ("call6", 'p', a.item (1))
				-- Polymorphic agent.
			p4 := agent a.put (?, 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call7", 't', a.item (1))
			p4 := agent a.put ('f', 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call8", 'f', a.item (1))
		end

	test_call_qualified2 is
			-- Test feature 'call' with a closed qualified target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE]
			p4: PROCEDURE [ANY, TUPLE]
		do
			create a.make (2)
				-- 1 open, 1 closed.
			p1 := agent a.put (?, 1)
			p1.call (['g'])
			assert_characters_equal ("call1", 'g', a.item (1))
				-- 2 open, 0 closed.
			p2 := agent a.put
			p2.call (['a', 1])
			assert_characters_equal ("call2", 'a', a.item (1))
				-- 2 open, 0 closed.
			p2 := agent a.put (?, ?)
			p2.call (['z', 1])
			assert_characters_equal ("call3", 'z', a.item (1))
				-- 0 open, 2 closed.
			p3 := agent a.put ('w', 1)
			p3.call ([])
			assert_characters_equal ("call4", 'w', a.item (1))
				-- 0 open, 2 closed.
			p3 := agent a.put ('b', 1)
			p3.call (Void)
			assert_characters_equal ("call5", 'b', a.item (1))
				-- Pass too many operands.
			p1 := agent a.put (?, 1)
			p1.call (['p', "gobo"])
			assert_characters_equal ("call6", 'p', a.item (1))
				-- Polymorphic agent.
			p4 := agent a.put (?, 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call7", 't', a.item (1))
			p4 := agent a.put ('f', 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call8", 'f', a.item (1))
		end

	test_call_qualified3 is
			-- Test feature 'call' with a closed qualified target
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE]
			p4: PROCEDURE [ANY, TUPLE]
		do
				-- 1 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p1 := agent a.put (?, 1)
			p1.call (['g'])
			assert_characters_equal ("call1a", 'g', a.item (1))
			a := "foo"
			p1 := agent a.put (?, 1)
			p1.call (['h'])
			assert_characters_equal ("call1b", 'h', a.item (1))
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p2 := agent a.put
			p2.call (['a', 1])
			assert_characters_equal ("call2a", 'a', a.item (1))
			a := "foo"
			p2 := agent a.put
			p2.call (['b', 1])
			assert_characters_equal ("call2b", 'b', a.item (1))
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p2 := agent a.put (?, ?)
			p2.call (['z', 1])
			assert_characters_equal ("call3a", 'z', a.item (1))
			a := "foo"
			p2 := agent a.put (?, ?)
			p2.call (['s', 1])
			assert_characters_equal ("call3b", 's', a.item (1))
				-- 0 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p3 := agent a.put ('w', 1)
			p3.call ([])
			assert_characters_equal ("call4a", 'w', a.item (1))
			a := "foo"
			p3 := agent a.put ('x', 1)
			p3.call ([])
			assert_characters_equal ("call4b", 'x', a.item (1))
				-- 0 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p3 := agent a.put ('b', 1)
			p3.call (Void)
			assert_characters_equal ("call5a", 'b', a.item (1))
			a := "foo"
			p3 := agent a.put ('c', 1)
			p3.call (Void)
			assert_characters_equal ("call5b", 'c', a.item (1))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p1 := agent a.put (?, 1)
			p1.call (['p', "gobo"])
			assert_characters_equal ("call6a", 'p', a.item (1))
			a := "foo"
			p1 := agent a.put (?, 1)
			p1.call (['q', "gobo"])
			assert_characters_equal ("call6b", 'q', a.item (1))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p4 := agent a.put (?, 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call7a", 't', a.item (1))
			p4 := agent a.put ('f', 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call8a", 'f', a.item (1))
			a := "bar"
			p4 := agent a.put (?, 1)
			p4.call (['u', "gobo"])
			assert_characters_equal ("call7b", 'u', a.item (1))
			p4 := agent a.put ('e', 1)
			p4.call (['u', "gobo"])
			assert_characters_equal ("call8b", 'e', a.item (1))
		end

	test_call_typed1 is
			-- Test feature 'call' with an open target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [ARRAY [CHARACTER], CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [ARRAY [CHARACTER], CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE [ARRAY [CHARACTER]]]
			p4: PROCEDURE [ANY, TUPLE]
		do
			create a.make (1, 1)
				-- 2 open, 1 closed.
			p1 := agent {ARRAY [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g'])
			assert_characters_equal ("call1", 'g', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent {ARRAY [CHARACTER]}.put
			p2.call ([a, 'a', 1])
			assert_characters_equal ("call2", 'a', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent {ARRAY [CHARACTER]}.put (?, ?)
			p2.call ([a, 'z', 1])
			assert_characters_equal ("call3", 'z', a.item (1))
				-- 1 open, 2 closed.
			p3 := agent {ARRAY [CHARACTER]}.put ('w', 1)
			p3.call ([a])
			assert_characters_equal ("call4", 'w', a.item (1))
				-- Pass too many operands.
			p1 := agent {ARRAY [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g', "gobo"])
			assert_characters_equal ("call5", 'g', a.item (1))
				-- Polymorphic agent.
			p4 := agent {ARRAY [CHARACTER]}.put (?, 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call6", 't', a.item (1))
			p4 := agent {ARRAY [CHARACTER]}.put ('f', 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call7", 'f', a.item (1))
		end

	test_call_typed2 is
			-- Test feature 'call' with an open target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [SPECIAL [CHARACTER], CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [SPECIAL [CHARACTER], CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE [SPECIAL [CHARACTER]]]
			p4: PROCEDURE [ANY, TUPLE]
		do
			create a.make (2)
				-- 2 open, 1 closed.
			p1 := agent {SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g'])
			assert_characters_equal ("call1", 'g', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent {SPECIAL [CHARACTER]}.put
			p2.call ([a, 'a', 1])
			assert_characters_equal ("call2", 'a', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent {SPECIAL [CHARACTER]}.put (?, ?)
			p2.call ([a, 'z', 1])
			assert_characters_equal ("call3", 'z', a.item (1))
				-- 1 open, 2 closed.
			p3 := agent {SPECIAL [CHARACTER]}.put ('w', 1)
			p3.call ([a])
			assert_characters_equal ("call4", 'w', a.item (1))
				-- Pass too many operands.
			p1 := agent {SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g', "gobo"])
			assert_characters_equal ("call5", 'g', a.item (1))
				-- Polymorphic agent.
			p4 := agent {SPECIAL [CHARACTER]}.put (?, 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call6", 't', a.item (1))
			p4 := agent {SPECIAL [CHARACTER]}.put ('f', 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call7", 'f', a.item (1))
		end

	test_call_typed3 is
			-- Test feature 'call' with an open target,
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [TO_SPECIAL [CHARACTER], CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [TO_SPECIAL [CHARACTER], CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE [TO_SPECIAL [CHARACTER]]]
			p4: PROCEDURE [ANY, TUPLE]
		do
				-- 2 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g'])
			assert_characters_equal ("call1a", 'g', a.item (1))
			a := "foo"
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'h'])
			assert_characters_equal ("call1b", 'h', a.item (1))
				-- 3 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.put
			p2.call ([a, 'a', 1])
			assert_characters_equal ("call2a", 'a', a.item (1))
			a := "foo"
			p2 := agent {TO_SPECIAL [CHARACTER]}.put
			p2.call ([a, 'b', 1])
			assert_characters_equal ("call2b", 'b', a.item (1))
				-- 3 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.put (?, ?)
			p2.call ([a, 'z', 1])
			assert_characters_equal ("call3a", 'z', a.item (1))
			a := "foo"
			p2 := agent {TO_SPECIAL [CHARACTER]}.put (?, ?)
			p2.call ([a, 'y', 1])
			assert_characters_equal ("call3b", 'y', a.item (1))
				-- 1 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.put ('w', 1)
			p3.call ([a])
			assert_characters_equal ("call4a", 'w', a.item (1))
			a := "foo"
			p3 := agent {TO_SPECIAL [CHARACTER]}.put ('x', 1)
			p3.call ([a])
			assert_characters_equal ("call4b", 'x', a.item (1))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g', "gobo"])
			assert_characters_equal ("call5a", 'g', a.item (1))
			a := "foo"
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'h', "gobo"])
			assert_characters_equal ("call5b", 'h', a.item (1))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make (1, 1)
			p4 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call6a", 't', a.item (1))
			p4 := agent {TO_SPECIAL [CHARACTER]}.put ('f', 1)
			p4.call ([a, 't', "gobo"])
			assert_characters_equal ("call7a", 'f', a.item (1))
			a := "foo"
			p4 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p4.call ([a, 'u', "gobo"])
			assert_characters_equal ("call6b", 'u', a.item (1))
			p4 := agent {TO_SPECIAL [CHARACTER]}.put ('e', 1)
			p4.call ([a, 'u', "gobo"])
			assert_characters_equal ("call7b", 'e', a.item (1))
		end

	test_call_unqualified1 is
			-- Test feature 'call' with a closed unqualified target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [ANY, TUPLE [CHARACTER]]
			p2: PROCEDURE [ANY, TUPLE [ARRAY [CHARACTER], CHARACTER, INTEGER]]
			p3: PROCEDURE [ANY, TUPLE]
			p4: PROCEDURE [ANY, TUPLE]
		do
			create a.make (1, 1)
				-- 1 open, 2 closed.
			p1 := agent f (a, ?, 1)
			p1.call (['g'])
			assert_characters_equal ("call1", 'g', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent f
			p2.call ([a, 'a', 1])
			assert_characters_equal ("call2", 'a', a.item (1))
				-- 3 open, 0 closed.
			p2 := agent f (?, ?, ?)
			p2.call ([a, 'z', 1])
			assert_characters_equal ("call3", 'z', a.item (1))
				-- 0 open, 3 closed.
			p3 := agent f (a, 'w', 1)
			p3.call ([])
			assert_characters_equal ("call4", 'w', a.item (1))
				-- 0 open, 3 closed.
			p3 := agent f (a, 'b', 1)
			p3.call (Void)
			assert_characters_equal ("call5", 'b', a.item (1))
				-- Pass too many operands.
			p1 := agent f (a, ?, 1)
			p1.call (['g', "gobo"])
			assert_characters_equal ("call6", 'g', a.item (1))
				-- Polymorphic agent.
			p4 := agent f (a, ?, 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call7", 't', a.item (1))
			p4 := agent f (a, 'f', 1)
			p4.call (['t', "gobo"])
			assert_characters_equal ("call8", 'f', a.item (1))
		end

feature {NONE} -- Implementation

	f (a: ARRAY [CHARACTER]; c: CHARACTER; i: INTEGER) is
			-- Insert `c' at index `i' in `a'.
		require
			a_not_void: a /= Void
			valid_index: a.valid_index (i)
		do
			a.put (c, i)
		ensure
			inserted: a.item (i) = c
		end

end
