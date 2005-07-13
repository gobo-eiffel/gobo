indexing

	description:

		"Invalid use of $$ in error action"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class PR_INVALID_DOLLAR_DOLLAR_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER) is
			-- Create a new error reporting that $$ has
			-- been used in an error action.
		require
			filename_not_void: filename /= Void
		do
			create parameters.make (1, 2)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: invalid use of $$$$ in error action"
			-- Default template used to built the error message

	code: STRING is "PR0026"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number

end
