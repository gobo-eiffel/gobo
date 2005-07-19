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
			if encoding.is_equal ("UTF-8") then
				create {XM_XSLT_UTF8_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("LATIN-1") or else encoding.is_equal ("ISO-8859-1") then
				create {XM_XSLT_LATIN1_ENCODER} Result.make (encoding, a_raw_outputter)
			elseif encoding.is_equal ("US-ASCII") then
				create {XM_XSLT_ASCII_ENCODER} Result.make (a_raw_outputter)
			elseif encoding.is_equal ("ISO646") then
				create {XM_XSLT_ASCII_ENCODER} Result.make (a_raw_outputter)
			elseif encoding.is_equal ("ISO-646") then
				create {XM_XSLT_ASCII_ENCODER} Result.make (a_raw_outputter)
			end
		end
	
end
