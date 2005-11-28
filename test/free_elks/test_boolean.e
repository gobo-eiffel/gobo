indexing

	description:

		"Test features of class BOOLEAN"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_BOOLEAN

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_default_create
			test_out
			test_item
			test_set_item___fail_ise
			test_is_hashable
			test_hash_code
			test_to_integer
			test_to_reference
			test_make_from_reference___fail_ise
			test_infix_and
			test_infix_and_then
			test_infix_or
			test_infix_or_else
			test_infix_xor
			test_infix_implies
			test_prefix_not
			test_convert
		end

	test_default_create is
			-- Test feature `default_create'
		local
			b: BOOLEAN
		do
			assert ("default", b = False)
		end

	test_out is
			-- Test feature `out'.
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

	test_item is
			-- Test feature `item'.
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

	test_set_item___fail_ise is
			-- Test feature `set_item'.
			-- Does not work with ISE Eiffel.
		local
			b: BOOLEAN
		do
			b.set_item (True)
			assert ("item1", b = True)
			b.set_item (False)
			assert ("item2", b = False)
				-- We get a new "True" at each call (it's an expanded type).
				-- So setting the `item' of one occurrence of `True' does not
				-- change the `item' of the next occurrence of `True'.
			(True).set_item (False)
			assert ("item3", (True).item = True)
				-- Setting the `item' of the result of a function does not
				-- set the `item' of the result of the next call of this
				-- function.
			(True or False).set_item (False)
			assert ("item4", (True or False).item = True)
		end

	test_is_hashable is
			-- Test feature `is_hashable'.
		local
			b: BOOLEAN
		do
			b := True
			assert ("hashable", b.is_hashable)
			b := False
			assert ("not_hashable", not b.is_hashable)
		end

	test_hash_code is
			-- Test feature `hash_code'.
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

	test_to_integer is
			-- Test feature `to_integer'.
		local
			b: BOOLEAN
		do
			b := True
			assert_integers_equal ("to_integer1", 1, b.to_integer)
			b := False
			assert_integers_equal ("to_integer2", 0, b.to_integer)
		end

	test_to_reference is
			-- Test feature `to_reference'.
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

	test_make_from_reference___fail_ise is
			-- Test feature `make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			b: BOOLEAN
			bref: BOOLEAN_REF
		do
			create bref
			bref.set_item (True)
			create b.make_from_reference (bref)
			assert ("item1", b = True)
			create bref
			bref.set_item (False)
			create b.make_from_reference (bref)
			assert ("item2", b = False)
		end

	test_infix_and is
			-- Test feature `infix "and"'.
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

	test_infix_and_then is
			-- Test feature `infix "and then"'.
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

	test_infix_or is
			-- Test feature `infix "or"'.
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

	test_infix_or_else is
			-- Test feature `infix "or else"'.
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

	test_infix_xor is
			-- Test feature `infix "xor"'.
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

	test_infix_implies is
			-- Test feature `infix "implies"'.
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

	test_prefix_not is
			-- Test feature `prefix "not"'.
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

	test_convert is
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
