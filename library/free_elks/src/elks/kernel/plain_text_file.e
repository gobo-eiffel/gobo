note
	description: "Files viewed as persistent sequences of ASCII characters"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class PLAIN_TEXT_FILE

inherit
	FILE
		rename
			index as position
		redefine
			make_with_name,
			make_with_path,
			is_plain_text
		end

create
	make, make_with_name, make_with_path,
	make_open_read, make_open_write, make_open_append,
	make_open_read_write, make_create_read_write,
	make_open_read_append,
	make_open_temporary, make_open_temporary_with_prefix

feature -- Initialization	

	make_with_name (fn: READABLE_STRING_GENERAL)
			-- <Precursor/>
		do
			Precursor (fn)
			create last_string_32.make_empty
		end

	make_with_path (a_path: PATH)
			-- <Precursor/>
		do
			Precursor (a_path)
			create last_string_32.make_empty
		end

feature -- Status report

	is_plain_text: BOOLEAN
			-- Is file reserved for text (character sequences)? (Yes)
		do
			Result := True
		end

	support_storable: BOOLEAN = False
			-- Can medium be used to store an Eiffel structure?

feature -- Output

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_integer_64 (i: INTEGER_64)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_integer_16 (i: INTEGER_16)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_integer_8 (i: INTEGER_8)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_natural_64 (i: NATURAL_64)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_natural_16 (i: NATURAL_16)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_natural_8 (i: NATURAL_8)
			-- Write ASCII value of `i' at current position.
		do
			put_string_general (i.out)
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write ASCII value of `b' at current position.
		do
			put_string_general (if b then true_string else false_string end)
		end

	put_real, putreal, put_real_32 (r: REAL_32)
			-- Write ASCII value of `r' at current position.
		do
			file_pr (file_pointer, r)
		end

	put_double, putdouble, put_real_64 (d: REAL_64)
			-- Write ASCII value `d' at current position.
		do
			file_pd (file_pointer, d)
		end

	put_string_32 (s: READABLE_STRING_32)
			-- Write string `s` at current position.
		do
			put_string_general (s)
		end

	put_string_general (s: READABLE_STRING_GENERAL)
			-- Write string `s` at current position.
		require
			extendible: extendible
			non_void: s /= Void
		local
			str: STRING_8
			utf32, utf8: ENCODING
			l_encoding: like encoding
		do
			l_encoding := encoding
			utf32 := {SYSTEM_ENCODINGS}.utf32
			utf32.convert_to (l_encoding, s)
			if utf32.last_conversion_successful then
				str := utf32.last_converted_string_8
			else
					-- This is a hack, since some OSes don't support convertion from/to UTF-32 to `a_console_encoding'.
					-- We convert UTF-32 to UTF-8 first, then convert UTF-8 to `a_console_encoding'.
				utf8 := {SYSTEM_ENCODINGS}.utf8
				utf32.convert_to (utf8, s)
				if utf32.last_conversion_successful then
					str := utf32.last_converted_string_8
					if not utf8.same_as (l_encoding) then
						utf8.convert_to (l_encoding, str)
						if utf8.last_conversion_successful then
							str := utf8.last_converted_string_8
						end
					end
				elseif s.is_valid_as_string_8 then
					str := s.to_string_8
				else
						-- Fallback to UTF-8.
					str := {UTF_CONVERTER}.string_32_to_utf_8_string_8 (s)
				end
			end
			put_string (str)
		end

feature -- Input

	read_integer_64
			-- Read the ASCII representation of a new 64-bit integer
			-- from file. Make result available in `last_integer_64`.
		do
			read_integer_with_no_type
			last_integer_64 := ctoi_convertor.parsed_integer_64
		end

	read_integer, readint, read_integer_32
			-- Read the ASCII representation of a new 32-bit integer
			-- from file. Make result available in `last_integer'.
		do
			read_integer_with_no_type
			last_integer := ctoi_convertor.parsed_integer_32
		end

	read_integer_16
			-- Read the ASCII representation of a new 16-bit integer
			-- from file. Make result available in `last_integer_16'.
		do
			read_integer_with_no_type
			last_integer_16 := ctoi_convertor.parsed_integer_16
		end

	read_integer_8
			-- Read the ASCII representation of a new 8-bit integer
			-- from file. Make result available in `last_integer_8'.
		do
			read_integer_with_no_type
			last_integer_8 := ctoi_convertor.parsed_integer_8
		end

	read_natural_64
			-- Read the ASCII representation of a new 64-bit natural
			-- from file. Make result available in `last_natural_64'.
		do
			read_integer_with_no_type
			last_natural_64 := ctoi_convertor.parsed_natural_64

		end

	read_natural, read_natural_32
			-- Read the ASCII representation of a new 32-bit natural
			-- from file. Make result available in `last_natural'.
		do
			read_integer_with_no_type
			last_natural := ctoi_convertor.parsed_natural_32
		end

	read_natural_16
			-- Read the ASCII representation of a new 16-bit natural
			-- from file. Make result available in `last_natural_16'.
		do
			read_integer_with_no_type
			last_natural_16 := ctoi_convertor.parsed_natural_16
		end

	read_natural_8
			-- Read the ASCII representation of a new 8-bit natural
			-- from file. Make result available in `last_natural_8'.
		do
			read_integer_with_no_type
			last_natural_8 := ctoi_convertor.parsed_natural_8
		end

	read_real, readreal, read_real_32
			-- Read the ASCII representation of a new real
			-- from file. Make result available in `last_real'.
		do
			last_real := file_gr (file_pointer)
		end

	read_double, readdouble, read_real_64
			-- Read the ASCII representation of a new double
			-- from file. Make result available in `last_double'.
		do
			last_double := file_gd (file_pointer)
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		do
			Result := file_gss (file_pointer, a_string.area.item_address (pos - 1), nb)
				-- `a_string' was externally modified, we need to reset its `hash_code'.
			a_string.reset_hash_codes
		end

