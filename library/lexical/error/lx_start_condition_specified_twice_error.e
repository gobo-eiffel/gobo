indexing

	description:

		"Error: Start condition specified twice"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_START_CONDITION_SPECIFIED_TWICE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; sc: STRING) is
			-- Create a new error reporting that
			-- `sc' has been specified twice.
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

	default_template: STRING is "Warning, %"$1%", line $2: <$3> specified twice"
			-- Default template used to built the error message

	code: STRING is "LX0019"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = start condition

end -- class LX_START_CONDITION_SPECIFIED_TWICE_ERROR
