indexing

	description: 
	
		"Test URL encoding routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	revision: "$Revision$"
	date: "$Date$"

deferred class UT_TEST_URL_ENCODING

inherit
	
	TS_TEST_CASE
	
feature

	test_decoding is
			-- Test URL encoding.
		do
			create encoder
			
			assert_equal ("simple", "A", encoder.unescape_string ("%%41"))
			assert_equal ("space", "a b", encoder.unescape_string ("a+b"))
			assert_equal ("hex_lower", "[", encoder.unescape_string ("%%5b"))
			assert_equal ("hex_upper", "[", encoder.unescape_string ("%%5B"))
			assert_equal ("sequence", "[]", encoder.unescape_string ("%%5B%%5d"))
			
			assert_equal ("malformed_short", "ab%%a", encoder.unescape_string ("ab%%a"))
			assert_equal ("malformed_percent", "ab%%", encoder.unescape_string ("ab%%"))
			assert_equal ("malformed_invalid_chars", "a%%_Zb", encoder.unescape_string ("a%%_Zb"))
		end
	
	test_encoding is
			-- Test URL decoding.
		do
			create encoder
			
			assert_equal ("space", "a+b", encoder.escape_string ("a b"))
			assert_equal ("percent", "%%25", encoder.escape_string ("%%")) 
			assert_equal ("sequence", "%%2b+ab", encoder.escape_string ("+ ab")) 
		end
		
feature {NONE} -- Implementation

	encoder: UT_URL_ENCODING

end
