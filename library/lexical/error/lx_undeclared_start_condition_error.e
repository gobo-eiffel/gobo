indexing

	description:

		"Error: Undeclared start condition"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_UNDECLARED_START_CONDITION_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; sc: STRING) is
			-- Create a new error reporting that `sc' has
			-- not been declared as a start condition.
		require
			filename_not_void: filename /= Void
			sc_not_void: sc /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (sc, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: undeclared start condition $3"
			-- Default template used to built the error message

	code: STRING is "LX0021"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = start condition

end -- class LX_UNDECLARED_START_CONDITION_ERROR
