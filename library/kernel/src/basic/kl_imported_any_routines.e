note

	description:

		"Imported routines that ought to be in class ANY"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_ANY_ROUTINES

feature -- Access

	ANY_: KL_ANY_ROUTINES
			-- Routines that ought to be in class ANY
		once
			create Result
		ensure
			any_routines_not_void: Result /= Void
		end

end
