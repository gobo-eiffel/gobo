indexing

	description:

		"Error: Symbol precedence defined twice"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_PRECEDENCE_DEFINED_TWICE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_name: STRING) is
			-- Create a new error reporting that the precedence
			-- of symbol `a_name' has been defined twice.
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

	default_template: STRING is "%"$1%", line $2: precedence of $3 defined twice"
			-- Default template used to built the error message

	code: STRING is "PR0006"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = symbol name

end -- class PR_PRECEDENCE_DEFINED_TWICE_ERROR
