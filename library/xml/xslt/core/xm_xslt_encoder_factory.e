indexing

	description:

		"Objects that create output encoders"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ENCODER_FACTORY

inherit

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	outputter (an_encoding: STRING; a_raw_outputter: XM_OUTPUT): XM_XSLT_OUTPUT_ENCODER is
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

			if encoding.is_equal ("UTF-8") then
				create {XM_XSLT_UTF8_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-16") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-16BE") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-16LE") then
				create {XM_XSLT_UTF16_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-32") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-32BE") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("UTF-32LE") then
				create {XM_XSLT_UTF32_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("ISO-8859-1")
				or  encoding.is_equal ("ISO_8859-1")
				or  encoding.is_equal ("ISO_8859-1:1987")
				or  encoding.is_equal ("LATIN1")
				or  encoding.is_equal ("L1")
				or  encoding.is_equal ("ISO-IR-100")
				or  encoding.is_equal ("IBM819")
				or  encoding.is_equal ("CP819")
				or  encoding.is_equal ("CSISOLATIN1") then
				create {XM_XSLT_LATIN1_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("US-ASCII")
				or encoding.is_equal ("ASCII")
				or encoding.is_equal ("US")
				or encoding.is_equal ("ISO646-US")
				or encoding.is_equal ("ISO-IR-6")
				or encoding.is_equal ("ISO_646.IRV:1991")
				or encoding.is_equal ("ANSI_X3.4-1968")
				or encoding.is_equal ("CSASCII")
				or encoding.is_equal ("IBM367")
				or encoding.is_equal ("CP367") then
				create {XM_XSLT_ASCII_ENCODER} Result.make (a_raw_outputter)
			end
		end
	
end
