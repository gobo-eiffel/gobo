indexing

	description:

		"Lexical analyzer input file buffers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FILE_BUFFER

inherit

	LX_BUFFER
		rename
			make as make_string_buffer
		redefine
			refill
		end

	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make

feature -- Initialization

	make (a_file: like INPUT_STREAM_TYPE) is
			-- Create a new buffer for `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			file := a_file
			refill
		ensure
			file_set: file = a_file
		end

feature -- Access

	file: like INPUT_STREAM_TYPE
			-- Input file

feature -- Status report

	end_of_file: BOOLEAN
			-- Has end-of-file been reached?

feature -- Element change

	refill is
			-- Refill buffer with characters from `file'.
		do
			if not INPUT_STREAM_.end_of_input (file) then
				content := INPUT_STREAM_.read_string (file, 16384)
			else
				end_of_file := True
				content := ""
			end
			position := 1
		end

invariant

	file_not_void: file /= Void
	file_open_read: not end_of_file implies INPUT_STREAM_.is_open_read (file)

end -- class LX_FILE_BUFFER
