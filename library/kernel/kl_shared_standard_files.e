indexing

	description:

		"Shared standard files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_STANDARD_FILES

feature -- Access

	std: KL_STANDARD_FILES is
			-- Standard files
		once
			!! Result
		ensure
			std_not_void: Result /= Void
		end

end -- class KL_SHARED_STANDARD_FILES
