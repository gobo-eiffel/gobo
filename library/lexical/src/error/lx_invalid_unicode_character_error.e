note

	description:

		"Error: Surrogate or invalid Unicode character"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class LX_INVALID_UNICODE_CHARACTER_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; char: STRING)
			-- Create a new error reporting that
			-- character `char' is out of range.
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

	default_template: STRING = "%"$1%", line $2: surrogate or invalid Unicode character '$3'"
			-- Default template used to built the error message

	code: STRING = "LX0033"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = character

end
