indexing

	description:

		"Shared standard files"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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
