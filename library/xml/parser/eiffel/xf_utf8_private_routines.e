indexing

	description:

		"UTF-8 decoding routines (exported to NONE)"

	todo: "Unify with UC_UTF8_UTILS"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XF_UTF8_PRIVATE_ROUTINES

inherit

	ANY

	KL_INTEGER_ROUTINES
		export
			{NONE} all
		end

feature {NONE} -- String validity

	is_utf8_string (a_string: STRING): BOOLEAN is
			-- Is `a_string' a well formed UTF8 string?
		require
			not_void: a_string /= Void
		do
			Result := valid_utf8 (a_string, 1, a_string.count)
		end

	valid_utf8 (a_string: STRING; a_start, a_count: INTEGER): BOOLEAN is
			-- Valid UTF8 substring?
		require
			not_void: a_string /= void;
			valid_start: a_start = 1 or (a_start <= a_string.count)
			positive_count: a_count >= 0;
			valid_count: a_count > 0 implies ((a_start + a_count -1) <=	a_string.count)
		local
			i: INTEGER
			cnt: INTEGER
			a_code: INTEGER
			expected_trail: INTEGER
		do
			from
				Result := True
				i := a_start
				cnt := a_start + a_count - 1
			until
				(i > cnt) or (not Result)
			loop
				a_code := a_string.item (i).code
				
				if expected_trail > 0 then
					Result := is_following_byte (a_code)
				else
					expected_trail := nr_of_encoding_bytes (a_code)
					Result := expected_trail > 0
				end
				
				expected_trail := expected_trail - 1
				i := i + 1
			end
			Result := Result and expected_trail <= 0
		end

feature {NONE} -- Encoding

	encoding_size (a_char: INTEGER): INTEGER is
			-- Number of bytes necessary to encode a char in UTF-8?
		require
			positive: a_char >= 0
		do
			if a_char < 128 then
				Result := 1
			elseif a_char < 2048 then -- 2^11
				Result := 2
			elseif a_char < 65536 then -- 2^16
				Result := 3
			elseif a_char < 2097152 then -- 2^21
				Result := 4
			elseif a_char < 67108864 then -- 2^26
				Result := 5
			else
				Result := 6
			end
		end

	encoded_byte (a_char: INTEGER; a_position: INTEGER; a_pos_count: INTEGER): INTEGER is
			-- Encoded byte at given position.
		require
			positive: a_char >= 0
			consistent: a_pos_count = encoding_size (a_char)
			position: a_position > 0
			position_max: a_position <= a_pos_count
		local
			i: INTEGER
		do
			if a_pos_count = 1 then
				-- not coded
				Result := a_char
			else
				-- shift value
				-- should be Result := a_char // (64^i) but the 
				-- portability of the power operator is questionable 
				-- unfortunately.
				from
					i := a_pos_count - a_position
					Result := a_char
				until
					i = 0
				loop
					Result := Result // 64
					i := i - 1
				end

				-- chop top bits
				Result := Result \\ 64

				-- set prefix
				if a_position = 1 then
					inspect 
						a_pos_count	
					when 2 then
						Result := Result + 192 -- 1100 0000
					when 3 then
						Result := Result + 224 -- 1110 0000
					when 4 then
						Result := Result + 240 -- 1111 0000
					when 5 then
						Result := Result + 248 -- 1111 1000
					when 6 then
						Result := Result + 252 -- 1111 1100
					when 7 then
						Result := Result + 254 -- 1111 1110
					end
				else
					Result := Result + 128 -- 1000 0000
				end
			end
		end

	encoded_octet (a_char: INTEGER; a_position: INTEGER; a_pos_count: INTEGER):	CHARACTER is
			-- Encoded byte at given position, result as a CHARACTER.
		require
			positive: a_char >= 0
			consistent: a_pos_count = encoding_size (a_char)
			position: a_position > 0
			position_max: a_position <= a_pos_count
		do
			Result := to_character (encoded_byte (a_char, a_position, a_pos_count))
		end

	single_string (a_code: INTEGER): STRING is
			-- One character in a UTF8 string.
		local
			i: INTEGER
			cnt: INTEGER
		do
			from
				Result := clone ("")
				i := 1
				cnt := encoding_size (a_code)
			until
				i > cnt
			loop
				Result.append_character (encoded_octet (a_code, i, cnt))
				i := i + 1
			end
		ensure
			new_string: Result /= Void
			count: Result.count = encoding_size (a_code)
		end

feature {NONE} -- Decoding

	is_integer_byte (a_code: INTEGER): BOOLEAN is
			-- Is this a byte value.
		do
			Result := (a_code >= 0) and (a_code < 256)
		end

	is_following_byte (a_code: INTEGER): BOOLEAN is
			-- Is this a trail byte for a multibyte character?
		require
			code: is_integer_byte (a_code)
		do
			Result := (a_code // 64) = 2 -- 10xxxxxx
		end

	is_leading_byte (a_code: INTEGER): BOOLEAN is
			-- Is this a leading byte.
		require
			code: is_integer_byte (a_code)
		do
			Result := not is_following_byte (a_code)
		end

	nr_of_encoding_bytes (a_first_byte: INTEGER): INTEGER is
			-- Number of bytes encoding a character from the first one.
		require
			code: is_integer_byte (a_first_byte)
			not_trail: is_leading_byte (a_first_byte)
		do
			if a_first_byte < 128 then -- 0xxxxxxx
				Result := 1
			elseif a_first_byte // 32 = 6 then -- 110xxxxx
				Result := 2 -- 11 bits
			elseif a_first_byte // 16 = 14 then -- 1110xxxx
				Result := 3 -- 16 bits
			elseif a_first_byte // 8 = 30 then -- 11110xxx
				Result := 4 -- 21 bits
			elseif a_first_byte // 4 = 62 then -- 111110xx
				Result := 5 -- 26 bits
			elseif a_first_byte // 2 = 126 then -- 1111110x
				Result := 6 -- 31 bits
			elseif a_first_byte = 254 then -- 11111110
				Result := 7 -- 36 bits
			end
		ensure
			positive: Result >= 0
			max_encoding: Result <= 7
			--error: Result = 0 implies error
		end

	decoded_first (a_first_byte: INTEGER; a_count: INTEGER): INTEGER is
			-- Decode first byte.
		require
			code: is_integer_byte (a_first_byte)
			not_trail: not is_following_byte (a_first_byte)
			consistent: a_count = nr_of_encoding_bytes (a_first_byte)
		do
			inspect 
				a_count
			when 1 then
				Result := a_first_byte
			when 2 then
				Result := a_first_byte \\ 32 -- 5 least bits
			when 3 then
				Result := a_first_byte \\ 16 -- 4 least bits
			when 4 then
				Result := a_first_byte \\ 8 -- 3 least bits
			when 5 then
				Result := a_first_byte \\ 4 -- 2 least bits
			when 6 then
				Result := a_first_byte \\ 2 -- least bit
			else
				Result := 0
			end
		ensure
			size: is_integer_byte (Result)
		end

	decoded_following (a_byte: INTEGER): INTEGER is
			-- Decode trail byte.
		require
			code: is_integer_byte (a_byte)
			trail: is_following_byte (a_byte)
		do
			Result := a_byte \\ 64 -- 10xxxxxx
		ensure
			size: (Result >= 0) and (Result < 64)
		end

end
