indexing

	description:

		"Positions in Eiffel files"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FILE_POSITION

inherit

	ET_POSITION

creation

	make

feature {NONE} -- Initialization

	make (a_filename: STRING; l, c: INTEGER) is
			-- Create a new position in `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		do
			filename := a_filename
			line := l
			column := c
		ensure
			filename_set: filename = a_filename
			line_set: line = l
			column_set: column = c
		end

feature -- Access

	filename: STRING
			-- Filename

end -- class ET_FILE_POSITION
