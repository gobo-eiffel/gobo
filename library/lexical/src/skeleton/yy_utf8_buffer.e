note

	description:
	"[
		Lexical analyzer buffers for Unicode inputs.
		The buffer contains the UTF-8 bytes, after possible
		conversion if the input used a different encoding.
		Supported encodings: UTF-8, ISO-8859-1.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class YY_UTF8_BUFFER

inherit

	YY_BUFFER
		rename
			make as make_from_utf8_string,
			set_string as set_utf8_string
		end

create

	make,
	make_from_utf8_string,
	make_from_buffer

feature {NONE} -- Initialization

	make (a_string: READABLE_STRING_GENERAL)
			-- Create a new buffer with characters from `a_string'.
			-- Invalid Unicode characters are encoded with one byte 0xFF.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			c, b: NATURAL_32
			l_buffer: like content
		do
			nb := a_string.count
			nb2 := {UC_UTF8_ROUTINES}.string_byte_count (a_string)
			l_buffer := new_default_buffer (nb2 + 2)
			from i := 1 until i > nb loop
				c := a_string.code (i)
				if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
					c := {UC_UTF8_ROUTINES}.natural_32_code_to_utf8 (c)
					j := j + 1
					l_buffer.put (((c & 0xFF000000) |>> (3 * {PLATFORM}.natural_8_bits)).to_character_8, j)
					b := c & 0x00FF0000
					if b /= 0 then
						j := j + 1
						l_buffer.put ((b |>> (2 * {PLATFORM}.natural_8_bits)).to_character_8, j)
						b := c & 0x0000FF00
						if b /= 0 then
							j := j + 1
							l_buffer.put ((b |>> {PLATFORM}.natural_8_bits).to_character_8, j)
							b := c & 0x000000FF
							if b /= 0 then
								j := j + 1
								l_buffer.put (b.to_character_8, j)
							end
						end
					end
				else
					j := j + 1
					l_buffer.put ((0xFF).to_character_8, j)
				end
				i := i + 1
			end
			l_buffer.put (End_of_buffer_character, j + 1)
			l_buffer.put (End_of_buffer_character, j + 2)
			make_from_buffer (l_buffer)
		ensure
			count_set: count = {UC_UTF8_ROUTINES}.string_byte_count (a_string)
			capacity_set: capacity = count
			beginning_of_line: beginning_of_line
		end

feature -- Setting

	set_string (a_string: READABLE_STRING_GENERAL)
			-- Reset buffer with characters from `a_string'.
			-- Invalid Unicode characters are encoded with one byte 0xFF.
			-- Resize buffer capacity if needed.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			c, b: NATURAL_32
			l_buffer: like content
		do
			nb := a_string.count
			nb2 := {UC_UTF8_ROUTINES}.string_byte_count (a_string)
			l_buffer := content
			if nb2 > capacity then
				l_buffer.resize (nb2 + 2)
			end
			from i := 1 until i > nb loop
				c := a_string.code (i)
				if {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (c) then
					c := {UC_UTF8_ROUTINES}.natural_32_code_to_utf8 (c)
					j := j + 1
					l_buffer.put (((c & 0xFF000000) |>> (3 * {PLATFORM}.natural_8_bits)).to_character_8, j)
					b := c & 0x00FF0000
					if b /= 0 then
						j := j + 1
						l_buffer.put ((b |>> (2 * {PLATFORM}.natural_8_bits)).to_character_8, j)
						b := c & 0x0000FF00
						if b /= 0 then
							j := j + 1
							l_buffer.put ((b |>> {PLATFORM}.natural_8_bits).to_character_8, j)
							b := c & 0x000000FF
							if b /= 0 then
								j := j + 1
								l_buffer.put (b.to_character_8, j)
							end
						end
					end
				else
					j := j + 1
					l_buffer.put ((0xFF).to_character_8, j)
				end
				i := i + 1
			end
			l_buffer.put (End_of_buffer_character, j + 1)
			l_buffer.put (End_of_buffer_character, j + 2)
			make_from_buffer (l_buffer)
			count := j
		ensure
			count_set: count = {UC_UTF8_ROUTINES}.string_byte_count (a_string)
			capacity_set: capacity = (old capacity).max (count)
			beginning_of_line: beginning_of_line
		end

end
