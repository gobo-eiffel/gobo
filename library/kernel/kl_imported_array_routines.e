indexing

	description:

		"Imported routines that ought to be in class ARRAY"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_IMPORTED_ARRAY_ROUTINES

feature -- Access

	ANY_ARRAY_: KL_ARRAY_ROUTINES [ANY] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			any_array_routines_not_void: Result /= Void
		end

	INTEGER_ARRAY_: KL_ARRAY_ROUTINES [INTEGER] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			integer_array_routines_not_void: Result /= Void
		end

	STRING_ARRAY_: KL_ARRAY_ROUTINES [STRING] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			string_array_routines_not_void: Result /= Void
		end

end -- class KL_IMPORTED_ARRAY_ROUTINES
