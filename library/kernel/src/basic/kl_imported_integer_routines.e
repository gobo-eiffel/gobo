note

	description:

		"Imported routines that ought to be in class INTEGER"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	INTEGER_: KL_INTEGER_ROUTINES
			-- Routines that ought to be in class INTEGER
		once
			create Result
		ensure
			integer_routines_not_void: Result /= Void
		end

end
