note

	description:

		"UTF-8 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF8_ROUTINES

inherit

	UC_IMPORTED_UNICODE_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

feature -- Status report

	valid_utf8 (a_string: STRING_8): BOOLEAN
			-- Are the bytes in `a_string' a valid UTF-8 encoding?
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		do
			Result := valid_utf8_substring (a_string, 1, a_string.count)
		ensure
			instance_free: class
		end

	valid_utf8_substring (a_string: STRING_8; s, e: INTEGER): BOOLEAN
			-- Are the bytes in `a_string' between indexes `s' and `e'
			-- a valid UTF-8 encoding?
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
		local
			i, nb, nb2: INTEGER
			bc, a_code: INTEGER
			a_byte, a_first_byte: CHARACTER_8
		do
			Result := True
			from
				i := s
				nb := e
			until
				i > nb
			loop
				a_first_byte := a_string.item (i)
				if is_encoded_first_byte (a_first_byte) then
					bc := encoded_byte_count (a_first_byte)
					if bc = 1 then
						i := i + 1
					else
						nb2 := i + bc - 1
						if nb2 > nb then
							Result := False
								-- Jump out of the loop.
							i := nb + 1
						else
							a_code := encoded_first_value (a_first_byte)
							i := i + 1
							a_byte := a_string.item (i)
							if not is_encoded_second_byte (a_byte, a_first_byte) then
								Result := False
									-- Jump out of the loop.
								i := nb + 1
							else
								a_code := a_code * 64 + encoded_next_value (a_byte)
								inspect bc
								when 2 then
									if a_code <= code_127 then
											-- 0xxxxxxx (2^7 - 1 = 127)
										Result := False
									end
								when 3 then
									if a_code <= code_31 then
											-- 110xxxxx (2^5 - 1 = 31)
										Result := False
									end
								when 4 then
									if a_code <= code_15 then
											-- 1110xxxx (2^4 - 1 = 15)
										Result := False
									end
								end
								if Result then
									from
										i := i + 1
									until
										i > nb2
									loop
										if is_encoded_next_byte (a_string.item (i)) then
											i := i + 1
										else
											Result := False
												-- Jump out of the loop.
											i := nb + 1
										end
									end
								end
							end
						end
					end
				else
					Result := False
						-- Jump out of the loop.
					i := nb + 1
				end
			end
		ensure
			instance_free: class
		end

	is_string_8 (a_utf8: STRING_8): BOOLEAN
			-- Is `a_utf8' representable as a STRING_8
			-- (using ISO-8859-1 encoding)?
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
			a_utf8_valid: valid_utf8 (a_utf8)
		local
			i, nb: INTEGER
			l_byte_count: INTEGER
		do
			Result := True
			nb := a_utf8.count
			from i := 1 until i > nb loop
				l_byte_count := encoded_byte_count (a_utf8.item (i))
				if l_byte_count = 1 then
					-- OK.
				elseif l_byte_count = 2 then
					if two_byte_character_code (a_utf8.item (i), a_utf8.item (i + 1)) > natural_32_code_255 then
						Result := False
							-- Jump out of the loop.
						i := nb + 1
					end
				else
					Result := False
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + l_byte_count
			end
		ensure
			instance_free: class
		end

	is_string_32 (a_utf8: STRING_8): BOOLEAN
			-- Is `a_utf8' representable as a STRING_32?
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
			a_utf8_valid: valid_utf8 (a_utf8)
		do
			Result := True
		ensure
			instance_free: class
		end

	is_encoded_first_byte (a_byte: CHARACTER_8): BOOLEAN
			-- Is `a_byte' the first byte in UTF-8 encoding?
		do
				-- All but 10xxxxxx and 1111111x
			Result := (a_byte <= byte_127 or (byte_194 <= a_byte and a_byte <= byte_244))
		ensure
			instance_free: class
		end

	is_encoded_next_byte (a_byte: CHARACTER_8): BOOLEAN
			-- Is `a_byte' one of the next bytes in UTF-8 encoding?
		do
				-- 10xxxxxx
			Result := (byte_127 < a_byte and a_byte <= byte_191)
		ensure
			instance_free: class
		end

	is_encoded_second_byte (a_byte, a_first_byte: CHARACTER_8): BOOLEAN
			-- Is `a_byte' a valid second byte in UTF-8 encoding?
		require
			valid_first_byte: is_encoded_first_byte (a_first_byte)
		do
				-- 10xxxxxx
			if a_first_byte = byte_224 then
				Result := (byte_159 < a_byte and a_byte <= byte_191)
			elseif a_first_byte = byte_237 then
				Result := (byte_127 < a_byte and a_byte <= byte_159)
			elseif a_first_byte = byte_240 then
				Result := (byte_143 < a_byte and a_byte <= byte_191)
			elseif a_first_byte = byte_244 then
				Result := (byte_127 < a_byte and a_byte <= byte_143)
			else
				Result := (byte_127 < a_byte and a_byte <= byte_191)
			end
		ensure
			instance_free: class
		end

	is_endian_detection_character (a_first, a_second, a_third: CHARACTER_8): BOOLEAN
			-- Is this sequence a UTF-8 Byte Order Marker (BOM)?
		do
			Result := is_endian_detection_character_start (a_first, a_second) and a_third = byte_bf
		ensure
			instance_free: class
			result_start: Result implies is_endian_detection_character_start (a_first, a_second)
			definition: Result = (a_first = utf8_bom.item (1) and a_second = utf8_bom.item (2) and a_third = utf8_bom.item (3))
		end

	is_endian_detection_character_start (a_first, a_second: CHARACTER_8): BOOLEAN
			-- Are these bytes the start of a UTF-8 encoded Byte Order Marker (BOM)?
		do
			Result := a_first = byte_ef and a_second = byte_bb
		ensure
			instance_free: class
			definition: Result = (a_first = utf8_bom.item (1) and a_second = utf8_bom.item (2))
		end

