indexing

	description:

		"Commands that do nothing"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_DO_NOTHING_COMMAND

inherit

	UT_COMMAND

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new command.
		do
		end

feature -- Execution

	execute is
			-- Execute current command.
		do
			-- Do nothing.
		end

end -- class UT_DO_NOTHING_COMMAND
