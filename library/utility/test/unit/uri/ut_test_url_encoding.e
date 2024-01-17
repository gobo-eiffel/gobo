note

	description:

		"Test URL encoding routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004-2022, Eric Bezault and others"
	license: "MIT License"

class UT_TEST_URL_ENCODING

inherit

	TS_TEST_CASE

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make_default

feature -- Tests

	test_decoding
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

	test_encoding
			-- Test URL decoding.
		local
			encoder: UT_URL_ENCODING
		do
			create encoder
			assert_strings_equal ("space", "a+b", encoder.escape_string ("a b"))
			assert_strings_equal ("percent", "%%25", encoder.escape_string ("%%"))
			assert_strings_equal ("sequence", "%%2B+ab", encoder.escape_string ("+ ab"))
			assert_strings_equal ("custom_space", "%%20", encoder.escape_custom (" ", encoder.new_character_set (""), False))
			assert_strings_equal ("custom_space_plus", "+", encoder.escape_custom (" ", encoder.new_character_set (""), True))
		end

	test_utf8
			-- Test escaping with UTF8.
		local
			l_string, l_decoded_string: STRING
			l_escaped_string: STRING
			l_encoder: UT_URL_ENCODING
		do
			create l_encoder
			l_string := "%/226/%/137/%/160/"
			l_escaped_string := "%%E2%%89%%A0"
			assert_strings_equal ("utf_encoding", l_escaped_string, l_encoder.escape_utf8 (new_unicode_string_from_utf8 (l_string)))
			assert_strings_equal ("utf_raw_decoding", l_string, l_encoder.unescape_string (l_escaped_string))
			l_decoded_string := l_encoder.unescape_utf8 (l_escaped_string)
			assert_true ("decoded_string_not_void", l_decoded_string /= Void)
			check
				l_decoded_string_not_void: l_decoded_string /= Void
				-- by construction of the test
			then
				assert_integers_equal ("utf_decoding_count", 1, l_decoded_string.count)
				assert_naturals_32_equal ("utf_decoding", 8800, l_decoded_string.code (1))
			end
		end

end
