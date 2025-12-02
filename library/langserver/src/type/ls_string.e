note

	description:

		"LSP unicode string values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_STRING

inherit

	LS_OPTIONAL_STRING
		redefine
			is_equal
		end

	LS_MARKED_STRING
		redefine
			is_equal
		end

	LS_REQUEST_ID
		redefine
			is_equal
		end

	LS_DOCUMENT_URI
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	LS_PROGRESS_TOKEN
		redefine
			is_equal
		end

	LS_CHANGE_ANNOTATION_IDENTIFIER
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	LS_DIAGNOSTIC_CODE
		redefine
			is_equal
		end

	LS_MARKUP_KIND
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	LS_POSITION_ENCODING_KIND
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	LS_TRACE_VALUE
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	LS_PATTERN
		undefine
			utf8_value,
			value
		redefine
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

create

	make_from_utf8,
	make_from_escaped_utf8,
	make_from_string

convert

	make_from_string ({STRING_8, STRING_32, READABLE_STRING_GENERAL}),
	value: {READABLE_STRING_GENERAL}

feature {NONE} -- Initialization

	make_from_utf8 (a_value: STRING_8)
			-- Create a new string value from `a_value`.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			utf8_value := a_value
		ensure
			utf8_value_set: utf8_value = a_value
		end

	make_from_escaped_utf8 (a_value: STRING_8)
			-- Create a new string value from `a_value` with possible escaped characters.
			-- Escaped characters follow JSON convention.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		local
			l_value: STRING_8
			i, nb, j: INTEGER
			b: CHARACTER_8
			l_code: NATURAL_32
			l_invalid: BOOLEAN
		do
			nb := a_value.count
			l_value := a_value
			from i := 1 until i > nb loop
				b := a_value.item (i)
				if b /= '\' then
					if l_value /= a_value then
						l_value.append_character (b)
					end
				elseif i < nb then
					if l_value = a_value then
						create l_value.make (nb)
						from j := 1 until j >= i loop
							l_value.append_character (a_value.item (j))
							j := j + 1
						end
					end
					i := i + 1
					b := a_value.item (i)
					inspect b
					when '%"' then
						l_value.append_character ('%"')
					when '\' then
						l_value.append_character ('\')
					when '/' then
						l_value.append_character ('/')
					when 'b' then
						l_value.append_character ('%B')
					when 'f' then
						l_value.append_character ('%F')
					when 'n' then
						l_value.append_character ('%N')
					when 'r' then
						l_value.append_character ('%R')
					when 't' then
						l_value.append_character ('%T')
					when 'u' then
						if i + 4 <= nb then
							l_invalid := False
							l_code := 0
							from j := 1 until j > 4 loop
								l_code := l_code * 16
								b := a_value.item (i + j)
								inspect b
								when '0' then
								when '1' then
									l_code := l_code + 1
								when '2' then
									l_code := l_code + 2
								when '3' then
									l_code := l_code + 3
								when '4' then
									l_code := l_code + 4
								when '5' then
									l_code := l_code + 5
								when '6' then
									l_code := l_code + 6
								when '7' then
									l_code := l_code + 7
								when '8' then
									l_code := l_code + 8
								when '9' then
									l_code := l_code + 9
								when 'a', 'A' then
									l_code := l_code + 10
								when 'b', 'B' then
									l_code := l_code + 11
								when 'c', 'C' then
									l_code := l_code + 12
								when 'd', 'D' then
									l_code := l_code + 13
								when 'e', 'E' then
									l_code := l_code + 14
								when 'f', 'F' then
									l_code := l_code + 15
								else
										-- Invalid escaped character.
									l_invalid := True
										-- Jump out of the loop.
									j := 4
								end
								j := j + 1
							end
							if l_invalid then
								l_value.append_character ('\')
								l_value.append_character ('u')
							else
								{UC_UTF8_ROUTINES}.append_natural_32_code_to_utf8 (l_value, l_code)
								i := i + 4
							end
						else
								-- Invalid escaped character.
							l_value.append_character ('\')
							l_value.append_character ('u')
						end
					else
							-- Invalid escaped character.
						l_value.append_character ('\')
						l_value.append_character (b)
					end
				else
						-- Invalid escaped character.
					if l_value /= a_value then
						l_value.append_character (b)
					end
				end
				i := i + 1
			end
			utf8_value := l_value
		ensure
			no_escaped_utf8_value_set: not a_value.has ('\') implies utf8_value = a_value
		end

	make_from_string (a_string: READABLE_STRING_GENERAL)
			-- Create a new string value from `a_string`.
		require
			a_string_not_void: a_string /= Void
			valid_unicode: across 1 |..| a_string.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end
		do
			if attached {STRING_8} a_string as l_string_8 and then l_string_8.same_type (once {STRING_8} "") and then {UC_UTF8_ROUTINES}.string_byte_count (l_string_8) = l_string_8.count then
				make_from_utf8 (l_string_8)
			else
				make_from_utf8 ({UC_UTF8_ROUTINES}.string_to_utf8 (a_string))
			end
		ensure
			value_set: value.same_string (a_string)
			utf8_value_set_if_ascii: (a_string.same_type ({STRING_8} "") and then {UC_UTF8_ROUTINES}.string_byte_count (a_string) = a_string.count) implies utf8_value = a_string
		end

feature -- Status report

	is_equal (other: like Current): BOOLEAN
			-- Is `other` considered equal to `Current`?
		do
			Result := other.utf8_value.same_string (utf8_value)
		end

feature -- Access

	utf8_value: STRING_8
			-- String value
			-- (using UTF-8 encoding)

	value: READABLE_STRING_GENERAL
			-- String value
		do
			if {UC_UTF8_ROUTINES}.unicode_character_count (utf8_value) = utf8_value.count then
				Result := utf8_value
			else
				Result := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (utf8_value)
			end
		end

	to_string: LS_STRING
			-- String representation
		do
			Result := Current
		end

	hash_code: INTEGER
			-- Hash value
		do
			Result := utf8_value.hash_code
		end

feature -- Output

	append_escaped_to_utf8 (a_utf8: STRING_8)
			-- Append escaped version of `utf8_value` to `a_utf8`.
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string_8: a_utf8.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (a_utf8)
		local
			i, nb: INTEGER
			b: CHARACTER_8
			l_code: NATURAL_32
		do
			nb := utf8_value.count
			from i := 1 until i > nb loop
				b := utf8_value.item (i)
				inspect b
				when '%"' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('%"')
				when '\' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('\')
				when '%B' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('b')
				when '%F' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('f')
				when '%N' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('n')
				when '%R' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('r')
				when '%T' then
					a_utf8.append_character ('\')
					a_utf8.append_character ('t')
				else
					l_code := b.natural_32_code
					if l_code < 32 then
						a_utf8.append_character ('\')
						a_utf8.append_character ('u')
						a_utf8.append_character ('0')
						a_utf8.append_character ('0')
						if l_code < 16 then
							a_utf8.append_character ('0')
							a_utf8.append_character (l_code.to_hex_character)
						else
							a_utf8.append_character ('1')
							l_code := l_code - 16
							a_utf8.append_character (l_code.to_hex_character)
						end
					else
						a_utf8.append_character (b)
					end
				end
				i := i + 1
			end
		ensure
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (a_utf8)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_string (Current)
		end

invariant

	utf8_value_not_void: utf8_value /= Void
	utf8_value_is_string_8: utf8_value.same_type ({STRING_8} "")
	valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (utf8_value)

end
