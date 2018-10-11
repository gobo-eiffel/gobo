note

	description:

		"Shared command-line arguments"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_ARGUMENTS

feature -- Access

	Arguments: KL_ARGUMENTS
			-- Command-line arguments
		once
			create Result.make
		ensure
			instance_free: class
			arguments_not_void: Result /= Void
		end

end
