indexing

	description:

		"UTF-8 output encoders."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UTF8_ENCODER

inherit

	XM_XSLT_OUTPUT_ENCODER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_CHARACTER_CLASS_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_encoding: STRING; a_raw_outputter: XM_OUTPUT) is
			-- Establish invariant.
		require
			outputter_not_void: a_raw_outputter /= Void
			encoding_not_void: an_encoding /= Void
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
			Result := False

			-- The following code is not correct:
			
			-- Result := is_surrogate (a_code) or is_non_character (a_code)

			-- The reasons for this are:
			-- 1) Surrogates have already been eliminated as the code has passed an `is_char' test
			-- 2) XML 1.1 discourages, but allows all the remaining non-characters

		end

feature -- Element change

	output (a_character_string: STRING) is
			-- Encode `a_character_string' and write it to `outputter'.
		do
			if not is_error then
				outputter.output (a_character_string)
			end
		rescue
			is_error := True
			retry
		end

	output_ignoring_error (a_character_string: STRING) is
			-- Output `a_character_string', ignoring any error.
		do
			if is_error then
				is_error := False
			else
				outputter.output (a_character_string)
			end
		rescue
			is_error := True
			retry
		end

end
	
