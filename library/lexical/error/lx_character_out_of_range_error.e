indexing

	description:

		"Error: Character out of range"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_CHARACTER_OUT_OF_RANGE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; char: STRING) is
			-- Create a new error reporting that
			-- character `char' is out of range.
		require
			filename_not_void: filename /= Void
			char_not_void: char /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (char, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: character '$3' out of range"
			-- Default template used to built the error message

	code: STRING is "LX0008"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = character

end -- class LX_CHARACTER_OUT_OF_RANGE_ERROR
