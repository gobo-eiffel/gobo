indexing

	description: 
	
		"Test base64 decoding routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	revision: "$Revision$"
	date: "$Date$"

deferred class UT_TEST_BASE64_DECODING

inherit
	
	TS_TEST_CASE
	
feature -- Tests

	
	test_decoding is
			-- Test base64 decoding via a proxy string stream.
		local
			a_string_stream: KL_STRING_INPUT_STREAM
			a_decoder: UT_BASE64_DECODING_INPUT_STREAM
		do
			create a_string_stream.make (encoded_string)
			create a_decoder.make (a_string_stream)
			assert ("Open for reading", a_decoder.is_open_read)
			a_decoder.read_string (1024)
			print (a_decoder.last_string)
			assert ("Decoded", a_decoder.last_string.count = 273)
		end
	
	encoded_string: STRING is "R0lGODdhMAAwAPAAAAAAAP///ywAAAAAMAAwAAAC8IyPqcvt3wCcDkiLc7C0qwyGHhSWpjQu5yqmCYsapyuvUUlvONmOZtfzgFzByTB10QgxOR0TqBQejhRNzOfkVJ+5YiUqrXF5Y5lKh/DeuNcP5yLWGsEbtLiOSpa/TPg7JpJHxyendzWTBfX0cxOnKPjgBzi4diinWGdkF8kjdfnycQZXZeYGejmJlZeGl9i2icVqaNVailT6F5iJ90m6mvuTS4OK05M0vDk0Q4XUtwvKOzrcd3iq9uisF81M1OIcR7lEewwcLp7tuNNkM3uNna3F2JQFo97Vriy/Xl4/f1cf5VWzXyym7PHhhx4dbgYKAAA7"
			-- base64-encoded image/gif file

end
