indexing

	description:

		"Variant of KI_CHARACTER_INPUT_STREAM that accepts UTF16 and Latin1 and converts it to UTF8"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

	--xml_specific_lt: "Detection assuming first char is < is XML specific"

class XM_EIFFEL_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
		redefine
			read_to_string
		end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UTF16_ROUTINES
		export {NONE} all end

create

	make, make_from_stream

feature {NONE} -- Initialization

	make (a_name: STRING) is
			-- Create a new stream based on file `a_name'.
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_file.make (a_name)
			a_file.open_read
			make_from_stream (a_file)
		end

	make_from_stream (a_stream: like impl) is
			-- Create a new stream based on `a_stream'.
		require
			a_stream_not_void: a_stream /= Void
			--at_start: stream empty or at start
		do
			impl := a_stream
			create utf_queue.make
			create last_string.make_empty
			encoding := Undetected
		ensure
			impl_set: impl = a_stream
		end

feature -- Encoding

	is_valid_encoding (an_encoding: STRING): BOOLEAN is
			-- Is this encoding known?
		do
			if an_encoding /= Void then
				Result := STRING_.same_case_insensitive (an_encoding, Encoding_latin_1)
					or STRING_.same_case_insensitive (an_encoding, Encoding_us_ascii)
					or STRING_.same_case_insensitive (an_encoding, Encoding_utf_8)
					or STRING_.same_case_insensitive (an_encoding, Encoding_utf_16)
			end
		end

	is_applicable_encoding (an_encoding: STRING): BOOLEAN is
			-- Can the current encoding be switched to `an_encoding'?
		require
			valid: is_valid_encoding (an_encoding)
		do
			if encoding = Undetected then
				Result := True
			else
				if
					STRING_.same_case_insensitive (an_encoding, Encoding_latin_1) or
					STRING_.same_case_insensitive (an_encoding, Encoding_us_ascii)
				then
					Result := encoding = Utf_8_or_compatible
						or encoding = Utf_8 or encoding = Latin_1
				elseif STRING_.same_case_insensitive (an_encoding, Encoding_utf_8) then
					Result := encoding = Utf_8_or_compatible
						or encoding = Utf_8
				elseif STRING_.same_case_insensitive (an_encoding, Encoding_utf_16) then
					Result := encoding = Utf16_msb_first or encoding = Utf16_msb_last
				end
			end
		end

	set_encoding (an_encoding: STRING) is
			-- Set encoding.
		require
			valid_encoding: is_valid_encoding (an_encoding)
			applicable_encoding: is_applicable_encoding (an_encoding)
		do
			debug ("xml_input_stream")
				std.output.put_string ("set_encoding to ")
				std.output.put_string (an_encoding)
				std.output.put_new_line
			end
			if STRING_.same_case_insensitive (an_encoding, Encoding_latin_1) then
				encoding := Latin_1
			elseif STRING_.same_case_insensitive (an_encoding, Encoding_utf_16) then
				check encoding_ok: encoding = Utf16_msb_first or encoding = Utf16_msb_last end
			else
				-- FIXME: own mode for us-ascii?
				encoding := Utf_8
			end
		end

feature {NONE} -- Encodings

	Encoding_us_ascii: STRING is "us-ascii"
	Encoding_latin_1: STRING is "iso-8859-1"
	Encoding_utf_8: STRING is "utf-8"
	Encoding_utf_16: STRING is "utf-16"

feature -- Input

	read_character is
			-- Read the next item in input stream.
			-- Make the result available in `last_character'.
		do
				-- See 'last_character': it chooses from impl or the queue.

			if encoding = Undetected then
				utf16_detect_read_character

					-- If detection has not put back read character in queue,
					-- read from upstream, which may be empty if the stream
					-- contains only the byte order character.
				if utf_queue.count = 0 and not impl.end_of_input then
					noqueue_read_character
				end
			else
				if utf_queue.count > 0 then
						-- Last character was read from queue, remove it.
					utf_queue.remove
						-- Next character may or may not be from queue.
					if utf_queue.count = 0 and not impl.end_of_input then
						noqueue_read_character
					end
				else
						-- Straightforward case.
					noqueue_read_character
				end
			end

			debug ("xml_input_stream")
				if not end_of_input then
					std.output.put_string ("read_character: ")
					std.output.put_string (last_character.code.out)
					std.output.put_string (" ")
					std.output.put_string (last_character.out)
					std.output.put_new_line
				end
			end
		end

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		local
			i: INTEGER
		do
				-- Naive implementation.
				-- When the file is not UTF16 we could use
				-- impl.read_string; last_string := impl.last_string but
				-- that would break the fact that `last_string' must
				-- remain the same object. It would also require
				-- to duplicate some of the detection handling.
			from
				STRING_.wipe_out (last_string)
				read_character
				i := nb
			until
				i = 0 or end_of_input
			loop
				last_string.append_character (last_character)
				read_character
				i := i - 1
			end
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
			-- Fill `a_string', starting at position `pos', with
			-- at most `nb' characters read from input stream.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		do
			if encoding = Undetected or encoding = Utf_8_or_compatible or else utf_queue.count > 0 then
					-- Read one by one,
					-- if Undetected because detection operates on the first few characters,
					-- if Utf_8_or_compatible because the actual encoding may be set soon
					-- and we should not read too much with the wrong encoding.
				read_character
				if not end_of_input then
					a_string.put (last_character, pos)
					Result := 1
				else
					Result := 0
				end
			elseif encoding = Utf_8 then
				Result := impl.read_to_string (a_string, pos, nb)
			else
				Result := Precursor (a_string, pos, nb)
			end
			debug ("xml_input_stream")
				std.output.put_string ("read_to_string: ")
				std.output.put_string (Result.out)
				std.output.put_string (" chars read")
				std.output.put_new_line
			end
		end

	unread_character (an_item: CHARACTER) is
			-- Put `an_item' back in input stream.
			-- This item will be read first by the next
			-- call to a read routine.
		do
			utf_queue.force (an_item)
		end

