indexing

	description:

		"Error: Unknown command-line flag"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_UNKNOWN_FLAG_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (a_flag: STRING) is
			-- Create a new error reporting that
			-- `a_flag' is an unknown flag.
		require
			a_flag_not_void: a_flag /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (a_flag, 1)
		end

feature -- Access

	default_template: STRING is "$0: unknown flag '$1'"
			-- Default template used to built the error message

	code: STRING is "UT0002"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = flag

end -- class UT_UNKNOWN_FLAG_ERROR
