indexing

	description:

		"Imported routines that ought to be in class INTEGER"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	INTEGER_: KL_INTEGER_ROUTINES is
			-- Routines that ought to be in class INTEGER
		once
			!! Result
		ensure
			integer_routines_not_void: Result /= Void
		end

end -- class KL_IMPORTED_INTEGER_ROUTINES
