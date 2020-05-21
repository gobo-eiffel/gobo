note
	description: "[
			Converter from/to UTF-8, UTF-16 and UTF-32 encodings.

			Handling of invalid encodings
			=============================

			Whenever a UTF-8 or UTF-16 sequence is decoded, the decoding routines also check
			that the sequence is valid. If it is not, it will replace the invalid unit (e.g. a byte
			for UTF-8 and a 2-byte for UTF-16 by the replacement character U+FFFD as described by
			variant #3 of the recommended practice for replacement character in Unicode (see
			http://www.unicode.org/review/pr-121.html for more details).

			However it means that you cannot roundtrip incorrectly encoded sequence back and forth
			between the encoded version and the decoded STRING_32 version. To allow roundtrip, an
			escaped representation of a bad encoded sequence has been introduced. It is adding a
			a fourth variant (which is a slight modification of variant #3) to the recommended
			practice where the replacement character is followed by the printed hexadecimal value
			of the invalid byte or the invalid 2-byte sequence.
			
			To provide an example (assuming that the Unicode character U+FFFD is represented as
			? textually):
			1 - on UNIX, any invalid UTF-8 byte sequence such as 0x8F 0x8F is encoded as the
			following Unicode sequence: U+FFFD U+0038 U+0046 U+FFFF U+0038 U+0046, and textually
			it looks like "?8F?8F".
			2 - on Windows, any invalid UTF-16 2-byte sequence such as 0xD800 0x0054 is encoded as the
			following Unicode sequence: U+FFFD U+0075 U+0044 U+0038 U+0030 U+0030 U+FFFD U+0035 U+0033,
			and textually it looks like "?uD800?54". The rule is that if the 2-byte sequence does not fit
			into 1 byte, it uses the letter `u' followed by the hexadecimal value of the 2-byte sequence,
			otherwise it simply uses the 1-byte hexadecimal representation.
		]"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	UTF_CONVERTER

feature -- Access

	escape_character: CHARACTER_32 = '%/0xFFFD/'
			-- Unicode replacement character to escape invalid UTF-8 or UTF-16 encoding.
			-- UTF-8 encoding: 0xEF 0xBF 0xBD
			-- Binary UTF-8 encoding: 11101111 10111111 10111101
			-- UTF-16 encoding: 0xFFFD

feature -- Status report

	is_valid_utf_8_string_8 (s: READABLE_STRING_8): BOOLEAN
			-- Is `s' a valid UTF-8 Unicode sequence?
		local
			c: NATURAL_32
			i, nb: INTEGER
		do
			from
				nb := s.count
				Result := True
			until
				i >= nb or not Result
			loop
				i := i + 1
				c := s.code (i)
				if c <= 127 then
						-- Form 0xxxxxxx.
				elseif (c & 0xE0) = 0xC0 and i < nb then
						-- Form 110xxxxx 10xxxxxx.
					i := i + 1
					Result := (s.code (i) & 0xC0) = 0x80
				elseif (c & 0xF0) = 0xE0 and i + 1 < nb then
					-- Form 1110xxxx 10xxxxxx 10xxxxxx.
					i := i + 2
					Result := (s.code (i - 1) & 0xC0) = 0x80 and
						(s.code (i) & 0xC0) = 0x80
				elseif (c & 0xF8) = 0xF0 and i + 2 < nb then
					-- Form 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx.
					i := i + 3
					Result := (s.code (i - 2) & 0xC0) = 0x80 and
						(s.code (i - 1) & 0xC0) = 0x80 and
						(s.code (i) & 0xC0) = 0x80
				else
						-- Anything else is not a valid UTF-8 sequence that would yield a valid Unicode character.
					Result := False
				end
			end
		ensure
			instance_free: class
		end

	is_valid_utf_16le_string_8 (s: READABLE_STRING_8): BOOLEAN
			-- Is `s' a valid UTF-16LE Unicode sequence?
		local
			c1, c2: NATURAL_32
			i, nb: INTEGER
		do
			nb := s.count
				-- If `nb' is not even, then clearly not a valid UTF-16 string.
			if (nb \\ 2) = 0 then
				from
					Result := True
				until
					i >= nb or not Result
				loop
					i := i + 2
					c1 := s.code (i - 1) | (s.code (i) |<< 8)
					if c1 < 0xD800 or c1 >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit, this is valid Unicode.
					elseif c1 <= 0xDBFF then
						i := i + 2
						if i <= nb then
							c2 := s.code (i - 1) | (s.code (i) |<< 8)
							Result := 0xDC00 <= c2 and c2 <= 0xDFF
						else
								-- Surrogate pair is incomplete, clearly not a valid UTF-16 sequence.
							Result := False
						end
					else
							-- Invalid starting surrogate pair which should be between 0xD800 and 0xDBFF.
						Result := False
					end
				end
			end
		ensure
			instance_free: class
		end

	is_valid_utf_16_subpointer (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN): BOOLEAN
			-- Is `p' a valid UTF-16 Unicode sequence between code unit `start_pos' and `end_pos'?
			-- If `a_stop_at_null' we stop checking after finding a null character.
		local
			i, n: INTEGER
			c1, c2: NATURAL_32
		do
			if p.count >= 2 and start_pos >= 0 and start_pos <= end_pos + 1 and end_pos < (p.count // 2) then
				from
					i := start_pos * 2
					n := end_pos * 2
					Result := True
				until
					i > n or not Result
				loop
					c1 := p.read_natural_16 (i)
					if c1 = 0 and a_stop_at_null then
							-- We hit our null terminating character, we can stop
						i := n + 1
					else
						if c1 < 0xD800 or c1 >= 0xE000 then
							-- Codepoint from Basic Multilingual Plane: one 16-bit code unit, this is valid Unicode.
							i := i + 1
						elseif c1 <= 0xDBFF then
							i := i + 2
							if i <= n then
								c2 := p.read_natural_16 (i)
								Result := 0xDC00 <= c2 and c2 <= 0xDFF
							else
									-- Surrogate pair is incomplete, clearly not a valid UTF-16 sequence.
								Result := False
							end
						else
								-- Invalid starting surrogate pair which should be between 0xD800 and 0xDBFF.
							Result := False
						end
					end
				end
			end
		ensure
			instance_free: class
		end

	is_valid_utf_16 (s: SPECIAL [NATURAL_16]): BOOLEAN
			-- Is `s' a valid UTF-16 Unicode sequence?
		local
			i, n: INTEGER
			c: NATURAL_16
		do
			from
				i := 0
				n := s.count
				Result := True
			until
				i >= n or not Result
			loop
				c := s.item (i)
				if c < 0xD800 or c >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit, this is valid Unicode.
				elseif c <= 0xDBFF then
					i := i + 1
					if i < n then
						c := s.item (i)
						Result := 0xDC00 <= c and c <= 0xDFF
					else
							-- Surrogate pair is incomplete, clearly not a valid UTF-16 sequence.
						Result := False
					end
				else
						-- Invalid starting surrogate pair which should be between 0xD800 and 0xDBFF.
					Result := False
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

feature -- Measurement

	utf_8_bytes_count (s: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
			-- Number of bytes necessary to encode in UTF-8 `s.substring (start_pos, end_pos)'.
			-- Note that this feature can be used for both escaped and non-escaped string.
			-- In the case of escaped strings, the result will be possibly higher than really needed.
			-- It does not include the terminating null character.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
		local
			i: INTEGER
			c: NATURAL_32
		do
			from
				i := start_pos
			until
				i > end_pos
			loop
				c := s.code (i)
				if c <= 0x7F then
						-- 0xxxxxxx.
					Result := Result + 1
				elseif c <= 0x7FF then
						-- 110xxxxx 10xxxxxx
					Result := Result + 2
				elseif c <= 0xFFFF then
						-- 1110xxxx 10xxxxxx 10xxxxxx
					Result := Result + 3
				else
						-- c <= 1FFFFF - there are no higher code points
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					Result := Result + 4
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	utf_16_characters_count_form_pointer (m: MANAGED_POINTER; start_pos, end_pos: INTEGER): INTEGER
			-- Number of characters of the UTF-16 encoded `m' starting at `start_pos' in `m' up to `end_pos - 1'.
			-- It does not include the terminating null character.
		require
			start_position_big_enough: start_pos >= 0
			end_position: start_pos <= end_pos + 2
			end_pos_small_enought: end_pos < m.count
			even_start_position: start_pos \\ 2 = 0
			even_end_position: end_pos \\ 2 = 0
		local
			i, n: INTEGER
			c: NATURAL_32
		do
			from
				i := start_pos
				n := end_pos
			until
				i >= end_pos
			loop
				c := m.read_natural_16 (i)
				if c < 0xD800 or c >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					i := i + 2
				elseif i <= n then
						-- Supplementary Planes: surrogate pair with lead and trail surrogates.						
					i := i + 4
				end
				Result := Result + 1
			end
		ensure
			instance_free: class
		end

	utf_16_bytes_count (s: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER): INTEGER
			-- Number of bytes necessary at the very least to encode in UTF-16 `s.substring (start_pos, end_pos)'.
			-- Note that this feature can be used for both escaped and non-escaped string.
			-- In the case of escaped strings, the result will be possibly higher than really needed.
			-- It does not include the terminating null character.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
		local
			i: INTEGER
			c: NATURAL_32
		do
			from
				i := start_pos
			until
				i > end_pos
			loop
				c := s.code (i)
				if c <= 0xFFFF then
						-- Code point from Basic Multilingual Plane: one 16-bit code unit.
					Result := Result + 2
				else
					Result := Result + 4
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	utf_8_to_string_32_count (s: SPECIAL [CHARACTER]; start_pos, end_pos: INTEGER): INTEGER
			-- Count of characters corresponding to UTF-8 sequence `s'.
		require
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < s.count
		local
			i: INTEGER
			n: INTEGER
			c: INTEGER
		do
			from
				i := start_pos
				n := end_pos
			until
				i > n
			loop
				c := s [i].code
				if c <= 0x7F then
						-- 0xxxxxxx
					i := i + 1
					Result := Result + 1
				elseif c <= 0xDF then
						-- 110xxxxx 10xxxxxx
					i := i + 2
					if i <= n then
						Result := Result + 1
					end
				elseif c <= 0xEF then
						-- 1110xxxx 10xxxxxx 10xxxxxx
					i := i + 3
					if i <= n then
						Result := Result + 1
					end
				elseif c <= 0xF7 then
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					i := i + 4
					if i <= n then
						Result := Result + 1
					end
				end
			end
		ensure
			instance_free: class
		end

feature -- UTF-32 to UTF-8

	string_32_to_utf_8_string_8 (s: READABLE_STRING_32): STRING_8
			-- UTF-8 sequence corresponding to `s'.
		do
			Result := utf_32_string_to_utf_8_string_8 (s)
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_string_32 (Result).same_string (s)
		end

	string_32_into_utf_8_string_8 (s: READABLE_STRING_32; a_result: STRING_8)
			-- Copy the UTF-8 sequence corresponding to `s' appended into `a_result'.
		do
			utf_32_string_into_utf_8_string_8 (s, a_result)
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_string_32 (a_result.substring (old a_result.count + 1, a_result.count)).same_string (s)
		end

	utf_32_string_to_utf_8_string_8 (s: READABLE_STRING_GENERAL): STRING_8
			-- UTF-8 sequence corresponding to `s' interpreted as a UTF-32 sequence.
		do
			create Result.make (s.count)
			utf_32_string_into_utf_8_string_8 (s, Result)
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_string_32 (Result).same_string_general (s)
		end

	utf_32_string_into_utf_8_string_8 (s: READABLE_STRING_GENERAL; a_result: STRING_8)
			-- Copy the UTF-8 sequence corresponding to `s' interpreted as a UTF-32 sequence
			-- appended into `a_result'.
		local
			i: like {STRING_32}.count
			n: like {STRING_32}.count
		do
			from
				n := s.count
				a_result.grow (a_result.count + n)
			until
				i >= n
			loop
				i := i + 1
				utf_32_code_into_utf_8_string_8 (s.code (i), a_result)
			end
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_string_32 (a_result.substring (old a_result.count + 1, a_result.count)).same_string_general (s)
		end

	utf_32_code_into_utf_8_string_8 (c: NATURAL_32; a_result: STRING_8)
			-- Copy the UTF-8 sequence corresponding to code `c' appended into `a_result'.
		do
			if c <= 0x7F then
					-- 0xxxxxxx
				a_result.extend (c.to_character_8)
			elseif c <= 0x7FF then
					-- 110xxxxx 10xxxxxx
				a_result.extend (((c |>> 6) | 0xC0).to_character_8)
				a_result.extend (((c & 0x3F) | 0x80).to_character_8)
			elseif c <= 0xFFFF then
					-- 1110xxxx 10xxxxxx 10xxxxxx
				a_result.extend (((c |>> 12) | 0xE0).to_character_8)
				a_result.extend ((((c |>> 6) & 0x3F) | 0x80).to_character_8)
				a_result.extend (((c & 0x3F) | 0x80).to_character_8)
			else
					-- c <= 1FFFFF - there are no higher code points
					-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
				a_result.extend (((c |>> 18) | 0xF0).to_character_8)
				a_result.extend ((((c |>> 12) & 0x3F) | 0x80).to_character_8)
				a_result.extend ((((c |>> 6) & 0x3F) | 0x80).to_character_8)
				a_result.extend (((c & 0x3F) | 0x80).to_character_8)
			end
		ensure
			instance_free: class
		end

	escaped_utf_32_substring_into_utf_8_0_pointer (
				s: READABLE_STRING_GENERAL; start_pos, end_pos: INTEGER; p: MANAGED_POINTER;
				p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER]
		)
			-- Write UTF-8 sequence corresponding to `s', interpreted as a UTF-32 sequence that could
			-- be escaped, with terminating zero to address `p + p_offset' and update the size of `p' to the
			-- number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is zero-terminated.
			-- If `s' contains the `escape_character' followed by either "HH" or "uHHHH" where H stands
			-- for an hexadecimal digit, then `s' has been escaped and will be converted to what is
			-- expected by the current platform.
			-- Otherwise it will be ignored and it will be left as is.
			-- See the note clause for the class for more details on the encoding.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
			p_offset_non_negative: p_offset >= 0
		local
			i, n, m, l_count: INTEGER
			c: NATURAL_32
			l_encoded_value: READABLE_STRING_GENERAL
			l_decoded, l_resized: BOOLEAN
		do
				-- Basic assumptions that there will be only one-byte code units.
			n := end_pos - start_pos + 1
			l_count := p.count
				-- Check that there is at least `n' bytes available plus the terminating null character.
			if l_count - p_offset < (n + 1) then
					-- Optimize resizing, once we have to resize, we actually perform the resizing
					-- only once.
				l_count := p_offset + utf_8_bytes_count (s, start_pos, end_pos) + 1
				p.resize (l_count)
				l_resized := True
			end

			from
				m := p_offset
				i := start_pos - 1
			until
				i >= end_pos
			loop
				i := i + 1
				c := s.code (i)

				if c = escape_character.natural_32_code then
						-- We might be facing a character that was escaped.
						-- In the Unix case, we only accept the 1-byte encoded format.
					if i < n and then s.item (i + 1) = escape_character then
							-- The `escape_character' was escaped, it meant they really wanted an `escape_character'.
						i := i + 1
					elseif i + 1 < n then
							-- We have at least 2 characters to read, make sure they represent an hexadecimal
							-- value.
						l_encoded_value := s.substring (i + 1, i + 2)
						if is_hexa_decimal (l_encoded_value) then
							c := to_natural_32 (l_encoded_value)
							if c <= 0x7F then
									-- Value was encoded when it should not have been
									-- do nothing, we leave the original content as is.	
								c := escape_character.natural_32_code
							else
								l_decoded := True
								i := i + 2
							end
						else
							-- Not an hexadecimal value, it was not escaped.
						end
					else
						-- Not enough to read to make it valid, it was not escaped.
					end
				end

				if not l_decoded then
					if c <= 0x7F then
							-- 0xxxxxxx
						p.put_natural_8 (c.to_natural_8, m)
						m := m + 1
					else
							-- Make sure there is sufficient room for all the remaining characters and
							-- at least 5 bytes, i.e. 4 bytes for the maximum UTF-8 encoding,
							-- and one byte for the terminating null character. Note that we do not
							-- take into account `p_offset' because `m' already includes it.
							-- Note that `end_pos - i' represents the number of remaining characters
							-- to process in the current string.
						if not l_resized and then (m + 5 + (end_pos - i) > l_count) then
								-- Optimize resizing, once we have to resize, we actually perform the resizing
								-- only once.
							l_count := m + utf_8_bytes_count (s, i, end_pos) + 1
							p.resize (l_count)
							l_resized := True
						end
						if c <= 0x7FF then
								-- 110xxxxx 10xxxxxx
							p.put_natural_8 (((c |>> 6) | 0xC0).to_natural_8, m)
							p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 1)
							m := m + 2
						elseif c <= 0xFFFF then
								-- 1110xxxx 10xxxxxx 10xxxxxx
							p.put_natural_8 (((c |>> 12) | 0xE0).to_natural_8, m)
							p.put_natural_8 ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 1)
							p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 2)
							m := m + 3
						else
								-- c <= 1FFFFF - there are no higher code points
								-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
							p.put_natural_8 (((c |>> 18) | 0xF0).to_natural_8, m)
							p.put_natural_8 ((((c |>> 12) & 0x3F) | 0x80).to_natural_8, m + 1)
							p.put_natural_8 ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 2)
							p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 3)
							m := m + 4
						end
					end
				else
					l_decoded := False
						-- Simply put decoded value directly in stream.
					p.put_natural_8 (c.to_natural_8, m)
					m := m + 1
				end
			end
			if l_resized then
					-- `p' was resized so we adjust it to accommodate up to the terminating null character.
				p.resize (m + 1)
			end
			p.put_natural_8 (0, m)
			if a_new_upper /= Void then
				a_new_upper.put (m)
			end
		ensure
			instance_free: class
			roundtrip: a_new_upper /= Void implies utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, a_new_upper.item - 1, False).same_string_general (s.substring (start_pos, end_pos))
			roundtrip: (a_new_upper = Void and then not s.substring (start_pos, end_pos).has ('%U')) implies
				 utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, p.count, True).same_string_general (s.substring (start_pos, end_pos))
		end

	escaped_utf_32_string_to_utf_8_string_8 (s: READABLE_STRING_GENERAL): STRING_8
			-- UTF-8 sequence corresponding to `s' interpreted as a UTF-32 sequence that could be escaped.
			-- If `s' contains the `escape_character' followed by either "HH" or "uHHHH" where H stands
			-- for an hexadecimal digit, then `s' has been escaped and will be converted to what is
			-- expected by the current platform.
			-- Otherwise it will be ignored and it will be left as is.
			-- See the note clause for the class for more details on the encoding.
		do
			create Result.make (s.count)
			escaped_utf_32_string_into_utf_8_string_8 (s, Result)
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_escaped_string_32 (Result).same_string_general (s)
		end

	escaped_utf_32_string_into_utf_8_string_8 (s: READABLE_STRING_GENERAL; a_result: STRING_8)
			-- Copy the UTF-8 sequence corresponding to `s' interpreted as a UTF-32 sequence that could
			-- be escaped appended into `a_result'.
			-- If `s' contains the `escape_character' followed by either "HH" or "uHHHH" where H stands
			-- for an hexadecimal digit, then `s' has been escaped and will be converted to what is
			-- expected by the current platform.
			-- Otherwise it will be ignored and it will be left as is.
			-- See the note clause for the class for more details on the encoding.
		local
			i: like {STRING_32}.count
			n: like {STRING_32}.count
			c: NATURAL_32
			l_encoded_value: READABLE_STRING_GENERAL
			l_decoded: BOOLEAN
		do
			from
				n := s.count
				a_result.grow (a_result.count + n)
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)

				if c = escape_character.natural_32_code then
						-- We might be facing a character that was escaped.
						-- In the Unix case, we only accept the 1-byte encoded format.
					if i < n and then s.item (i + 1) = escape_character then
							-- The `escape_character' was escaped, it meant they really wanted an `escape_character'.
						i := i + 1
					elseif i + 1 < n then
							-- We have at least 2 characters to read, make sure they represent an hexadecimal
							-- value.
						l_encoded_value := s.substring (i + 1, i + 2)
						if is_hexa_decimal (l_encoded_value) then
							c := to_natural_32 (l_encoded_value)
							if c <= 0x7F then
									-- Value was encoded when it should not have been
									-- do nothing, we leave the original content as is.	
								c := escape_character.natural_32_code
							else
								l_decoded := True
								i := i + 2
							end
						else
							-- Not an hexadecimal value, it was not escaped.
						end
					else
						-- Not enough to read to make it valid, it was not escaped.
					end
				end

				if not l_decoded then
					if c <= 0x7F then
							-- 0xxxxxxx
						a_result.extend (c.to_character_8)
					elseif c <= 0x7FF then
							-- 110xxxxx 10xxxxxx
						a_result.extend (((c |>> 6) | 0xC0).to_character_8)
						a_result.extend (((c & 0x3F) | 0x80).to_character_8)
					elseif c <= 0xFFFF then
							-- 1110xxxx 10xxxxxx 10xxxxxx
						a_result.extend (((c |>> 12) | 0xE0).to_character_8)
						a_result.extend ((((c |>> 6) & 0x3F) | 0x80).to_character_8)
						a_result.extend (((c & 0x3F) | 0x80).to_character_8)
					else
							-- c <= 1FFFFF - there are no higher code points
							-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
						a_result.extend (((c |>> 18) | 0xF0).to_character_8)
						a_result.extend ((((c |>> 12) & 0x3F) | 0x80).to_character_8)
						a_result.extend ((((c |>> 6) & 0x3F) | 0x80).to_character_8)
						a_result.extend (((c & 0x3F) | 0x80).to_character_8)
					end
				else
					l_decoded := False
						-- Simply put decoded value directly in stream.
					a_result.extend (c.to_character_8)
				end
			end
		ensure
			instance_free: class
			roundtrip: utf_8_string_8_to_escaped_string_32 (a_result.substring (old a_result.count + 1, a_result.count)).same_string_general (s)
		end

	string_32_into_utf_8_0_pointer (s: READABLE_STRING_32; p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-8 sequence corresponding to `s' with terminating zero
			-- to address `p + p_offset' and update the size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is zero-terminated.
		require
			p_offset_non_negative: p_offset >= 0
		do
			utf_32_string_into_utf_8_0_pointer (s, p, p_offset, a_new_upper)
		ensure
			instance_free: class
			roundtrip: a_new_upper /= Void implies utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, a_new_upper.item - 1, False).same_string (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies
				 utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, p.count, True).same_string_general (s)
		end

	utf_32_string_into_utf_8_0_pointer (s: READABLE_STRING_GENERAL; p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-8 sequence corresponding to `s', interpreted as a UTF-32 sequence,
			-- with terminating zero to address `p + p_offset' and update the size of `p' to the
			-- number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is zero-terminated.
		require
			p_offset_non_negative: p_offset >= 0
		local
			m: INTEGER
			i, n, l_count: INTEGER
			c: NATURAL_32
			l_resized: BOOLEAN
		do
				-- Basic assumptions that there will be only one-byte code units.
			n := s.count
			l_count := p.count
				-- Check that there is at least `n' bytes available plus the terminating null character.
			if l_count - p_offset < (n + 1) then
					-- Optimize resizing, once we have to resize, we actually perform the resizing
					-- only once.
				l_count := p_offset + utf_8_bytes_count (s, 1, n) + 1
				p.resize (l_count)
				l_resized := True
			end

				-- Fill `p' with the converted data.
			from
				i := 0
				m := p_offset
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)
				if c <= 0x7F then
						-- 0xxxxxxx.
					p.put_natural_8 (c.to_natural_8, m)
					m := m + 1
				else
						-- Make sure there is sufficient room for all the remaining characters and
						-- at least 5 bytes, i.e. 4 bytes for the maximum UTF-8 encoding,
						-- and one byte for the terminating null character. Note that we do not
						-- take into account `p_offset' because `m' already includes it.
						-- Note that `n - i' represents the number of remaining characters
						-- to process in the current string.
					if not l_resized and then (m + 5 + (n - i) > l_count) then
							-- Optimize resizing, once we have to resize, we actually perform the resizing
							-- only once.
						l_count := m + utf_8_bytes_count (s, i, n) + 1
						p.resize (l_count)
						l_resized := True
					end

					if c <= 0x7FF then
							-- 110xxxxx 10xxxxxx.
						p.put_natural_8 (((c |>> 6) | 0xC0).to_natural_8, m)
						p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 1)
						m := m + 2
					elseif c <= 0xFFFF then
							-- 1110xxxx 10xxxxxx 10xxxxxx
						p.put_natural_8 (((c |>> 12) | 0xE0).to_natural_8, m)
						p.put_natural_8 ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 1)
						p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 2)
						m := m + 3
					else
							-- c <= 1FFFFF - there are no higher code points
							-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
						p.put_natural_8 (((c |>> 18) | 0xF0).to_natural_8, m)
						p.put_natural_8 ((((c |>> 12) & 0x3F) | 0x80).to_natural_8, m + 1)
						p.put_natural_8 ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 2)
						p.put_natural_8 (((c & 0x3F) | 0x80).to_natural_8, m + 3)
						m := m + 4
					end
				end
			end
			if l_resized then
					-- `p' was resized so we adjust it to accommodate up to the terminating null character.
				p.resize (m + 1)
			end
			p.put_natural_8 (0, m)
			if a_new_upper /= Void then
				a_new_upper.put (m)
			end
		ensure
			instance_free: class
			roundtrip: a_new_upper /= Void implies utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, a_new_upper.item - 1, False).same_string_general (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies
				 utf_8_0_subpointer_to_escaped_string_32 (p, p_offset, p.count, True).same_string_general (s)
		end

	utf_32_string_to_utf_8 (s: READABLE_STRING_GENERAL): SPECIAL [NATURAL_8]
			-- UTF-8 sequence corresponding to `s', interpreted as a UTF-32 sequence.
			-- The sequence is not zero-terminated.
		do
			Result := utf_32_string_to_utf_8_0 (s)
			Result := Result.aliased_resized_area_with_default (0, Result.count - 1)
		ensure
			instance_free: class
			roundtrip: attached utf_32_string_to_utf_8_string_8 (s) as l_ref and then
				across Result as l_spec all l_spec.item = l_ref.code (l_spec.target_index + 1) end
		end

	utf_32_string_to_utf_8_0 (s: READABLE_STRING_GENERAL): SPECIAL [NATURAL_8]
			-- UTF-8 sequence corresponding to `s', interpreted as a UTF-32 sequence.
			-- The sequence is zero-terminated.
		local
			m: INTEGER
			i, n: like {STRING_32}.count
			c: NATURAL_32
		do
			n := s.count

				-- First compute how many bytes we need to convert `s' to UTF-8.
			m := utf_8_bytes_count (s, 1, n)

				-- Fill `Result' with the converted data.
			from
				create Result.make_filled (0, m + 1)
				i := 0
				m := 0
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)
				if c <= 0x7F then
						-- 0xxxxxxx.
					Result.put (c.to_natural_8, m)
					m := m + 1
				elseif c <= 0x7FF then
						-- 110xxxxx 10xxxxxx.
					Result.put (((c |>> 6) | 0xC0).to_natural_8, m)
					Result.put (((c & 0x3F) | 0x80).to_natural_8, m + 1)
					m := m + 2
				elseif c <= 0xFFFF then
						-- 1110xxxx 10xxxxxx 10xxxxxx
					Result.put (((c |>> 12) | 0xE0).to_natural_8, m)
					Result.put ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 1)
					Result.put (((c & 0x3F) | 0x80).to_natural_8, m + 2)
					m := m + 3
				else
						-- c <= 1FFFFF - there are no higher code points
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					Result.put (((c |>> 18) | 0xF0).to_natural_8, m)
					Result.put ((((c |>> 12) & 0x3F) | 0x80).to_natural_8, m + 1)
					Result.put ((((c |>> 6) & 0x3F) | 0x80).to_natural_8, m + 2)
					Result.put (((c & 0x3F) | 0x80).to_natural_8, m + 3)
					m := m + 4
				end
			end
			Result.put (0, m)
		ensure
			instance_free: class
			attached_utf_8_string: attached utf_32_string_to_utf_8_string_8 (s) as l_ref
			count: Result.count = l_ref.count + 1
			roundtrip: across l_ref as ic all ic.item = Result [ic.target_index - 1].to_character_8	end
			zero_terminated: Result [Result.upper] = 0
		end