feature -- Access

	max_bytes: INTEGER = 4
			-- Maximum number of bytes to encode a Unicode character to UTF-8

	max_bytes_of_iso_8859_1_to_utf8: INTEGER = 2
			-- Maximum number of bytes to encode a ISO-8859-1 character to UTF-8

	utf8_bom: STRING_8 = "%/239/%/187/%/191/"
			-- Byte order mark (BOM) for UTF-8 (0xEF,0xBB,0xBF)
			-- See http://en.wikipedia.org/wiki/Byte_order_mark

	invalid_character_utf8_byte: CHARACTER_8 = '%/255/'
			-- Byte to be used when converting a surrogate or invalid
			-- Unicode character to UTF-8
			-- (0xFF, which is an invalid byte in UTF-8)

	encoded_first_value (a_byte: CHARACTER_8): INTEGER
			-- Value encoded in first byte
		require
			is_encoded_first_byte: is_encoded_first_byte (a_byte)
		do
			Result := a_byte.code
			if a_byte <= byte_127 then
					-- 0xxxxxxx
			elseif a_byte <= byte_223 then
					-- 110xxxxx
				Result := Result \\ 32
			elseif a_byte <= byte_239 then
					-- 1110xxxx
				Result := Result \\ 16
			elseif a_byte <= byte_244 then
					-- 11110xxx
				Result := Result \\ 8
			end
		ensure
			instance_free: class
			value_positive: Result >= 0
			value_small_enough: Result < 128
		end

	encoded_next_value (a_byte: CHARACTER_8): INTEGER
			-- Value encoded in one of the next bytes
		require
			is_encoded_next_byte: is_encoded_next_byte (a_byte)
		do
				-- 10xxxxxx
			Result := a_byte.code \\ 64
		ensure
			instance_free: class
			value_positive: Result >= 0
			value_small_enough: Result < 64
		end

	two_byte_character_code (a_byte1, a_byte2: CHARACTER_8): NATURAL_32
			-- Character code corresponding to the two bytes `a_byte1' and `a_byte_2'
			-- 110xxxxx 10xxxxxx
		require
			encoded_byte_count: encoded_byte_count (a_byte1) = 2
			a_byte1_is_encoded_first_byte: is_encoded_first_byte (a_byte1)
			a_byte2_is_encoded_next_byte: is_encoded_next_byte (a_byte2)
		do
			Result := ((a_byte1.natural_32_code & 0x1F) |<< 6) | (a_byte2.natural_32_code & 0x3F)
		ensure
			instance_free: class
		end

	three_byte_character_code (a_byte1, a_byte2, a_byte3: CHARACTER_8): NATURAL_32
			-- Character code corresponding to the three bytes `a_byte1', `a_byte_2' and `a_byte_3'
			-- 1110xxxx 10xxxxxx 10xxxxxx
		require
			encoded_byte_count: encoded_byte_count (a_byte1) = 3
			a_byte1_is_encoded_first_byte: is_encoded_first_byte (a_byte1)
			a_byte2_is_encoded_next_byte: is_encoded_next_byte (a_byte2)
			a_byte3_is_encoded_next_byte: is_encoded_next_byte (a_byte3)
		do
			Result := ((a_byte1.natural_32_code & 0x0F) |<< 12) | ((a_byte2.natural_32_code & 0x3F) |<< 6) | (a_byte3.natural_32_code & 0x3F)
		ensure
			instance_free: class
		end

	four_byte_character_code (a_byte1, a_byte2, a_byte3, a_byte4: CHARACTER_8): NATURAL_32
			-- Character code corresponding to the four bytes `a_byte1', `a_byte_2', `a_byte_3' and `a_byte_4'
			-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
		require
			encoded_byte_count: encoded_byte_count (a_byte1) = 4
			a_byte1_is_encoded_first_byte: is_encoded_first_byte (a_byte1)
			a_byte2_is_encoded_next_byte: is_encoded_next_byte (a_byte2)
			a_byte3_is_encoded_next_byte: is_encoded_next_byte (a_byte3)
			a_byte4_is_encoded_next_byte: is_encoded_next_byte (a_byte4)
		do
			Result := ((a_byte1.natural_32_code & 0x07) |<< 18) | ((a_byte2.natural_32_code & 0x3F) |<< 12) | ((a_byte3.natural_32_code & 0x3F) |<< 6) | (a_byte4.natural_32_code & 0x3F)
		ensure
			instance_free: class
		end

	natural_32_code_to_utf8 (a_code: NATURAL_32): NATURAL_32
			-- UTF-8 encoded version of `a_code'
			-- (e.g. 0xb1000000 or 0xb1b20000 or 0xb1b2b300 or 0xb1b2b3b4)
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		local
			b1, b2, b3, b4, c: NATURAL_32
		do
			if a_code < natural_32_code_128 then
					-- 2^7
					-- 0xxxxxxx
				Result := a_code |<< (3 * {PLATFORM}.natural_8_bits)
			elseif a_code < natural_32_code_2048 then
					-- 2^11
					-- 110xxxxx 10xxxxxx
				b2 := a_code \\ 64 + 128
					-- 110xxxxx
				b1 := a_code // 64 + 192
				Result := (b1 |<< (3 * {PLATFORM}.natural_8_bits)) | (b2 |<< (2 * {PLATFORM}.natural_8_bits))
			elseif a_code < natural_32_code_65536 then
				if a_code >= {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code and a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
						-- Surrogate.
						-- Use invalid UTF-8 byte 0xFF instead.
					Result := 0xFF000000
				else
						-- 2^16
						-- 1110xxxx 10xxxxxx 10xxxxxx
					c := a_code
					b3 := c \\ 64 + 128
					c := c // 64
					b2 := c \\ 64 + 128
						-- 1110xxxx
					b1 := c // 64 + 224
					Result := (b1 |<< (3 * {PLATFORM}.natural_8_bits)) | (b2 |<< (2 * {PLATFORM}.natural_8_bits)) | (b3 |<< {PLATFORM}.natural_8_bits)
				end
			elseif a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
				c := a_code
				b4 := c \\ 64 + 128
				c := c // 64
				b3 := c \\ 64 + 128
				c := c // 64
				b2 := c \\ 64 + 128
					-- 11110xxx
				b1 := c // 64 + 240
				Result := (b1 |<< (3 * {PLATFORM}.natural_8_bits)) | (b2 |<< (2 * {PLATFORM}.natural_8_bits)) | (b3 |<< {PLATFORM}.natural_8_bits) | b4
			else
					-- Invalid Unicode character.
					-- Use invalid UTF-8 byte 0xFF instead.
				Result := 0xFF000000
			end
		ensure
			instance_free: class
		end

feature -- Measurement

	encoded_byte_count (a_byte: CHARACTER_8): INTEGER
			-- Number of bytes which were necessary to encode
			-- the Unicode character whose first byte is `a_byte'
		require
			is_encoded_first_byte: is_encoded_first_byte (a_byte)
		do
			if a_byte <= byte_127 then
					-- 0xxxxxxx
				Result := 1
			elseif a_byte <= byte_223 then
					-- 110xxxxx
				Result := 2
			elseif a_byte <= byte_239 then
					-- 1110xxxx
				Result := 3
			else
					-- 11110xxx
				Result := 4
			end
		ensure
			instance_free: class
			encoded_byte_code_large_enough: Result >= 1
			encoded_byte_code_small_enough: Result <= 4
		end

	string_byte_count (a_string: READABLE_STRING_GENERAL): INTEGER
			-- Number of bytes needed to encode characters of
			-- `a_string' with the UTF-8 encoding
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_string_not_void: a_string /= Void
		do
			Result := substring_byte_count (a_string, 1, a_string.count)
		ensure
			instance_free: class
			string_byte_count_not_negative: Result >= 0
		end

	substring_byte_count (a_string: READABLE_STRING_GENERAL; start_index, end_index: INTEGER): INTEGER
			-- Number of bytes needed to encode characters of
			-- `a_string' between `start_index' and `end_index'
			-- inclusive with the UTF-8 encoding
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_string_not_void: a_string /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		local
			s, e: INTEGER
			i: INTEGER
		do
			if start_index <= end_index then
				if ANY_.same_types (a_string, dummy_string) and then attached {STRING_8} a_string as l_string_8 then
						-- This is the original code
					from i := start_index until i > end_index loop
						Result := Result + character_8_byte_count (l_string_8.item (i))
						i := i + 1
					end
				elseif ANY_.same_types (a_string, dummy_uc_string) and then attached {UC_STRING} a_string as a_uc_string then
					if start_index = 1 and end_index = a_uc_string.count then
						Result := a_uc_string.byte_count
					else
						s := a_uc_string.byte_index (start_index)
						if end_index = a_uc_string.count then
							Result := a_uc_string.byte_count - s + 1
						else
							e := a_uc_string.shifted_byte_index (s, end_index - start_index + 1)
							Result := e - s
						end
					end
				elseif attached {UC_UTF8_STRING} a_string as a_utf8 then
					if start_index = 1 and end_index = a_utf8.count then
						Result := a_utf8.byte_count
					else
						s := a_utf8.byte_index (start_index)
						if end_index = a_utf8.count then
							Result := a_utf8.byte_count - s + 1
						else
							e := a_utf8.shifted_byte_index (s, end_index - start_index + 1)
							Result := e - s
						end
					end
				else
					from
						i := start_index
					until
						i > end_index
					loop
						Result := Result + character_32_byte_count (a_string.item (i))
						i := i + 1
					end
				end
			end
		ensure
			instance_free: class
			substring_byte_count_not_negative: Result >= 0
		end

	character_byte_count (c: CHARACTER_8): INTEGER
			-- Number of bytes needed to encode character
			-- `c' with the UTF-8 encoding
		do
			Result := character_8_byte_count (c)
		ensure
			instance_free: class
			character_byte_count_large_enough: Result >= 1
			character_byte_count_small_enough: Result <= 2
		end

	character_8_byte_count (c: CHARACTER_8): INTEGER
			-- Number of bytes needed to encode character
			-- `c' with the UTF-8 encoding
		do
			if c <= byte_127 then
					-- 2^7
					-- 0xxxxxxx
				Result := 1
			else
					-- 110xxxxx 10xxxxxx
				Result := 2
			end
		ensure
			instance_free: class
			character_8_byte_count_large_enough: Result >= 1
			character_8_byte_count_small_enough: Result <= 2
		end

	character_32_byte_count (c: CHARACTER_32): INTEGER
			-- Number of bytes needed to encode character
			-- `c' with the UTF-8 encoding
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		do
			Result := natural_32_code_byte_count (c.natural_32_code)
		ensure
			instance_free: class
			character_32_byte_count_large_enough: Result >= 1
			character_32_byte_count_small_enough: Result <= 4
		end

	code_byte_count (a_code: INTEGER): INTEGER
			-- Number of bytes needed to encode unicode character
			-- of code `a_code' with the UTF-8 encoding
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_code_not_negative: a_code >= 0
		do
			if a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_character_code then
				Result := natural_32_code_byte_count (a_code.to_natural_32)
			else
				Result := 1
			end
		ensure
			instance_free: class
			code_byte_count_large_enough: Result >= 1
			code_byte_count_small_enough: Result <= 4
		end

	natural_32_code_byte_count (a_code: NATURAL_32): INTEGER
			-- Number of bytes needed to encode unicode character
			-- of code `a_code' with the UTF-8 encoding
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		do
			if a_code < natural_32_code_128 then
					-- 2^7
					-- 0xxxxxxx
				Result := 1
			elseif a_code < natural_32_code_2048 then
					-- 2^11
					-- 110xxxxx 10xxxxxx
				Result := 2
			elseif a_code < {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code then
					-- 2^16
					-- 1110xxxx 10xxxxxx 10xxxxxx
				Result := 3
			elseif a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
					-- Surrogate.
					-- Use invalid UTF-8 byte 0xFF instead.
				Result := 1
			elseif a_code < natural_32_code_65536 then
					-- 2^16
					-- 1110xxxx 10xxxxxx 10xxxxxx
				Result := 3
			elseif a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
				Result := 4
			else
					-- Invalid Unicode character.
					-- Use invalid UTF-8 byte 0xFF instead.
				Result := 1
			end
		ensure
			instance_free: class
			natural_32_code_byte_count_large_enough: Result >= 1
			natural_32_code_byte_count_small_enough: Result <= 4
		end

	unicode_character_count (a_utf8: STRING_8): INTEGER
			-- Number of Unicode characters encoded in `a_utf8'
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string_8: a_utf8.same_type( {STRING_8} "")
			a_utf8_valid: valid_utf8 (a_utf8)
		do
			Result := unicode_substring_character_count (a_utf8, 1, a_utf8.count)
		ensure
			instance_free: class
			unicode_character_count_not_negative: Result >= 0
		end

	unicode_substring_character_count (a_utf8: STRING_8; s, e: INTEGER): INTEGER
			-- Number of Unicode characters encoded
			-- in `a_utf8' between indexes `s' and `e'
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string_8: a_utf8.same_type( {STRING_8} "")
			s_large_enough: s >= 1
			e_small_enough: e <= a_utf8.count
			valid_interval: s <= e + 1
			a_utf8_valid_substring: valid_utf8_substring (a_utf8, s, e)
		local
			i, nb: INTEGER
		do
			nb := e
			from i := s until i > nb loop
				Result := Result + 1
				i := i + encoded_byte_count (a_utf8.item (i))
			end
		ensure
			instance_free: class
			unicode_character_count_not_negative: Result >= 0
		end

feature -- Conversion

	string_to_utf8 (a_string: READABLE_STRING_GENERAL): STRING_8
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of `a_string'
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_string_not_void: a_string /= Void
		do
			Result := substring_to_utf8 (a_string, 1, a_string.count)
		ensure
			instance_free: class
			string_to_utf8_not_void: Result /= Void
			string_to_utf8_is_string: Result.same_type ({STRING_8} "")
			valid_utf8: across 1 |..| a_string.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end implies valid_utf8 (Result)
			byte_count_set: Result.count = string_byte_count (a_string)
		end

	substring_to_utf8 (a_string: READABLE_STRING_GENERAL; s, e: INTEGER): STRING_8
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of the characters of
			-- `a_string' between indexes `s' and `e'
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
		do
			create Result.make (substring_byte_count (a_string, s, e))
			append_substring_to_utf8 (Result, a_string, s, e)
		ensure
			instance_free: class
			substring_to_utf8_not_void: Result /= Void
			substring_to_utf8_is_string: Result.same_type ({STRING_8} "")
			valid_utf8: across s |..| e as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end implies valid_utf8 (Result)
			byte_count_set: Result.count = substring_byte_count (a_string, s, e)
		end

	to_utf8 (a_string: STRING_8): STRING_8
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of `a_string'
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			if attached {UC_STRING} a_string as uc_string then
				Result := uc_string.to_utf8
			else
				nb := a_string.count
				create Result.make (nb)
				from
					i := 1
				until
					i > nb
				loop
					append_code_to_utf8 (Result, a_string.item_code (i))
					i := i + 1
				end
			end
		ensure
			instance_free: class
			to_utf8_not_void: Result /= Void
			string_type: ANY_.same_types (Result, {STRING_8} "")
			valid_utf8: valid_utf8 (Result)
		end

feature -- Element change

	append_string_to_utf8 (a_utf8: STRING_8; a_string: READABLE_STRING_GENERAL)
			-- Add UTF-8 encoded characters of `a_string' at the end of `a_utf8'.
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
			a_string_not_void: a_string /= Void
		do
			append_substring_to_utf8 (a_utf8, a_string, 1, a_string.count)
		ensure
			instance_free: class
			a_utf8: old valid_utf8 (a_utf8) and across 1 |..| a_string.count as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end implies valid_utf8 (a_utf8)
			byte_count_set: a_utf8.count = old a_utf8.count + string_byte_count (a_string)
		end

	append_substring_to_utf8 (a_utf8: STRING_8; a_string: READABLE_STRING_GENERAL; s, e: INTEGER)
			-- Add UTF-8 encoded characters of `a_string' between
			-- indexes `s' and `e' at the end of `a_utf8'.
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
		local
			i, nb: INTEGER
		do
			if s <= e then
				from
					i := s
					nb := e
				until
					i > nb
				loop
					append_natural_32_code_to_utf8 (a_utf8, a_string.code (i))
					i := i + 1
				end
			end
		ensure
			instance_free: class
			a_utf8: old valid_utf8 (a_utf8) and across s |..| e as l_index all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (l_index.item)) end implies valid_utf8 (a_utf8)
			byte_count_set: a_utf8.count = old a_utf8.count + substring_byte_count (a_string, s, e)
		end

	append_code_to_utf8 (a_utf8: STRING_8; a_code: INTEGER)
			-- Add UTF-8 encoded character of code `a_code'
			-- at the end of `a_utf8'.
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
			a_code_not_negative: a_code >= 0
		do
			append_natural_32_code_to_utf8 (a_utf8, a_code.to_natural_32)
		ensure
			instance_free: class
			a_utf8_valid: old valid_utf8 (a_utf8) and unicode.valid_non_surrogate_code (a_code) implies valid_utf8 (a_utf8)
			byte_count_set: a_utf8.count = old a_utf8.count + code_byte_count (a_code)
		end

	append_natural_32_code_to_utf8 (a_utf8: STRING_8; a_code: NATURAL_32)
			-- Add UTF-8 encoded character of code `a_code'
			-- at the end of `a_utf8'.
			--
			-- Note that surrogate or invalid Unicode characters
			-- are encoded with the single byte 0xFF (which is
			-- an invalid byte in UTF-8).
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ({STRING_8} "")
		local
			b2, b3, b4: CHARACTER_8
			c: NATURAL_32
		do
			if a_code < natural_32_code_128 then
					-- 2^7
					-- 0xxxxxxx
				a_utf8.append_character (a_code.to_character_8)
			elseif a_code < natural_32_code_2048 then
					-- 2^11
					-- 110xxxxx 10xxxxxx
				c := a_code
				b2 := ((c \\ 64) + 128).to_character_8
				c := c // 64
					-- 110xxxxx
				a_utf8.append_character ((c + 192).to_character_8)
				a_utf8.append_character (b2)
			elseif a_code < natural_32_code_65536 then
				if a_code >= {UC_UNICODE_CONSTANTS}.minimum_unicode_surrogate_natural_32_code and a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_surrogate_natural_32_code then
						-- Surrogate.
						-- Use invalid UTF-8 byte 0xFF instead.
					a_utf8.append_character (invalid_character_utf8_byte)
				else
						-- 2^16
						-- 1110xxxx 10xxxxxx 10xxxxxx
					c := a_code
					b3 := ((c \\ 64) + 128).to_character_8
					c := c // 64
					b2 := ((c \\ 64) + 128).to_character_8
					c := c // 64
						-- 1110xxxx
					a_utf8.append_character ((c + 224).to_character_8)
					a_utf8.append_character (b2)
					a_utf8.append_character (b3)
				end
			elseif a_code <= {UC_UNICODE_CONSTANTS}.maximum_unicode_character_natural_32_code then
					-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
				c := a_code
				b4 := ((c \\ 64) + 128).to_character_8
				c := c // 64
				b3 := ((c \\ 64) + 128).to_character_8
				c := c // 64
				b2 := ((c \\ 64) + 128).to_character_8
				c := c // 64
					-- 11110xxx
				a_utf8.append_character ((c + 240).to_character_8)
				a_utf8.append_character (b2)
				a_utf8.append_character (b3)
				a_utf8.append_character (b4)
			else
					-- Invalid Unicode character.
					-- Use invalid UTF-8 byte 0xFF instead.
				a_utf8.append_character (invalid_character_utf8_byte)
			end
		ensure
			instance_free: class
			a_utf8_valid: old valid_utf8 (a_utf8) and unicode.valid_non_surrogate_natural_32_code (a_code) implies valid_utf8 (a_utf8)
			byte_count_set: a_utf8.count = old a_utf8.count + natural_32_code_byte_count (a_code)
		end

feature {NONE} -- Constants

	code_15: INTEGER = 15
			-- 1110xxxx (2^4 - 1 = 15)

	code_31: INTEGER = 31
			-- 110xxxxx (2^5 - 1 = 31)

	byte_127: CHARACTER_8 = '%/127/'
			-- Highest ASCII character/1st UTF-8 byte

	code_127: INTEGER = 127
			-- 01111111

	natural_32_code_128: NATURAL_32 = 128

	byte_143: CHARACTER_8 = '%/143/'

	byte_159: CHARACTER_8 = '%/159/'

	byte_191: CHARACTER_8 = '%/191/'
			-- 10111111

	byte_194: CHARACTER_8 = '%/194/'

	byte_223: CHARACTER_8 = '%/223/'
			-- 11011111

	byte_224: CHARACTER_8 = '%/224/'

	byte_237: CHARACTER_8 = '%/237/'

	byte_239: CHARACTER_8 = '%/239/'
			-- 11101111

	byte_240: CHARACTER_8 = '%/240/'

	byte_244: CHARACTER_8 = '%/244/'

	byte_253: CHARACTER_8 = '%/253/'
			-- 11111101

	natural_32_code_255: NATURAL_32 = 255
			-- 11111111

	byte_ef: CHARACTER_8 = '%/239/'
			-- UTF-8 BOM first: EF

	byte_bb: CHARACTER_8 = '%/187/'
			-- UTF-8 BOM second: BB

	byte_bf: CHARACTER_8 = '%/191/'
			-- UTF-8 BOM third: BF

	natural_32_code_2048: NATURAL_32 = 2048

	natural_32_code_65536: NATURAL_32 = 65536

feature {NONE} -- Implementation

	dummy_string: STRING_8 = ""
			-- Dummy string

	dummy_uc_string: UC_STRING
			-- Dummy UC_STRING
		once
			create Result.make_empty
		ensure
			instance_free: class
			dummy_uc_string_not_void: Result /= Void
		end

end
