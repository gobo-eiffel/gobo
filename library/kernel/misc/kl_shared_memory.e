note

	description:

		"Shared garbage collection facilities"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_MEMORY

feature -- Access

	memory: KL_MEMORY is
			-- Garbage collection facilities
		once
			create Result
		ensure
			memory_not_void: Result /= Void
		end

end
