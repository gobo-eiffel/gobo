indexing

	description:

		"Shared operating system"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_OPERATING_SYSTEM

feature -- Acess

	operating_system: KL_OPERATING_SYSTEM is
			-- Underlying operating system
		once
			!! Result
		ensure
			operating_system_not_void: Result /= Void
		end

end -- class KL_SHARED_OPERATING_SYSTEM
