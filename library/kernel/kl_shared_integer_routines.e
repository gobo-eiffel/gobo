indexing

	description:

		"Shared routines that ought to be in class INTEGER"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_INTEGER_ROUTINES

feature -- Access

	INTEGER_: KL_INTEGER_ROUTINES is
			-- Routines that ought to be in class INTEGER
		once
			!! Result
		ensure
			integer_routines_not_void: Result /= Void
		end

end -- class KL_SHARED_INTEGER_ROUTINES
