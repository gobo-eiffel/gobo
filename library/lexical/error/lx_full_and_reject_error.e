indexing

	description:

		"Error: The use of reject is incompatible with full tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FULL_AND_REJECT_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new error reporting that the use
			-- of reject is incompatible with full tables.
		do
			!! parameters.make (1, 0)
		end

feature -- Access

	default_template: STRING is "$0: `reject' cannot be used with -f"
			-- Default template used to built the error message

	code: STRING is "LX0028"
			-- Error code

invariant

	-- dollar0: $0 = program name

end -- class LX_FULL_AND_REJECT_ERROR
