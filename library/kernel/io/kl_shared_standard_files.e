indexing

	description:

		"Shared standard files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_STANDARD_FILES

feature -- Access

	std: KL_STANDARD_FILES is
			-- Standard files
		once
			!! Result
		ensure
			std_not_void: Result /= Void
		end

end
