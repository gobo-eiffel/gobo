indexing

	description:

		"Output streams that base64-encode a stream"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_BASE64_ENCODING_OUTPUT_STREAM

inherit
	
	KL_PROXY_CHARACTER_OUTPUT_STREAM
		rename
			make as make_base
		redefine
			put_character, put_string,
			flush, close, is_closable
		end

creation

	make

feature {NONE} -- Initialization
	
	make (an_underlying_stream: like base_stream; output_line_breaks: BOOLEAN) is
			-- Establish invariant.
		do
			make_base (an_underlying_stream)
			is_line_breaking := output_line_breaks
			create triplet.make (1, 3)
			triplet_position := 1
		ensure
			line_breaking: is_line_breaking = output_line_breaks
			base_stream_set: base_stream = an_underlying_stream
		end

feature -- Status report

	is_line_breaking: BOOLEAN
			-- Are line breaks to be written out after 76 characters?

	is_closable: BOOLEAN is
			-- Can current output stream be closed?
		do
			Result := True
		end

feature -- Output

	put_character (c: CHARACTER) is
			-- Write `c' to output stream.
		do
--			if is_pending_line_break then
--				is_pending_line_break := False
--				if c = '%N' then
--					buffer_character ('%N')
--				else
--					buffer_character ('%N')
--					buffer_character (c)
--					if c = '%R' then
--						is_pending_line_break := True
--					end
--				end
--			elseif c = '%N' then
--				buffer_character ('%R')
--				is_pending_line_break := True
--			elseif c = '%R' then
--				buffer_character (c)
--				is_pending_line_break := True
--			else
				buffer_character (c)
--			end
		end

	put_string (a_string: STRING) is
			-- Write `a_string' to output stream.
		local
			an_index: INTEGER
		do
			from
				an_index := 1
			variant
				a_string.count + 1 - an_index
			until
				an_index > a_string.count
			loop
				put_character (a_string.item (an_index))
				an_index := an_index + 1
			end
		end

feature -- Basic operations

	flush is
			-- Flush buffered data to disk.
		do
			-- no-op as we might not have a full quartet ready for output
		end

	close is
			-- Try to close output stream if it is closable. Set
			-- `is_open_write' to false if operation was successful.
		do
			if triplet_position /= 1 then
				write_quartet -- padding will take place
			end
			if base_stream.is_closable then
				base_stream.close
			end
		end

feature {NONE} -- Implementation

	Full_line_count: INTEGER is 76
			-- Maximum line length

	shift_2_bits: INTEGER is 4
	shift_4_bits: INTEGER is 16
	shift_6_bits: INTEGER is 64

	padding: INTEGER is 64
			-- Pad character ('=')

	line_count: INTEGER
			-- Number of characters output in current line

	triplet: ARRAY [CHARACTER]
			-- Three characters to be encoded

	triplet_position: INTEGER
			-- Position of next character in `triplet' to be filled

	is_pending_line_break: BOOLEAN
			-- Has the CR of a CRLF pair been written out?

	buffer_character (c: CHARACTER) is
			-- Write `c' to `triplet'.
		do
			triplet.put (c, triplet_position)
			triplet_position := 1 + triplet_position
			if triplet_position = 4 then
				triplet_position := 1
				write_quartet
			end
		end

	write_quartet is
			-- Write a quartet (padded, if necessary) to `base_stream'.
		require
			stream_is_open: is_open_write
		local
			a_code, another_code, a_remainder: INTEGER
		do
			a_code := triplet.item (1).code
			a_remainder := a_code \\ shift_2_bits
			another_code := a_code // shift_2_bits
			write_character (another_code)
			another_code := a_remainder * shift_4_bits
			if triplet_position = 2 then
				write_character (another_code)
				write_character (padding)
				write_character (padding)
			else
				a_code := triplet.item (2).code
				a_remainder := a_code \\ shift_4_bits
				another_code := another_code + a_code // shift_4_bits
				write_character (another_code)
				another_code := a_remainder * shift_2_bits
				if triplet_position = 3 then
					write_character (another_code)
					write_character (padding)
				else
					a_code := triplet.item (3).code
					a_remainder := a_code \\ shift_6_bits
					another_code := another_code + a_code // shift_6_bits
					write_character (another_code)
					another_code := a_remainder
					write_character (another_code)
				end
			end
			triplet_position := 1
		ensure
			empty_triplet: triplet_position = 1
		end

	write_character (c: INTEGER) is
			-- Write `c' to the output stream.
		do
			base_stream.put_character (base64_alphabet.item (c))
			if is_line_breaking then
				line_count := line_count + 1
				if line_count = Full_line_count then
					line_count := 0
					base_stream.put_character ('%N')
				end
			end
		end

	base64_alphabet: ARRAY [CHARACTER] is
			-- base64 alphabet
		once
			create Result.make (0, 64)
			Result.put ('A', 0)
			Result.put ('B', 1)
			Result.put ('C', 2)
			Result.put ('D', 3)
			Result.put ('E', 4)
			Result.put ('F', 5)
			Result.put ('G', 6)
			Result.put ('H', 7)
			Result.put ('I', 8)
			Result.put ('J', 9)
			Result.put ('K', 10)
			Result.put ('L', 11)
			Result.put ('M', 12)
			Result.put ('N', 13)
			Result.put ('O', 14)
			Result.put ('P', 15)
			Result.put ('Q', 16)
			Result.put ('R', 17)
			Result.put ('S', 18)
			Result.put ('T', 19)
			Result.put ('U', 20)
			Result.put ('V', 21)
			Result.put ('W', 22)
			Result.put ('X', 23)
			Result.put ('Y', 24)
			Result.put ('Z', 25)
			Result.put ('a', 26)
			Result.put ('b', 27)
			Result.put ('c', 28)
			Result.put ('d', 29)
			Result.put ('e', 30)
			Result.put ('f', 31)
			Result.put ('g', 32)
			Result.put ('h', 33)
			Result.put ('i', 34)
			Result.put ('j', 35)
			Result.put ('k', 36)
			Result.put ('l', 37)
			Result.put ('m', 38)
			Result.put ('n', 39)
			Result.put ('o', 40)
			Result.put ('p', 41)
			Result.put ('q', 42)
			Result.put ('r', 43)
			Result.put ('s', 44)
			Result.put ('t', 45)
			Result.put ('u', 46)
			Result.put ('v', 47)
			Result.put ('w', 48)
			Result.put ('x', 49)
			Result.put ('y', 50)
			Result.put ('z', 51)
			Result.put ('0', 52)
			Result.put ('1', 53)
			Result.put ('2', 54)
			Result.put ('3', 55)
			Result.put ('4', 56)
			Result.put ('5', 57)
			Result.put ('6', 58)
			Result.put ('7', 59)
			Result.put ('8', 60)
			Result.put ('9', 61)
			Result.put ('+', 62)
			Result.put ('/', 63)
			Result.put ('=', 64)
		end

invariant

	triplet_is_three_characters: triplet /= Void and then triplet.count = 3
	triplet_position_in_range: triplet_position >= 1 and then triplet_position <= 3

end
	
