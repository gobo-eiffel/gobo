indexing

	description:

		"Test features of class ARRAY"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ARRAY

inherit

	TEST_CASE

feature -- Test

	run_all is
			-- Run all tests.
		do
			test_manifest_array_character
			test_manifest_array_boolean
			test_manifest_array_integer_8
			test_manifest_array_integer_16
			test_manifest_array_integer_32
			test_manifest_array_integer_64
			test_manifest_array_natural_8
			test_manifest_array_natural_16
			test_manifest_array_natural_32
			test_manifest_array_natural_64
			test_manifest_array_real_32
			test_manifest_array_real_64
		end

	test_manifest_array_character is
			-- Test manifest arrays of CHARACTER.
		local
			l_array: ARRAY [CHARACTER]
		do
			l_array := <<'a', 'c'>>
			assert ("item1", l_array.item (1) = 'a')
			assert ("item2", l_array.item (2) = 'c')
		end

	test_manifest_array_boolean is
			-- Test manifest arrays of BOOLEAN.
		local
			l_array: ARRAY [BOOLEAN]
		do
			l_array := <<True, False, True>>
			assert ("item1", l_array.item (1))
			assert ("item2", not l_array.item (2))
			assert ("item3", l_array.item (3))
		end

	test_manifest_array_integer_8 is
			-- Test manifest arrays of INTEGER_8.
		local
			l_array: ARRAY [INTEGER_8]
			i1, i2: INTEGER_8
		do
			i1 := 100
			i2 := -4
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_integer_16 is
			-- Test manifest arrays of INTEGER_16.
		local
			l_array: ARRAY [INTEGER_16]
			i1, i2: INTEGER_16
		do
			i1 := 10000
			i2 := -9999
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_integer_32 is
			-- Test manifest arrays of INTEGER.
		local
			l_array: ARRAY [INTEGER]
			i1, i2: INTEGER
		do
			i1 := 123456
			i2 := -654321
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_integer_64 is
			-- Test manifest arrays of INTEGER_64.
		local
			l_array: ARRAY [INTEGER_64]
			i1, i2: INTEGER_64
		do
			i1 := 12345678912345678
			i2 := 9876543219876543
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_natural_8 is
			-- Test manifest arrays of NATURAL_8.
		local
			l_array: ARRAY [NATURAL_8]
			i1, i2: NATURAL_8
		do
			i1 := 100
			i2 := 4
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_natural_16 is
			-- Test manifest arrays of NATURAL_16.
		local
			l_array: ARRAY [NATURAL_16]
			i1, i2: NATURAL_16
		do
			i1 := 10000
			i2 := 9999
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_natural_32 is
			-- Test manifest arrays of NATURAL_32.
		local
			l_array: ARRAY [NATURAL_32]
			i1, i2: NATURAL_32
		do
			i1 := 123456
			i2 := 654321
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_natural_64 is
			-- Test manifest arrays of NATURAL_64.
		local
			l_array: ARRAY [NATURAL_64]
			i1, i2: NATURAL_64
		do
			i1 := 12345678912345678
			i2 := 9876543219876543
			l_array := <<i1, i2>>
			assert ("item1", l_array.item (1) = i1)
			assert ("item2", l_array.item (2) = i2)
		end

	test_manifest_array_real_32 is
			-- Test manifest arrays of REAL.
		local
			l_array: ARRAY [REAL]
			r1, r2: REAL
		do
			r1 := 1.45
			r2 := -4.2E+7
			l_array := <<r1, r2>>
			assert ("item1", l_array.item (1) = r1)
			assert ("item2", l_array.item (2) = r2)
		end

	test_manifest_array_real_64 is
			-- Test manifest arrays of DOUBLE.
		local
			l_array: ARRAY [DOUBLE]
			r1, r2: DOUBLE
		do
			r1 := 1.45
			r2 := -4.2E+7
			l_array := <<r1, r2>>
			assert ("item1", l_array.item (1) = r1)
			assert ("item2", l_array.item (2) = r2)
		end

end
