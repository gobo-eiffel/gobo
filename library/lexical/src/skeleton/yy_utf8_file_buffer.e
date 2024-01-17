note

	description:
	"[
		Lexical analyzer buffers for Unicode input files.
		The buffer contains the UTF-8 bytes, after possible
		conversion if the input used a different encoding.
		Supported encodings: UTF-8, ISO-8859-1.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class YY_UTF8_FILE_BUFFER

inherit

	YY_FILE_BUFFER
		rename
			make_from_string as make_from_utf8_string,
			set_string as set_utf8_string
		redefine
			fill,
			flush,
			compact_left
		end

	YY_UTF8_BUFFER
		rename
			make as make_from_string
		undefine
			name,
			wipe_out,
			set_utf8_string,
			make_from_utf8_string
		redefine
			set_string,
			make_from_string,
			fill,
			flush,
			compact_left
		end

create

	make,
	make_with_size

feature {NONE} -- Initialization

	make_from_string (a_string: READABLE_STRING_GENERAL)
			-- Create a new buffer with characters from `a_string'.
			-- Invalid Unicode characters are encoded with one byte 0xFF.
			-- Do not alter `a_string' during the scanning process.
		do
			end_of_file := True
			file := null_input_stream
			Precursor (a_string)
			filled := False
		end

feature -- Access

	default_encoding: INTEGER
			-- Default encoding to be used
			-- (ISO-8859-1 if not specified)

	encoding: INTEGER
			-- Encoding of the input file

	unknown_encoding: INTEGER = 0
			-- Encoding not determined yet

	utf8_encoding: INTEGER = 1
			-- Code for UTF-8 encoding

	iso_8859_1_encoding: INTEGER = 2
			-- Code for ISO-8859-1 encoding

feature -- Setting

	set_string (a_string: READABLE_STRING_GENERAL)
			-- Reset buffer with characters from `a_string'.
			-- Invalid Unicode characters are encoded with one byte 0xFF.
			-- Resize buffer capacity if needed.
			-- Do not alter `a_string' during the scanning process.
		do
			end_of_file := True
			file := null_input_stream
			Precursor (a_string)
			filled := False
		end

	set_default_encoding (a_encoding: like default_encoding)
			-- Set `default_encoding' to `a_encoding'.
		do
			default_encoding := a_encoding
		ensure
			default_encoding_set: default_encoding = a_encoding
		end

