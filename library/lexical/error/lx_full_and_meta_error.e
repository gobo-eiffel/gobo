indexing

	description:

		"Error: The use of meta equivalence classes %
		%does not make sense with full tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FULL_AND_META_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new error reporting that the use
			-- of meta equivalence classes does not make
			-- sense with full tables.
		do
			!! parameters.make (1, 0)
		end

feature -- Access

	default_template: STRING is "$0: -f and -m don't make sense together"
			-- Default template used to built the error message

	code: STRING is "LX0027"
			-- Error code

invariant

	-- dollar0: $0 = program name

end -- class LX_FULL_AND_META_ERROR
