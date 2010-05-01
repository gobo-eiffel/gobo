note

	description:

		"Positions in Eiffel files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FILE_POSITION

inherit

	ET_COMPRESSED_POSITION
		rename
			make as make_compressed_position,
			make_default as make_default_compressed_position
		redefine
			append_to_string
		end

create

	make, make_default

feature {NONE} -- Initialization

	make (a_filename: like filename; a_line, a_column: INTEGER) is
			-- Create a new position in `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			filename := a_filename
			make_compressed_position (a_line, a_column)
		ensure
			filename_set: filename = a_filename
			line_set: a_line <= maximum_line implies line = a_line
			no_line_set: a_line > maximum_line implies line = 0
			column_set: a_column <= maximum_column implies column = a_column
			no_column_set: a_column > maximum_column implies column = 0
		end

	make_default is
			-- Create a new default position.
		do
			make (no_filename, no_line, no_column)
		ensure
			filename_set: filename = no_filename
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	filename: STRING
			-- Filename

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append `to_text' to `a_string'.
		do
			append_to_string_with_filename (filename, a_string)
		end

feature -- Constants

	no_filename: STRING is ""
			-- Filename used in `make_default'

invariant

	filename_not_void: filename /= Void

end
