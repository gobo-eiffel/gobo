﻿note

	description:

		"Shared operating system"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"

class KL_SHARED_OPERATING_SYSTEM

feature -- Access

	operating_system: KL_OPERATING_SYSTEM
			-- Underlying operating system
		once
			create Result
		ensure
			instance_free: class
			operating_system_not_void: Result /= Void
		end

end
