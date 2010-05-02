note

	description:

		"Error: Integer too large (implementation limitation)"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_INTEGER_TOO_LARGE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; an_int: STRING)
			-- Create a new error reporting `an_int' is too large.
		require
			filename_not_void: filename /= Void
			an_int_not_void: an_int /= Void
		do
			create parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (an_int, 2)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: integer $3 too large (implementation limitation)"
			-- Default template used to built the error message

	code: STRING = "LX0032"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = integer value

end