feature -- Unicode input

	last_string_32: STRING_32
			-- Last unicode string read.

	read_unicode_line
			-- Read a line as STRING_32.
		local
			utf32: ENCODING
		do
			read_line
			utf32 := {SYSTEM_ENCODINGS}.utf32
			encoding.convert_to (utf32, last_string)
			if encoding.last_conversion_successful then
				last_string_32.wipe_out
				last_string_32.append (encoding.last_converted_string_32)
			end
		end

feature -- Encoding

	encoding: ENCODING
			-- Associated encoding.
		do
			if attached internal_encoding as l_encoding then
				Result := l_encoding
			else
				Result := default_encoding
				internal_encoding := Result
			end
		ensure
			encoding_not_void: Result /= Void
		end

	default_encoding: ENCODING
			-- Default value for `encoding`.
		once
			Result := {SYSTEM_ENCODINGS}.utf8
		ensure
			default_encoding_not_void: Result /= Void
		end
		
	set_encoding (enc: like encoding)
			-- Set associated `encoding` with `enc`.
		require
			enc_not_void: enc /= Void
		do
			internal_encoding := enc
		ensure
			encoding_set: encoding = enc
		end

	set_utf8_encoding
			-- Set `encoding` to UTF-8.
		do
			set_encoding ({SYSTEM_ENCODINGS}.utf8)
		ensure
			encoding_set: encoding = {SYSTEM_ENCODINGS}.utf8
		end

	detect_encoding
			-- Detect and update `encoding` according to BOM detection.
		require
			is_open_read
		local
			pos: like position
			c1,c2,c3,c4: CHARACTER
		do
				--| See https://en.wikipedia.org/wiki/Byte_order_mark
			pos := position
			start
			if readable then
				read_character
				c1 := last_character
				inspect c1
				when '%/0xEF/' then
					if readable then
						read_character
						c2 := last_character
						if c2 = '%/0xBB/' then
							if readable then
								read_character
								c3 := last_character
								if c3 = '%/0xBF/' then
										-- EF BB BF
									set_utf8_encoding
								else
									back
								end
							end
						else
							back
						end
					end
				when '%/0xFF/' then
					if readable then
						read_character
						c2 := last_character
						if c2 = '%/0xFE/' then
							if readable then
								read_character
								c3 := last_character
								if readable then
									read_character
									c4 := last_character
								end
								if c3 = '%U' and c4 = '%U'then
										-- FF FE 00 00
									set_encoding (create {ENCODING}.make ({CODE_PAGE_CONSTANTS}.utf32_le))
								else
									-- FF FE
									set_encoding (create {ENCODING}.make ({CODE_PAGE_CONSTANTS}.utf16_le))
									back
									back
								end
							end
						else
							back
						end
					end
				when '%/0xFE/' then
					if readable then
						read_character
						c2 := last_character
						if c2 = '%/0xFF/' then
								-- FE FF
							set_encoding (create {ENCODING}.make ({CODE_PAGE_CONSTANTS}.utf16_be))
						else
							back
						end
					end
				when '%U' then
					if readable then
						read_character
						c2 := last_character
						if c2 = '%U' then
							if readable then
								read_character
								c3 := last_character
								if c3 = '%/0xFE/' then
									if readable then
										read_character
										c4 := last_character
										if c4 = '%/0xFF/' then
												-- 00 00 FE FF
											set_encoding (create {ENCODING}.make ({CODE_PAGE_CONSTANTS}.utf32_be))
										else
											back
										end
									end
								else
									back
								end
							end
						else
							back
						end
					end
				else
					back
				end
			end
			if pos /= 0 then
				go (pos)
			end
		end

	put_encoding_bom
			-- Put Byte Order Mark (BOM) related to `encoding`.
		require
			is_open_write: is_open_write
			at_beginning: position = 0
		local
			cp: READABLE_STRING_8
		do
			cp := encoding.code_page
			if cp.is_case_insensitive_equal_general ({CODE_PAGE_CONSTANTS}.utf8) then
				put_character ('%/0xEF/')
				put_character ('%/0xBB/')
				put_character ('%/0xBF/')
			elseif cp.is_case_insensitive_equal_general ({CODE_PAGE_CONSTANTS}.utf16_le) then
				put_character ('%/0xFF/')
				put_character ('%/0xFE/')
			elseif cp.is_case_insensitive_equal_general ({CODE_PAGE_CONSTANTS}.utf16_be) then
				put_character ('%/0xFE/')
				put_character ('%/0xFF/')
			elseif cp.is_case_insensitive_equal_general ({CODE_PAGE_CONSTANTS}.utf32_le) then
				put_character ('%/0xFF/')
				put_character ('%/0xFE/')
				put_character ('%U')
				put_character ('%U')
			elseif cp.is_case_insensitive_equal_general ({CODE_PAGE_CONSTANTS}.utf32_be) then
				put_character ('%U')
				put_character ('%U')
				put_character ('%/0xFE/')
				put_character ('%/0xFF/')
			end
		end

