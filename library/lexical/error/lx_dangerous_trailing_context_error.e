indexing

	description:

		"Warning: Dangerous variable trailing context in rule"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_DANGEROUS_TRAILING_CONTEXT_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER) is
			-- Create a new error reporting that a rule
			-- contains "dangerous" variable trailing context.
		require
			filename_not_void: filename /= Void
		do
			!! parameters.make (1, 2)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
		end

feature -- Access

	default_template: STRING is
		"Warning, %"$1%", line $2: dangerous trailing context"
			-- Default template used to built the error message

	code: STRING is "LX0026"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number

end -- class LX_DANGEROUS_TRAILING_CONTEXT_ERROR
