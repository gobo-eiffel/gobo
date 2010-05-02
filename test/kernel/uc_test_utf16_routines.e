note

	description:

		"Test features of class UC_UTF16_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_TEST_UTF16_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UTF16_ROUTINES

create

	make_default

feature -- Test

	test_valid
			-- Test feature `valid_utf16' when valid.
		do
			assert ("empty", utf16.valid_utf16 (""))
			assert ("valid_big_endian", utf16.valid_utf16 (Big_endian + "%/0/a%/216/b%/223/c%/0/d"))
			assert ("valid_little_endian", utf16.valid_utf16 (Little_endian + "a%/0/b%/217/c%/223/d%/0/"))
			assert ("valid_little_endian_2", utf16.valid_utf16 (Little_endian + "2%U0%U1%U7%U3%U4%U2%U %U2%U0%U0%U7%U0%U7%U1%U8%U %UU%U"))
			assert ("valid_little_endian_3", utf16.valid_utf16le ("a%/0/b%/217/c%/223/d%/0/"))
			assert ("valid_little_endian_4", utf16.valid_utf16le ("2%U0%U1%U7%U3%U4%U2%U %U2%U0%U0%U7%U0%U7%U1%U8%U %UU%U"))
			assert ("valid_no_byte_order_marker", utf16.valid_utf16 ("%/0/a%/216/b%/223/c%/0/d"))
		end

	test_invalid
			-- Test feature `valid_utf16' when invalid.
		do
			assert ("odd", not utf16.valid_utf16 (Big_endian + "a"))
			assert ("little_endian_no_bom", not not utf16.valid_utf16 ("2%U0%U1%U7%U3%U4%U2%U %U2%U0%U0%U7%U0%U7%U1%U8%U %UU%U"))
			assert ("surrogate_high_high", not utf16.valid_utf16 (Big_endian + "%/0/a%/216/b%/219/c%/0/d"))
			assert ("surrogate_low_low", not utf16.valid_utf16 (Big_endian + "%/0/a%/220/b%/223/c%/0/d"))
			assert ("surrogate_low_high", not utf16.valid_utf16 (Big_endian + "%/0/a%/222/b%/218/c%/0/d"))
			assert ("surrogate_high_alone", not utf16.valid_utf16 (Big_endian + "%/0/a%/217/b%/0/c"))
			assert ("surrogate_low_alone", not utf16.valid_utf16 (Big_endian + "%/0/a%/221/b%/0/c"))
			assert ("surrogate_high_at_end", not utf16.valid_utf16 (Big_endian + "%/0/a%/217/a"))
			assert ("surrogate_low_at_end", not utf16.valid_utf16 (Big_endian + "%/0/a%/221/a"))
		end

	test_is_endian_detection_character
			-- Test feature `is_endian_detection_character'.
		do
			assert ("big_endian_char", utf16.is_endian_detection_character (Big_endian.item_code (1), Big_endian.item_code (2)))
			assert ("little_endian_char", utf16.is_endian_detection_character (Little_endian.item_code (1), Little_endian.item_code (2)))
			assert ("endian_not", not utf16.is_endian_detection_character (255, 255))
		end

	test_surrogate
			-- Test feature `surrogate_from_bytes'.
		do
				-- Surrogate 0x10000.
			assert_integers_equal ("surrogate_0x10000", utf16.surrogate_from_bytes (216, 0, 220, 0), 65536)
				-- Surrogate 0x10001.
			assert_integers_equal ("surrogate_0x10001", utf16.surrogate_from_bytes (216, 0, 220, 1), 65537)
				-- Surrogate 0x10ffff.
			assert_integers_equal ("surrogate_0x10ffff", utf16.surrogate_from_bytes (219, 255, 223, 255), 1114111)
		end

	test_supplementary
			-- Test features `supplementary_to_high' and `supplementary_low_surrogate'.
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

	test_utf16_bytes_to_utf8
			-- Test creating UTF-8 strings from UTF-16 byte sequences.
		local
			l_utf8: UC_UTF8_STRING
		do
			create l_utf8.make_from_utf16 (Big_endian_test_string)
			assert_equal ("Correct big-endian string", l_utf8.to_utf16_be, Big_endian_test_string)
			create l_utf8.make_from_utf16be (Big_endian_test_string)
			assert_equal ("Correct big-endian string 2", l_utf8.to_utf16_be, Big_endian_test_string)
			create l_utf8.make_from_utf16le (Little_endian_test_string)
			assert_equal ("Correct little-endian string", l_utf8.to_utf16_le, Little_endian_test_string)
		end

feature {NONE} -- Constants

	Big_endian: STRING = "%/254/%/255/"
			-- Big-endian BOM

	Little_endian: STRING = "%/255/%/254/"
			-- Little-endian BOM

	Big_endian_test_string: STRING = "%/0/a%/216/b%/223/c%/0/d"
			-- UTF-16BE string

	Little_endian_test_string: STRING = "2%U0%U1%U7%U3%U4%U2%U %U2%U0%U0%U7%U0%U7%U1%U8%U %UU%U"
			-- UTF-16LE string


end
