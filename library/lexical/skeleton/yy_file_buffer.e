indexing

	description:

		"Lexical analyzer input file buffers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class YY_FILE_BUFFER

inherit

	YY_BUFFER
		rename
			make as make_from_string
		export
			{NONE} make_from_string, make_from_buffer
		redefine
			fill
		end

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make, make_with_size

feature -- Initialization

	make (a_file: like INPUT_STREAM_TYPE) is
			-- Create a new buffer for `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			make_with_size (a_file, Default_capacity)
		ensure
			count_set: count = 0
			file_set: file = a_file
			beginning_of_line: beginning_of_line
		end
		
	make_with_size (a_file: like INPUT_STREAM_TYPE; size: INTEGER) is
			-- Create a new buffer of capacity `size' for `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
			size_positive: size >= 0
		do
			capacity := size
				-- `content' has to be 2 characters longer
				-- than the size given because we need to
				-- put in 2 end-of-buffer characters.
			content := STRING_.make_buffer (size + 2)
			set_file (a_file)
		ensure
			capacity_set: capacity = size
			count_set: count = 0
			file_set: file = a_file
			beginning_of_line: beginning_of_line
		end

feature -- Access

	file: like INPUT_STREAM_TYPE
			-- Input file

feature -- Setting

	set_file (a_file: like INPUT_STREAM_TYPE) is
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			flush
			file := a_file
		ensure
			count_set: count = 0
			file_set: file = a_file
			beginning_of_line: beginning_of_line
		end

feature -- Element change

	fill is
			-- Fill buffer with characters from `file'.
			-- Do not lose unprocessed characters in buffer.
			-- Resize buffer if necessary. Set `filled' to True
			-- if characters have been added to buffer.
		local
			i, j, nb: INTEGER
			buff: STRING
		do
				-- If the last call to `fill' failed to add
				-- more characters, this means that the end of
				-- file has already been reached. Do not attempt
				-- to fill again the buffer in that case.
			if filled and not INPUT_STREAM_.end_of_input (file) then
				buff := content
					-- First move last characters to start of buffer.
					--| This should be done with a block copy.
				nb := count
				from i := position until i > nb loop
					j := j + 1
					buff.put (buff.item (i), j)
					i := i + 1
				end
				count := j
				position := 1
				nb := capacity - count
				if nb = 0 then
						-- Buffer is full. Resize it.
					capacity := capacity * 2
					if capacity = 0 then
						capacity := Default_capacity
					end
						-- Make sure `buffer.count' is big enough.
						-- Include room for 2 EOB characters.
					if capacity + 2 - buff.count > 0 then
							-- Set `content.count' to `capacity' + 2.
						STRING_.resize_buffer (buff, capacity + 2)
					end
					nb := capacity - count
				end
					-- Read in more data.
				if interactive then
					file.read_character
					if not INPUT_STREAM_.end_of_input (file) then
						j := j + 1
						buff.put (file.last_character, j)
						filled := True
					else
						filled := False
					end
				else
					if nb > Read_buffer_capacity then
						nb := Read_buffer_capacity
					end
					nb := INPUT_STREAM_.read_stream (file, buff, j + 1, nb)
					if nb > 0 then
						filled := True
					else
						filled := False
					end
					j := j + nb
				end
				count := j
				buff.put (End_of_buffer_character, j + 1)
				buff.put (End_of_buffer_character, j + 2)
			else
				filled := False
			end
		end

feature {NONE} -- Constants

	Read_buffer_capacity: INTEGER is 8192
			-- Maximum number of characters to 
			-- be read at a time

invariant

	file_not_void: file /= Void
	file_open_read: INPUT_STREAM_.is_open_read (file)

end -- class YY_FILE_BUFFER
