indexing

	description:

		"Error: Token with two different token_ids"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TWO_TOKEN_IDS_TOKEN_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_token: STRING; id1, id2: INTEGER) is
			-- Create a new error reporting that the token `a_token'
			-- has been given two different token_ids.
		require
			filename_not_void: filename /= Void
			a_token_not_void: a_token /= Void
		do
			!! parameters.make (1, 5)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_token, 3)
			parameters.put (id1.out, 4)
			parameters.put (id2.out, 5)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: token $3 has two different ids $4 and $5"
			-- Default template used to built the error message

	code: STRING is "PR0024"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = token
	-- dollar4: $4 = id #1
	-- dollar5: $5 = id string #2

end -- class PR_TWO_TOKEN_IDS_TOKEN_ERROR
