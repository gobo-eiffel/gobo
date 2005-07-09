indexing

	description:

		"Test features of class KL_PLATFORM"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_PLATFORM

inherit

	KL_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end
	
	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

feature -- Test

	test_boolean_bits is
			-- Test feature `Boolean_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Boolean_bits >= 1)
			assert ("small_enough", a_platform.Boolean_bits <= a_platform.Boolean_bytes * a_platform.Byte_bits)
		end

	test_byte_bits is
			-- Test feature `Byte_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", 8, a_platform.Byte_bits)
		end

	test_character_bits is
			-- Test feature `Character_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", a_platform.Character_bytes * a_platform.Byte_bits, a_platform.Character_bits)
				-- Needed in the implementation of some of the Gobo classes:
			assert ("more_than_byte", a_platform.Character_bits >= a_platform.Byte_bits)
		end

-- Not supported with SE 2.1 and 2.2.
--	test_double_bits is
--			-- Test feature `Double_bits'.
--		local
--			a_platform: KL_PLATFORM
--		do
--			create a_platform
--			assert_integers_equal ("definition", a_platform.Double_bytes * a_platform.Byte_bits, a_platform.Double_bits)
--			assert ("more_than_real", a_platform.Double_bits >= a_platform.Real_bits)
--		end

	test_integer_bits is
			-- Test feature `Integer_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", a_platform.Integer_bytes * a_platform.Byte_bits, a_platform.Integer_bits)
				-- The code of characters should fit into an integer:
			assert ("more_than_character", a_platform.Integer_bits >= a_platform.Character_bits)
				-- Needed in the implementation of some of the Gobo classes:
			assert ("more_than_32_bits", a_platform.Integer_bits >= 32)
		end

	test_pointer_bits is
			-- Test feature `Pointer_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", a_platform.Pointer_bytes * a_platform.Byte_bits, a_platform.Pointer_bits)
		end

	test_real_bits is
			-- Test feature `Real_bits'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", a_platform.Real_bytes * a_platform.Byte_bits, a_platform.Real_bits)
		end

	test_boolean_bytes is
			-- Test feature `Boolean_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Boolean_bytes >= 1)
		end

	test_byte_bytes is
			-- Test feature `Byte_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", 1, a_platform.Byte_bytes)
		end

	test_character_bytes is
			-- Test feature `Character_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Character_bytes >= 1)
				-- Needed in the implementation of some of the Gobo classes:
			assert ("more_than_byte", a_platform.Character_bytes >= a_platform.Byte_bytes)
		end

	test_double_bytes is
			-- Test feature `Double_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Double_bytes >= 1)
			assert ("more_than_real", a_platform.Double_bytes >= a_platform.Real_bytes)
		end

	test_integer_bytes is
			-- Test feature `Integer_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Integer_bytes >= 1)
				-- The code of characters should fit into an integer:
			assert ("more_than_character", a_platform.Integer_bytes >= a_platform.Character_bytes)
				-- Needed in the implementation of some of the Gobo classes:
			assert ("more_than_4_bytes", a_platform.Integer_bytes >= 4)
		end

	test_pointer_bytes is
			-- Test feature `Pointer_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Pointer_bytes >= 1)
		end

	test_real_bytes is
			-- Test feature `Real_bytes'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Real_bytes >= 1)
		end

	test_minimum_byte_code is
			-- Test feature `Minimum_byte_code'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", 0, a_platform.Minimum_byte_code)
		end

	test_maximum_byte_code is
			-- Test feature `Maximum_byte_code'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", 255, a_platform.Maximum_byte_code)
		end

	test_minimum_character_code is
			-- Test feature `Minimum_character_code'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert_integers_equal ("definition", 0, a_platform.Minimum_character_code)
		end

	test_maximum_character_code is
			-- Test feature `Maximum_character_code'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("large_enough", a_platform.Maximum_character_code >= a_platform.Maximum_byte_code)
			assert_integers_equal ("definition", a_platform.Maximum_character_code, INTEGER_.power (2, a_platform.Character_bits) - 1)
		end

	test_minimum_integer is
			-- Test feature `Minimum_integer'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("meaningful", a_platform.Minimum_integer <= 0)
			assert ("definition", a_platform.Minimum_integer = INTEGER_.power (2, a_platform.Integer_bits - 2) * -2)
			if a_platform.Integer_bits = 32 then
				if not eiffel_compiler.is_ve then
						-- There is a bug in VE 4.0 (build 4001) in STRING.out
						-- when the integer value is PLATFORM.Minimum_integer.
					assert_equal ("value_32_bits", "-2147483648", a_platform.Minimum_integer.out)
				end
			end
		end

	test_maximum_integer is
			-- Test feature `Maximum_integer'.
		local
			a_platform: KL_PLATFORM
		do
			create a_platform
			assert ("meaningful", a_platform.Maximum_integer >= 0)
			assert_integers_equal ("definition", - (a_platform.Minimum_integer + 1), a_platform.Maximum_integer)
			if a_platform.Integer_bits = 32 then
				assert_equal ("value_32_bits", "2147483647", a_platform.Maximum_integer.out)
			end
		end

end
