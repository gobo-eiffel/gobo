note

	description:

		"Imported routines that ought to be in class BOOLEAN"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_BOOLEAN_ROUTINES

feature -- Access

	BOOLEAN_: KL_BOOLEAN_ROUTINES is
			-- Routines that ought to be in class BOOLEAN
		once
			create Result
		ensure
			boolean_routines_not_void: Result /= Void
		end

end
