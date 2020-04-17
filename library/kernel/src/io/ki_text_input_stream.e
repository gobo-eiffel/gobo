note

	description:

		"Interface for character input streams with the notion of lines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_TEXT_INPUT_STREAM

inherit

	KI_CHARACTER_INPUT_STREAM

feature -- Input

	read_line
			-- Read characters from input stream until a line separator
			-- or end of file is reached. Make the characters that have
			-- been read available in `last_string' and discard the line
			-- separator characters from the input stream.
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
		deferred
		ensure
			last_string_not_void: not end_of_input implies last_string /= Void
		end

	read_new_line
			-- Read a line separator from input stream.
			-- Make the characters making up the recognized
			-- line separator available in `last_string',
			-- or make `last_string' empty and leave the
			-- input stream unchanged if no line separator
			-- was found.
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
		deferred
		ensure
			not_end_of_input: not end_of_input
			last_string_not_void: last_string /= Void
		end

feature -- Access

	eol: STRING_8
			-- Line separator
		deferred
		ensure
			eol_not_void: Result /= Void
			eol_not_empty: Result.count > 0
		end

end
