indexing

	description:

		"Error: Symbol is already declared as a token"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_SYMBOL_DECLARED_TOKEN_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_name: STRING) is
			-- Create a new error reporting that symbol
			-- `a_name' has already been declared as a token.
		require
			filename_not_void: filename /= Void
			a_name_not_void: a_name /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_name, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: symbol $3 is already declared as a token"
			-- Default template used to built the error message

	code: STRING is "PR0017"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = symbol name

end -- class PR_SYMBOL_DECLARED_TOKEN_ERROR
