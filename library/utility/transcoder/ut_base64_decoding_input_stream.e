indexing

	description:

		"Input streams that decode an base64-encoded stream"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_BASE64_DECODING_INPUT_STREAM

inherit
	
	KL_PROXY_CHARACTER_INPUT_STREAM
		redefine
			make, end_of_input, read_string,
			read_character, unread_character, last_character,
			last_string, valid_unread_character
		end

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (an_underlying_stream: like base_stream) is
			-- Establish invariant.
		do
			Precursor (an_underlying_stream)
			create codes.make (1, 4)
			create decoded_triplet.make_filled (' ', 3)
			triplet_position := 4
		end

feature -- Input

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
		local
			i: INTEGER
		do
			if last_string = Void then
				create last_string.make (nb)
			else
				STRING_.wipe_out (last_string)
			end
			from i := 1 until i > nb loop
				read_character
				if not end_of_input then
					last_string.append_character (last_character)
					i := i + 1
				else
					i := nb + 1 -- Jump out of the loop.
				end
			end
			end_of_input := (last_string.count = 0)
		end
	
	read_character is
			-- Read the next item in input stream.
			-- Make the result available in `last_character'.
		do
			if triplet_position = 4 then
				read_24_bits
			end
			check
				triplet_position_in_range: triplet_position < 4
				-- post-condition of read_24_bits
			end
			if not end_of_input then
				last_character := decoded_triplet.item (triplet_position)
				triplet_position := triplet_position + 1
			end
		end

	unread_character (an_item: CHARACTER) is
			-- Put `an_item' back in input stream.
			-- This item will be read first by the next
			-- call to a read routine.
		do
			-- Not supported
		end

feature -- Access

	last_string: STRING
			-- Last string read

	last_character: CHARACTER
			-- Last item read

feature -- Status report

	end_of_input: BOOLEAN
			-- Has the end of input stream been reached?

	valid_unread_character (a_character: CHARACTER): BOOLEAN is
			-- Can `a_character' be put back in input stream?
		do

			-- I'm not going to attempt this, as it's hard!

			Result := False
		end

feature {NONE} -- Implementation

	decoded_triplet: STRING
			-- Characters decoded by `decode_24_bits'.

	triplet_position: INTEGER
			-- Position in `decoded_triplet'.

	codes: ARRAY [INTEGER]
			-- Array of 4 6-bit codes

	is_base64_character (c: CHARACTER): BOOLEAN is
			-- Is `c' is a valid base64 character?
		do
			Result := decoded_character (c) >= 0
		end

	decoded_character (ch: CHARACTER): INTEGER is
			-- Decoded character;
			-- Returns -1 if `ch' is an ignorable character.
			-- Returns -2 if `ch' is an invalid character.
		do
			inspect ch
			when 'A' then Result := 0
			when 'B' then Result := 1
			when 'C' then Result := 2
			when 'D' then Result := 3
			when 'E' then Result := 4
			when 'F' then Result := 5
			when 'G' then Result := 6
			when 'H' then Result := 7
			when 'I' then Result := 8
			when 'J' then Result := 9
			when 'K' then Result := 10
			when 'L' then Result := 11
			when 'M' then Result := 12
			when 'N' then Result := 13
			when 'O' then Result := 14
			when 'P' then Result := 15
			when 'Q' then Result := 16
			when 'R' then Result := 17
			when 'S' then Result := 18
			when 'T' then Result := 19
			when 'U' then Result := 20
			when 'V' then Result := 21
			when 'W' then Result := 22
			when 'X' then Result := 23
			when 'Y' then Result := 24
			when 'Z' then Result := 25
			when 'a' then Result := 26
			when 'b' then Result := 27
			when 'c' then Result := 28
			when 'd' then Result := 29
			when 'e' then Result := 30
			when 'f' then Result := 31
			when 'g' then Result := 32
			when 'h' then Result := 33
			when 'i' then Result := 34
			when 'j' then Result := 35
			when 'k' then Result := 36
			when 'l' then Result := 37
			when 'm' then Result := 38
			when 'n' then Result := 39
			when 'o' then Result := 40
			when 'p' then Result := 41
			when 'q' then Result := 42
			when 'r' then Result := 43
			when 's' then Result := 44
			when 't' then Result := 45
			when 'u' then Result := 46
			when 'v' then Result := 47
			when 'w' then Result := 48
			when 'x' then Result := 49
			when 'y' then Result := 50
			when 'z' then Result := 51
			when '0' then Result := 52
			when '1' then Result := 53
			when '2' then Result := 54
			when '3' then Result := 55
			when '4' then Result := 56
			when '5' then Result := 57
			when '6' then Result := 58
			when '7' then Result := 59
			when '8' then Result := 60
			when '9' then Result := 61
			when '+' then Result := 62
			when '=' then Result := 0 -- treat padding character as 0 bits
			when '/' then Result := 63
			when ' ', '%T', '%R', '%N' then Result := -1
			else
				Result := -2
			end
		ensure
			valid_result: Result >= -2 and Result < 64
		end

	shift_2_bits: INTEGER is 4
	shift_4_bits: INTEGER is 16
	shift_6_bits: INTEGER is 64

	read_24_bits is
			-- Read the next four characters, decode them, and make the
			-- decoded characters available in `decoded_triplet'.
			-- Sets `end_of_input' if premature end of input reached.
			-- Sets `triplet_position' to the first character.
			-- It ignores invalid characters.
		local
			c: CHARACTER
			i: INTEGER
			a_code: INTEGER
		do
			-- Fill `codes' with four 6-bit values.
			triplet_position := 1
			from
				i := 1
				base_stream.read_character
			until
				base_stream.end_of_input or else
				i > 4
			loop
				c := base_stream.last_character
				if c = '=' then
					triplet_position := triplet_position + 1
				end
				a_code := decoded_character (c)
				inspect a_code
				when -1 then
					-- white space, ignore
				when -2 then
					-- bad base64 stream
				else
					codes.put (a_code, i)
					i := i + 1
				end
				if i <= 4 then
					base_stream.read_character
				end
			end

			-- Bit-shift `codes' into 3 characters
			if i = 5 and then triplet_position <= 3 then
				a_code := (codes.item (1) * shift_2_bits) + (codes.item (2) // shift_4_bits)
				decoded_triplet.put (INTEGER_.to_character (a_code), triplet_position)
				if triplet_position < 3 then
					a_code := (codes.item (2) * shift_4_bits) + (codes.item (3) // shift_2_bits)
					a_code := a_code \\ 256
					decoded_triplet.put (INTEGER_.to_character (a_code), triplet_position + 1)
					if triplet_position = 1 then
						a_code := (codes.item (3) * shift_6_bits) + (codes.item (4))
						a_code := a_code \\ 256
						decoded_triplet.put (INTEGER_.to_character (a_code), 3)
					end
				end
			else
				end_of_input := True
			end
		end

invariant

	decoded_triplet_has_three_characters: decoded_triplet /= Void and then decoded_triplet.count = 3
	valid_triplet_position: triplet_position >= 1 and triplet_position <= 4

end
	
