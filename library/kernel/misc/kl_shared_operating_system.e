note

	description:

		"Shared operating system"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_OPERATING_SYSTEM

feature -- Acess

	operating_system: KL_OPERATING_SYSTEM is
			-- Underlying operating system
		once
			create Result
		ensure
			operating_system_not_void: Result /= Void
		end

end
