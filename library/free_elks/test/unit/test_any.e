note

	description:

		"Test features of class ANY"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ANY

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_generator
			-- Test feature 'generator'.
		local
			l_generator: STRING
			s: STRING_8
			i: INTEGER_16
			aa: AA
			bb: BB [INTEGER_64]
			cc: CC [STRING_32, CHARACTER_32]
			sp: SPECIAL [BOOLEAN]
		do
				-- STRING_8.
			create s.make (0)
			l_generator := s.generator
			assert ("not_void1", l_generator /= Void )
			assert ("type1", l_generator.same_type (""))
			assert_equal ("value1", "STRING_8", l_generator)
			assert ("new_object1", l_generator /= s.generator)
				-- INTEGER_16.
			i := 5
			l_generator := i.generator
			assert ("not_void2", l_generator /= Void )
			assert ("type2", l_generator.same_type (""))
			assert_equal ("value2", "INTEGER_16", l_generator)
			assert ("new_object2", l_generator /= i.generator)
				-- AA.
			create aa
			l_generator := aa.generator
			assert ("not_void3", l_generator /= Void )
			assert ("type3", l_generator.same_type (""))
			assert_equal ("value3", "AA", l_generator)
			assert ("new_object3", l_generator /= aa.generator)
				-- BB [INTEGER_64].
			create bb
			l_generator := bb.generator
			assert ("not_void4", l_generator /= Void )
			assert ("type4", l_generator.same_type (""))
			assert_equal ("value4", "BB", l_generator)
			assert ("new_object4", l_generator /= bb.generator)
				-- CC [STRING_32, CHARACTER_32].
			create cc
			l_generator := cc.generator
			assert ("not_void5", l_generator /= Void )
			assert ("type5", l_generator.same_type (""))
			assert_equal ("value5", "CC", l_generator)
			assert ("new_object5", l_generator /= cc.generator)
				-- SPECIAL [BOOLEAN].
			create sp.make_filled (True, 2)
			l_generator := sp.generator
			assert ("not_void6", l_generator /= Void )
			assert ("type6", l_generator.same_type (""))
			assert_equal ("value6", "SPECIAL", l_generator)
			assert ("new_object6", l_generator /= sp.generator)
		end

	test_generating_type
			-- Test feature 'generating_type'.
		local
			l_type: TYPE [detachable ANY]
			s: STRING_8
			i: INTEGER_16
			aa: AA
			bb: BB [INTEGER_64]
			cc: CC [STRING_32, CHARACTER_32]
			sp: SPECIAL [BOOLEAN]
		do
				-- STRING_8.
			create s.make (0)
			l_type := s.generating_type
			assert ("not_void1", l_type /= Void )
			assert ("type1", l_type.same_type ({detachable STRING_8}))
			assert_equal ("value1", {detachable STRING_8}, l_type)
				-- INTEGER_16.
			i := 5
			l_type := i.generating_type
			assert ("not_void2", l_type /= Void )
			assert ("type2", l_type.same_type ({INTEGER_16}))
			assert_equal ("value2", {INTEGER_16}, l_type)
				-- AA.
			create aa
			l_type := aa.generating_type
			assert ("not_void3", l_type /= Void )
			assert ("type3", l_type.same_type ({detachable AA}))
			assert_equal ("value3", {detachable AA}, l_type)
				-- BB [INTEGER_64].
			create bb
			l_type := bb.generating_type
			assert ("not_void4", l_type /= Void )
			assert ("type4", l_type.same_type ({detachable BB [INTEGER_64]}))
			assert_equal ("value4", {detachable BB [INTEGER_64]}, l_type)
				-- CC [STRING_32, CHARACTER_32].
			create cc
			l_type := cc.generating_type
			assert ("not_void5", l_type /= Void )
			assert ("type5", l_type.same_type ({detachable CC [STRING_32, CHARACTER_32]}))
			assert_equal ("value5", {detachable CC [STRING_32, CHARACTER_32]}, l_type)
				-- SPECIAL [BOOLEAN].
			create sp.make_filled (True, 2)
			l_type := sp.generating_type
			assert ("not_void6", l_type /= Void )
			assert ("type6", l_type.same_type ({detachable SPECIAL [BOOLEAN]}))
			assert_equal ("value6", {detachable SPECIAL [BOOLEAN]}, l_type)
		end

	test_same_type
			-- Test feature 'same_type'.
		local
			s1, s2: STRING
			i1, i2: INTEGER
			bb1, bb2: BB [STRING]
			bb3: BB [ANY]
			sp1, sp2: SPECIAL [STRING]
			sp3: SPECIAL [INTEGER]
		do
			s1 := "gobo"
			s2 := "foo"
			assert ("same1", s1.same_type (s2))
			assert ("same2", s2.same_type (s1))
			assert ("same3", s1.same_type (s1))
			i1 := 5
			i2 := 6
			-- INTEGER is converter to an INTEGER_REF.
			-- assert ("same4", i1.same_type (i2))
			-- assert ("same5", i2.same_type (i1))
			-- assert ("same6", i1.same_type (i1))
			assert ("not_same1", not i1.same_type (s1))
			create bb1
			create bb2
			assert ("same7", bb1.same_type (bb2))
			assert ("same8", bb2.same_type (bb1))
			assert ("same9", bb1.same_type (bb1))
			create bb3
			assert ("same10", bb3.same_type (bb3))
			assert ("not_same2", not bb3.same_type (bb1))
			assert ("not_same3", not bb3.same_type (s1))
			create sp1.make_filled ("gobo", 2)
			create sp2.make_filled ("eiffel", 2)
			assert ("same11", sp1.same_type (sp2))
			assert ("same12", sp2.same_type (sp1))
			assert ("same13", sp1.same_type (sp1))
			create sp3.make_filled (0, 2)
			assert ("same14", sp3.same_type (sp3))
			assert ("not_same4", not sp3.same_type (sp1))
			assert ("not_same5", not sp3.same_type (s1))
		end

	test_conforms_to
			-- Test feature 'conforms_to'.
		local
			s1, s2: STRING
			i1, i2: INTEGER
			bb1, bb2: BB [STRING]
			bb3: BB [ANY]
			sp1, sp2: SPECIAL [STRING]
			sp3: SPECIAL [INTEGER]
			sp4: SPECIAL [ANY]
		do
			s1 := "gobo"
			s2 := "foo"
			assert ("conforms1", s1.conforms_to (s2))
			assert ("conforms2", s2.conforms_to (s1))
			assert ("conforms3", s1.conforms_to (s1))
			i1 := 5
			i2 := 6
			-- INTEGER is converter to an INTEGER_REF.
			-- assert ("conforms4", i1.conforms_to (i2))
			-- assert ("conforms5", i2.conforms_to (i1))
			-- assert ("conforms6", i1.conforms_to (i1))
			assert ("not_conforms1", not i1.conforms_to (s1))
			create bb1
			create bb2
			assert ("conforms7", bb1.conforms_to (bb2))
			assert ("conforms8", bb2.conforms_to (bb1))
			assert ("conforms9", bb1.conforms_to (bb1))
			create bb3
			assert ("conforms10", bb3.conforms_to (bb3))
			assert ("conforms11", bb1.conforms_to (bb3))
			assert ("not_conforms2", not bb3.conforms_to (bb1))
			assert ("not_conforms3", not bb3.conforms_to (s1))
			create sp1.make_filled ("gobo", 2)
			create sp2.make_filled ("eiffel", 2)
			assert ("conforms12", sp1.conforms_to (sp2))
			assert ("conforms13", sp2.conforms_to (sp1))
			assert ("conforms14", sp1.conforms_to (sp1))
			create sp3.make_filled (5, 2)
			assert ("conforms15", sp3.conforms_to (sp3))
			assert ("not_conforms4", not sp1.conforms_to (sp3))
			assert ("not_conforms5", not sp3.conforms_to (sp1))
			assert ("not_conforms6", not sp3.conforms_to (s1))
			create sp4.make_filled ("foo", 2)
			assert ("conforms16", sp4.conforms_to (sp4))
			assert ("conforms17", sp1.conforms_to (sp4))
			assert ("not_conforms7", not sp4.conforms_to (sp1))
			assert ("not_conforms8", not sp4.conforms_to (s1))
		end

	test_is_equal
			-- Test feature 'is_equal'.
		local
			s1, s2, s3: STRING
			i1, i2, i3: INTEGER
			sp1, sp2: SPECIAL [INTEGER]
			aa1, aa2: AA
		do
			s1 := "gobo"
			s2 := "gobo"
			s3 := "foo"
			assert ("equal1", s1.is_equal (s2))
			assert ("equal2", s2.is_equal (s1))
			assert ("equal3", s1.is_equal (s1))
			assert ("not_equal1", not s1.is_equal (s3))
			assert ("not_equal2", not s3.is_equal (s1))
			i1 := 5
			i2 := 5
			i3 := 6
			assert ("equal4", i1.is_equal (i2))
			assert ("equal5", i2.is_equal (i1))
			assert ("equal6", i1.is_equal (i1))
			assert ("not_equal3", not i1.is_equal (i3))
			assert ("not_equal4", not i3.is_equal (i1))
			create sp1.make_filled (0, 2)
			create sp2.make_filled (0, 2)
			assert ("equal7", sp1.is_equal (sp1))
			assert ("equal8", sp1.is_equal (sp2))
			assert ("equal9", sp2.is_equal (sp1))
			sp2.put (5, 0)
			assert ("not_equal5", not sp1.is_equal (sp2))
			assert ("not_equal6", not sp2.is_equal (sp1))
			create aa1
			create aa2
			assert ("equal10", aa1.is_equal (aa1))
			assert ("equal11", aa1.is_equal (aa2))
			assert ("equal12", aa2.is_equal (aa1))
			aa2.set_foo (4)
			assert ("not_equal7", not aa1.is_equal (aa2))
			assert ("not_equal8", not aa2.is_equal (aa1))
		end

	test_equal
			-- Test feature 'equal'.
		local
			s1, s2, s3: STRING
			sp1, sp2: SPECIAL [INTEGER]
			aa1, aa2: AA
			bbsi: BB [SPECIAL [INTEGER]]
		do
			s1 := "gobo"
			s2 := "gobo"
			s3 := "foo"
			assert ("equal1", s1.equal (s1, s2))
			assert ("equal2", s1.equal (s2, s1))
			assert ("equal3", s1.equal (s1, s1))
			assert ("not_equal1", not s1.equal (s1, s3))
			assert ("not_equal2", not s1.equal (s3, s1))
			assert ("equal4", equal (Void, Void))
			assert ("not_equal3", not s1.equal (s1, Void))
			create sp1.make_filled (0, 2)
			create sp2.make_filled (0, 2)
			create bbsi
			assert ("equal5", bbsi.equal (sp1, sp1))
			assert ("equal6", bbsi.equal (sp1, sp2))
			assert ("equal7", bbsi.equal (sp2, sp1))
			sp2.put (5, 0)
			assert ("not_equal4", not bbsi.equal (sp1, sp2))
			assert ("not_equal5", not bbsi.equal (sp2, sp1))
			create aa1
			create aa2
			assert ("equal8", aa1.equal (aa1, aa1))
			assert ("equal9", aa1.equal (aa1, aa2))
			assert ("equal10", aa1.equal (aa2, aa1))
			aa2.set_foo (4)
			assert ("not_equal6", not aa1.equal (aa1, aa2))
			assert ("not_equal7", not aa1.equal (aa2, aa1))
		end

	test_standard_is_equal
			-- Test feature 'standard_is_equal'.
		local
			s1, s2, s3: STRING
			sp1, sp2: SPECIAL [INTEGER]
			aa1, aa2: AA
		do
			s1 := "gobo"
			s2 := "gobo"
			s3 := "foo"
			assert ("equal1", s1.standard_is_equal (s1))
			assert ("not_equal1", not s2.standard_is_equal (s1))
			assert ("not_equal2", not s1.standard_is_equal (s2))
			assert ("not_equal3", not s1.standard_is_equal (s3))
			assert ("not_equal4", not s3.standard_is_equal (s1))
			create sp1.make_filled (0, 2)
			create sp2.make_filled (0, 2)
			assert ("equal5", sp1.standard_is_equal (sp1))
			assert ("equal6", sp1.standard_is_equal (sp2))
			assert ("equal7", sp2.standard_is_equal (sp1))
			sp2.put (5, 0)
			assert ("not_equal7", not sp1.standard_is_equal (sp2))
			assert ("not_equal8", not sp2.standard_is_equal (sp1))
			create aa1
			create aa2
			assert ("equal8", aa1.standard_is_equal (aa1))
			assert ("equal9", aa1.standard_is_equal (aa2))
			assert ("equal10", aa2.standard_is_equal (aa1))
			aa2.set_foo (4)
			assert ("not_equal9", not aa1.standard_is_equal (aa2))
			assert ("not_equal10", not aa2.standard_is_equal (aa1))
		end

	test_standard_is_equal___fail_ise
			-- Test feature 'standard_is_equal'.
			-- Does not work with ISE Eiffel.
		local
			i1, i2, i3: INTEGER
		do
			if not eiffel_compiler.is_ise then
				i1 := 5
				i2 := 5
				i3 := 6
				assert ("equal2", i1.standard_is_equal (i2))
				assert ("equal3", i2.standard_is_equal (i1))
				assert ("equal4", i1.standard_is_equal (i1))
				assert ("not_equal5", not i1.standard_is_equal (i3))
				assert ("not_equal6", not i3.standard_is_equal (i1))
			end
		end

	test_standard_equal
			-- Test feature 'standard_equal'.
		local
			s1, s2, s3: STRING
			sp1, sp2: SPECIAL [INTEGER]
			aa1, aa2: AA
		do
			s1 := "gobo"
			s2 := "gobo"
			s3 := "foo"
			assert ("equal1", s1.standard_equal (s1, s1))
			assert ("not_equal1", not s1.standard_equal (s2, s1))
			assert ("not_equal2", not s1.standard_equal (s1, s2))
			assert ("not_equal3", not s1.standard_equal (s1, s3))
			assert ("not_equal4", not s1.standard_equal (s3, s1))
			assert ("equal2", standard_equal (Void, Void))
			assert ("not_equal5", not s1.standard_equal (s1, Void))
			create sp1.make_filled (0, 2)
			create sp2.make_filled (0, 2)
			assert ("equal3", sp1.standard_equal (sp1, sp1))
			assert ("equal4", sp1.standard_equal (sp1, sp2))
			assert ("equal5", sp1.standard_equal (sp2, sp1))
			sp2.put (5, 0)
			assert ("not_equal6", not sp1.standard_equal (sp1, sp2))
			assert ("not_equal7", not sp1.standard_equal (sp2, sp1))
			create aa1
			create aa2
			assert ("equal6", aa1.standard_equal (aa1, aa1))
			assert ("equal7", aa1.standard_equal (aa1, aa2))
			assert ("equal8", aa1.standard_equal (aa2, aa1))
			aa2.set_foo (4)
			assert ("not_equal8", not aa1.standard_equal (aa1, aa2))
			assert ("not_equal9", not aa1.standard_equal (aa2, aa1))
		end

	test_twin_1
			-- Test feature 'twin'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			s2 := s1.twin
			assert ("not_void", s2 /= Void)
			assert_equal ("value", "gobo", s2)
			assert ("not_same_area", s2.area /= s1.area)
			assert ("cloned", s2 /= s1)
		end

	test_twin_2
			-- Test feature 'twin'.
		local
			i1, i2: INTEGER
		do
			i1 := 5
			i2 := i1.twin
			assert ("value", i2 = 5)
		end

	test_twin_3
			-- Test feature 'twin'.
		local
			sp1, sp2: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			sp2 := sp1.twin
			assert ("not_void", sp2 /= Void)
			assert ("sp_count", sp2.count = 2)
			assert ("sp_item0", sp2.item (0) = 2)
			assert ("sp_item1", sp2.item (1) = 5)
			assert ("cloned", sp2 /= sp1)
		end

	test_twin_4
			-- Test feature 'twin'.
		local
			aa1, aa2: AA
		do
			create aa1
			aa1.set_foo (5)
			aa2 := aa1.twin
			assert ("not_void", aa2 /= Void)
			assert ("value", aa2.foo = 5)
			assert ("cloned", aa2 /= aa1)
		end

	test_twin_5
			-- Test feature 'twin'.
			-- Shows that the new object is created with
			-- default initialization before calling 'copy'.
		local
			ff1,ff2: FF
		do
			create ff1
			ff1.set_foo (15)
			ff1.set_bar (25)
			ff1.set_copy_count (5)
			ff2 := ff1.twin
			assert ("not_void", ff2 /= Void)
			assert ("cloned", ff2 /= ff1)
			assert ("foo", ff2.foo = 15)
			assert ("bar", ff2.bar = 0)
			assert ("copy_count", ff2.copy_count = 1)
		end

	test_copy_1
			-- Test feature 'copy'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			create s2.make (10)
			s2.copy (s1)
			assert_equal ("value", "gobo", s2)
			assert ("not_same_area", s2.area /= s1.area)
		end

	test_copy_2
			-- Test feature 'copy'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			create s2.make (2)
			s2.copy (s1)
			assert_equal ("value", "gobo", s2)
			assert ("not_same_area", s2.area /= s1.area)
		end

	test_copy_3
			-- Test feature 'copy'.
			-- Copy SPECIALs of the same size.
		local
			sp1, sp2: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 2)
			sp2.copy (sp1)
			assert_integers_equal ("sp_count", 2, sp2.count)
			assert_integers_equal ("sp_item0", 2, sp2.item (0))
			assert_integers_equal ("sp_item1", 5, sp2.item (1))
		end

	test_copy_4
			-- Test feature 'copy'.
			-- Copy object with basic expanded attribute.
		local
			aa1, aa2: AA
		do
			create aa1
			aa1.set_foo (5)
			create aa2
			aa2.copy (aa1)
			assert_integers_equal ("value7", 5, aa2.foo)
		end

	test_copy_5
			-- Test feature 'copy'.
			-- Copy object with expanded attribute whose
			-- 'copy' routine has been redefined. This redefined
			-- version of 'copy' is not called, 'standard_copy'
			-- is used instead.
			-- Does not work with ISE Eiffel.
		local
			xx1, xx2: XX
		do
			if not eiffel_compiler.is_ise then
				create xx1
				xx1.set_z_attr (5)
				assert_integers_equal ("xx1_value", 5, xx1.z.attr)
				create xx2
				xx2.set_z_attr (10)
				assert_integers_equal ("xx2_copy_count_0", 0, xx2.z.copy_count)
				xx2.copy (xx1)
				assert_integers_equal ("xx2_value", 5, xx2.z.attr)
				assert_integers_equal ("xx2_copy_count_1", 1, xx2.z.copy_count)
				assert_integers_equal ("xx1_copy_count_0", 0, xx1.z.copy_count)
			end
		end

	test_copy_6
			-- Test feature 'copy'.
			-- Copy tuple with expanded item whose
			-- 'copy' routine has been redefined.
			-- Does not work with ISE Eiffel.
		local
			t1, t2: TUPLE [z: ZZ]
			z: ZZ
		do
			if not eiffel_compiler.is_ise then
				z.set_attr (5)
				z.set_copy_count (25)
				t1 := [z]
				assert_integers_equal ("t1_value_1", 5, t1.z.attr)
				z.set_attr (10)
				z.set_copy_count (25)
				t2 := [z]
				assert_integers_equal ("t2_value_1", 10, t2.z.attr)
				t2.copy (t1)
				assert_integers_equal ("t2_value_2", 5, t2.z.attr)
				assert_integers_equal ("t2_copy_count_2", 1, t2.z.copy_count)
			end
		end

	test_copy_7
			-- Test feature 'copy'.
			-- Does not work with ISE Eiffel.
		local
			i1, i2: INTEGER
		do
			if not eiffel_compiler.is_ise then
				i1 := 5
				i2.copy (i1)
				assert ("value", i2 = 5)
			end
		end

	test_copy_8
			-- Test feature 'copy'.
		local
			sp1, sp2: SPECIAL [INTEGER]
			b: BOOLEAN
		do
				-- `sp2' has more items than `sp1'.
				-- All items of `sp1' will be copied to `sp2'.
				-- The other items in `sp2' will not be changed.
				-- The 'count' and 'capacity' in `sp2' will not change.
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 4)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp2.copy (sp1)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp2_count", 4, sp2.count)
			assert_integers_equal ("sp2_item0", 2, sp2.item (0))
			assert_integers_equal ("sp2_item1", 5, sp2.item (1))
			assert_integers_equal ("sp2_item2", 0, sp2.item (2))
			assert_integers_equal ("sp2_item3", 0, sp2.item (3))
		end

	test_copy_9
			-- Test feature 'copy'.
		local
			sp1, sp2: SPECIAL [INTEGER]
			b: BOOLEAN
		do
				-- `sp2' has less items than `sp1'.
				-- All items of `sp2' will be replaced by the first items in `sp1'.
				-- The 'count' and 'capacity' in `sp2' will not change.
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 1)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp2.copy (sp1)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp2_count", 1, sp2.count)
			assert_integers_equal ("sp2_item0", 2, sp2.item (0))
		end

	test_standard_twin_1
			-- Test feature 'standard_twin'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			s2 := s1.standard_twin
			assert ("not_void", s2 /= Void)
			assert_equal ("value", "gobo", s2)
			assert ("same_area", s2.area = s1.area)
			assert ("cloned", s2 /= s1)
		end

	test_standard_twin_2
			-- Test feature 'standard_twin'.
		local
			i1, i2: INTEGER
		do
			i1 := 5
			i2 := i1.standard_twin
			assert_integers_equal ("value", 5, i2)
		end

	test_standard_twin_3
			-- Test feature 'standard_twin'.
		local
			sp1, sp2: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			sp2 := sp1.standard_twin
			assert ("not_void", sp2 /= Void)
			assert ("sp_count", sp2.count = 2)
			assert ("sp_item0_", sp2.item (0) = 2)
			assert ("sp_item1_", sp2.item (1) = 5)
			assert ("cloned", sp2 /= sp1)
		end

	test_standard_twin_4
			-- Test feature 'standard_twin'.
		local
			aa1, aa2: AA
		do
			create aa1
			aa1.set_foo (5)
			aa2 := aa1.standard_twin
			assert ("not_void", aa2 /= Void)
			assert ("value", aa2.foo = 5)
			assert ("cloned", aa2 /= aa1)
		end

	test_standard_copy_1
			-- Test feature 'standard_copy'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			create s2.make (10)
			s2.standard_copy (s1)
			assert_equal ("value", "gobo", s2)
			assert ("same_area", s2.area = s1.area)
		end

	test_standard_copy_2
			-- Test feature 'standard_copy'.
		local
			s1, s2: STRING
		do
			s1 := "gobo"
			create s2.make (2)
			s2.standard_copy (s1)
			assert_equal ("value", "gobo", s2)
			assert ("same_area", s2.area = s1.area)
		end

	test_standard_copy_3
			-- Test feature 'standard_copy'.
			-- Copy SPECIALs of the same size.
		local
			sp1, sp2: SPECIAL [INTEGER]
		do
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 2)
			sp2.standard_copy (sp1)
			assert_integers_equal ("sp_count", 2, sp2.count)
			assert_integers_equal ("sp_item0", 2, sp2.item (0))
			assert_integers_equal ("sp_item1", 5, sp2.item (1))
		end

	test_standard_copy_4
			-- Test feature 'standard_copy'.
			-- Copy object with basic expanded attribute.
		local
			aa1, aa2: AA
		do
			create aa1
			aa1.set_foo (5)
			create aa2
			aa2.standard_copy (aa1)
			assert_integers_equal ("value", 5, aa2.foo)
		end

	test_standard_copy_5
			-- Test feature 'standard_copy'.
			-- Copy object with expanded attribute whose
			-- 'copy' routine has been redefined.
			-- Does not work with ISE Eiffel.
		local
			xx1, xx2: XX
		do
			if not eiffel_compiler.is_ise then
				create xx1
				xx1.set_z_attr (5)
				assert_integers_equal ("xx1_value_1", 5, xx1.z.attr)
				assert_integers_equal ("xx1_copy_count_1", 0, xx1.z.copy_count)
				create xx2
				xx2.set_z_attr (10)
				assert_integers_equal ("xx2_value_1", 10, xx2.z.attr)
				assert_integers_equal ("xx2_copy_count_1", 0, xx2.z.copy_count)
				xx2.standard_copy (xx1)
				assert_integers_equal ("xx2_value_2", 5, xx2.z.attr)
				assert_integers_equal ("xx2_copy_count_2", 1, xx2.z.copy_count)
				assert_integers_equal ("xx1_value_2", 5, xx1.z.attr)
				assert_integers_equal ("xx1_copy_count_2", 0, xx1.z.copy_count)
			end
		end

	test_standard_copy_6
			-- Test feature 'standard_copy'.
			-- Copy tuple with expanded item whose
			-- 'copy' routine has been redefined.
			-- Does not work with ISE Eiffel.
		local
			t1, t2: TUPLE [z: ZZ]
			z: ZZ
		do
			if not eiffel_compiler.is_ise then
				z.set_attr (5)
				z.set_copy_count (25)
				t1 := [z]
				assert_integers_equal ("t1_value_1", 5, t1.z.attr)
				z.set_attr (10)
				z.set_copy_count (25)
				t2 := [z]
				assert_integers_equal ("t2_value_1", 10, t2.z.attr)
				t2.standard_copy (t1)
				assert_integers_equal ("t2_value_2", 5, t2.z.attr)
				assert_integers_equal ("t2_copy_count_2", 1, t2.z.copy_count)
			end
		end

	test_standard_copy_7
			-- Test feature 'standard_copy'.
			-- Does not work with ISE Eiffel.
		local
			i1, i2: INTEGER
		do
			if not eiffel_compiler.is_ise then
				i1 := 5
				i2.standard_copy (i1)
				assert ("value", i2 = 5)
			end
		end

	test_standard_copy_8
			-- Test feature 'standard_copy'.
		local
			sp1, sp2: SPECIAL [INTEGER]
			b: BOOLEAN
		do
				-- `sp2' has more items than `sp1'.
				-- All items of `sp1' will be copied to `sp2'.
				-- The other items in `sp2' will not be changed.
				-- The 'count' and 'capacity' in `sp2' will not change.
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 4)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp2.standard_copy (sp1)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp2_count", 4, sp2.count)
			assert_integers_equal ("sp2_item0", 2, sp2.item (0))
			assert_integers_equal ("sp2_item1", 5, sp2.item (1))
			assert_integers_equal ("sp2_item2", 0, sp2.item (2))
			assert_integers_equal ("sp2_item3", 0, sp2.item (3))
		end

	test_standard_copy_9
			-- Test feature 'standard_copy'.
		local
			sp1, sp2: SPECIAL [INTEGER]
			b: BOOLEAN
		do
				-- `sp2' has less items than `sp1'.
				-- All items of `sp2' will be replaced by the first items in `sp1'.
				-- The 'count' and 'capacity' in `sp2' will not change.
			create sp1.make_filled (0, 2)
			sp1.put (2, 0)
			sp1.put (5, 1)
			create sp2.make_filled (0, 1)
				-- The following call to 'copy' violates its
				-- postcondition "is_equal".
			b := {ISE_RUNTIME}.check_assert (False)
			sp2.standard_copy (sp1)
			b := {ISE_RUNTIME}.check_assert (b)
			assert_integers_equal ("sp2_count", 1, sp2.count)
			assert_integers_equal ("sp2_item0", 2, sp2.item (0))
		end

	test_out
			-- Test feature 'out'.
		local
			l_out: STRING
			s: STRING
			i1: INTEGER
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
			sp3: SPECIAL [SPECIAL [INTEGER]]
			aa: AA
			bb1: BB [CHARACTER]
			bb2: BB [BOOLEAN]
			bb3: BB [DOUBLE]
			bb4: BB [POINTER]
		do
			s := "gobo"
			l_out := s.out
			assert ("not_void1", l_out /= Void )
			assert ("type1", l_out.same_type (""))
			assert_equal ("value1", "gobo", l_out)
			assert ("new_object1", l_out /= s.out)
			i1 := 15
			l_out := i1.out
			assert ("not_void2", l_out /= Void )
			assert ("type2", l_out.same_type (""))
			assert_equal ("value2", "15", l_out)
			assert ("new_object2", l_out /= i1.out)
			create sp1.make_filled (0, 2)
			sp1.put (5, 0)
			sp1.put (6, 1)
			l_out := sp1.out
			assert ("not_void3", l_out /= Void )
			assert ("type3", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value3", "SPECIAL [INTEGER] [0x5]%N  0: INTEGER_32 = 5%N  1: INTEGER_32 = 6%N", normalized_addresses (l_out))
--			end
			assert ("new_object3", l_out /= sp1.out)
			create sp2.make_filled ("foo", 2)
			sp2.put ("gobo", 0)
			sp2.put ("bar", 1)
			l_out := sp2.out
			assert ("not_void4", l_out /= Void )
			assert ("type4", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value4", "SPECIAL [STRING] [0x5]%N  0: STRING [0x5]%N  1: STRING [0x5]%N", normalized_addresses (l_out))
--			end
			assert ("new_object4", l_out /= sp2.out)
			create sp3.make_filled (sp1, 2)
			l_out := sp3.out
			assert ("not_void5", l_out /= Void )
			assert ("type5", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value5", "SPECIAL [SPECIAL [INTEGER]] [0x5]%N  0: SPECIAL [INTEGER] [0x5]%N  1: SPECIAL [INTEGER] [0x5]%N", normalized_addresses (l_out))
--			end
			assert ("new_object5", l_out /= sp3.out)
			create aa
			aa.set_foo (5)
			l_out := aa.out
			assert ("not_void6", l_out /= Void )
			assert ("type6", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value6", "AA [0x5]%N  foo: INTEGER_32 = 5%N  bar: INTEGER_32 = 0%N", normalized_addresses (l_out))
--			end
			assert ("new_object6", l_out /= aa.out)
			create bb1
			bb1.set_item ('a')
			l_out := bb1.out
			assert ("not_void7", l_out /= Void )
			assert ("type7", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value7", "BB [0x5]%N  item: CHARACTER = 'a'%N", normalized_addresses (l_out))
--			end
			assert ("new_object7", l_out /= bb1.out)
			create bb2
			bb2.set_item (True)
			l_out := bb2.out
			assert ("not_void8", l_out /= Void )
			assert ("type8", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value8", "BB [0x5]%N  item: BOOLEAN = True%N", normalized_addresses (l_out))
--			end
			assert ("new_object8", l_out /= bb2.out)
			create bb3
			bb3.set_item (1.5)
			l_out := bb3.out
			assert ("not_void9", l_out /= Void )
			assert ("type9", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value9", "BB [0x5]%N  item: DOUBLE = 1.5%N", normalized_addresses (l_out))
--			end
			assert ("new_object9", l_out /= bb3.out)
			create bb4
			l_out := bb4.out
			assert ("not_void10", l_out /= Void )
			assert ("type10", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value10", "BB [0x5]%N  item: POINTER =  C pointer 0x0%N", normalized_addresses (l_out))
--			end
			assert ("new_object10", l_out /= bb4.out)
		end

	test_tagged_out
			-- Test feature 'tagged_out'.
		local
			l_out: STRING
			s: STRING
			i1: INTEGER
			sp1: SPECIAL [INTEGER]
			sp2: SPECIAL [STRING]
			sp3: SPECIAL [SPECIAL [INTEGER]]
			aa: AA
			bb1: BB [CHARACTER]
			bb2: BB [BOOLEAN]
			bb3: BB [DOUBLE]
			bb4: BB [POINTER]
		do
			s := "g"
			l_out := s.tagged_out
			assert ("not_void1", l_out /= Void )
			assert ("type1", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value1", "STRING [0x5]%N  area: SPECIAL [CHARACTER] [0x5]%N    -- begin special object --%N        0: CHARACTER = 'g'%N        1: CHARACTER = Ctrl-@%N    -- end special object --%N  object_comparison: BOOLEAN = False%N  internal_hash_code: INTEGER_32 = 0%N  count: INTEGER_32 = 1%N", normalized_addresses (l_out))
--			end
			assert ("new_object1", l_out /= s.tagged_out)
			i1 := 15
			l_out := i1.tagged_out
			assert ("not_void2", l_out /= Void )
			assert ("type2", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value2", "INTEGER_REF [0x5]%N  item: INTEGER_32 = 15%N", normalized_addresses (l_out))
--			end
			assert ("new_object2", l_out /= i1.tagged_out)
			create sp1.make_filled (0, 2)
			sp1.put (5, 0)
			sp1.put (6, 1)
			l_out := sp1.tagged_out
			assert ("not_void3", l_out /= Void )
			assert ("type3", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value3", "SPECIAL [INTEGER] [0x5]%N  0: INTEGER_32 = 5%N  1: INTEGER_32 = 6%N", normalized_addresses (l_out))
--			end
			assert ("new_object3", l_out /= sp1.tagged_out)
			create sp2.make_filled ("foo", 2)
			sp2.put ("gobo", 0)
			sp2.put ("bar", 1)
			l_out := sp2.tagged_out
			assert ("not_void4", l_out /= Void )
			assert ("type4", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value4", "SPECIAL [STRING] [0x5]%N  0: STRING [0x5]%N  1: STRING [0x5]%N", normalized_addresses (l_out))
--			end
			assert ("new_object4", l_out /= sp2.tagged_out)
			create sp3.make_filled (sp1, 2)
			l_out := sp3.tagged_out
			assert ("not_void5", l_out /= Void )
			assert ("type5", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value5", "SPECIAL [SPECIAL [INTEGER]] [0x5]%N  0: SPECIAL [INTEGER] [0x5]%N  1: SPECIAL [INTEGER] [0x5]%N", normalized_addresses (l_out))
--			end
			assert ("new_object5", l_out /= sp3.tagged_out)
			create aa
			aa.set_foo (5)
			l_out := aa.tagged_out
			assert ("not_void6", l_out /= Void )
			assert ("type6", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value6", "AA [0x5]%N  foo: INTEGER_32 = 5%N  bar: INTEGER_32 = 0%N", normalized_addresses (l_out))
--			end
			assert ("new_object6", l_out /= aa.tagged_out)
			create bb1
			bb1.set_item ('a')
			l_out := bb1.tagged_out
			assert ("not_void7", l_out /= Void )
			assert ("type7", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value7", "BB [0x5]%N  item: CHARACTER = 'a'%N", normalized_addresses (l_out))
--			end
			assert ("new_object7", l_out /= bb1.tagged_out)
			create bb2
			bb2.set_item (True)
			l_out := bb2.tagged_out
			assert ("not_void8", l_out /= Void )
			assert ("type8", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value8", "BB [0x5]%N  item: BOOLEAN = True%N", normalized_addresses (l_out))
--			end
			assert ("new_object8", l_out /= bb2.tagged_out)
			create bb3
			bb3.set_item (1.5)
			l_out := bb3.tagged_out
			assert ("not_void9", l_out /= Void )
			assert ("type9", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value9", "BB [0x5]%N  item: DOUBLE = 1.5%N", normalized_addresses (l_out))
--			end
			assert ("new_object9", l_out /= bb3.tagged_out)
			create bb4
			l_out := bb4.tagged_out
			assert ("not_void10", l_out /= Void )
			assert ("type10", l_out.same_type (""))
--			if eiffel_compiler.is_ise then
--				assert_equal ("value10", "BB [0x5]%N  item: POINTER =  C pointer 0x0%N", normalized_addresses (l_out))
--			end
			assert ("new_object10", l_out /= bb4.tagged_out)
		end

	test_default
			-- Test feature 'default'.
		local
			s: STRING
			i: INTEGER
			sp: SPECIAL [INTEGER]
			aa: AA
			p: POINTER
			c: CHARACTER
			b: BOOLEAN
		do
			assert ("defaut1", default = Void)
			s := "gobo"
			assert ("defaut2", s.default = Void)
			i := 5
			assert_integers_equal ("defaut3", 0, i.default)
			create sp.make_filled (0, 2)
			assert ("defaut4", sp.default = Void)
			create aa
			assert ("defaut5", aa.default = Void)
			assert ("defaut6", p.default = p)
			assert ("defaut7", c.default = '%U')
			assert ("defaut8", b.default = False)
		end

	test_default_pointer
			-- Test feature 'default_pointer'.
		local
			p: POINTER
		do
			assert ("null", default_pointer = p)
			assert ("default", default_pointer = p.default)
		end

	test_default_create
			-- Test feature 'default_create'.
		do
			default_create
		end

	test_default_rescue
			-- Test feature 'default_rescue'.
		do
			default_rescue
		end

	test_do_nothing
			-- Test feature 'do_nothing'.
		local
			s: STRING
			aa: AA
		do
			do_nothing
			s := "gobo"
			s.do_nothing
			create aa
			aa.do_nothing
		end

feature {NONE} -- Implementation

	normalized_addresses (s: STRING): STRING
			-- Clone of `s' where all addresses of the
			-- form [0xCB52D0] are replaced by [0x5]
		require
			s_not_void: s /= Void
		local
			i, j, nb: INTEGER
			l_state: INTEGER
			c: CHARACTER
		do
			Result := s.twin
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				inspect l_state
				when 0 then
					j := j + 1
					Result.put (c, j)
					if c = '[' then
						l_state := 1
					end
				when 1 then
					j := j + 1
					Result.put (c, j)
					if c = '0' then
						l_state := 2
					else
						l_state := 0
					end
				when 2 then
					j := j + 1
					Result.put (c, j)
					if c = 'x' then
						j := j + 1
						Result.put ('5', j)
						l_state := 3
					else
						l_state := 0
					end
				when 3 then
					if c = ']' then
						j := j + 1
						Result.put (c, j)
						l_state := 0
					end
				else
					j := j + 1
					Result.put (c, j)
				end
				i := i + 1
			end
			Result.keep_head (j)
		ensure
			normalized_addresses_not_void: Result /= Void
		end

end
