note
	description: "Eiffel implementations for Unicode encoding conversion."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	UNICODE_CONVERSION

inherit
	ENCODING_I

create {ENCODING}
	default_create

feature -- Query

	is_code_page_valid (a_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_code_page` valid?
		do
			if a_code_page /= Void and then not a_code_page.is_empty then
				Result := unicode_encodings.has (a_code_page)
			end
		end

	is_code_page_convertible (a_from_code_page, a_to_code_page: READABLE_STRING_8): BOOLEAN
			-- Is `a_from_code_page` convertible to `a_to_code_page`.
		do
				-- We accept conversion between the same encodings to optimize.
			Result := a_from_code_page = {CODE_PAGE_CONSTANTS}.utf8 and then a_to_code_page = {CODE_PAGE_CONSTANTS}.utf32
			if not Result then
				if a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) then
						-- UTF-8 to UTF-32
					Result := a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) or else
								a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32)
				elseif a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32) then
						-- UTF-32 to UTF-8
						-- UTF-32 to UTF-16
					Result := a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32) or else
								a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) or else
								a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf16)
				elseif a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf16) then
						-- UTF-16 to UTF-32
					Result := a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf16) or else
								a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32)
				elseif a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf7) then
						-- Do not support UTF-7 encoding conversion.
					Result := a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf7)
				--else
						-- Neither other endian independent Unicode encodings.
				end
			end
		end

	last_conversion_lost_data: BOOLEAN = False
			-- Has last conversion between two encodings lost data?

	is_valid_utf8 (a_string: READABLE_STRING_8): BOOLEAN
			-- Is `a_string` valid UTF-8 string?
		require
			a_string_not_void: a_string /= Void
		do
			Result := {UTF_CONVERTER}.is_valid_utf_8_string_8 (a_string)
		end

	is_valid_as_string_16 (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Check high 16 bit of any char in `a_string` is zero.
		local
			i, nb: INTEGER_32
			l_area: SPECIAL [CHARACTER_32]
		do
			if a_string /= Void then
				if a_string.is_string_32 then
					from
						nb := a_string.count
						Result := True
						l_area := a_string.as_string_32.area
					until
						i = nb or not Result
					loop
						Result := l_area [i].code <= 0xFFFF
						i := i + 1
					end
				else
					Result := True
				end
			end
		end

feature -- Conversion

	convert_to (a_from_code_page: READABLE_STRING_8; a_from_string: READABLE_STRING_GENERAL; a_to_code_page: READABLE_STRING_8)
			-- Convert between Unicode encodings.
		do
			reset
				-- We accept conversion between the same encodings to optimize.
			if a_from_code_page.is_case_insensitive_equal (a_to_code_page) then
				last_conversion_successful := True
				if a_from_string.is_string_8 then
					last_converted_string := a_from_string.to_string_8
				else
					last_converted_string := a_from_string.as_string_32
				end
			else
				if a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) then
						-- UTF-8 to UTF-32
					last_converted_string := utf8_to_utf32
						(if a_from_string.is_valid_as_string_8 then
								-- Use original string.
							a_from_string.to_string_8
						else
								-- Fallback to UTF-8.
							{UTF_CONVERTER}.utf_32_string_to_utf_8_string_8 (a_from_string)
						end)
					last_conversion_successful := True
				elseif a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32) then
					if a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf8) then
							-- UTF-32 to UTF-8
						last_converted_string := utf32_to_utf8 (a_from_string.as_string_32)
						last_conversion_successful := True
					elseif a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf16) then
							-- UTF-32 to UTF-16
						last_converted_string := utf32_to_utf16 (a_from_string.as_string_32)
						last_was_wide_string := True
						last_conversion_successful := True
					end
				elseif a_from_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf16) then
						-- UTF-16 to UTF-32
					if a_to_code_page.is_case_insensitive_equal ({CODE_PAGE_CONSTANTS}.utf32) then
						last_converted_string := utf16_to_utf32 (a_from_string.as_string_32)
						last_conversion_successful := True
					end
				--elseif a_from_code_page.is_case_insensitive_equal (utf7) then
						-- Do not support UTF-7 encoding conversion.
				--else
						-- Neither other endian independent Unicode encodings.
				end
			end
		end

feature -- Explicit Conversion

	utf8_to_utf32 (a_string: READABLE_STRING_8): STRING_32
			-- UTF8 to UTF32 conversion, Eiffel implementation.
		require
			a_string_not_void: a_string /= Void
		do
			Result := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (a_string)
		ensure
			Result_not_void: Result /= Void
		end

	utf32_to_utf8 (a_string: READABLE_STRING_32): STRING_8
			-- Convert UTF32 to UTF8.
		require
			a_string_not_void: a_string /= Void
		do
			Result := {UTF_CONVERTER}.utf_32_string_to_utf_8_string_8 (a_string)
		ensure
			Result_not_void: Result /= Void
		end

	utf32_to_utf16 (a_str: READABLE_STRING_32): STRING_32
			-- Convert utf32 to utf16 without data lose.
		require
			a_str_not_void: a_str /= Void
		local
			l_code: NATURAL_32
			i, l_count: INTEGER
		do
			create Result.make (a_str.count * 2)
			from
				i := 1
				l_count := a_str.count
			until
				i > l_count
			loop
				l_code := a_str.code (i) & 0xFFFFF
				if l_code > 0xFFFF then
					l_code := l_code - 0x10000
					Result.append_code (l_code |>> 10 | 0xD800)
					Result.append_code (l_code & 0x03FF | 0xDC00)
				else
					Result.append_code (l_code)
				end
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	utf16_to_utf32 (a_str: READABLE_STRING_32): STRING_32
			-- Convert utf16 to utf32.
		require
			a_str_not_void: a_str /= Void
		local
			i, -- Old string pointer
			l_count: INTEGER
			l_code: NATURAL_32
			l_temp: NATURAL_32
			l_lower: NATURAL_32
		do
			l_count := a_str.count
			create Result.make (l_count)
			from
				i := 1
			until
				i > l_count
			loop
				l_code := a_str.code (i)
				i := i + 1
				l_temp := l_code & 0xFFFF
				if i <= l_count then
					l_lower := a_str.code (i) & 0xFFFF
				end
				if l_temp >= 0xD800 and then l_temp <= 0xDBFF and then i <= l_count and then
					l_lower >= 0xDC00 and then
					l_lower <= 0xDFFF
				then
					Result.append_code ((l_temp & 0x03FF) |<< 10 + l_lower & 0x03FF + 0x10000)
					i := i + 1
				else
					Result.append_code (l_temp)
				end
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	append_code_point_to_utf8 (a_code: NATURAL_32; a_string: STRING_8)
			-- Append a Unicode code point `a_code` to a UTF-8 stream.
		require
			a_string_not_void: a_string /= Void
				-- According to ISO/IEC 10646, the maximum Unicode point is 10FFFF.
			a_code_is_valid: a_code >= 0 and then a_code <= 0x10FFFF
		do
			{UTF_CONVERTER}.utf_32_code_into_utf_8_string_8 (a_code, a_string)
		ensure
			a_string_appended: (a_code <= 127 implies a_string.count = old a_string.count + 1) and
								((a_code > 127 and a_code <= 0x7FF) implies a_string.count = old a_string.count + 2) and
								((a_code > 0x7FF and a_code <= 0xFFFF) implies a_string.count = old a_string.count + 3) and
								((a_code > 0xFFFF and a_code <= 0x10FFFF) implies a_string.count = old a_string.count + 4)
		end

	read_character_from_utf8 (a_position: INTEGER; a_read_bytes: detachable INTEGER_32_REF; a_string: READABLE_STRING_8): CHARACTER_32
			-- Read a Unicode character from UTF-8 string.
			-- `a_string` is in UTF-8.
			-- `a_position` is the starting byte point of a character.
			-- `a_read_bytes` is the number of bytes read.
		require
			a_string_not_void: a_string /= Void
			a_position_in_range: a_position > 0 and a_position <= a_string.count
			a_position_valid: a_string.code (a_position).to_natural_8 <= 127 or
								(a_string.code (a_position).to_natural_8 & 0xE0) = 0xC0 or
								(a_string.code (a_position).to_natural_8 & 0xF0) = 0xE0 or
								(a_string.code (a_position).to_natural_8 & 0xF8) = 0xF0 or
								(a_string.code (a_position).to_natural_8 & 0xFC) = 0xF8 or
								(a_string.code (a_position).to_natural_8 & 0xFE) = 0xFC
		local
			l_pos: INTEGER
			l_nat8: NATURAL_8
			l_code: NATURAL_32
		do
			l_pos := a_position
			l_nat8 := a_string.code (l_pos).to_natural_8
			if l_nat8 <= 127 then
					-- Form 0xxxxxxx.
				Result := l_nat8.to_character_32

			elseif (l_nat8 & 0xE0) = 0xC0 then
					-- Form 110xxxxx 10xxxxxx.
				l_code := (l_nat8 & 0x1F).to_natural_32 |<< 6
				l_pos := l_pos + 1
				l_nat8 := a_string.code (l_pos).to_natural_8
				l_code := l_code | (l_nat8 & 0x3F).to_natural_32
				Result := l_code.to_character_32

			elseif (l_nat8 & 0xF0) = 0xE0 then
				-- Form 1110xxxx 10xxxxxx 10xxxxxx.
				l_code := (l_nat8 & 0x0F).to_natural_32 |<< 12
				l_nat8 := a_string.code (l_pos + 1).to_natural_8
				l_code := l_code | ((l_nat8 & 0x3F).to_natural_32 |<< 6)
				l_nat8 := a_string.code (l_pos + 2).to_natural_8
				l_code := l_code | (l_nat8 & 0x3F).to_natural_32
				Result := l_code.to_character_32
				l_pos := l_pos + 2

			elseif (l_nat8 & 0xF8) = 0xF0 then
				-- Form 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx.
				l_code := (l_nat8 & 0x07).to_natural_32 |<< 18
				l_nat8 := a_string.code (l_pos + 1).to_natural_8
				l_code := l_code | ((l_nat8 & 0x3F).to_natural_32 |<< 12)
				l_nat8 := a_string.code (l_pos + 2).to_natural_8
				l_code := l_code | ((l_nat8 & 0x3F).to_natural_32 |<< 6)
				l_nat8 := a_string.code (l_pos + 3).to_natural_8
				l_code := l_code | (l_nat8 & 0x3F).to_natural_32
				Result := l_code.to_character_32
				l_pos := l_pos + 3

			elseif (l_nat8 & 0xFC) = 0xF8 then
				-- Starts with 111110xx
				-- This seems to be a 5 bytes character,
				-- but UTF-8 is restricted to 4, then substitute with a space
				Result := ' '
				l_pos := l_pos + 4

			else
				-- Starts with 1111110x
				-- This seems to be a 6 bytes character,
				-- but UTF-8 is restricted to 4, then substitute with a space
				Result := ' '
				l_pos := l_pos + 5

			end
			if a_read_bytes /= Void then
				a_read_bytes.set_item (l_pos - a_position + 1)
			end
		end

feature {NONE} -- Implementation

	unicode_encodings: STRING_TABLE [READABLE_STRING_8]
			-- Supported Unicode encodings.
		once
			create Result.make (8)
			Result.put ({CODE_PAGE_CONSTANTS}.utf7, {CODE_PAGE_CONSTANTS}.utf7)
			Result.put ({CODE_PAGE_CONSTANTS}.utf8, {CODE_PAGE_CONSTANTS}.utf8)

			Result.put ({CODE_PAGE_CONSTANTS}.utf16, {CODE_PAGE_CONSTANTS}.utf16)
			Result.put ({CODE_PAGE_CONSTANTS}.utf16_le, {CODE_PAGE_CONSTANTS}.utf16_le)

			Result.put ({CODE_PAGE_CONSTANTS}.utf32, {CODE_PAGE_CONSTANTS}.utf32)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_le, {CODE_PAGE_CONSTANTS}.utf32_le)

			Result.put ({CODE_PAGE_CONSTANTS}.utf16_be, {CODE_PAGE_CONSTANTS}.utf16_be)
			Result.put ({CODE_PAGE_CONSTANTS}.utf32_be, {CODE_PAGE_CONSTANTS}.utf32_be)
		end

note
	library:   "Encoding: Library of reusable components for Eiffel."
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
