indexing

	description:

		"Shared platform-dependent properties"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_PLATFORM

feature -- Access

	Platform: KL_PLATFORM is
			-- Platform-dependent properties
		once
			!! Result
		ensure
			platform_not_void: Result /= Void
		end

feature -- Obsolete

	platform_: KL_PLATFORM is
			-- Platform-dependent properties
		obsolete
			"Use `Platform' instead."
		once
			Result := Platform
		ensure
			platform__not_void: Result /= Void
		end

end -- class KL_SHARED_PLATFORM
