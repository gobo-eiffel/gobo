note

	description:

		"Interface for character output streams with the notion of lines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_TEXT_OUTPUT_STREAM

inherit

	KI_CHARACTER_OUTPUT_STREAM

feature -- Output

	put_line (a_string: STRING)
			-- Write `a_string' to output stream
			-- followed by a line separator.
		require
			is_open_write: is_open_write
			a_string_not_void: a_string /= Void
		do
			put_string (a_string)
			put_new_line
		end

	put_new_line
			-- Write a line separator to output stream.
		require
			is_open_write: is_open_write
		do
			put_string (eol)
		end

feature -- Access

	eol: STRING
			-- Line separator
		deferred
		ensure
			eol_not_void: Result /= Void
			eol_not_empty: Result.count > 0
		end

end
