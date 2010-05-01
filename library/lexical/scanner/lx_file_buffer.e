note

	description:

		"Lexical analyzer input file buffers"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_FILE_BUFFER

inherit

	LX_BUFFER
		rename
			make as make_string_buffer
		redefine
			refill
		end

create

	make

feature -- Initialization

	make (a_file: like file) is
			-- Create a new buffer for `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			file := a_file
			refill
		ensure
			file_set: file = a_file
		end

feature -- Access

	file: KI_CHARACTER_INPUT_STREAM
			-- Input file

feature -- Status report

	end_of_file: BOOLEAN
			-- Has end-of-file been reached?

feature -- Element change

	refill is
			-- Refill buffer with characters from `file'.
		do
			if not file.end_of_input then
				file.read_string (16384)
				content := file.last_string
			else
				end_of_file := True
				content := ""
			end
			index := 1
		end

invariant

	file_not_void: file /= Void
	file_open_read: not end_of_file implies file.is_open_read

end
