indexing

	description:

		"Executable commands";

	library:    "Gobo Eiffel Utility Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class UT_COMMAND

feature -- Status report

	executable (arg: ANY): BOOLEAN is
			-- Can current command be executed with `arg'?
		deferred
		end

feature -- Execution

	execute (arg: ANY) is
			-- Execute current command.
		require
			executable: executable (arg)
		deferred
		end

end -- class UT_COMMAND
