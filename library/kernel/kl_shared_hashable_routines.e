indexing

	description:

		"Shared routines that ought to be in class HASHABLE"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_HASHABLE_ROUTINES

feature -- Access

	HASHABLE_: KL_HASHABLE_ROUTINES is
			-- Routines that ought to be in class HASHABLE
		once
			!! Result
		ensure
			hashable_routines_not_void: Result /= Void
		end

end -- class KL_SHARED_HASHABLE_ROUTINES
