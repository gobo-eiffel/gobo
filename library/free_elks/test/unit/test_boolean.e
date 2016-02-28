note

	description:

		"Test features of class BOOLEAN"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BOOLEAN

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_default_create
			-- Test feature 'default_create'.
		local
			b: BOOLEAN
		do
			assert ("default", b = False)
		end

	test_out
			-- Test feature 'out'.
		local
			b: BOOLEAN
			l_out: STRING
		do
			b := True
			l_out := b.out
			assert ("not_void1", l_out /= Void)
			assert ("string_type1", l_out.same_type (""))
			assert_equal ("true", "True", l_out)
			assert ("new_string1", l_out /= b.out)
			b := False
			l_out := b.out
			assert ("not_void2", l_out /= Void)
			assert ("string_type2", l_out.same_type (""))
			assert_equal ("false", "False", l_out)
			assert ("new_string2", l_out /= b.out)
		end

	test_item
			-- Test feature 'item'.
		local
			b: BOOLEAN
		do
			b := True
			assert ("item1", b.item = True)
			b := False
			assert ("item2", b.item = False)
			assert ("item3", (False).item = False)
			assert ("item4", (True).item = True)
		end

	test_set_item___fail_ise
			-- Test feature 'set_item'.
			-- Does not work with ISE Eiffel.
		local
			b: BOOLEAN
		do
			if not eiffel_compiler.is_ise then
				b.set_item (True)
				assert ("item1", b = True)
				b.set_item (False)
				assert ("item2", b = False)
					-- We get a new "True" at each call (it's an expanded type).
					-- So setting the 'item' of one occurrence of "True" does not
					-- change the 'item' of the next occurrence of "True".
				(True).set_item (False)
				assert ("item3", (True).item = True)
					-- Setting the 'item' of the result of a function does not
					-- set the 'item' of the result of the next call of this
					-- function.
				(True or False).set_item (False)
				assert ("item4", (True or False).item = True)
			end
		end

	test_is_hashable
			-- Test feature 'is_hashable'.
		local
			b: BOOLEAN
		do
			b := True
			assert ("true_hashable", b.is_hashable)
			b := False
			assert ("false_hashable", b.is_hashable)
		end

	test_hash_code
			-- Test feature 'hash_code'.
		local
			b1, b2: BOOLEAN
		do
			b1 := True
			b2 := True
			assert ("hash_code1", b1.hash_code = b2.hash_code)
			b1 := False
			b2 := False
			assert ("hash_code2", b1.hash_code = b2.hash_code)
		end

	test_to_integer
			-- Test feature 'to_integer'.
		local
			b: BOOLEAN
		do
			b := True
			assert_integers_equal ("to_integer1", 1, b.to_integer)
			b := False
			assert_integers_equal ("to_integer2", 0, b.to_integer)
		end

	test_to_reference
			-- Test feature 'to_reference'.
		local
			b: BOOLEAN
			bref: BOOLEAN_REF
		do
			b := True
			bref := b.to_reference
			assert ("not_void1", bref /= Void)
			assert ("item1", bref.item = True)
			b := False
			bref := b.to_reference
			assert ("not_void2", bref /= Void)
			assert ("item2", bref.item = False)
		end

	test_make_from_reference___fail_ise
			-- Test feature 'make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			b: BOOLEAN
			bref: BOOLEAN_REF
		do
			if not eiffel_compiler.is_ise then
				create bref
				bref.set_item (True)
				create b.make_from_reference (bref)
				assert ("item1", b = True)
				create bref
				bref.set_item (False)
				create b.make_from_reference (bref)
				assert ("item2", b = False)
			end
		end

	test_conjuncted
			-- Test feature 'conjuncted alias "and"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 and b2
			assert ("and1", b3 = True)
			b1 := True
			b2 := False
			b3 := b1 and b2
			assert ("and2", b3 = False)
			b1 := False
			b2 := True
			b3 := b1 and b2
			assert ("and3", b3 = False)
			b1 := False
			b2 := False
			b3 := b1 and b2
			assert ("and4", b3 = False)
		end

	test_conjuncted_semistrict
			-- Test feature 'conjuncted_semistrict alias "and then"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 and then b2
			assert ("and_then1", b3 = True)
			b1 := True
			b2 := False
			b3 := b1 and then b2
			assert ("and_then2", b3 = False)
			b1 := False
			b2 := True
			b3 := b1 and then b2
			assert ("and_then3", b3 = False)
			b1 := False
			b2 := False
			b3 := b1 and then b2
			assert ("and_then4", b3 = False)
		end

	test_disjuncted
			-- Test feature 'disjuncted alias "or"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 or b2
			assert ("or1", b3 = True)
			b1 := True
			b2 := False
			b3 := b1 or b2
			assert ("or2", b3 = True)
			b1 := False
			b2 := True
			b3 := b1 or b2
			assert ("or3", b3 = True)
			b1 := False
			b2 := False
			b3 := b1 or b2
			assert ("or4", b3 = False)
		end

	test_disjuncted_semistrict
			-- Test feature 'disjuncted_semistrict alias "or else"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 or else b2
			assert ("or_else1", b3 = True)
			b1 := True
			b2 := False
			b3 := b1 or else b2
			assert ("or_else2", b3 = True)
			b1 := False
			b2 := True
			b3 := b1 or else b2
			assert ("or_else3", b3 = True)
			b1 := False
			b2 := False
			b3 := b1 or else b2
			assert ("or_else4", b3 = False)
		end

	test_disjuncted_exclusive
			-- Test feature 'disjuncted_exclusive alias "xor"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 xor b2
			assert ("xor1", b3 = False)
			b1 := True
			b2 := False
			b3 := b1 xor b2
			assert ("xor2", b3 = True)
			b1 := False
			b2 := True
			b3 := b1 xor b2
			assert ("xor3", b3 = True)
			b1 := False
			b2 := False
			b3 := b1 xor b2
			assert ("xor4", b3 = False)
		end

	test_implication
			-- Test feature 'implication alias "implies"'.
		local
			b1, b2, b3: BOOLEAN
		do
			b1 := True
			b2 := True
			b3 := b1 implies b2
			assert ("implies1", b3 = True)
			b1 := True
			b2 := False
			b3 := b1 implies b2
			assert ("implies2", b3 = False)
			b1 := False
			b2 := True
			b3 := b1 implies b2
			assert ("implies3", b3 = True)
			b1 := False
			b2 := False
			b3 := b1 implies b2
			assert ("implies4", b3 = True)
		end

	test_negated
			-- Test feature 'negated alias "not"'.
		local
			b1, b2: BOOLEAN
		do
			b1 := True
			b2 := not b1
			assert ("not1", b2 = False)
			b1 := False
			b2 := not b1
			assert ("not1", b2 = True)
		end

	test_convert
			-- Test conversion.
		local
			b: BOOLEAN
			bref: BOOLEAN_REF
		do
				-- Convert to.
			b := True
			bref := b
			assert ("not_void1", bref /= Void)
			assert ("item1", bref.item = True)
			b := False
			bref := b
			assert ("not_void2", bref /= Void)
			assert ("item2", bref.item = False)
				-- Convert from.
			create bref
			bref.set_item (True)
			b := bref
			assert ("item3", b = True)
			create bref
			bref.set_item (False)
			b := bref
			assert ("item4", b = False)
		end

end
