indexing

	description:

		"Error: Literal string token defined twice"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_STRING_TOKEN_DEFINED_TWICE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_string: STRING; token1, token2: STRING) is
			-- Create a new error reporting that the literal
			-- `a_string' has been defined twice.
		require
			filename_not_void: filename /= Void
			a_string_not_void: a_string /= Void
			token1_not_void: token1 /= Void
			token2_not_void: token2 /= Void
		do
			!! parameters.make (1, 5)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_string, 3)
			parameters.put (token1, 4)
			parameters.put (token2, 5)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: literal string $3 defined twice with $4 and $5"
			-- Default template used to built the error message

	code: STRING is "PR0022"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = literal string
	-- dollar4: $4 = token1
	-- dollar5: $5 = token2

end -- class PR_STRING_TOKEN_DEFINED_TWICE_ERROR
