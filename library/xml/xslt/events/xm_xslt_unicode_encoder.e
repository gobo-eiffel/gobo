indexing

	description:

		"Unicode output encoders."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNICODE_ENCODER

inherit

	XM_XSLT_OUTPUT_ENCODER

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_encoding: STRING; a_raw_outputter: XM_OUTPUT) is
			-- Establish invariant.
		require
			outputter_not_void: a_raw_outputter /= Void
			encoding_not_void: an_encoding /= Void and then an_encoding.count > 4
		do
			encoding := an_encoding
			outputter := a_raw_outputter
		ensure
			encoding_set: encoding = an_encoding
			outputter_set: outputter = a_raw_outputter
		end

feature -- Status report

	is_bad_character_code (a_code: INTEGER): BOOLEAN is
			-- Is `a_code' not representable in `encoding'?
		do
			-- All characters are valid
		end

feature {NONE} -- Implementation

	encoded_string (a_character_string: STRING): STRING is
			-- Encoded version of `a_character_string'
		do
			if STRING_.same_string (encoding, "UTF-8") then
				Result := a_character_string
			else
				-- need support for at least UTF-16
			end
		end

end
	
