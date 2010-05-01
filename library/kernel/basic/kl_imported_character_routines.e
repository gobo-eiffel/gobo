note

	description:

		"Imported routines that ought to be in class CHARACTER"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_CHARACTER_ROUTINES

feature -- Access

	CHARACTER_: KL_CHARACTER_ROUTINES is
			-- Routines that ought to be in class CHARACTER
		once
			create Result
		ensure
			character_routines_not_void: Result /= Void
		end

end
