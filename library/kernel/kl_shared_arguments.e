indexing

	description:

		"Shared command-line arguments"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_ARGUMENTS

feature -- Access

	Arguments: KL_ARGUMENTS is
			-- Command-line arguments
		once
			!! Result.make
		ensure
			arguments_not_void: Result /= Void
		end

end -- class KL_SHARED_ARGUMENTS
