indexing

	description:

		"Error: Cannot write to file"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_CANNOT_WRITE_TO_FILE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING) is
			-- Create a new error reporting that file
			-- `filename' cannot be opened in write mode.
		require
			filename_not_void: filename /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (filename, 1)
		end

feature -- Access

	default_template: STRING is "$0: cannot write to '$1'"
			-- Default template used to built the error message

	code: STRING is "UT0004"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename

end -- class UT_CANNOT_WRITE_TO_FILE_ERROR
