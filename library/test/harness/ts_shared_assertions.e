indexing

	description:

		"Shared assertions"

	pattern: "Singleton"
	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_SHARED_ASSERTIONS

feature -- Access

	Assertions: TS_ASSERTIONS is
			-- Assertions
		once
			!! Result.make
		ensure
			assertions_not_void: Result /= Void
		end

end -- class TS_SHARED_ASSERTIONS
