﻿note

	description:

		"Imported routines that ought to be in class HASHABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

class KL_IMPORTED_HASHABLE_ROUTINES

feature -- Access

	HASHABLE_: KL_HASHABLE_ROUTINES
			-- Routines that ought to be in class HASHABLE
		once
			create Result
		ensure
			instance_free: class
			hashable_routines_not_void: Result /= Void
		end

end
