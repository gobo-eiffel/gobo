indexing

	description:

		"Percent-encoded string for URI components"

	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004, Franck Arnaud and others"
	date: "$Date$"
	revision: "$Revision$"

class UT_URI_STRING

inherit

	ANY

	UT_SHARED_URL_ENCODING

create

	make_empty,
	make_encoded,
	make_decoded,
	make_decoded_utf8

feature {NONE} -- Initialization

	make_empty is
			-- Create an empty string.
		do
			make_encoded ("")
		ensure
			definition: encoded.is_empty
		end

	make_encoded (a_string: STRING) is
			-- Create with encoded `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_no_excluded_chars: not Url_encoding.has_excluded_characters (a_string)
		do
			encoded := a_string
		ensure
			definition: encoded = a_string
		end

	make_decoded (a_string: STRING) is
			-- Create with `a_string', where each character is
			-- percent-encoded directly.
		require
			a_string_not_void: a_string /= Void
		do
			decoded_impl := a_string
			encoded := Url_encoding.escape_string (a_string)
		end

	make_decoded_utf8 (a_string: STRING) is
			-- Create with `a_string', to be encoded as UTF and
			-- then percent-encoded.
		require
			a_string_not_void: a_string /= Void
		do
			decoded_utf8_impl := a_string
			encoded := Url_encoding.escape_utf8 (a_string)
		end

feature -- Access

	encoded: STRING
			-- Percent-encoded string

	decoded: STRING is
			-- Decoded string where each %-encoded character
			-- gives one item in the resulting string;
			-- The encoding is assumed to be Latin-1.
		local
			l_decoded_impl: like decoded_impl
		do
			l_decoded_impl := decoded_impl
			if l_decoded_impl = Void then
				l_decoded_impl := Url_encoding.unescape_string (encoded)
				decoded_impl := l_decoded_impl
			end
			Result := l_decoded_impl
		ensure
			decoded_not_void: Result /= Void
		end

	decoded_utf8: ?STRING is
			-- Decoded string where the percent-encoded characters
			-- are in the UTF-8 character set
			-- (This may return a STRING object of another type than STRING)
		do
			if decoded_utf8_impl = Void then
				decoded_utf8_impl := Url_encoding.unescape_utf8 (encoded)
			end
			Result := decoded_utf8_impl
		end

feature {NONE} -- Implementation

	decoded_impl: ?STRING
			-- Cache for `decoded'

	decoded_utf8_impl: ?STRING
			-- Cache for `decoded_utf8'

invariant

	encoded_not_void: encoded /= Void

end
