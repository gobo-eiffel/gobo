indexing

	description:

		"Error: Token associated with two different literal strings"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TWO_STRINGS_TOKEN_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_token: STRING; string1, string2: STRING) is
			-- Create a new error reporting that the token `a_token'
			-- has been associated with two different literal strings.
		require
			filename_not_void: filename /= Void
			a_token_not_void: a_token /= Void
			string1_not_void: string1 /= Void
			string2_not_void: string2 /= Void
		do
			!! parameters.make (1, 5)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_token, 3)
			parameters.put (string1, 4)
			parameters.put (string2, 5)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: token $3 associated with two literal strings $4 and $5"
			-- Default template used to built the error message

	code: STRING is "PR0023"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = token
	-- dollar4: $4 = literal string #1
	-- dollar5: $5 = literal string #2

end -- class PR_TWO_STRINGS_TOKEN_ERROR