feature {NONE} -- Encoding

	internal_encoding: detachable ENCODING
			-- Internal value for `encoding`.
			
feature {NONE} -- Implementation

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR
			-- Convertor used to parse string to integer or natural
		once
			create Result.make
			Result.set_leading_separators (internal_leading_separators)
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (False)
		end

	internal_leading_separators: STRING = " %N%R%T"
			-- Characters that are considered as leading separators

	is_sequence_an_expected_numeric: BOOLEAN
			-- Is last number sequence read by `read_number_sequence' an expected numeric?

	read_number_sequence (convertor: STRING_TO_NUMERIC_CONVERTOR; conversion_type: INTEGER)
			-- Read a number sequence from current position and parse this
			-- sequence using `convertor' to see if it is a valid numeric.
			-- Set `is_sequence_an_expected_numeric' with True if it is valid.
		do
			convertor.reset (conversion_type)
			from
				is_sequence_an_expected_numeric := True
			until
				end_of_file or else not is_sequence_an_expected_numeric
			loop
				read_character
				if not end_of_file then
					convertor.parse_character (last_character)
					is_sequence_an_expected_numeric := convertor.parse_successful
				end
			end
		end

	read_integer_with_no_type
			-- Read a ASCII representation of number of `type'
			-- at current position.
		do
			read_number_sequence (ctoi_convertor, {NUMERIC_INFORMATION}.type_no_limitation)
				-- Return character(s) if necessary.
			if not is_sequence_an_expected_numeric then
				return_characters
			end
		end

	return_characters
			-- Return character(s)
		do
			if last_character = '%N' and {PLATFORM}.is_windows then
				back
			end
			back
		end

	file_gi (file: POINTER): INTEGER
			-- Get an integer from `file'
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		alias
			"eif_file_gi"
		end

	file_gr (file: POINTER): REAL_32
			-- Read a real from `file'
		external
			"C signature (FILE *): EIF_REAL_32 use %"eif_file.h%""
		alias
			"eif_file_gr"
		end

	file_gd (file: POINTER): REAL_64
			-- Read a double from `file'
		external
			"C signature (FILE *): EIF_REAL_64 use %"eif_file.h%""
		alias
			"eif_file_gd"
		end

	file_pi (file: POINTER; n: INTEGER)
			-- Put `n' to end of `file'.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		alias
			"eif_file_pi"
		end

	file_pr (file: POINTER; r: REAL_32)
			-- Put `r' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_32) use %"eif_file.h%""
		alias
			"eif_file_pr"
		end

	file_pd (file: POINTER; d: REAL_64)
			-- Put `d' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_64) use %"eif_file.h%""
		alias
			"eif_file_pd"
		end

invariant

	plain_text: is_plain_text

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
