indexing

	description:

		"Shared platform-dependent properties"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_PLATFORM

feature -- Access

	platform_: KL_PLATFORM is
			-- Platform-dependent properties
		once
			!! Result
		ensure
			platform__not_void: Result /= Void
		end

end -- class KL_SHARED_PLATFORM
