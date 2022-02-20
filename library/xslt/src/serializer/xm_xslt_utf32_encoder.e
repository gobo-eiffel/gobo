note

	description:

		"Output encoders for UTF-32, UTF-32BE and UTF-32LE."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UTF32_ENCODER

inherit

	XM_XSLT_OUTPUT_ENCODER

	UC_IMPORTED_UTF32_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_encoding: STRING; a_raw_outputter: XM_OUTPUT)
			-- Establish invariant.
		require
			outputter_not_void: a_raw_outputter /= Void
			encoding_not_void: an_encoding /= Void
		do
			encoding := an_encoding
			if STRING_.same_string (encoding, "UTF-32BE") then
				is_utf32_be := True
			elseif STRING_.same_string (encoding, "UTF-32LE") then
				is_utf32_le := True
			else
				check
					utf32: STRING_.same_string (encoding, "UTF-32")
					-- Encoder factory assures this
				end
			end
			outputter := a_raw_outputter
		ensure
			encoding_set: encoding = an_encoding
			outputter_set: outputter = a_raw_outputter
		end

feature -- Access

	byte_order_mark: STRING
			-- XML BOM
		once
			if is_utf32_le then
				Result := utf32.bom_le
			else
				Result := utf32.bom_be
			end
		end

feature -- Status report

	is_utf32_be, is_utf32_le: BOOLEAN
			-- Flags for specific encoding schemes

	byte_order_mark_permitted: BOOLEAN
			--	Is a BOM permitted?
		do
			Result := not (is_utf32_be or is_utf32_le)
		end

	is_byte_order_mark_default: BOOLEAN
			-- Is emitting a BOM the default behaviour?
		do
			Result := True
		end

	is_bad_character_code (a_code: NATURAL_32): BOOLEAN
			-- Is `a_code' not representable in `encoding'?
		do
			Result := False

			-- The following code is not correct:

			-- Result := is_surrogate (a_code) or is_non_character (a_code)

			-- The reasons for this are:

			-- The reasons for this are:
			-- 1) Surrogates have already been eliminated as the code has passed an `is_char' test
			-- 2) XML 1.1 discourages, but allows all the remaining non-characters

		end

feature -- Element change

	output (a_character_string: STRING)
			-- Encode `a_character_string' and write it to `outputter'.
		do
			if not is_error then
				if is_utf32_le then
					outputter.output (STRING_.to_utf32_le (a_character_string))
				else
					outputter.output (STRING_.to_utf32_be (a_character_string))
				end
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
				outputter.output (a_character_string)
			end
		rescue
			if not is_error then
				is_error := True
				retry
			end
		end

invariant

	unique_encoding_scheme: not (is_utf32_be and is_utf32_le)

end