feature -- Status report

	is_open_read: BOOLEAN is
			-- Can items be read from input stream?
		do
			Result := impl.is_open_read
		end

	end_of_input: BOOLEAN is
			-- Has the end of input stream been reached?
		do
			Result := utf_queue.count = 0 and impl.end_of_input
		end

feature -- Access

	name: STRING is
			-- Name of input stream
		do
			Result := impl.name
		end

	last_character: CHARACTER is
			-- Last character read.
		do
			if utf_queue.count > 0 then
				Result := utf_queue.item
			else
				Result := impl.last_character
			end
		end

	last_string: STRING
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)

feature {NONE} -- State

	encoding: INTEGER
			-- Input encoding, one of:

	Utf_8: INTEGER is 1
	Utf_8_or_compatible: INTEGER is 2
	Latin_1: INTEGER is 3
	Utf16_msb_first: INTEGER is 4
	Utf16_msb_last: INTEGER is 5
	Undetected: INTEGER is 6
			-- Utf_8_or_compatible: probably UTF-8 but charset may be changed
			-- Utf_8: input already in UTF-8, will remain so
			-- Latin_1: input in ISO 8859-1 (Latin-1)
			-- Utf16_msb_first: UTF-16 with most significant byte first.
			-- Utf16_msb_last: UTF-16 with least significant byte first.
			-- Undetected: before reading first two chars

	utf_queue: DS_LINKED_QUEUE [CHARACTER]
			-- Queue used in UTF16 mode

	impl: KI_CHARACTER_INPUT_STREAM
			-- Internal stream

feature {NONE} -- Input

	noqueue_read_character is
			-- Read character after detection and when detection queue has
			-- been flushed.
		require
			open_read: is_open_read
			not_end: not end_of_input
			detected: encoding /= Undetected
			queue_empty: utf_queue.count = 0
		do
			if encoding = Utf_8 or encoding = Utf_8_or_compatible then
				impl.read_character
			elseif encoding = Latin_1 then
				latin1_read_character
			else
				check
					utf_16: encoding = Utf16_msb_first or encoding = Utf16_msb_last
				end
				utf16_read_character
			end
		end

