indexing

	description:

		"Shared routines that ought to be in class STRING"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_STRING_ROUTINES

feature -- Access

	string_: KL_STRING_ROUTINES is
			-- Routines that ought to be in class STRING
		once
			!! Result
		ensure
			string__not_void: Result /= Void
		end

end -- class KL_SHARED_STRING_ROUTINES
