indexing

	description:

		"Executable commands"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class UT_COMMAND

feature -- Execution

	execute is
			-- Execute current command.
		deferred
		end

end -- class UT_COMMAND
