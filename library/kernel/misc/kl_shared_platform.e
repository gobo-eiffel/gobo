indexing

	description:

		"Shared platform-dependent properties"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_PLATFORM

inherit

	KL_ANY

feature -- Access

	Platform: KL_PLATFORM is
			-- Platform-dependent properties
		once
			create Result
		ensure
			platform_not_void: Result /= Void
		end

feature -- Obsolete

	platform_: KL_PLATFORM is
			-- Platform-dependent properties
		obsolete
			"[040101] Use `Platform' instead."
		once
			Result := Platform
		ensure
			platform_not_void: Result /= Void
		end

end
