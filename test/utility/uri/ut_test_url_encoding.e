indexing

	description: 

		"Test URL encoding routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	revision: "$Revision$"
	date: "$Date$"

class UT_TEST_URL_ENCODING

inherit

	TS_TEST_CASE

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make_default

feature -- Tests

	test_decoding is
			-- Test URL encoding.
		local
			encoder: UT_URL_ENCODING
		do
			create encoder
			assert_strings_equal ("simple", "A", encoder.unescape_string ("%%41"))
			assert_strings_equal ("space", "a b", encoder.unescape_string ("a+b"))
			assert_strings_equal ("hex_lower", "[", encoder.unescape_string ("%%5b"))
			assert_strings_equal ("hex_upper", "[", encoder.unescape_string ("%%5B"))
			assert_strings_equal ("sequence", "[]", encoder.unescape_string ("%%5B%%5d"))

			assert_strings_equal ("malformed_short", "ab%%a", encoder.unescape_string ("ab%%a"))
			assert_strings_equal ("malformed_percent", "ab%%", encoder.unescape_string ("ab%%"))
			assert_strings_equal ("malformed_invalid_chars", "a%%_Zb", encoder.unescape_string ("a%%_Zb"))
		end

	test_encoding is
			-- Test URL decoding.
		local
			encoder: UT_URL_ENCODING
		do
			create encoder
			assert_strings_equal ("space", "a+b", encoder.escape_string ("a b"))
			assert_strings_equal ("percent", "%%25", encoder.escape_string ("%%")) 
			assert_strings_equal ("sequence", "%%2B+ab", encoder.escape_string ("+ ab")) 
			assert_strings_equal ("custom_space", "%%20", encoder.escape_custom (" ", encoder.new_character_set (""), False))
			assert_equal ("custom_space_plus", "+", encoder.escape_custom (" ", encoder.new_character_set (""), True))
		end

	test_utf8 is
			-- Test escaping with UTF8.
		local
			a_string: STRING
			escaped_string: STRING
			encoder: UT_URL_ENCODING
		do
			create encoder
			a_string := "%/226/%/137/%/160/"
			escaped_string := "%%E2%%89%%A0"
			assert_strings_equal ("utf_encoding", escaped_string, encoder.escape_utf8 (new_unicode_string_from_utf8 (a_string)))
			assert_strings_equal ("utf_raw_decoding", a_string, encoder.unescape_string (escaped_string))
			assert_integers_equal ("utf_decoding", 8800, encoder.unescape_utf8 (escaped_string).item_code (1))
			assert_integers_equal ("utf_decoding_count", 1, encoder.unescape_utf8 (escaped_string).count)
		end

end