feature -- UTF-8 to UTF-32

	utf_8_0_pointer_to_escaped_string_32 (p: MANAGED_POINTER): STRING_32
			-- {STRING_32} object corresponding to UTF-8 sequence `p' which is zero-terminated,
			-- where invalid UTF-8 sequences are escaped.
		do
				-- Allocate Result with the same number of bytes as `p'.
			create Result.make (p.count)
			utf_8_0_pointer_into_escaped_string_32 (p, Result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_8_string_8 (Result) as l_str and then
				across l_str as l_char all l_char.item = p.read_natural_8 (l_char.target_index - 1).to_character_8 end
		end

	utf_8_0_pointer_into_escaped_string_32 (p: MANAGED_POINTER; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-8 sequence `p' which is zero-terminated,
			-- where invalid UTF-8 sequences are escaped, appended into `a_result'.
		do
			utf_8_0_subpointer_into_escaped_string_32 (p, 0, p.count - 1, True, a_result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_8_string_8 (a_result.substring (old a_result.count + 1, a_result.count)) as l_str and then
				across l_str as l_char all l_char.item = p.read_natural_8 (l_char.target_index - 1).to_character_8 end
		end

	utf_8_0_subpointer_to_escaped_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN): STRING_32
			-- {STRING_32} object corresponding to UTF-8 sequence `p' between indexes `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null', where invalid
			-- UTF-8 sequences are escaped.
		require
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count
		do
				-- Allocate Result with the same number of bytes as `p'.
			create Result.make (p.count)
			utf_8_0_subpointer_into_escaped_string_32 (p, start_pos, end_pos, a_stop_at_null, Result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_8_string_8 (Result) as l_str and then
				across l_str as l_char all l_char.item = p.read_natural_8 (start_pos + l_char.target_index - 1).to_character_8 end
		end

	utf_8_0_subpointer_into_escaped_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-8 sequence `p' between indexes `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null', where invalid
			-- UTF-8 sequences are escaped, appended into `a_result'.
		require
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count
		local
			i: like {STRING_8}.count
			c1, c2, c3, c4: NATURAL_8
			l_last_char: CHARACTER_32
		do
			from
				a_result.grow (a_result.count + end_pos - start_pos + 1)
				i := start_pos
			until
				i > end_pos
			loop
				c1 := p.read_natural_8 (i)
				if c1 = 0 and a_stop_at_null then
						-- We hit our null terminating character, we can stop					
					i := end_pos + 1
				elseif c1 <= 0x7F then
						-- 0xxxxxxx
					a_result.extend (c1.to_character_32)
					i := i + 1
				elseif (c1 & 0xE0) = 0xC0 then
					if i < end_pos then
						c2 := p.read_natural_8 (i + 1)
						if (c2 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 110xxxxx 10xxxxxx
							a_result.extend ((
								((c1.as_natural_32 & 0x1F) |<< 6) |
								(c2.as_natural_32 & 0x3F)
								).to_character_32)
							i := i + 2
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
							i := i + 1
						end
					else
							-- Invalid UTF-8 sequence, we escape the first byte.
						escape_code_into (a_result, c1)
						i := i + 1
					end
				elseif (c1 & 0xF0) = 0xE0 then
					if i + 1 < end_pos then
						c2 := p.read_natural_8 (i + 1)
						c3 := p.read_natural_8 (i + 2)
						if (c2 & 0xC0) = 0x80 and (c3 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 1110xxxx 10xxxxxx 10xxxxxx
							l_last_char := (((c1.as_natural_32 & 0xF) |<< 12) |
								((c2.as_natural_32 & 0x3F) |<< 6) |
								(c3.as_natural_32 & 0x3F)
								).to_character_32
							a_result.extend (l_last_char)
							i := i + 3
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
							i := i + 1
						end
					else
							-- Invalid UTF-8 sequence.
						escape_code_into (a_result, c1)
						i := i + 1
					end
				elseif (c1 & 0xF8) = 0xF0 then
					if i + 2 < end_pos then
						c2 := p.read_natural_8 (i + 1)
						c3 := p.read_natural_8 (i + 2)
						c4 := p.read_natural_8 (i + 3)
						if (c2 & 0xC0) = 0x80 and (c3 & 0xC0) = 0x80 and (c4 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
							a_result.extend ((
								((c1.as_natural_32 & 0x7) |<< 18) |
								((c2.as_natural_32 & 0x3F) |<< 12) |
								((c3.as_natural_32 & 0x3F) |<< 6) |
								(c4.as_natural_32 & 0x3F)
								).to_character_32)
							i := i + 4
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
							i := i + 1
						end
					else
							-- Invalid UTF-8 sequence.
						escape_code_into (a_result, c1)
						i := i + 1
					end

				else
						-- Clearly invalid UTF-8
					escape_code_into (a_result, c1)
					i := i + 1
				end
			end
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_8_string_8 (a_result.substring (old a_result.count + 1, a_result.count)) as l_str and then
				across l_str as l_char all l_char.item = p.read_natural_8 (start_pos + l_char.target_index - 1).to_character_8 end
		end

	utf_8_string_8_to_string_32 (s: READABLE_STRING_8): STRING_32
			-- STRING_32 corresponding to UTF-8 sequence `s'.
		do
			create Result.make (s.count)
			utf_8_string_8_into_string_32 (s, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_8_string_8 (s) implies utf_32_string_to_utf_8_string_8 (Result).same_string (s)
		end

	utf_8_string_8_into_string_32 (s: READABLE_STRING_8; a_result: STRING_32)
			-- Copy STRING_32 corresponding to UTF-8 sequence `s' appended into `a_result'.
		local
			i: like {STRING_8}.count
			n: like {STRING_8}.count
			c: NATURAL_32
		do
			from
				n := s.count
				a_result.grow (a_result.count + n)
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)
				if c <= 0x7F then
						-- 0xxxxxxx
					a_result.extend (c.to_character_32)
				elseif c <= 0xDF then
						-- 110xxxxx 10xxxxxx
					i := i + 1
					if i <= n then
						a_result.extend ((
							((c & 0x1F) |<< 6) |
							(s.code (i) & 0x3F)
						).to_character_32)
					end
				elseif c <= 0xEF then
						-- 1110xxxx 10xxxxxx 10xxxxxx
					i := i + 2
					if i <= n then
						a_result.extend ((
							((c & 0xF) |<< 12) |
							((s.code (i - 1) & 0x3F) |<< 6) |
							(s.code (i) & 0x3F)
						).to_character_32)
					end
				elseif c <= 0xF7 then
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					i := i + 3
					if i <= n then
						a_result.extend ((
							((c & 0x7) |<< 18) |
							((s.code (i - 2) & 0x3F) |<< 12) |
							((s.code (i - 1) & 0x3F) |<< 6) |
							(s.code (i) & 0x3F)
						).to_character_32)
					end
				end
			end
		ensure
			instance_free: class
			roundtrip: is_valid_utf_8_string_8 (s) implies utf_32_string_to_utf_8_string_8 (a_result.substring (old a_result.count + 1, a_result.count)).same_string (s)
		end

	utf_8_string_8_to_escaped_string_32 (s: READABLE_STRING_8): STRING_32
			-- STRING_32 corresponding to UTF-8 sequence `s', where invalid UTF-8 sequences are escaped.
		do
			create Result.make (s.count)
			utf_8_string_8_into_escaped_string_32 (s, Result)
		ensure
			instance_free: class
			roundtrip: escaped_utf_32_string_to_utf_8_string_8 (Result).same_string (s)
		end

	utf_8_string_8_into_escaped_string_32 (s: READABLE_STRING_8; a_result: STRING_32)
			-- Copy STRING_32 corresponding to UTF-8 sequence `s', where invalid UTF-8 sequences are escaped,
			-- appended into `a_result'.
		local
			i: like {STRING_8}.count
			n: like {STRING_8}.count
			c1, c2, c3, c4: NATURAL_8
			l_last_char: CHARACTER_32
		do
			from
				n := s.count
				a_result.grow (a_result.count + n)
			until
				i >= n
			loop
				i := i + 1
				c1 := s.code (i).as_natural_8
				if c1 <= 0x7F then
						-- 0xxxxxxx
					a_result.extend (c1.to_character_32)
				elseif (c1 & 0xE0) = 0xC0 then
					if i < n then
						c2 := s.code (i + 1).as_natural_8
						if (c2 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 110xxxxx 10xxxxxx
							a_result.extend ((
								((c1.as_natural_32 & 0x1F) |<< 6) |
								(c2.as_natural_32 & 0x3F)
								).to_character_32)
							i := i + 1
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
						end
					else
							-- Invalid UTF-8 sequence, we escape the first byte.
						escape_code_into (a_result, c1)
					end
				elseif (c1 & 0xF0) = 0xE0 then
					if i + 1 < n then
						c2 := s.code (i + 1).as_natural_8
						c3 := s.code (i + 2).as_natural_8
						if (c2 & 0xC0) = 0x80 and (c3 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 1110xxxx 10xxxxxx 10xxxxxx
							l_last_char := (((c1.as_natural_32 & 0xF) |<< 12) |
								((c2.as_natural_32 & 0x3F) |<< 6) |
								(c3.as_natural_32 & 0x3F)
								).to_character_32
							a_result.extend (l_last_char)
							i := i + 2
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
						end
					else
							-- Invalid UTF-8 sequence.
						escape_code_into (a_result, c1)
					end
				elseif (c1 & 0xF8) = 0xF0 then
					if i + 2 < n then
						c2 := s.code (i + 1).as_natural_8
						c3 := s.code (i + 2).as_natural_8
						c4 := s.code (i + 3).as_natural_8
						if (c2 & 0xC0) = 0x80 and (c3 & 0xC0) = 0x80 and (c4 & 0xC0) = 0x80 then
								-- Valid UTF-8 sequence:
								-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
							a_result.extend ((
								((c1.as_natural_32 & 0x7) |<< 18) |
								((c2.as_natural_32 & 0x3F) |<< 12) |
								((c3.as_natural_32 & 0x3F) |<< 6) |
								(c4.as_natural_32 & 0x3F)
								).to_character_32)
							i := i + 3
						else
								-- Invalid UTF-8 sequence, we escape the first byte
								-- and try with the next one to see if it is the starting
								-- byte of a valid UTF-8 sequence.
							escape_code_into (a_result, c1)
						end
					else
							-- Invalid UTF-8 sequence.
						escape_code_into (a_result, c1)
					end

				else
						-- Clearly invalid UTF-8
					escape_code_into (a_result, c1)
				end
			end
		ensure
			instance_free: class
			roundtrip: escaped_utf_32_string_to_utf_8_string_8 (a_result.substring (old a_result.count + 1, a_result.count)).same_string (s)
		end

feature -- UTF-32 to UTF-16

	string_32_to_utf_16 (s: READABLE_STRING_32): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to `s'.
			-- The sequence is not zero-terminated.
		do
			Result := utf_32_string_to_utf_16 (s)
		ensure
			instance_free: class
			roundtrip: attached utf_32_string_to_utf_16le_string_8 (s) as l_ref and then
				across Result as l_spec all l_spec.item = (l_ref.code (l_spec.target_index * 2 + 1) | (l_ref.code ((l_spec.target_index + 1) * 2) |<< 16)) end
		end

	utf_32_string_to_utf_16 (s: READABLE_STRING_GENERAL): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to `s' interpreted as a UTF-32 sequence.
			-- The sequence is not zero-terminated.
		do
			Result := utf_32_string_to_utf_16_0 (s)
			Result := Result.aliased_resized_area_with_default (0, Result.count - 1)
		ensure
			instance_free: class
			roundtrip: attached utf_32_string_to_utf_16le_string_8 (s) as l_ref and then
				across Result as l_spec all l_spec.item = (l_ref.code (l_spec.target_index * 2 + 1) | (l_ref.code ((l_spec.target_index + 1) * 2) |<< 8)) end
		end

	string_32_to_utf_16_0 (s: READABLE_STRING_32): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to `s' with terminating zero.
		do
			Result := utf_32_string_to_utf_16_0 (s)
		ensure
			instance_free: class
			roundtrip: attached utf_32_string_to_utf_16le_string_8 (s) as l_ref and then
				across Result.resized_area_with_default (0, Result.count - 1) as l_spec all
					l_spec.item = (l_ref.code (l_spec.target_index * 2 + 1) | ((l_ref.code ((l_spec.target_index + 1) * 2)) |<< 8))
				end
		end

	utf_32_string_to_utf_16_0 (s: READABLE_STRING_GENERAL): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to `s', interpreted as a UTF-32 sequence,
			-- with terminating zero.
		local
			i: like {STRING_32}.count
			n: like {STRING_32}.count
			m: like {STRING_32}.count
			p: like {STRING_32}.count
			c: NATURAL_32
		do
			from
				m := 0
				n := s.count
				p := n
				create Result.make_empty (p + 1)
			invariant
				m = Result.count
				p + 1 = Result.capacity
			until
				i >= n
			loop
				i := i + 1
					-- Make sure there is sufficient room for at least 2 code units.
				if p < m + 2 then
					p := m + (n - i) + 2
					Result := Result.aliased_resized_area (p + 1)
				end
				c := s.code (i)
				if c <= 0xFFFF then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					Result.extend (c.to_natural_16)
					m := m + 1
				else
						-- Supplementary Planes: surrogate pair with lead and trail surrogates.
					Result.extend ((0xD7C0 + (c |>> 10)).to_natural_16)
					Result.extend ((0xDC00 + (c & 0x3FF)).to_natural_16)
					m := m + 2
				end
			end
			Result.extend (0)
		ensure
			instance_free: class
			roundtrip: attached utf_32_string_to_utf_16le_string_8 (s) as l_ref and then
				across Result.resized_area_with_default (0, Result.count - 1) as l_spec all
					l_spec.item = (l_ref.code (l_spec.target_index * 2 + 1) | ((l_ref.code ((l_spec.target_index + 1) * 2)) |<< 8))
				end
		end

	string_32_into_utf_16_pointer (s: READABLE_STRING_32; p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-16 sequence corresponding to `s' to address `p + p_offset'
			-- and update the size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is not zero-terminated.
		require
			even_p_offset: (p_offset \\ 2) = 0
			p_offset_non_negative: p_offset >= 0
		do
			utf_32_substring_into_utf_16_pointer (s, 1, s.count, p, p_offset, a_new_upper)
		ensure
			instance_free: class
			roundtrip: a_new_upper /= Void implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (a_new_upper.item // 2) - 1, False).same_string (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (p.count // 2) - 1, True).same_string (s)
		end

	string_32_into_utf_16_0_pointer (s: READABLE_STRING_32; p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-16 sequence corresponding to `s' with terminating zero
			-- to address `p + p_offset' and update the size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is zero-terminated.
		require
			even_p_offset: (p_offset \\ 2) = 0
			p_offset_non_negative: p_offset >= 0
		do
			utf_32_substring_into_utf_16_0_pointer (s, 1, s.count, p, p_offset, a_new_upper)
		ensure
			instance_free: class
			roundtrip: a_new_upper /= Void implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (a_new_upper.item // 2) - 1, False).same_string (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (p.count // 2) - 1, True).same_string (s)
		end

	utf_32_substring_into_utf_16_pointer
			(s: READABLE_STRING_GENERAL;
			start_pos, end_pos: like {READABLE_STRING_32}.count;
			p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-16 sequence corresponding to the substring of `s',
			-- interpreted as a UTF-32 sequence, starting at index `start_pos'
			-- and ending at index `end_pos' to address `p + p_offset' and update the
			-- size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is not zero-terminated.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
			even_p_offset: (p_offset \\ 2) = 0
			p_offset_non_negative: p_offset >= 0
		local
			m: INTEGER
		do
			m := p.count
			utf_32_substring_into_utf_16_0_pointer (s, start_pos, end_pos, p, p_offset, a_new_upper)
			if m < p.count then
					-- Remove the null terminating character.
				p.resize (p.count - 2)
				if a_new_upper /= Void then
					a_new_upper.put (p.count - 2)
				end
			end
		ensure
			instance_free: class
			p_count_may_increase: p.count >= old p.count
			roundtrip: a_new_upper /= Void implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (a_new_upper.item // 2) - 1, False).same_string_general (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (p.count // 2) - 1, True).same_string_general (s)
		end

	utf_32_substring_into_utf_16_0_pointer
			(s: READABLE_STRING_GENERAL;
			start_pos, end_pos: like {READABLE_STRING_32}.count;
			p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER])
			-- Write UTF-16 sequence corresponding to the substring of `s',
			-- interpreted as a UTF-32 sequence, starting at index `start_pos'
			-- and ending at index `end_pos' to address `p + p_offset' and update the
			-- size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is zero-terminated.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
			even_p_offset: (p_offset \\ 2) = 0
			p_offset_non_negative: p_offset >= 0
		local
			i: like {READABLE_STRING_GENERAL}.count
			c: NATURAL_32
			m, l_count: like {MANAGED_POINTER}.count
			l_resized: BOOLEAN
		do
				-- Write UTF-16 sequence.
			from
				i := end_pos - start_pos + 1
				l_count := p.count
					-- Check that there is at least `i * 2' bytes available plus the terminating null character.
				if l_count - p_offset < (i + 1) * 2  then
						-- Optimize resizing, once we have to resize, we actually perform the resizing
						-- only once.
					l_count := p_offset + utf_16_bytes_count (s, start_pos, end_pos) + 2
					p.resize (l_count)
					l_resized := True
				end
				i := start_pos - 1
				m := p_offset
			until
				i >= end_pos
			loop
				i := i + 1
				c := s.code (i)
				if c <= 0xFFFF then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					p.put_natural_16 (c.to_natural_16, m)
					m := m + 2
				else
						-- Make sure there is sufficient room for all the remaining characters and
						-- at least 3 code units of 2 bytes each, i.e. 2 code unit for the surrogate
						-- pair, and one unit for the terminating null character. Note that we do not
						-- take into account `p_offset' because `m' already includes it.
						-- Note that `end_pos - i' represents the number of remaining characters
						-- to process in the current string.
					if not l_resized and then (m + 6 + (end_pos - i) * 2 > l_count) then
							-- Optimize resizing, once we have to resize, we actually perform the resizing
							-- only once.
						l_count := m + utf_16_bytes_count (s, i, end_pos) + 2
						p.resize (l_count)
						l_resized := True
					end

						-- Supplementary Planes: surrogate pair with lead and trail surrogates.
					p.put_natural_16 ((0xD7C0 + (c |>> 10)).to_natural_16, m)
					p.put_natural_16 ((0xDC00 + (c & 0x3FF)).to_natural_16, m + 2)
					m := m + 4
				end
			end
				-- Adjust number of written bytes and add terminating zero at the end.
			if l_resized then
					-- We had to add a code unit on 4 bytes. We adjust the size.
				p.resize (m + 2)
			end
			p.put_natural_16 (0, m)
			if a_new_upper /= Void then
				a_new_upper.put (m)
			end
		ensure
			instance_free: class
			p_count_may_increase: p.count >= old p.count
			roundtrip: a_new_upper /= Void implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (a_new_upper.item // 2) - 1, False).same_string_general (s)
			roundtrip: (a_new_upper = Void and then not s.has ('%U')) implies utf_16_0_subpointer_to_string_32 (p, p_offset // 2, (p.count // 2) - 1, True).same_string_general (s)
		end

	utf_32_string_to_utf_16le_string_8 (s: READABLE_STRING_GENERAL): STRING_8
			-- UTF-16LE sequence corresponding to `s' interpreted as a UTF-32 sequence
		do
				-- We would need at least 2-bytes per characters in `s'.
			create Result.make (s.count * 2)
			utf_32_string_into_utf_16le_string_8 (s, Result)
		ensure
			instance_free: class
			roundtrip: utf_16le_string_8_to_string_32 (Result).same_string_general (s)
		end

	utf_32_string_into_utf_16le_string_8 (s: READABLE_STRING_GENERAL; a_result: STRING_8)
			-- Copy UTF-16LE sequence corresponding to `s' interpreted as a UTF-32 sequence
			-- appended into `a_result'.
		local
			i: like {STRING_32}.count
			n: like {STRING_32}.count
			c: NATURAL_32
			l_nat16: NATURAL_16
		do
			from
				n := s.count
					-- We would need at least 2-bytes per characters in `s'.
				a_result.grow (a_result.count + n * 2)
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)
				if c <= 0xFFFF then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					a_result.extend ((c & 0x00FF).to_character_8)
					a_result.extend (((c & 0xFF00) |>> 8).to_character_8)
				else
						-- Write the lead surrogate pair.
					l_nat16 := (0xD7C0 + (c |>> 10)).to_natural_16
					a_result.extend ((l_nat16 & 0x00FF).to_character_8)
					a_result.extend (((l_nat16 & 0xFF00) |>> 8).to_character_8)

						-- Write the trail surrogate pair.
					l_nat16 := (0xDC00 + (c & 0x3FF)).to_natural_16
					a_result.extend ((l_nat16 & 0x00FF).to_character_8)
					a_result.extend (((l_nat16 & 0xFF00) |>> 8).to_character_8)
				end
			end
		ensure
			instance_free: class
			roundtrip: utf_16le_string_8_to_string_32 (a_result.substring (old a_result.count + 1, a_result.count)).same_string_general (s)
		end

	escaped_utf_32_substring_into_utf_16_0_pointer (
				s: READABLE_STRING_GENERAL; start_pos, end_pos: like {READABLE_STRING_32}.count;
				p: MANAGED_POINTER; p_offset: INTEGER; a_new_upper: detachable CELL [INTEGER]
			)
			-- Write UTF-16 sequence corresponding to the substring of `s',
			-- interpreted as a UTF-32 sequence, starting at index `start_pos'
			-- and ending at index `end_pos' to address `p + p_offset' and update the
			-- size of `p' to the number of written bytes.
			-- If `a_new_upper' is provided, the upper index of `p' containing the zero-termination
			-- is written to `a_new_upper'.
			-- The sequence is not zero-terminated.
		require
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos <= s.count
			even_p_offset: (p_offset \\ 2) = 0
			p_offset_non_negative: p_offset >= 0
		local
			i, n, m, l_count: INTEGER
			c: NATURAL_32
			l_encoded_value: READABLE_STRING_GENERAL
			l_decoded: BOOLEAN
			l_resized: BOOLEAN
		do
			from
				n := end_pos - start_pos + 1
				l_count := p.count
					-- Check that there is at least `i * 2' bytes available plus the terminating null character.
				if l_count - p_offset < (n + 1) * 2  then
						-- Optimize resizing, once we have to resize, we actually perform the resizing
						-- only once.
					l_count := p_offset + utf_16_bytes_count (s, start_pos, end_pos) + 2
					p.resize (l_count)
					l_resized := True
				end
				i := start_pos - 1
				m := p_offset
			until
				i >= end_pos
			loop
				i := i + 1
				c := s.code (i)
				if c = escape_character.natural_32_code then
						-- We might be facing a character that was escaped.
					if i < n then
						if s.item (i + 1) = escape_character then
								-- The `escape_character' was escaped, it meant they really wanted an `escape_character'.
							i := i + 1
						elseif s.item (i + 1) = 'u' then
							if i + 4 < n then
								l_encoded_value := s.substring (i + 2, i + 5)
								if is_hexa_decimal (l_encoded_value) then
									c := to_natural_32 (l_encoded_value)
									if c < 0xD800 or c > 0xDFFF then
											-- Value was encoded when it should not have been
											-- do nothing, we leave the original content as is.	
										c := escape_character.natural_32_code
									else
										l_decoded := True
										i := i + 5
									end
								else
										-- Not an hexadecimal value, it was not escaped.
								end
							else
								-- Not enough characters to make a 2-byte value, it was not escaped.
							end
						else
							-- Value was most likely not encoded, because if it did, it would be the
							-- hexadecimal representation of a byte which clearly did not need to
							-- be escaped
						end
					else
							-- Nothing more to read, clearly it was not encoded.
					end
				end

				if not l_decoded then
					if c <= 0xFFFF then
							-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
						p.put_natural_16 (c.to_natural_16, m)
						m := m + 2
					else
							-- Make sure there is sufficient room for all the remaining characters and
							-- at least 3 code units of 2 bytes each, i.e. 2 code unit for the surrogate
							-- pair, and one unit for the terminating null character. Note that we do not
							-- take into account `p_offset' because `m' already includes it.
							-- Note that `end_pos - i' represents the number of remaining characters
							-- to process in the current string.
						if not l_resized and then (m + 6 + (end_pos - i) * 2 > l_count) then
								-- Optimize resizing, once we have to resize, we actually perform the resizing
								-- only once.
							l_count := m + utf_16_bytes_count (s, i, end_pos) + 2
							p.resize (l_count)
							l_resized := True
						end

							-- Write the lead surrogate pair.
						p.put_natural_16 ((0xD7C0 + (c |>> 10)).to_natural_16, m)

							-- Write the trail surrogate pair.
						p.put_natural_16 ((0xDC00 + (c & 0x3FF)).to_natural_16, m + 2)

						m := m + 4
					end
				else
					l_decoded := False
						-- Simply put decoded value directly in stream.
					p.put_natural_16 (c.to_natural_16, m)
					m := m + 2
				end
			end
			if l_resized then
					-- We had to add a code unit on 4 bytes. We adjust the size.
				p.resize (m + 2)
			end
			p.put_natural_16 (0, m)
			if a_new_upper /= Void then
				a_new_upper.put (m)
			end
		ensure
			instance_free: class
			p_count_may_increase: p.count >= old p.count
			roundtrip: a_new_upper /= Void implies utf_16_0_subpointer_to_escaped_string_32 (p, p_offset // 2, (a_new_upper.item // 2) - 1, False).same_string_general (s.substring (start_pos, end_pos))
			roundtrip: (a_new_upper = Void and then not s.substring (start_pos, end_pos).has ('%U')) implies
				utf_16_0_subpointer_to_escaped_string_32 (p, p_offset // 2, (p.count // 2) - 1, True).same_string_general (s.substring (start_pos, end_pos))
		end

	escaped_utf_32_string_to_utf_16le_string_8 (s: READABLE_STRING_GENERAL): STRING_8
			-- UTF-16LE sequence corresponding to `s' interpreted as a UTF-32 sequence that could be escaped.
			-- If `s' contains the `escape_character' followed by either "HH" or "uHHHH" where H stands
			-- for an hexadecimal digit, then `s' has been escaped and will be converted to what is
			-- expected by the current platform.
			-- Otherwise it will be ignored and it will be left as is.
			-- See the note clause for the class for more details on the encoding.
		do
				-- We would need at least 2-bytes per characters in `s'.
			create Result.make (s.count * 2)
			escaped_utf_32_string_into_utf_16le_string_8 (s, Result)
		ensure
			instance_free: class
			roundtrip: utf_16le_string_8_to_escaped_string_32 (Result).same_string_general (s)
		end

	escaped_utf_32_string_into_utf_16le_string_8 (s: READABLE_STRING_GENERAL; a_result: STRING_8)
			-- Copy UTF-16LE sequence corresponding to `s' interpreted as a UTF-32 sequence that could be
			-- escaped appended into `a_result'.
			-- If `s' contains the `escape_character' followed by either "HH" or "uHHHH" where H stands
			-- for an hexadecimal digit, then `s' has been escaped and will be converted to what is
			-- expected by the current platform.
			-- Otherwise it will be ignored and it will be left as is.
			-- See the note clause for the class for more details on the encoding.
		local
			i: like {STRING_32}.count
			n: like {STRING_32}.count
			c: NATURAL_32
			l_nat16: NATURAL_16
			l_encoded_value: READABLE_STRING_GENERAL
			l_decoded: BOOLEAN
		do
			from
				n := s.count
					-- We would need at least 2-bytes per characters in `s'.
				a_result.grow (a_result.count + n * 2)
			until
				i >= n
			loop
				i := i + 1
				c := s.code (i)
				if c = escape_character.natural_32_code then
						-- We might be facing a character that was escaped.
					if i < n then
						if s.item (i + 1) = escape_character then
								-- The `escape_character' was escaped, it meant they really wanted an `escape_character'.
							i := i + 1
						elseif s.item (i + 1) = 'u' then
							if i + 4 < n then
								l_encoded_value := s.substring (i + 2, i + 5)
								if is_hexa_decimal (l_encoded_value) then
									c := to_natural_32 (l_encoded_value)
									if c < 0xD800 or c > 0xDFFF then
											-- Value was encoded when it should not have been
											-- do nothing, we leave the original content as is.	
										c := escape_character.natural_32_code
									else
										l_decoded := True
										i := i + 5
									end
								else
										-- Not an hexadecimal value, it was not escaped.
								end
							else
									-- Not enough characters to make a 2-byte value, it was not escaped.
							end
						else
							-- Value was most likely not encoded, because if it did, it would be the
							-- hexadecimal representation of a byte which clearly did not need to
							-- be escaped
						end
					else
							-- Nothing more to read, clearly it was not encoded.
					end
				end

				if not l_decoded then
					if c <= 0xFFFF then
							-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
						a_result.extend ((c & 0x00FF).to_character_8)
						a_result.extend (((c & 0xFF00) |>> 8).to_character_8)
					else
							-- Write the lead surrogate pair.
						l_nat16 := (0xD7C0 + (c |>> 10)).to_natural_16
						a_result.extend ((l_nat16 & 0x00FF).to_character_8)
						a_result.extend (((l_nat16 & 0xFF00) |>> 8).to_character_8)

								-- Write the trail surrogate pair.
						l_nat16 := (0xDC00 + (c & 0x3FF)).to_natural_16
						a_result.extend ((l_nat16 & 0x00FF).to_character_8)
						a_result.extend (((l_nat16 & 0xFF00) |>> 8).to_character_8)
					end
				else
					l_decoded := False
						-- Simply put decoded value directly in stream.
					a_result.extend ((c & 0x00FF).to_character_8)
					a_result.extend (((c & 0xFF00) |>> 8).to_character_8)
				end
			end
		ensure
			instance_free: class
			roundtrip: utf_16le_string_8_to_escaped_string_32 (a_result.substring (old a_result.count + 1, a_result.count)).same_string_general (s)
		end

feature -- UTF-16 to UTF-32

	utf_16_0_pointer_to_string_32 (p: MANAGED_POINTER): STRING_32
			-- {STRING_32} object corresponding to UTF-16 sequence `p' which is zero-terminated.
		require
			minimum_size: p.count >= 2
			valid_count: p.count \\ 2 = 0
		do
				-- Allocate Result with the same number of bytes as `p'.
			create Result.make (p.count)
			utf_16_0_pointer_into_string_32 (p, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16_subpointer (p, 0, p.count // 2, True) implies
				across string_32_to_utf_16 (Result) as l_spec all l_spec.item = p.read_natural_16 ((l_spec.target_index + 1) * 2) end
		end

	utf_16_0_pointer_into_string_32 (p: MANAGED_POINTER; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16 sequence `p' which is zero-terminated
			-- appended into `a_result'.
		require
			minimum_size: p.count >= 2
			valid_count: p.count \\ 2 = 0
		do
			utf_16_0_subpointer_into_string_32 (p, 0, p.count // 2 - 1, True, a_result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16_subpointer (p, 0, p.count // 2, True) implies
				across string_32_to_utf_16 (a_result.substring (old a_result.count + 1, a_result.count)) as l_spec all l_spec.item = p.read_natural_16 (l_spec.target_index * 2) end
		end

	utf_16_0_subpointer_to_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN): STRING_32
			-- {STRING_32} object corresponding to UTF-16 sequence `p' between code units `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null'.
		require
			minimum_size: p.count >= 2
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count // 2
		do
			create Result.make (p.count)
			utf_16_0_subpointer_into_string_32 (p, start_pos, end_pos, a_stop_at_null, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16_subpointer (p, start_pos, end_pos, a_stop_at_null) implies
				across string_32_to_utf_16 (Result) as l_spec all l_spec.item = p.read_natural_16 (l_spec.target_index * 2) end
		end

	utf_16_0_subpointer_into_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16 sequence `p' between code units `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null' appended into `a_result'.
		require
			minimum_size: p.count >= 2
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count // 2
		local
			i, n: INTEGER
			c: NATURAL_32
		do
			from
					-- Allocate Result with the same number of bytes as copied from `p'.
				a_result.grow (a_result.count + end_pos - start_pos + 1)
				i := start_pos * 2
				n := end_pos * 2
			until
				i > n
			loop
				c := p.read_natural_16 (i)
				if c = 0 and a_stop_at_null then
						-- We hit our null terminating character, we can stop
					i := n + 1
				else
					i := i + 2
					if c < 0xD800 or c >= 0xE000 then
							-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
						a_result.extend (c.to_character_32)
					else
							-- Supplementary Planes: surrogate pair with lead and trail surrogates.
						if i <= n then
							a_result.extend (((c.as_natural_32 |<< 10) + p.read_natural_16 (i) - 0x35FDC00).to_character_32)
							i := i + 2
						end
					end
				end
			end
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16_subpointer (p, start_pos, end_pos, a_stop_at_null) implies
				across string_32_to_utf_16 (a_result.substring (old a_result.count + 1, a_result.count)) as l_spec all l_spec.item = p.read_natural_16 (l_spec.target_index * 2) end
		end

	utf_16_0_pointer_to_escaped_string_32 (p: MANAGED_POINTER): STRING_32
			-- {STRING_32} object corresponding to UTF-16 sequence `p' which is zero-terminated,
			-- where invalid UTF-16LE sequences are escaped.
		require
			minimum_size: p.count >= 2
			valid_count: p.count \\ 2 = 0
		do
				-- Allocate Result with the same number of bytes as `p'.
			create Result.make (p.count)
			utf_16_0_pointer_into_escaped_string_32 (p, Result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_16le_string_8 (Result) as l_utf and then
				across l_utf.new_cursor.incremented (1) as l_str all
					(l_str.item.natural_32_code | (l_utf.code (l_str.target_index + 1) |<< 8)) = p.read_natural_16 (l_str.target_index - 1)
				end
		end

	utf_16_0_pointer_into_escaped_string_32 (p: MANAGED_POINTER; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16 sequence `p' which is zero-terminated,
			-- where invalid UTF-16LE sequences are escaped, appended into `a_result'.
		require
			minimum_size: p.count >= 2
			valid_count: p.count \\ 2 = 0
		do
			utf_16_0_subpointer_into_escaped_string_32 (p, 0, p.count // 2 - 1, True, a_result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_16le_string_8 (a_result.substring (old a_result.count + 1, a_result.count)) as l_utf and then
				across l_utf.new_cursor.incremented (1) as l_str all
					(l_str.item.natural_32_code | (l_utf.code (l_str.target_index + 1) |<< 8)) = p.read_natural_16 (l_str.target_index - 1)
				end
		end

	utf_16_0_subpointer_to_escaped_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN): STRING_32
			-- {STRING_32} object corresponding to UTF-16 sequence `p' between code units `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null', where invalid
			-- UTF-16LE sequences are escaped.
		require
			minimum_size: p.count >= 2
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count // 2
		do
			create Result.make (end_pos - start_pos + 1)
			utf_16_0_subpointer_into_escaped_string_32 (p, start_pos, end_pos, a_stop_at_null, Result)
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_16le_string_8 (Result) as l_utf and then
				across l_utf.new_cursor.incremented (1) as l_str all
					(l_str.item.natural_32_code | (l_utf.code (l_str.target_index + 1) |<< 8)) = p.read_natural_16 (start_pos * 2 + l_str.target_index - 1)
				end
		end

	utf_16_0_subpointer_into_escaped_string_32 (p: MANAGED_POINTER; start_pos, end_pos: INTEGER; a_stop_at_null: BOOLEAN; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16 sequence `p' between code units `start_pos' and
			-- `end_pos' or the first null character encountered if `a_stop_at_null', where invalid
			-- UTF-16LE sequences are escaped, appended into `a_result'.
		require
			minimum_size: p.count >= 2
			start_position_big_enough: start_pos >= 0
			end_position_big_enough: start_pos <= end_pos + 1
			end_pos_small_enough: end_pos < p.count // 2
		local
			i, n: INTEGER
			c1, c2: NATURAL_32
		do
			from
					-- Allocate Result with the same number of bytes as copied from `p'.
				a_result.grow (a_result.count + end_pos - start_pos + 1)
				i := start_pos * 2
				n := end_pos * 2
			until
				i > n
			loop
				c1 := p.read_natural_16 (i)
				if c1 = 0 and a_stop_at_null then
						-- We hit our null terminating character, we can stop
					i := n + 1
				else
					i := i + 2
					if c1 < 0xD800 or c1 >= 0xE000 then
							-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
						a_result.extend (c1.to_character_32)
					elseif c1 <= 0xDBFF and then i <= n then
							-- Check if a lead surrogate (value between 0xD800 and 0xDBFF) is followed by a trail surrogate.
						c2 := p.read_natural_16 (i)
						if c2 >= 0xDC00 and c2 <= 0xDFFF then
								-- Supplementary Planes: surrogate pair with lead and trail surrogates.
							a_result.extend (((c1 |<< 10) + c2 - 0x35FDC00).to_character_32)
							i := i + 2
						else
								-- Escape a lead surrogate not followed by a trail one.
							escape_code_into (a_result, c1.as_natural_16)
						end
					else
							-- Escape a trail surrogate not following a lead one or
							-- a lead surrogate not followed by a trail one.
						escape_code_into (a_result, c1.as_natural_16)
					end
				end
			end
		ensure
			instance_free: class
			roundtrip: attached escaped_utf_32_string_to_utf_16le_string_8 (a_result.substring (old a_result.count + 1, a_result.count)) as l_utf and then
				across l_utf.new_cursor.incremented (1) as l_str all
					(l_str.item.natural_32_code | (l_utf.code (l_str.target_index + 1) |<< 8)) = p.read_natural_16 (start_pos * 2 + l_str.target_index - 1)
				end
		end

	utf_16_to_string_32 (s: SPECIAL [NATURAL_16]): STRING_32
			-- {STRING_32} object corresponding to UTF-16 sequence `s'.
		do
			create Result.make (s.count)
			utf_16_into_string_32 (s, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16 (s) implies string_32_to_utf_16 (Result).is_equal (s)
		end

	utf_16_into_string_32 (s: SPECIAL [NATURAL_16]; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16 sequence `s'
			-- appended into `a_result'.
		local
			i: like {SPECIAL [NATURAL_16]}.count
			n: like {SPECIAL [NATURAL_16]}.count
			c: NATURAL_32
		do
			from
				n := s.count
				a_result.grow (a_result.count + n)
			until
				i >= n
			loop
				c := s [i]
				i := i + 1
				if c < 0xD800 or c >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					a_result.extend (c.to_character_32)
				else
						-- Supplementary Planes: surrogate pair with lead and trail surrogates.
					if i < n then
						a_result.extend (((c |<< 10) + s [i] - 0x35FDC00).to_character_32)
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16 (s) implies string_32_to_utf_16 (a_result.substring (old a_result.count + 1, a_result.count)).is_equal (s)
		end

	utf_16le_string_8_to_string_32 (s: READABLE_STRING_8): STRING_32
			-- {STRING_32} object corresponding to UTF-16LE sequence `s'.
		do
				-- There is at least half the characters of `s'.
			create Result.make (s.count |>> 1)
			utf_16le_string_8_into_string_32 (s, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16le_string_8 (s) implies escaped_utf_32_string_to_utf_16le_string_8 (Result).same_string (s)
		end

	utf_16le_string_8_into_string_32 (s: READABLE_STRING_8; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16LE sequence `s' appended into `a_result'.
		local
			i, nb: INTEGER
			c1, c2: NATURAL_32
		do
			from
				nb := s.count
					-- There is at least half the characters of `s'.
				a_result.grow (a_result.count + (nb |>> 1))
			until
				i + 1 >= nb
			loop
				i := i + 2
					-- Extract the first 2-bytes
				c1 := s.code (i - 1) | (s.code (i) |<< 8)
				if c1 < 0xD800 or c1 >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit, this is valid Unicode.						
					a_result.extend (c1.to_character_32)
				else
					i := i + 2
					if i <= nb then
						c2 := s.code (i - 1) | (s.code (i) |<< 8)
						a_result.extend (((c1 |<< 10) + c2 - 0x35FDC00).to_character_32)
					end
				end
			end
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16le_string_8 (s) implies escaped_utf_32_string_to_utf_16le_string_8 (a_result.substring (old a_result.count + 1, a_result.count)).same_string (s)
		end

	utf_16le_string_8_to_escaped_string_32 (s: READABLE_STRING_8): STRING_32
			-- {STRING_32} object corresponding to UTF-16LE sequence `s', where invalid UTF-16LE
			-- sequences are escaped.
		do
				-- There is at least half the characters of `s'.
			create Result.make (s.count |>> 1)
			utf_16le_string_8_into_escaped_string_32 (s, Result)
		ensure
			instance_free: class
			roundtrip: escaped_utf_32_string_to_utf_16le_string_8 (Result).same_string (s)
		end

	utf_16le_string_8_into_escaped_string_32 (s: READABLE_STRING_8; a_result: STRING_32)
			-- Copy {STRING_32} object corresponding to UTF-16LE sequence `s', where invalid UTF-16LE
			-- sequences are escaped, appended into `a_result'.
		local
			i, nb: INTEGER
			c1, c2: NATURAL_32
		do
			from
				nb := s.count
					-- There is at least half the characters of `s'.
				a_result.grow (a_result.count + (nb |>> 1))
			until
				i + 1 >= nb
			loop
				i := i + 2
					-- Extract the first 2-bytes
				c1 := s.code (i - 1) | (s.code (i) |<< 8)
				if c1 < 0xD800 or c1 >= 0xE000 then
						-- Codepoint from Basic Multilingual Plane: one 16-bit code unit.
					a_result.extend (c1.to_character_32)
				elseif c1 <= 0xDBFF and i + 2 <= nb then
						-- Check if a lead surrogate is followed by a trail surrogate.
					c2 := s.code (i + 1) | (s.code (i + 2) |<< 8)
					if c2 >= 0xDC00 and c2 <= 0xDFFF then
							-- Supplementary Planes: surrogate pair with lead and trail surrogates.
						a_result.extend (((c1 |<< 10) + c2 - 0x35FDC00).to_character_32)
						i := i + 2
					else
							-- Escape a lead surrogate not followed by a trail one.
						escape_code_into (a_result, c1.as_natural_16)
					end
				else
						-- Escape a trail surrogate not following a lead one or
						-- a lead surrogate not followed by a trail one.
					escape_code_into (a_result, c1.as_natural_16)
				end
			end
		ensure
			instance_free: class
			roundtrip: escaped_utf_32_string_to_utf_16le_string_8 (a_result.substring (old a_result.count + 1, a_result.count)).same_string (s)
		end

feature -- UTF-16 to UTF-8

	utf_16_to_utf_8_string_8 (s: SPECIAL [NATURAL_16]): STRING_8
			-- UTF-8 sequence corresponding to UTF-16 sequence `s'.
		do
			debug ("to_implement")
				(create {REFACTORING_HELPER}).to_implement ("Convert directly from UTF-16 to UTF-8.")
			end
			Result := string_32_to_utf_8_string_8 (utf_16_to_string_32 (s))
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16 (s) implies string_32_to_utf_16 (utf_8_string_8_to_string_32 (Result)).is_equal (s)
		end

	utf_16_into_utf_8_string_8 (s: SPECIAL [NATURAL_16]; a_result: STRING_8)
			-- Copy UTF-8 sequence corresponding to UTF-16 sequence `s' appended into `a_result'.
		do
			debug ("to_implement")
				(create {REFACTORING_HELPER}).to_implement ("Convert directly from UTF-16 to UTF-8.")
			end
			string_32_into_utf_8_string_8 (utf_16_to_string_32 (s), a_result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16 (s) implies string_32_to_utf_16 (utf_8_string_8_to_string_32 (a_result.substring (old a_result.count + 1, a_result.count))).is_equal (s)
		end

	utf_16le_string_8_to_utf_8_string_8 (s: READABLE_STRING_8): STRING_8
			-- UTF-8 sequence corresponding to UTF-16LE sequence `s'.
		do
			create Result.make (s.count)
			utf_16le_string_8_into_utf_8_string_8 (s, Result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16le_string_8 (s) implies utf_32_string_to_utf_16le_string_8 (utf_8_string_8_to_string_32 (Result)).same_string (s)
		end

	utf_16le_string_8_into_utf_8_string_8 (s: READABLE_STRING_8; a_result: STRING_8)
			-- Copy UTF-8 sequence corresponding to UTF-16LE sequence `s' appended into `a_result'.
		require
			even_count: (s.count & 1) = 0
		local
			v: SPECIAL [NATURAL_16]
			i: like {STRING_8}.count
			n: like {STRING_8}.count
		do
			from
				n := s.count
				create v.make_empty (n |>> 1)
			until
				i >= n
			loop
				i := i + 2
				check
					valid_index: 1 <= i - 1 and i <= s.count
				end
				v.extend (s [i - 1].code.as_natural_16 | (s [i].code.as_natural_16 |<< 8))
			end
			utf_16_into_utf_8_string_8 (v, a_result)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_16le_string_8 (s) implies utf_32_string_to_utf_16le_string_8 (utf_8_string_8_to_string_32 (a_result.substring (old a_result.count + 1, a_result.count))).same_string (s)
		end

feature -- UTF-8 to UTF-16

	utf_8_string_8_to_utf_16 (s: READABLE_STRING_8): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to UTF-8 sequence `s'.
		do
			debug ("to_implement")
				(create {REFACTORING_HELPER}).to_implement ("Convert directly from UTF-8 to UTF-16.")
			end
			Result := string_32_to_utf_16 (utf_8_string_8_to_string_32 (s))
		ensure
			instance_free: class
			roundtrip: is_valid_utf_8_string_8 (s) implies utf_16_to_utf_8_string_8 (Result).same_string (s)
		end

	utf_8_string_8_to_utf_16_0 (s: READABLE_STRING_8): SPECIAL [NATURAL_16]
			-- UTF-16 sequence corresponding to UTF-8 sequence `s' with terminating zero.
		do
			Result := utf_8_string_8_to_utf_16 (s)
			Result := Result.aliased_resized_area_with_default (0, Result.count + 1)
		ensure
			instance_free: class
			roundtrip: is_valid_utf_8_string_8 (s) implies utf_16_to_utf_8_string_8 (Result).same_string (s)
		end

feature -- Byte Order Mark (BOM)

	utf_8_bom_to_string_8: STRING_8 = "%/239/%/187/%/191/"
			-- UTF-8 BOM sequence.

	utf_16be_bom_to_string_8: STRING_8 = "%/254/%/255/"
			-- UTF-16BE BOM sequence.

	utf_16le_bom_to_string_8: STRING_8 = "%/255/%/254/"
			-- UTF-16LE BOM sequence.

	utf_32be_bom_to_string_8: STRING_8 = "%U%U%/254/%/255/"
			-- UTF-32BE BOM sequence.

	utf_32le_bom_to_string_8: STRING_8 = "%/255/%/254/%U%U"
			-- UTF-32LE BOM sequence.

feature {NONE} -- Implementation

	escape_code_into (a_string: STRING_32; a_code: NATURAL_16)
			-- Escape `a_code' as documented in the note clause of the class into `a_string'.
			-- If `a_code' fits into a NATURAL_8, it will be just the `escape_character' followed
			-- by the 2-digit hexadecimal representation, otherwise `escape_character' followed
			-- by the letter `u' followed by the 4-digit hexadecimal representation.
		do
			a_string.append_character (escape_character)
			if a_code <= {NATURAL_8}.max_value then
				a_string.append_string_general (a_code.as_natural_8.to_hex_string)
			else
				a_string.append_character ('u')
				a_string.append_string_general (a_code.to_hex_string)
			end
		ensure
			instance_free: class
		end

	is_hexa_decimal (a_string: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_string' a valid hexadecimal sequence?
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.reset ({NUMERIC_INFORMATION}.type_natural_32)
			l_convertor.parse_string_with_type (a_string, {NUMERIC_INFORMATION}.type_natural_32)
			Result := l_convertor.is_integral_integer
		ensure
			instance_free: class
		end

	to_natural_32 (a_hex_string: READABLE_STRING_GENERAL): NATURAL_32
			-- Convert hexadecimal value `a_hex_string' to its corresponding NATURAL_32 value.
		require
			is_hexa: is_hexa_decimal (a_hex_string)
		local
			l_convertor: like ctoi_convertor
		do
			l_convertor := ctoi_convertor
			l_convertor.parse_string_with_type (a_hex_string, {NUMERIC_INFORMATION}.type_no_limitation)
			Result := l_convertor.parsed_natural_32
		ensure
			instance_free: class
		end

	ctoi_convertor: HEXADECIMAL_STRING_TO_INTEGER_CONVERTER
			-- Convertor used to convert string to integer or natural
		once
			create Result.make
			Result.set_leading_separators_acceptable (False)
			Result.set_trailing_separators_acceptable (False)
		ensure
			instance_free: class
			ctoi_convertor_not_void: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
