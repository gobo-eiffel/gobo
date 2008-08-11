indexing

	description:

		"Test base64 decoding routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	revision: "$Revision$"
	date: "$Date$"

class UT_TEST_BASE64_DECODING

inherit

	TS_TEST_CASE

create

	make_default

feature -- Tests

	test_decoding is
			-- Test base64 decoding via a proxy string stream.
		local
			a_string_stream: KL_STRING_INPUT_STREAM
			a_decoder: UT_BASE64_DECODING_INPUT_STREAM
			an_encoder: UT_BASE64_ENCODING_OUTPUT_STREAM
			an_output_stream: KL_STRING_OUTPUT_STREAM
		do
			create a_string_stream.make (encoded_string)
			create a_decoder.make (a_string_stream)
			assert ("is_open_read", a_decoder.is_open_read)
			a_decoder.read_string (1024)
			assert ("decoded", a_decoder.last_string.count = 273)
			create an_output_stream.make_empty
			create an_encoder.make (an_output_stream, False, False)
			assert ("is_open_write", an_encoder.is_open_write)
			an_encoder.put_string (a_decoder.last_string)
			an_encoder.close
			assert ("round_trip", STRING_.same_string (an_output_stream.string, encoded_string))
		end

	test_encoding_decoding_numerals is
			-- Test base64 encoding and decoding of numerals.
		local
			i: INTEGER
			s1, s2, t: STRING
		do
			s1 := ""
			from
				i := 0
			until
				i > 200
			loop
				t := encoded_base64_binary (s1)
				assert ("encoded_string_not_void", t /= Void)
				s2 := decoded_base64_binary (t)
				assert ("decoded_string_not_void", s2 /= Void)
				assert_equal ("original_string_matches_round_trip", s1, s2)
				i := i +1
				s1.append_string ((i \\ 10).out)
			end
		end

feature {NONE} -- Implementation

	encoded_string: STRING is "R0lGODdhMAAwAPAAAAAAAP///ywAAAAAMAAwAAAC8IyPqcvt3wCcDkiLc7C0qwyGHhSWpjQu5yqmCYsapyuvUUlvONmOZtfzgFzByTB10QgxOR0TqBQejhRNzOfkVJ+5YiUqrXF5Y5lKh/DeuNcP5yLWGsEbtLiOSpa/TPg7JpJHxyendzWTBfX0cxOnKPjgBzi4diinWGdkF8kjdfnycQZXZeYGejmJlZeGl9i2icVqaNVailT6F5iJ90m6mvuTS4OK05M0vDk0Q4XUtwvKOzrcd3iq9uisF81M1OIcR7lEewwcLp7tuNNkM3uNna3F2JQFo97Vriy/Xl4/f1cf5VWzXyym7PHhhx4dbgYKAAA7"
			-- base64-encoded image/gif file

	encoded_base64_binary (a_text: STRING): STRING is
			-- `a_text' encoded as base64-binary
		local
			l_string_stream: KL_STRING_OUTPUT_STREAM
			l_encoder: UT_BASE64_ENCODING_OUTPUT_STREAM
		do
			create l_string_stream.make_empty
			create l_encoder.make (l_string_stream, True, True)
			l_encoder.put_string (a_text)
			l_encoder.close
			Result := l_string_stream.string
		end

	decoded_base64_binary (a_text: STRING): STRING is
			-- Decoded version of `a_text' from base64-binary
		local
			l_string_stream: KL_STRING_INPUT_STREAM
			l_decoder: UT_BASE64_DECODING_INPUT_STREAM
		do
			create l_string_stream.make (a_text)
			create l_decoder.make (l_string_stream)
			from
				Result := ""
			until
				l_decoder.end_of_input
			loop
				l_decoder.read_string (100)
				if not l_decoder.end_of_input then
					Result := STRING_.appended_string (Result, l_decoder.last_string)
				end
			end
		end

end
