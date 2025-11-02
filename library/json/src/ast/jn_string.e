note

	description:

		"JSON string values"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_STRING

inherit

	JN_VALUE
		redefine
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

create

	make_from_utf8,
	make_from_string,
	make_from_escaped

feature {NONE} -- Initialization

	make_from_utf8 (a_value: STRING_8)
			-- Create a new string value from `a_value` with no escaped characters.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			value := a_value
			literal := a_value
		ensure
			value_set: value = a_value
			literal_set: literal = a_value
		end

	make_from_string (a_string: READABLE_STRING_GENERAL)
			-- Create a new string value from `a_string` with no escaped characters.
		require
			a_string_not_void: a_string /= Void
			valid_unicode: across 1 |..| a_string.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end
		do
			if a_string.same_type (once {STRING_8} "") and then {UC_UTF8_ROUTINES}.string_byte_count (a_string) = a_string.count then
				make_from_utf8 (a_string)
			else
				make_from_utf8 ({UC_UTF8_ROUTINES}.string_to_utf8 (a_string))
			end
		end

	make_from_escaped (a_value: STRING_8)
			-- Create a new string value from `a_value` with possible escaped characters.
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
			value := l_value
			literal := a_value
			is_escaped := True
		ensure
			literal_set: literal = a_value
			is_escaped: is_escaped
		end

feature -- Status report

	is_escaped: BOOLEAN
			-- Is `literal` escaped?
			-- (i.e. can it be used in a JSON text?)

	is_equal (other: like Current): BOOLEAN
			-- Is `other` considered equal to `Current`?
		do
			Result := other.value.same_string (value)
		end

feature -- Access

	value: STRING_8
			-- String value
			-- (using UTF-8 encoding)

	literal: STRING_8
			-- Literal value (may contain escaped characters)
			-- (using UTF-8 encoding)

	hash_code: INTEGER
			-- Hash value
		do
			Result := value.hash_code
		end

feature -- Output

	append_to_string (a_string: STRING_8)
			-- Append `to_text' to `a_string'.
		do
			a_string.append_string (value)
		end

feature -- Processing

	process (a_processor: JN_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_string (Current)
		end

invariant

	value_not_void: value /= Void
	value_is_string_8: value.same_type ({STRING_8} "")
	valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (value)
	literal_not_void: literal /= Void
	literal_is_string_8: literal.same_type ({STRING_8} "")
	literal_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (literal)

end
