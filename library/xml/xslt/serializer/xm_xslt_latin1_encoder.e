note

	description:

		"Latin-1 (ISO-8859-1) output encoders."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LATIN1_ENCODER

inherit

	XM_XSLT_OUTPUT_ENCODER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_encoding: STRING; a_raw_outputter: XM_OUTPUT)
			-- Establish invariant.
		require
			outputter_not_void: a_raw_outputter /= Void
			encoding_not_void: an_encoding /= Void and then an_encoding.count > 6
		do
			encoding := an_encoding
			outputter := a_raw_outputter
		ensure
			encoding_set: encoding = an_encoding
			outputter_set: outputter = a_raw_outputter
		end

feature -- Access

	byte_order_mark: STRING
			-- XML BOM
		once
			-- Precondition is never met
		end

feature -- Status report

	byte_order_mark_permitted: BOOLEAN
			--	Is a BOM permitted?
		do
			Result := False
		end

	is_byte_order_mark_default: BOOLEAN
			-- Is emitting a BOM the default behaviour?
		do
			Result := False
		end

	is_bad_character_code (a_code: INTEGER): BOOLEAN
			-- Is `a_code' not representable in `encoding'?
		do
			Result := a_code > 255
		end

feature -- Element change

	output (a_character_string: STRING)
			-- Encode `a_character_string' and write it to `outputter'.
		do
			if not is_error then
				outputter.output (a_character_string.string)
			end
		rescue
			if not is_error then
				is_error := True
				retry
			end
		end

	output_ignoring_error (a_character_string: STRING)
			-- Output `a_character_string', ignoring any error.
		do
			if is_error then
				is_error := False
			else
				outputter.output (a_character_string.string)
			end
		rescue
			if not is_error then
				is_error := True
				retry
			end
		end

end

