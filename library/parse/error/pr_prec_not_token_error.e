indexing

	description:

		"Error: Symbol after %%prec is not a token"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_PREC_NOT_TOKEN_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_name: STRING) is
			-- Create a new error reporting that symbol
			-- `a_name' after %prec is not a token.
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

	default_template: STRING is "%"$1%", line $2: symbol $3 after %%prec is not a token"
			-- Default template used to built the error message

	code: STRING is "PR0008"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = symbol name

end -- class PR_PREC_NOT_TOKEN_ERROR
