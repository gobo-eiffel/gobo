indexing

	description:

		"Executable commands"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class UT_COMMAND

feature -- Execution

	execute is
			-- Execute current command.
		deferred
		end

end -- class UT_COMMAND
