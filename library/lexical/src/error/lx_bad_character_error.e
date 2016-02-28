note

	description:

		"Error: Bad character"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_BAD_CHARACTER_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; char: STRING)
			-- Create a new error reporting the presence
			-- of a bad character `char'.
		require
			filename_not_void: filename /= Void
			char_not_void: char /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (char, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: bad character: $3"
			-- Default template used to built the error message

	code: STRING = "LX0003"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = character

end
