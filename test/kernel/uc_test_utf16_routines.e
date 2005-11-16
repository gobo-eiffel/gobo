indexing

	description:

		"Test features of class UC_UTF16_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class UC_TEST_UTF16_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UTF16_ROUTINES

feature

	test_valid is
			-- Test feature `valid_utf16' when valid.
		do
			assert ("empty", utf16.valid_utf16 (""))
			assert ("valid_big_endian", utf16.valid_utf16 (Big_endian + "%/0/a%/216/b%/223/c%/0/d"))
			assert ("valid_little_endian", utf16.valid_utf16 (Little_endian + "a%/0/b%/217/c%/223/d%/0/"))
			assert ("valid_no_byte_order_marker", utf16.valid_utf16 ("%/0/a%/216/b%/223/c%/0/d"))
		end

	test_invalid is
			-- Test feature `valid_utf16' when invalid.
		do
			assert ("odd", not utf16.valid_utf16 (Big_endian + "a"))
			assert ("surrogate_high_high", not utf16.valid_utf16 (Big_endian + "%/0/a%/216/b%/219/c%/0/d"))
			assert ("surrogate_low_low", not utf16.valid_utf16 (Big_endian + "%/0/a%/220/b%/223/c%/0/d"))
			assert ("surrogate_low_high", not utf16.valid_utf16 (Big_endian + "%/0/a%/222/b%/218/c%/0/d"))
			assert ("surrogate_high_alone", not utf16.valid_utf16 (Big_endian + "%/0/a%/217/b%/0/c"))
			assert ("surrogate_low_alone", not utf16.valid_utf16 (Big_endian + "%/0/a%/221/b%/0/c"))
			assert ("surrogate_high_at_end", not utf16.valid_utf16 (Big_endian + "%/0/a%/217/a"))
			assert ("surrogate_low_at_end", not utf16.valid_utf16 (Big_endian + "%/0/a%/221/a"))
		end

	test_is_endian_detection_character is
			-- Test feature `is_endian_detection_character'
		do
			assert ("big_endian_char", utf16.is_endian_detection_character (Big_endian.item_code (1), Big_endian.item_code (2)))
			assert ("little_endian_char", utf16.is_endian_detection_character (Little_endian.item_code (1), Little_endian.item_code (2)))
			assert ("endian_not", not utf16.is_endian_detection_character (255, 255))
		end

	test_surrogate is
			-- Test feature `surrogate_from_bytes'
		do
				-- Surrogate 0x10000.
			assert_integers_equal ("surrogate_0x10000", utf16.surrogate_from_bytes (216, 0, 220, 0), 65536)
				-- Surrogate 0x10001.
			assert_integers_equal ("surrogate_0x10001", utf16.surrogate_from_bytes (216, 0, 220, 1), 65537)
				-- Surrogate 0x10ffff.
			assert_integers_equal ("surrogate_0x10ffff", utf16.surrogate_from_bytes (219, 255, 223, 255), 1114111)
		end

	test_supplementary is
			-- Test features `supplementary_to_high/low_surrogate'
		do
			-- Surrogates for 0x10000.
			assert_integers_equal ("high_surrogate_0x10000", 55296, utf16.supplementary_to_high_surrogate (65536))
			assert_integers_equal ("low_surrogate_0x10000", 56320, utf16.supplementary_to_low_surrogate (65536))
				-- Surrogate 0x10001.
			assert_integers_equal ("high_surrogate_0x10001", 55296, utf16.supplementary_to_high_surrogate (65537))
			assert_integers_equal ("low_surrogate_0x10001", 56321, utf16.supplementary_to_low_surrogate (65537))
				-- Surrogate 0x10ffff.
			assert_integers_equal ("high_surrogate_0x10ffff", 56319, utf16.supplementary_to_high_surrogate (1114111))
			assert_integers_equal ("low_surrogate_0x10ffff", 57343, utf16.supplementary_to_low_surrogate (1114111))
		end

feature {NONE} -- Constants

	Big_endian: STRING is "%/254/%/255/"
	Little_endian: STRING is "%/255/%/254/"

end
