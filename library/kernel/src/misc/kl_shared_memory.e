note

	description:

		"Shared garbage collection facilities"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

class KL_SHARED_MEMORY

feature -- Access

	memory: KL_MEMORY
			-- Garbage collection facilities
		once
			create Result
		ensure
			instance_free: class
			memory_not_void: Result /= Void
		end

end
