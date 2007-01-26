indexing

	description:

		"Shared command-line arguments"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_ARGUMENTS

feature -- Access

	Arguments: KL_ARGUMENTS is
			-- Command-line arguments
		once
			create Result.make
		ensure
			arguments_not_void: Result /= Void
		end

end
