indexing

	description:

		"UTF-8 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_UTF8_ROUTINES

inherit

	UC_IMPORTED_UNICODE_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INTEGER_ROUTINES
	UC_STRING_HANDLER

feature -- Status report

	valid_utf8 (a_string: STRING): BOOLEAN is
			-- Are the bytes in `a_string' a valid UTF-8 encoding?
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ("")
		local
			i, nb, nb2: INTEGER
			bc, a_code: INTEGER
			a_byte: CHARACTER
		do
			Result := True
			nb := a_string.count
			from i := 1 until i > nb loop
				a_byte := a_string.item (i)
				if is_encoded_first_byte (a_byte) then
					bc := encoded_byte_count (a_byte)
					if bc = 1 then
						i := i + 1
					else
						nb2 := i + bc - 1
						if nb2 > nb then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							a_code := encoded_first_value (a_byte)
							i := i + 1
							a_byte := a_string.item (i)
							if not is_encoded_next_byte (a_byte) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
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
								when 5 then
									if a_code <= code_7 then
											-- 11110xxx (2^3 - 1 = 7)
										Result := False
									end
								when 6 then
									if a_code <= code_3 then
											-- 111110xx (2^2 - 1 = 3)
										Result := False
									end
								end
								if Result then
									from i := i + 1 until i > nb2 loop
										if is_encoded_next_byte (a_string.item (i)) then
											i := i + 1
										else
											Result := False
											i := nb + 1 -- Jump out of the loop.
										end
									end
								end
							end
						end
					end
				else
					Result := False
					i := nb + 1 -- Jump out of the loop.
				end
			end
		end

	is_encoded_first_byte (a_byte: CHARACTER): BOOLEAN is
			-- Is `a_byte' the first byte in UTF-8 encoding?
		do
				-- All but 10xxxxxx and 1111111x
			Result := (a_byte <= byte_127 or (byte_191 < a_byte and a_byte <= byte_253))
		end

	is_encoded_next_byte (a_byte: CHARACTER): BOOLEAN is
			-- Is `a_byte' one of the next bytes in UTF-8 encoding?
		do
				-- 10xxxxxx
			Result := (byte_127 < a_byte and a_byte <= byte_191)
		end

feature -- Access

	encoded_first_value (a_byte: CHARACTER): INTEGER is
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
			elseif a_byte <= byte_247 then
					-- 11110xxx
				Result := Result \\ 8
			elseif a_byte <= byte_251 then
					-- 111110xx
				Result := Result \\ 4
			elseif a_byte <= byte_253 then
					-- 1111110x
				Result := Result \\ 2
			else
				Result := 0
			end
		ensure
			value_positive: Result >= 0
			value_small_enough: Result < 128
		end

	encoded_next_value (a_byte: CHARACTER): INTEGER is
			-- Value encoded in one of the next bytes
		require
			is_encoded_next_byte: is_encoded_next_byte (a_byte)
		do
				-- 10xxxxxx
			Result := a_byte.code \\ 64
		ensure
			value_positive: Result >= 0
			value_small_enough: Result < 64
		end

feature -- Measurement

	encoded_byte_count (a_byte: CHARACTER): INTEGER is
			-- Number of bytes which were necessary to encode
			-- the unicode character whose first byte is `a_byte'
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
			elseif a_byte <= byte_247 then
					-- 11110xxx
				Result := 4
			elseif a_byte <= byte_251 then
					-- 111110xx
				Result := 5
			else
					-- 1111110x
				Result := 6
			end
		ensure
			encoded_byte_code_large_enough: Result >= 1
			encoded_byte_code_small_enough: Result <= 6
		end

	substring_byte_count (a_string: STRING; start_index, end_index: INTEGER): INTEGER is
			-- Number of bytes needed to encode characters  of
			-- `a_string' between `start_index' and `end_index'
			-- inclusive with the UTF-8 encoding
		require
			a_string_not_void: a_string /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= a_string.count
			meaningful_interval: start_index <= end_index + 1
		local
			a_utf8: UC_UTF8_STRING
			s, e: INTEGER
			i: INTEGER
		do
			if start_index <= end_index then
				if a_string.same_type (dummy_string) then
					from i := start_index until i > end_index loop
						Result := Result + character_byte_count (a_string.item (i))
						i := i + 1
					end
				else
					a_utf8 ?= a_string
					if a_utf8 /= Void then
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
						from i := start_index until i > end_index loop
							Result := Result + code_byte_count (a_string.item_code (i))
							i := i + 1
						end
					end
				end
			end
		ensure
			substring_byte_count_positive: Result >= 0
		end

	code_byte_count (a_code: INTEGER): INTEGER is
			-- Number of bytes needed to encode unicode character
			-- of code `a_code' with the UTF-8 encoding
		require
			valid_code: unicode.valid_code (a_code)
		do
			if a_code < 128 then
					-- 2^7
					-- 0xxxxxxx
				Result := 1
			elseif a_code < 2048 then
					-- 2^11
					-- 110xxxxx 10xxxxxx 
				Result := 2
			elseif a_code < 65536 then
					-- 2^16
					-- 1110xxxx 10xxxxxx 10xxxxxx
				Result := 3
			elseif a_code < 2097152 then
					-- 2^21
					-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
				Result := 4
			elseif a_code < 67108864 then
					-- 2^26
					-- 111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
				Result := 5
			else
					-- 2^31
					-- 1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
				Result := 6
			end
		ensure
			code_byte_count_large_enough: Result >= 1
			code_byte_count_small_enough: Result <= 6
		end

	character_byte_count (c: CHARACTER): INTEGER is
			-- Number of bytes needed to encode character
			-- `c' with the UTF-8 encoding
		local
			a_code: INTEGER
		do
			if c <= byte_127 then
					-- 2^7
					-- 0xxxxxxx
				Result := 1
			elseif c <= byte_255 then
					-- 110xxxxx 10xxxxxx 
				Result := 2
			else
				a_code := c.code
				if a_code < 2048 then
						-- 2^11
						-- 110xxxxx 10xxxxxx 
					Result := 2
				elseif a_code < 65536 then
						-- 2^16
						-- 1110xxxx 10xxxxxx 10xxxxxx
					Result := 3
				elseif a_code < 2097152 then
						-- 2^21
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					Result := 4
				elseif a_code < 67108864 then
						-- 2^26
						-- 111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
					Result := 5
				else
						-- 2^31
						-- 1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
					Result := 6
				end
			end
		ensure
			character_byte_count_large_enough: Result >= 1
			character_byte_count_small_enough: Result <= 6
		end

