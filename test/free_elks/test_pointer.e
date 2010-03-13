indexing

	description:

		"Test features of class POINTER"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_POINTER

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_default_create is
			-- Test feature 'default_create'.
		local
			p: POINTER
		do
			assert ("default", p = pointer_0x0)
		end

	test_plus is
			-- Test feature 'plus alias "+"'.
		local
			p1, p2: POINTER
		do
			p1 := p2 + 1024
			assert ("plus1", p1 = pointer_0x400)
			p2 := p1 + 3072
			assert ("plus2", p2 = pointer_0x1000)
		end

	test_to_integer_32 is
			-- Test feature 'to_integer_32'.
		local
			p1: POINTER
		do
			p1 := pointer_0x0
			assert ("to_integer_32_1", p1.to_integer_32 = 0)
			p1 := pointer_0x400
			assert ("to_integer_32_2", p1.to_integer_32 = 1024)
			p1 := pointer_0x1000
			assert ("to_integer_32_3", p1.to_integer_32 = 4096)
		end

	test_out is
			-- Test feature 'out'.
		local
			p1: POINTER
			l_out: STRING
		do
			p1 := pointer_0x0
			l_out := p1.out
			assert ("not_void1", l_out /= Void)
			assert ("string_type1", l_out.same_type (""))
			assert_equal ("value1", "0x0", l_out)
			assert ("new_string1", l_out /= p1.out)
			p1 := pointer_0x400
			l_out := p1.out
			assert ("not_void2", l_out /= Void)
			assert ("string_type2", l_out.same_type (""))
			assert_equal ("value2", "0x400", l_out)
			assert ("new_string2", l_out /= p1.out)
			p1 := pointer_0x1000
			l_out := p1.out
			assert ("not_void3", l_out /= Void)
			assert ("string_type3", l_out.same_type (""))
			assert_equal ("value3", "0x1000", l_out)
			assert ("new_string3", l_out /= p1.out)
		end

	test_hash_code is
			-- Test feature 'hash_code'.
		local
			p1: POINTER
		do
			p1 := pointer_0x0
			assert ("hash_code1", p1.hash_code = 0)
			p1 := pointer_0x400
			assert ("hash_code2", p1.hash_code = 1024)
			p1 := pointer_0x1000
			assert ("hash_code3", p1.hash_code = 4096)
		end

	test_memory_compare is
			-- Test feature 'memory_compare'.
		local
			sp1, sp2: SPECIAL [INTEGER_8]
		do
			create sp1.make_filled (0, 2)
			create sp2.make_filled (0, 2)
			assert ("sp1_item1", sp1.item (0) = 0)
			assert ("sp1_item2", sp1.item (1) = 0)
			assert ("sp2_item1", sp2.item (0) = 0)
			assert ("sp2_item2", sp2.item (1) = 0)
			assert ("memory_compare1", sp1.base_address.memory_compare (sp2.base_address, 2))
			sp1.put (5, 0)
			sp1.put (6, 1)
			assert ("memory_compare2", not sp1.base_address.memory_compare (sp2.base_address, 2))
			sp2.base_address.memory_copy (sp1.base_address, 2)
			assert ("sp2_item3", sp2.item (0) = 5)
			assert ("sp2_item4", sp2.item (1) = 6)
			assert ("memory_compare3", sp1.base_address.memory_compare (sp2.base_address, 2))
		end

	test_item is
			-- Test feature 'item'.
		local
			p: POINTER
		do
			p := pointer_0x400
			assert ("item1", p.item = pointer_0x400)
			p := pointer_0x1000
			assert ("item2", p.item = pointer_0x1000)
		end

	test_set_item___fail_ise is
			-- Test feature 'set_item'.
			-- Does not work with ISE Eiffel.
		local
			p: POINTER
		do
			if not eiffel_compiler.is_ise then
				p.set_item (pointer_0x400)
				assert ("item1", p = pointer_0x400)
				p.set_item (pointer_0x1000)
				assert ("item2", p = pointer_0x1000)
					-- Setting the 'item' of the result of a function does not
					-- set the 'item' of the result of the next call of this
					-- function.
				(pointer_0x400 + 3072).set_item (pointer_0x0)
				assert ("item3", (pointer_0x400 + 3072).item = pointer_0x1000)
			end
		end

	test_to_reference is
			-- Test feature 'to_reference'.
		local
			p: POINTER
			pref: POINTER_REF
		do
			p := pointer_0x400
			pref := p.to_reference
			assert ("not_void1", pref /= Void)
			assert ("item1", pref.item = pointer_0x400)
			p := pointer_0x1000
			pref := p.to_reference
			assert ("not_void2", pref /= Void)
			assert ("item2", pref.item = pointer_0x1000)
		end

	test_make_from_reference___fail_ise is
			-- Test feature 'make_from_reference'.
			-- Does not work with ISE Eiffel.
		local
			p: POINTER
			pref: POINTER_REF
		do
			if not eiffel_compiler.is_ise then
				create pref
				pref.set_item (pointer_0x400)
				create p.make_from_reference (pref)
				assert ("item1", p = pointer_0x400)
				create pref
				pref.set_item (pointer_0x1000)
				create p.make_from_reference (pref)
				assert ("item2", p = pointer_0x1000)
			end
		end

	test_convert is
			-- Test conversion.
		local
			p: POINTER
			pref: POINTER_REF
		do
				-- Convert to.
			p := pointer_0x400
			pref := p
			assert ("not_void1", pref /= Void)
			assert ("item1", pref.item = pointer_0x400)
			p := pointer_0x1000
			pref := p
			assert ("not_void2", pref /= Void)
			assert ("item2", pref.item = pointer_0x1000)
				-- Convert from.
			create pref
			pref.set_item (pointer_0x400)
			p := pref
			assert ("item3", p = pointer_0x400)
			create pref
			pref.set_item (pointer_0x1000)
			p := pref
			assert ("item4", p = pointer_0x1000)
		end

feature {NONE} -- Constants

	pointer_0x0: POINTER
			-- Null pointer

	pointer_0x400: POINTER is
			-- Pointer 0x400
		once
			Result := Result + 1024
		end

	pointer_0x1000: POINTER is
			-- Pointer 0x1000
		once
			Result := Result + 4096
		end

end