feature -- Element change

	fill
			-- Fill buffer with UTF-8 bytes from `file', after possible conversion.
			-- Do not lose unprocessed bytes in buffer.
			-- Resize buffer if necessary. Set `filled' to True
			-- if bytes have been added to buffer.
		local
			nb, nb2: INTEGER
			buff: like content
			i, j, k: INTEGER
			c: CHARACTER_8
			l_code: INTEGER
		do
				-- If the last call to `fill' failed to add
				-- more characters, this means that the end of
				-- file has already been reached. Do not attempt
				-- to fill again the buffer in that case.
			if filled and not end_of_file then
					-- First move last characters to start of buffer
					-- and eventually resize `content' if necessary.
				compact_left
				buff := content
					-- Read in more data.
				if interactive then
					if encoding = utf8_encoding then
						nb := 1
						nb2 := buff.fill_from_stream (file, count + 1, nb)
					elseif encoding = iso_8859_1_encoding then
							-- In case of ISO 8859-1, first read the character far enough
							-- on the right of the buffer so that we can later convert it
							-- to the left (with one or two bytes).
						nb := 1
						k := count + 1 + nb
						nb2 := buff.fill_from_stream (file, k, nb)
					elseif default_encoding = utf8_encoding then
						encoding := utf8_encoding
						nb := 1
						nb2 := buff.fill_from_stream (file, count + 1, nb)
					else
						encoding := iso_8859_1_encoding
							-- In case of ISO 8859-1, first read the character far enough
							-- on the right of the buffer so that we can later convert it
							-- to the left (with one or two bytes).
						nb := 1
						k := count + 1 + nb
						nb2 := buff.fill_from_stream (file, k, nb)
					end
				elseif encoding = utf8_encoding then
					nb := capacity - count
					nb2 := buff.fill_from_stream (file, count + 1, nb)
				elseif encoding = iso_8859_1_encoding then
						-- In case of ISO 8859-1, first read the characters (half of the
						-- available number of bytes) far enough on the right of the buffer
						-- so that we can later convert them to the left (with one or two
						-- bytes for each character read).
					nb := (capacity - count) // {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
					k := count + 1 + nb
					nb2 := buff.fill_from_stream (file, k, nb)
				else
						-- We need to determine whether the file starts with a UTF-8 BOM.
						-- Make as if the characters read are not the BOM but regular
						-- ISO 8859-1, so that we have enough room to convert them to
						-- possibly one or two bytes each.
					nb := {UC_UTF8_ROUTINES}.utf8_bom.count
					k := count + 1 + nb
					from
						nb2 := buff.fill_from_stream (file, k, nb)
					until
						nb2 >= nb or else file.end_of_input
					loop
						nb2 := nb2 + buff.fill_from_stream (file, k + nb2, nb - nb2)
					end
					if nb2 >= nb and then {UC_UTF8_ROUTINES}.is_endian_detection_character (buff.item (k), buff.item (k + 1), buff.item (k + 2)) then
							-- We found the UTF-8 BOM.
							-- Discard it and fill the buffer with the following UTF-8 characters.
						encoding := utf8_encoding
						nb := capacity - count
						nb2 := buff.fill_from_stream (file, count + 1, nb)
					else
							-- It's not the UTF-8 BOM.
						if default_encoding = utf8_encoding then
							encoding := utf8_encoding
						else
								-- So it's not a UTF-8 file.
							encoding := iso_8859_1_encoding
						end
					end
				end
				if nb2 < nb then
					end_of_file := file.end_of_input
				end
				if encoding = iso_8859_1_encoding then
						-- Convert the ISO-8859-1 characters which have been read
						-- on the right of the buffer to one or two bytes UTF-8
						-- characters each on the left of the buffer.
					from
						i := 1
						j := count
					until
						i > nb2
					loop
						c := buff.item (k)
						l_code := c.code
						if l_code <= 0x7F then
							j := j + 1
							buff.put (c, j)
						else
								-- 110xxxxx
							j := j + 1
							buff.put ({KL_INTEGER_ROUTINES}.to_character (l_code // 64 + 192), j)
								-- 10xxxxxx
							j := j + 1
							buff.put ({KL_INTEGER_ROUTINES}.to_character (l_code \\ 64 + 128), j)
						end
						k := k + 1
						i := i + 1
					end
					count := j
				else
					count := count + nb2
				end
				if nb2 > 0 then
					filled := True
				else
					filled := False
				end
				buff.put (End_of_buffer_character, count + 1)
				buff.put (End_of_buffer_character, count + 2)
			else
				filled := False
			end
		end

	flush
			-- Flush buffer.
		do
			Precursor
			encoding := unknown_encoding
		ensure then
			unknown_encoding: encoding = unknown_encoding
		end

	compact_left
			-- Move unconsumed characters to the start of buffer
			-- and make sure there is still available space at
			-- the end of buffer.
		local
			nb: INTEGER
			l_space_needed: INTEGER
			l_old_capacity: INTEGER
		do
			if encoding = utf8_encoding then
				l_space_needed := 1
			elseif encoding = iso_8859_1_encoding then
					-- We need to consider the fact that a ISO-8859-1 character
					-- can be converted to one or two bytes in UTF-8.
				l_space_needed := {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
			elseif interactive then
					-- We need to consider the fact that a ISO-8859-1 character
					-- can be converted to one or two bytes in UTF-8.
				l_space_needed := {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
			else
					-- We need to have enough room to read the BOM if any.
				l_space_needed := {UC_UTF8_ROUTINES}.utf8_bom.count * {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
			end
			l_old_capacity := capacity
			nb := count - index + 1
			if nb + l_space_needed > l_old_capacity then
					-- Buffer is full. Resize it.
				if capacity = 0 then
					capacity := default_capacity
				else
					capacity := capacity * 2
				end
				if capacity < l_old_capacity + l_space_needed then
					capacity := l_old_capacity + l_space_needed
				end
					-- Make sure `content.count' is big enough.
					-- Include room for 2 EOB characters.
				if capacity + 2 > content.count then
						-- Set `content.count' to `capacity' + 2.
					content.resize (capacity + 2)
				end
			end
			if index /= 1 then
					-- Move the 2 EOB characters as well.
				content.move_left (index, 1, nb + 2)
				index := 1
				count := nb
			end
		ensure then
			not_full_utf8_encoding: encoding = utf8_encoding implies capacity >= count + 1
			not_full_iso_8859_1_encoding: encoding = iso_8859_1_encoding implies capacity >= count + {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
			not_full_interactive: interactive and encoding /= utf8_encoding and encoding /= iso_8859_1_encoding implies (default_encoding = utf8_encoding implies capacity >= count + 1) and (default_encoding /= utf8_encoding implies capacity >= count + {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8)
			not_full_unknown_encoding: not interactive and encoding /= utf8_encoding and encoding /= iso_8859_1_encoding implies capacity >= count + {UC_UTF8_ROUTINES}.utf8_bom.count * {UC_UTF8_ROUTINES}.max_bytes_of_iso_8859_1_to_utf8
		end

end
