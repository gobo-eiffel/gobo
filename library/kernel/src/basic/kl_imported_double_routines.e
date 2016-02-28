note

	description:

		"Imported routines that ought to be in class DOUBLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_DOUBLE_ROUTINES

feature -- Access

	DOUBLE_: KL_DOUBLE_ROUTINES
			-- Routines that ought to be in class DOUBLE
		once
			create Result
		ensure
			double_routines_not_void: Result /= Void
		end

end
