indexing

	description:

		"Error: Too many nested include files"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP_TOO_MANY_INCLUDES_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (max: INTEGER) is
			-- Create a new error.
		do
			!! parameters.make (1, 1)
			parameters.put (max.out, 1)
		end

feature -- Access

	default_template: STRING is "$0: too many (i.e. $1) nested include files"
			-- Default template used to built the error message

	code: STRING is "GEPP01"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = max number of nested include files

end -- class GEPP_TOO_MANY_INCLUDES_ERROR
