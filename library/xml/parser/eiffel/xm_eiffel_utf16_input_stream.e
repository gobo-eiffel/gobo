indexing

	description: 

		"Variant of KI_CHARACTER_INPUT_STREAM that accepts UTF16 and converts it to UTF8"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

	--xml_specific_lt: "Detection assuming first char is < is XML specific"
	-- TODO:
	-- UTF16 surrogate characters
	-- factorise UTF8 encoding routines

class XM_EIFFEL_UTF16_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
	KL_SHARED_STANDARD_FILES
	KL_IMPORTED_STRING_ROUTINES
	UC_IMPORTED_UTF8_ROUTINES

creation

	make, make_from_stream

feature {NONE} -- Initialization

	make (a_name: STRING) is
			-- Create a new stream based on file `a_name'.
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			!! a_file.make (a_name)
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
			!! utf_queue.make
			last_string := clone ("")
		ensure
			impl_set: impl = a_stream
		end

feature -- Input

	read_character is
			-- Read the next item in input stream.
			-- Make the result available in `last_item'.
		do
			if not is_detected then
				utf16_detect_read_character
				is_detected := True
					-- Detection may eat characters so we do a normal
					-- read afterwards, fill queue for normal read.
			elseif utf_queue.count > 0 then
					-- Last character was read from queue.
				utf_queue.remove
			end
				-- If `utf_queue' still contains something,
				-- this is the next character, so do nothing.
			if utf_queue.count = 0 then
					-- Otherwise we read via our routine if we 
					-- are in a UTF16 file otherwise leave it to
					-- parent.
				if is_utf16 then
					utf16_read_character
				else
					impl.read_character
				end
			end
		end

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
		local
			i: INTEGER
		do
			-- naive implementation.
			-- When the file is not UTF16 we could use
			-- impl.read_string; last_string := impl.last_string but 
			-- that would break the fact that `last_string' must 
			-- remain the same object. It would also require 
			-- to duplicate some of the detection handling.
			from
				last_string.wipe_out
				i := nb
				read_character
			until
				i = 0 or end_of_input
			loop
				last_string.append_character (last_character)
				read_character
				i := i - 1
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
			-- (Note: unlike the abstract specification, this _often_ but 
			-- not always returns the same object.)

feature {NONE} -- State

	is_utf16: BOOLEAN
			-- Are we reading an UTF16 file?

	is_msb_first: BOOLEAN
			-- Is the most significant byte first?

	is_detected: BOOLEAN
			-- Have first two bytes been read?

	utf_queue: DS_LINKED_QUEUE [CHARACTER]
			-- Queue used in UTF16 mode

	impl: KI_CHARACTER_INPUT_STREAM
			-- Internal stream

feature {NONE} -- Implementation

	utf16_detect_read_character is
			-- Read first two chars of file to establish
			-- whether we are a UTF16 file.
		require
			not_detected: not is_detected
			not_end: not impl.end_of_input
		local
			first_char, second_char: CHARACTER
		do
			impl.read_character
			if not impl.end_of_input then
				first_char := impl.last_character
				impl.read_character
				if not impl.end_of_input then
					second_char := impl.last_character
						-- Check byte ordering character.
						-- If found, set found and do not forward as input.
					if (first_char.code = 254 and second_char.code = 255) then
						is_utf16 := True
						is_msb_first := True
					elseif (first_char.code = 255 and second_char.code = 254) then
						is_utf16 := True
						is_msb_first := False
					elseif (first_char.code = 0 and second_char = Lt_char) then 
							-- Check wide '<'.
						is_utf16 := True
						is_msb_first := False
						utf_queue.force (Lt_char)
					elseif (first_char = Lt_char and second_char.code = 0) then
						is_utf16 := True
						is_msb_first := False
						utf_queue.force (Lt_char)
					else
							-- Not unicode.
						utf_queue.force (first_char)
						utf_queue.force (second_char)
					end
				end
			end
		end

	utf16_read_character is
			-- Read two characters at a time and fill queue with 
			-- UTF8 encoding of character.
		require
			utf16: is_utf16
			not_end: not impl.end_of_input
		local
			first_char, second_char: CHARACTER
		do
			impl.read_character
			if not impl.end_of_input then
				first_char := impl.last_character
				impl.read_character
				if not impl.end_of_input then
					second_char := impl.last_character
					if is_msb_first then
						append_character (first_char.code * 256 + second_char.code)
					else
						append_character (second_char.code * 256 + first_char.code)
					end
				end
			end
		end

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
				std.output.put_string ("[")
				std.output.put_string (a_char.out)
				std.output.put_string ("]")
			end
				-- Convert to UTF8
			a_buffer := utf8_buffer
			STRING_.wipe_out (a_buffer)
			utf8.append_code_to_utf8 (a_buffer, a_char)
			nb := a_buffer.count
			from i := 1 until i > nb loop
				utf_queue.force (a_buffer.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Lt_char: CHARACTER is '<'

	utf8_buffer: STRING is
			-- Buffer for UTF-8 encoding
		once
			Result := STRING_.make (6)
		ensure
			utf8_buffer_not_void: Result /= Void
			string_type: Result.same_type ("")
		end

invariant
	
	last_string: last_string /= Void
	impl_not_void: impl /= Void
	queue_not_void: utf_queue /= Void

end
