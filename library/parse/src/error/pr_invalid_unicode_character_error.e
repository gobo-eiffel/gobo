note

	description:

		"Error: Invalid Unicode character"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_INVALID_UNICODE_CHARACTER_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_char: STRING)
			-- Create a new error reporting that the character
			-- `a_char' is a surrogate or invalid Unicode character.
		require
			filename_not_void: filename /= Void
			a_char_not_void: a_char /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_char, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: surrogate or invalid Unicode character $3"
			-- Default template used to built the error message

	code: STRING = "PR0031"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = character

end
