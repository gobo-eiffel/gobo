
indexing

	description: 
		
		"Variant of KI_CHARACTER_INPUT_STREAM that accepts UTF16 and converts it to UTF8"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
	--xml_specific_zero: "Zero characters conflict with EOB but are not valid XML"
	--xml_specific_lt: "Detection assuming first char is < is XML specific"
	-- TODO:
	-- close file OK?
	-- efficient fill
	-- factorise UTF8 encoding routines
	
class XF_UTF16_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM
	
	XF_UTF8_PRIVATE_ROUTINES
		
creation

	make, make_from_stream
	
feature {NONE} -- Creation

	make (a_name: STRING) is
			-- Make.
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			!! a_file.make (a_name)
			a_file.open_read
			make_from_stream (a_file)
		end
			
	make_from_stream (a: like impl) is
			-- Make from stream.
		require
			--at_start: stream empty or at start
		do
			impl := a
			!! utf_queue.make
			last_string := clone ("")
		ensure
			def: impl = a
		end
		
feature {NONE} -- Impl

	impl: KI_CHARACTER_INPUT_STREAM
	
feature -- Input

	read_character is
			-- Read the next item in input stream.
			-- Make the result available in `last_item'.
		do
			if not is_detected then
				utf16_detect_read_character
				is_detected := True
				-- detection may eat characters so we do a normal
				-- read afterwards, fill queue for normal read
			elseif utf_queue.count > 0 then
				-- last character was read from queue
				utf_queue.remove
			end
			
			-- if utf_queue still contains something,
			-- this is the next character, so do nothing
			if utf_queue.count = 0 then
				-- otherwise we read via our routine if we 
				-- are in a UTF16 file otherwise leave it to
				-- parent.
				if is_utf16 then
					utf16_read_character
				else
					impl.read_character
				end
			end
		end

	unread_character (an_item: CHARACTER) is
			-- Put `an_item' back in input stream.
			-- This item will be read first by the next
			-- call to a read routine.
		do
			impl.unread_character (an_item)
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
			-- Last item read
		do 
			if utf_queue.count > 0 then
				Result := utf_queue.item
			else
				Result := impl.last_character
			end
		end

feature -- Input

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
		local
			i: INTEGER
		do
			check 
				last_not_void: last_string /= Void 
			end
			
			if is_utf16 then
				-- canonical naive implementation
				from
					-- once we are in utf_16 mode we stay that way so 
					-- we should never wipe out impl.last_string.
					last_string.wipe_out
					i := 1
				until	
					i > nb or end_of_input
				loop
					read_character
					last_string.append_character (last_character)
					i := i + 1
				end
			else
				-- use client's possibly faster routines
				-- this means we do change last_string's pointer.
				impl.read_string (nb)
				last_string := impl.last_string
			end
		end
		
	last_string: STRING
			-- Last string read
			-- (Note: unlike the abstract specification, this _often_ but 
			-- not always returns the same object.)
	
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
			first_char := impl.last_character
			if not impl.end_of_input then
				impl.read_character
				second_char := impl.last_character
				if not impl.end_of_input then
					-- check byte ordering character
					-- if found, set found and do not forward as input
					if (first_char.code = 254 and second_char.code = 255) then
						is_utf16 := True
						is_msb_first := True
					elseif (first_char.code = 255 and second_char.code = 254) then
						is_utf16 := True
						is_msb_first := False
					-- check wide '<'
					elseif (first_char.code = 0 and second_char = Lt_char) then 
						is_utf16 := True
						is_msb_first := False
						utf_queue.force (Lt_char)
					elseif (first_char = Lt_char and second_char.code = 0) then
						is_utf16 := True
						is_msb_first := False
						utf_queue.force (Lt_char)
					-- not unicode
					else
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
			first_char := impl.last_character
			if not impl.end_of_input then
				impl.read_character
				second_char := impl.last_character
				if not impl.end_of_input then
					if is_msb_first then
						append_character (first_char.code * 256 + second_char.code)
					else
						append_character (second_char.code * 256 + first_char.code)
					end
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
			i: INTEGER
			enc_size: INTEGER
		do
			debug ("xml_parser")
				io.put_string ("[")
				io.put_string (a_char.out)
				io.put_string ("]")
			end

			-- convert to UTF8
			from
				enc_size := encoding_size (a_char)
				i := 1
			until
				i > enc_size
			loop
				utf_queue.force (encoded_octet (a_char, i, enc_size))
				i := i + 1
			end
		end
						
feature {NONE} -- State
	
	is_utf16: BOOLEAN
			-- Are we reading an UTF16 file?

	is_msb_first: BOOLEAN
			-- Is the most significant byte first?
	
	is_detected: BOOLEAN
			-- Have first two bytes been read?

	utf_queue: DS_LINKED_QUEUE [CHARACTER]
			-- Queue used in UTF16 mode.
		
feature {NONE} -- Constants

	Lt_char: CHARACTER is '<'
	
invariant
	
	last_string: last_string /= Void
	impl_not_void: impl /= Void
	queue_not_void: utf_queue /= Void

end
