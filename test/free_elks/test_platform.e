indexing

	description:

		"Test features of class PLATFORM"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PLATFORM

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_character_bytes is
			-- Test feature 'character_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("character_bytes", p.character_bytes >= 1)
		end

	test_integer_8_bytes is
			-- Test feature 'integer_8_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_8_bytes", p.integer_8_bytes = 1)
		end

	test_integer_16_bytes is
			-- Test feature 'integer_16_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_16_bytes", p.integer_16_bytes = 2)
		end

	test_integer_32_bytes is
			-- Test feature 'integer_32_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_32_bytes", p.integer_32_bytes = 4)
		end

	test_integer_64_bytes is
			-- Test feature 'integer_64_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_64_bytes", p.integer_64_bytes = 8)
		end

	test_natural_8_bytes is
			-- Test feature 'natural_8_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_8_bytes", p.natural_8_bytes = 1)
		end

	test_natural_16_bytes is
			-- Test feature 'natural_16_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_16_bytes", p.natural_16_bytes = 2)
		end

	test_natural_32_bytes is
			-- Test feature 'natural_32_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_32_bytes", p.natural_32_bytes = 4)
		end

	test_natural_64_bytes is
			-- Test feature 'natural_64_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_64_bytes", p.natural_64_bytes = 8)
		end

	test_integer_8_bits is
			-- Test feature 'integer_8_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_8_bits", p.integer_8_bits = 8)
		end

	test_integer_16_bits is
			-- Test feature 'integer_16_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_16_bits", p.integer_16_bits = 16)
		end

	test_integer_32_bits is
			-- Test feature 'integer_32_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_32_bits", p.integer_32_bits = 32)
		end

	test_integer_64_bits is
			-- Test feature 'integer_64_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("integer_64_bits", p.integer_64_bits = 64)
		end

	test_natural_8_bits is
			-- Test feature 'natural_8_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_8_bits", p.natural_8_bits = 8)
		end

	test_natural_16_bits is
			-- Test feature 'natural_16_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_16_bits", p.natural_16_bits = 16)
		end

	test_natural_32_bits is
			-- Test feature 'natural_32_bytes'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_32_bits", p.natural_32_bits = 32)
		end

	test_natural_64_bits is
			-- Test feature 'natural_64_bits'.
		local
			p: PLATFORM
		do
			create p
			assert ("natural_64_bits", p.natural_64_bits = 64)
		end

end
