indexing

	description:

		"Error: Undefined literal string token"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_UNDEFINED_STRING_TOKEN_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_string: STRING) is
			-- Create a new error reporting that the literal
			-- `a_string' has not been defined as a token.
		require
			filename_not_void: filename /= Void
			a_string_not_void: a_string /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_string, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: undefined literal string token $3"
			-- Default template used to built the error message

	code: STRING is "PR0021"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = undefined literal string token

end -- class PR_UNDEFINED_STRING_TOKEN_ERROR