feature {NONE} -- UTF16 implementation

	utf16_detect_read_character is
			-- Read first two chars of file to establish
			-- whether we are a UTF16 file.
		require
			not_detected: encoding = Undetected
			not_end: not impl.end_of_input
		local
			first_char, second_char, third_char: CHARACTER
		do
			encoding := Utf_8_or_compatible
			impl.read_character
			if not impl.end_of_input then
				first_char := impl.last_character
				impl.read_character
				if not impl.end_of_input then
					second_char := impl.last_character
						-- Check byte ordering character.
						-- If found, set found and do not forward as input.
					if utf16.is_endian_detection_character_most_first (first_char.code, second_char.code) then
						encoding := Utf16_msb_first
					elseif utf16.is_endian_detection_character_least_first (first_char.code, second_char.code) then
						encoding := Utf16_msb_last
					elseif (first_char.code = 0 and second_char = Lt_char) then
							-- Check wide '<'.
						encoding := Utf16_msb_first
						utf_queue.force (Lt_char)
					elseif (first_char = Lt_char and second_char.code = 0) then
						encoding := Utf16_msb_last
						utf_queue.force (Lt_char)
					elseif utf8.is_endian_detection_character_start (first_char, second_char) then
							-- Check UTF8 BOM.
						impl.read_character
						if not impl.end_of_input then
							third_char := impl.last_character
							if utf8.is_endian_detection_character (first_char, second_char, third_char) then
								check utf_8: encoding = Utf_8_or_compatible end
									-- BOM is not forwarded
							else
									-- Not a BOM
								utf_queue.force (first_char)
								utf_queue.force (second_char)
								utf_queue.force (third_char)
							end
						else
								-- Nothing detected
							utf_queue.force (first_char)
							utf_queue.force (second_char)
						end
					else
							-- Nothing detected
						utf_queue.force (first_char)
						utf_queue.force (second_char)
					end
				else
					utf_queue.force (first_char)
				end
			end
		ensure
			end_or_set: encoding /= Undetected
		end

	utf16_read_character is
			-- Read two characters at a time and fill queue with
			-- UTF8 encoding of character.
		require
			utf16: (encoding = Utf16_msb_first) or (encoding = Utf16_msb_last)
			not_end: not impl.end_of_input
		local
			first_char, second_char: CHARACTER
			a_most, a_least: INTEGER
			a_high_surrogate: INTEGER
		do
				-- Warning: error conditions not handled on premature end of input,
				-- partial characters do not produce output

			impl.read_character
			if not impl.end_of_input then
				first_char := impl.last_character
				impl.read_character
				if not impl.end_of_input then
					second_char := impl.last_character
					a_most := most_significant (first_char, second_char)
					a_least := least_significant (first_char, second_char)

						-- UTF16 surrogate?
					if utf16.is_surrogate (a_most) then
							-- The character is in the surrogate range.
						if utf16.is_high_surrogate (a_most) then
								-- First value of a surrogate pair.
							a_high_surrogate := utf16.least_10_bits (a_most, a_least)

								-- Now get second part of surrogate pair.
							impl.read_character
							if not impl.end_of_input then
								first_char := impl.last_character
								impl.read_character
								if not impl.end_of_input then
									second_char := impl.last_character
									a_most := most_significant (first_char, second_char)
									a_least := least_significant (first_char, second_char)
									if utf16.is_low_surrogate (a_most) then
										append_character (utf16.surrogate (a_high_surrogate, utf16.least_10_bits (a_most, a_least)))
									else
										-- Error condition: unexpected second byte of a
										-- surrogate pair.
									end
								end
							end
						else
							-- Error condition: unexpected second byte of a
							-- surrogate pair.
						end
					else
							-- Ordinary UTF16 character.
						append_character (a_most * 256 + a_least)
					end
				end
			end
		end

feature {NONE} -- Latin-1 implementation

	latin1_read_character is
			-- Read character from source and convert it to UTF8 if latin1
			-- character (8th bit set).
		require
			latin1: encoding = Latin_1
		do
			impl.read_character
			if not impl.end_of_input then
				if impl.last_character.code >= 128 then
					append_character (impl.last_character.code)
				end
			end
		end

feature {NONE} -- Implementation

	append_character (a_char: INTEGER) is
			-- Append character from UTF16 code.
		require
			positive: a_char >= 0
			max_utf16: a_char < 65536
		local
			i, nb: INTEGER
			a_buffer: STRING
		do
			debug ("xml_parser")
				std.error.put_character ('[')
				std.error.put_string (a_char.out)
				std.error.put_character (']')
			end
				-- Convert to UTF8.
			a_buffer := utf8_buffer
			STRING_.wipe_out (a_buffer)
			utf8.append_code_to_utf8 (a_buffer, a_char)
			nb := a_buffer.count
			from i := 1 until i > nb loop
				utf_queue.force (a_buffer.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	most_significant (first, second: CHARACTER): INTEGER is
			-- Most significant byte from incoming bytes
		do
			if encoding = Utf16_msb_first then
				Result := first.code
			else
				Result := second.code
			end
		ensure
			result_byte: Result >= 0 and Result < 256
			first_or_second: Result = first.code or Result = second.code
		end

	least_significant (first, second: CHARACTER): INTEGER is
			-- Least significant byte from incoming bytes
		do
			if encoding = Utf16_msb_first then
				Result := second.code
			else
				Result := first.code
			end
		ensure
			result_byte: Result >= 0 and Result < 256
			first_or_second: Result = first.code or Result = second.code
		end

feature {NONE} -- Constants

	Lt_char: CHARACTER is '<'

	utf8_buffer: STRING is
			-- Buffer for UTF-8 encoding
		once
			create Result.make (6)
		ensure
			utf8_buffer_not_void: Result /= Void
			string_type: ANY_.same_types (Result, "")
		end

invariant

	impl_not_void: impl /= Void
	queue_not_void: utf_queue /= Void

end
