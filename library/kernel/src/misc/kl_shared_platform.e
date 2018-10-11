note

	description:

		"Shared platform-dependent properties"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_PLATFORM

inherit

	KL_ANY

feature -- Access

	Platform: KL_PLATFORM
			-- Platform-dependent properties
		once
			create Result
		ensure
			instance_free: class
			platform_not_void: Result /= Void
		end

end
