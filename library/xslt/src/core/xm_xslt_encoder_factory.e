note

	description:

		"Objects that create output encoders"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_ENCODER_FACTORY

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	outputter (an_encoding: STRING; a_raw_outputter: XM_OUTPUT): detachable XM_XSLT_OUTPUT_ENCODER
			-- Output encoder for `an_encoding'
		require
			encoding_not_void: an_encoding /= Void
			raw_outputter_not_void: a_raw_outputter /= Void
		local
			encoding: STRING
		do
			encoding := an_encoding.as_upper

			-- The preferred MIME for is listed first for each encoding
			-- All aliases are taken from http://www.iana.org/assignments/character-sets

			-- N.B. UTF-16BE is NOT an alias for UTF-16 - it is a seperate Unicode Encoding Scheme.
			-- Therefore these names are tested seperately, even though they share
			--  the same implementation class

			if STRING_.same_string (encoding, "UTF-8") then
				create {XM_XSLT_UTF8_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-16") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-16BE") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-16LE") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-32") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-32BE") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif STRING_.same_string (encoding, "UTF-32LE") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif
				STRING_.same_string (encoding, "ISO-8859-1") or
				STRING_.same_string (encoding, "ISO_8859-1") or
				STRING_.same_string (encoding, "ISO_8859-1:1987") or
				STRING_.same_string (encoding, "LATIN1") or
				STRING_.same_string (encoding, "L1") or
				STRING_.same_string (encoding, "ISO-IR-100") or
				STRING_.same_string (encoding, "IBM819") or
				STRING_.same_string (encoding, "CP819") or
				STRING_.same_string (encoding, "CSISOLATIN1")
			then
				create {XM_XSLT_LATIN1_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif
				STRING_.same_string (encoding, "US-ASCII") or
				STRING_.same_string (encoding, "ASCII") or
				STRING_.same_string (encoding, "US") or
				STRING_.same_string (encoding, "ISO646-US") or
				STRING_.same_string (encoding, "ISO-IR-6") or
				STRING_.same_string (encoding, "ISO_646.IRV:1991") or
				STRING_.same_string (encoding, "ANSI_X3.4-1968") or
				STRING_.same_string (encoding, "CSASCII") or
				STRING_.same_string (encoding, "IBM367") or
				STRING_.same_string (encoding, "CP367")
			then
				create {XM_XSLT_ASCII_ENCODER} Result.make (a_raw_outputter)
			end
		end

end
