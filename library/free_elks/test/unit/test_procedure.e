note

	description:

		"Test features of class PROCEDURE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PROCEDURE

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_call_qualified1
			-- Test feature 'call' with a closed qualified target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [CHARACTER]
			p2: PROCEDURE [CHARACTER, INTEGER]
			p3: PROCEDURE
			p4: PROCEDURE
		do
			create a.make_filled ('%U', 1, 1)
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

	test_call_qualified2
			-- Test feature 'call' with a closed qualified target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: PROCEDURE [CHARACTER]
			p2: PROCEDURE [CHARACTER, INTEGER]
			p3: PROCEDURE
			p4: PROCEDURE
		do
			create a.make_filled ('%U', 2)
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

	test_call_qualified3
			-- Test feature 'call' with a closed qualified target
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: PROCEDURE [CHARACTER]
			p2: PROCEDURE [CHARACTER, INTEGER]
			p3: PROCEDURE
			p4: PROCEDURE
		do
				-- 1 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p1 := agent a.put (?, 1)
			p1.call (['g'])
			assert_characters_equal ("call1a", 'g', a.item (1))
			a := "foo"
			p1 := agent a.put (?, 1)
			p1.call (['h'])
			assert_characters_equal ("call1b", 'h', a.item (1))
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p2 := agent a.put
			p2.call (['a', 1])
			assert_characters_equal ("call2a", 'a', a.item (1))
			a := "foo"
			p2 := agent a.put
			p2.call (['b', 1])
			assert_characters_equal ("call2b", 'b', a.item (1))
				-- 2 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p2 := agent a.put (?, ?)
			p2.call (['z', 1])
			assert_characters_equal ("call3a", 'z', a.item (1))
			a := "foo"
			p2 := agent a.put (?, ?)
			p2.call (['s', 1])
			assert_characters_equal ("call3b", 's', a.item (1))
				-- 0 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p3 := agent a.put ('w', 1)
			p3.call ([])
			assert_characters_equal ("call4a", 'w', a.item (1))
			a := "foo"
			p3 := agent a.put ('x', 1)
			p3.call ([])
			assert_characters_equal ("call4b", 'x', a.item (1))
				-- 0 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p3 := agent a.put ('b', 1)
			p3.call (Void)
			assert_characters_equal ("call5a", 'b', a.item (1))
			a := "foo"
			p3 := agent a.put ('c', 1)
			p3.call (Void)
			assert_characters_equal ("call5b", 'c', a.item (1))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p1 := agent a.put (?, 1)
			p1.call (['p', "gobo"])
			assert_characters_equal ("call6a", 'p', a.item (1))
			a := "foo"
			p1 := agent a.put (?, 1)
			p1.call (['q', "gobo"])
			assert_characters_equal ("call6b", 'q', a.item (1))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
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

	test_call_typed1
			-- Test feature 'call' with an open target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [ARRAY [CHARACTER], CHARACTER]
			p2: PROCEDURE [ARRAY [CHARACTER], CHARACTER, INTEGER]
			p3: PROCEDURE [ARRAY [CHARACTER]]
			p4: PROCEDURE
		do
			create a.make_filled ('%U', 1, 1)
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

	test_call_typed2
			-- Test feature 'call' with an open target,
			-- calling builtin features.
		local
			a: SPECIAL [CHARACTER]
			p1: PROCEDURE [SPECIAL [CHARACTER], CHARACTER]
			p2: PROCEDURE [SPECIAL [CHARACTER], CHARACTER, INTEGER]
			p3: PROCEDURE [SPECIAL [CHARACTER]]
			p4: PROCEDURE
		do
			create a.make_filled ('%U', 2)
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

	test_call_typed3
			-- Test feature 'call' with an open target,
			-- which can be polymorphic.
		local
			a: TO_SPECIAL [CHARACTER]
			p1: PROCEDURE [TO_SPECIAL [CHARACTER], CHARACTER]
			p2: PROCEDURE [TO_SPECIAL [CHARACTER], CHARACTER, INTEGER]
			p3: PROCEDURE [TO_SPECIAL [CHARACTER]]
			p4: PROCEDURE
		do
				-- 2 open, 1 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g'])
			assert_characters_equal ("call1a", 'g', a.item (1))
			a := "foo"
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'h'])
			assert_characters_equal ("call1b", 'h', a.item (1))
				-- 3 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.put
			p2.call ([a, 'a', 1])
			assert_characters_equal ("call2a", 'a', a.item (1))
			a := "foo"
			p2 := agent {TO_SPECIAL [CHARACTER]}.put
			p2.call ([a, 'b', 1])
			assert_characters_equal ("call2b", 'b', a.item (1))
				-- 3 open, 0 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p2 := agent {TO_SPECIAL [CHARACTER]}.put (?, ?)
			p2.call ([a, 'z', 1])
			assert_characters_equal ("call3a", 'z', a.item (1))
			a := "foo"
			p2 := agent {TO_SPECIAL [CHARACTER]}.put (?, ?)
			p2.call ([a, 'y', 1])
			assert_characters_equal ("call3b", 'y', a.item (1))
				-- 1 open, 2 closed.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p3 := agent {TO_SPECIAL [CHARACTER]}.put ('w', 1)
			p3.call ([a])
			assert_characters_equal ("call4a", 'w', a.item (1))
			a := "foo"
			p3 := agent {TO_SPECIAL [CHARACTER]}.put ('x', 1)
			p3.call ([a])
			assert_characters_equal ("call4b", 'x', a.item (1))
				-- Pass too many operands.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'g', "gobo"])
			assert_characters_equal ("call5a", 'g', a.item (1))
			a := "foo"
			p1 := agent {TO_SPECIAL [CHARACTER]}.put (?, 1)
			p1.call ([a, 'h', "gobo"])
			assert_characters_equal ("call5b", 'h', a.item (1))
				-- Polymorphic agent.
			create {ARRAY [CHARACTER]} a.make_filled ('%U', 1, 1)
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

	test_call_unqualified1
			-- Test feature 'call' with a closed unqualified target.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [CHARACTER]
			p2: PROCEDURE [ARRAY [CHARACTER], CHARACTER, INTEGER]
			p3: PROCEDURE
			p4: PROCEDURE
		do
			create a.make_filled ('%U', 1, 1)
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

	test_valid_operands
			-- Test feature 'valid_operands'.
		local
			p1: PROCEDURE
			s: STRING
			a: ARRAY [CHARACTER]
			t1: TUPLE [ANY]
		do
			p1 := agent f (?, 'a', 1)
				-- Test with invalid operands.
			s := "gobo"
			assert ("not_valid1", not p1.valid_operands ([s]))
				-- Test with valid operands.
			create a.make_filled ('%U', 1, 1)
			assert ("valid1", p1.valid_operands ([a]))
				-- Test that the operands are valid even though TUPLE [ANY]
				-- does not conform to TUPLE [ARRAY [CHARACTER]]. According
				-- to ISE's implementation, what is taken into account is the
				-- dynamic type of the item of the tuple argument (which should
				-- therefore conform to ARRAY [CHARACTER]).
			create t1
			t1.put_reference (a, 1)
			assert ("valid2", p1.valid_operands (t1))
		end

	test_is_target_closed
			-- Test feature 'is_target_closed'.
		local
			s: STRING
			p1: PROCEDURE [STRING]
			p2: PROCEDURE
		do
			p1 := agent {STRING}.wipe_out
			assert ("is_open", not p1.is_target_closed)
			s := "gobo"
			p2 := agent s.wipe_out
			assert ("is_closed", p2.is_target_closed)
		end

	test_set_target
			-- Test feature 'set_target'.
		local
			s1, s2: STRING
			p: PROCEDURE [CHARACTER]
		do
			s1 := "gobo"
			p := agent s1.append_character
			s2 := "foo"
			p.set_target (s2)
			p.call (['Z'])
			assert_strings_equal ("s1", "gobo", s1)
			assert_strings_equal ("s2", "fooZ", s2)
		end

	test_boxed_operands
			-- Test that the access to the items of the tuple argument
			-- of 'call' is correctly done, with boxing of expanded
			-- objects to reference when necessary.
		local
			p1: PROCEDURE [ANY, INTEGER]
			p2: PROCEDURE [ANY, ANY]
			a: ARRAY [detachable ANY]
			t: TUPLE [ANY, INTEGER]
			b: ANY
			s: STRING
		do
			if not eiffel_compiler.is_ise then
					-- Does not work with ISE.
				create a.make_filled (Void, 1, 1)
				p1 := agent a.put
					-- Here the call to 'call' will have to box the
					-- character 'b' to a reference object when passing
					-- it to ARRAY.put
				p1.call (['b', 1])
				b := 'b'
				assert_equal ("call1", b, a.item (1))
					-- Now use a polymorphic tuple argument.
				p1 := agent a.put
				s := "gobo"
				t := [s, 1]
				p1.call (t)
				assert_same ("call2", s, a.item (1))
				t := ['b', 1]
				p1.call (t)
				assert_equal ("call3", b, a.item (1))
					-- Now test unboxing.
				p2 := agent a.put
				p2.call ([s, 1])
				assert_same ("call4", s, a.item (1))
				t := [s, 1]
				p2.call (t)
				assert_same ("call5", s, a.item (1))
			end
		end

	test_twin
			-- Test feature 'twin'.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [CHARACTER]
		do
				-- Test that 'twin' does not twin the closed operands.
				-- Here the array has not been twined.
			create a.make_filled ('%U', 1, 1)
			p1 := agent f (a, ?, 1)
			p1.call (['g'])
			assert_characters_equal ("item1a", 'g', a.item (1))
			p1 := p1.twin
			p1.call (['f'])
			assert_characters_equal ("item1b", 'f', a.item (1))
		end

	test_deep_twin
			-- Test feature 'deep_twin'.
		local
			a: ARRAY [CHARACTER]
			p1: PROCEDURE [CHARACTER]
		do
			create a.make_filled ('%U', 1, 1)
			p1 := agent f (a, ?, 1)
			p1.call (['g'])
			assert_characters_equal ("item1a", 'g', a.item (1))
			p1 := p1.deep_twin
			p1.call (['f'])
			assert_characters_equal ("item1b", 'g', a.item (1))
		end

feature {NONE} -- Implementation

	f (a: ARRAY [CHARACTER]; c: CHARACTER; i: INTEGER)
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