feature -- Conversion

	to_utf8 (a_string: STRING): STRING is
			-- New STRING made up of bytes corresponding to
			-- the UTF-8 representation of `a_string'
		require
			a_string_not_void: a_string /= Void
		local
			uc_string: UC_STRING
			i, nb: INTEGER
		do
			uc_string ?= a_string
			if uc_string /= Void then
				Result := uc_string.to_utf8
			else
				nb := a_string.count
				Result := STRING_.make (nb)
				from i := 1 until i > nb loop
					append_code_to_utf8 (Result, a_string.item_code (i))
					i := i + 1
				end
			end
		ensure
			to_utf8_not_void: Result /= Void
			string_type: Result.same_type ("")
			valid_utf8: valid_utf8 (Result)
		end

feature -- Element change

	append_code_to_utf8 (a_utf8: STRING; a_code: INTEGER) is
			-- Add UTF-8 encoded character of code `a_code'
			-- at the end of `a_utf8'.
		require
			a_utf8_not_void: a_utf8 /= Void
			a_utf8_is_string: a_utf8.same_type ("")
			a_utf8_valid: valid_utf8 (a_utf8)
			valid_code: unicode.valid_code (a_code)
		local
			b2, b3, b4, b5, b6: CHARACTER
			c: INTEGER
		do
			inspect code_byte_count (a_code)
			when 1 then
					-- 0xxxxxxx
				a_utf8.append_character (INTEGER_.to_character (a_code))
			when 2 then
				c := a_code
				b2 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
					-- 110xxxxx
				a_utf8.append_character (INTEGER_.to_character (c + 192))
				a_utf8.append_character (b2)
			when 3 then
				c := a_code
				b3 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b2 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
					-- 1110xxxx
				a_utf8.append_character (INTEGER_.to_character (c + 224))
				a_utf8.append_character (b2)
				a_utf8.append_character (b3)
			when 4 then
				c := a_code
				b4 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b3 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b2 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
					-- 11110xxx
				a_utf8.append_character (INTEGER_.to_character (c + 240))
				a_utf8.append_character (b2)
				a_utf8.append_character (b3)
				a_utf8.append_character (b4)
			when 5 then
				c := a_code
				b5 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b4 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b3 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b2 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
					-- 111110xx
				a_utf8.append_character (INTEGER_.to_character (c + 248))
				a_utf8.append_character (b2)
				a_utf8.append_character (b3)
				a_utf8.append_character (b4)
				a_utf8.append_character (b5)
			when 6 then
				c := a_code
				b6 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b5 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b4 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b3 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
				b2 := INTEGER_.to_character ((c \\ 64) + 128)
				c := c // 64
					-- 1111110x
				a_utf8.append_character (INTEGER_.to_character (c + 252))
				a_utf8.append_character (b2)
				a_utf8.append_character (b3)
				a_utf8.append_character (b4)
				a_utf8.append_character (b5)
				a_utf8.append_character (b6)
			end
		ensure
			a_utf8_valid: valid_utf8 (a_utf8)
		end

feature {NONE} -- Constants

	code_3: INTEGER is 3
			-- 111110xx (2^2 - 1 = 3)

	code_7: INTEGER is 7
			-- 11110xxx (2^3 - 1 = 7)

	code_15: INTEGER is 15
			-- 1110xxxx (2^4 - 1 = 15)

	code_31: INTEGER is 31
			-- 110xxxxx (2^5 - 1 = 31)

	byte_127: CHARACTER is '%/127/'
	code_127: INTEGER is 127
			-- 01111111

	byte_191: CHARACTER is '%/191/'
	code_191: INTEGER is 191
			-- 10111111

	byte_223: CHARACTER is '%/223/'
	code_223: INTEGER is 223
			-- 11011111

	byte_239: CHARACTER is '%/239/'
	code_239: INTEGER is 239
			-- 11101111

	byte_247: CHARACTER is '%/247/'
	code_247: INTEGER is 247
			-- 11110111

	byte_251: CHARACTER is '%/251/'
	code_251: INTEGER is 251
			-- 11111011

	byte_253: CHARACTER is '%/253/'
	code_253: INTEGER is 253
			-- 11111101

	byte_255: CHARACTER is '%/255/'

feature {NONE} -- Implementation

	dummy_string: STRING is ""
			-- Dummy string

end
