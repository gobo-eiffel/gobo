indexing

	description:

		"Shared exception handling"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_EXCEPTIONS

feature -- Access

	exceptions_: KL_EXCEPTIONS is
			-- Exception handling
		once
			!! Result
		ensure
			exceptions__not_void: Result /= Void
		end

end -- class KL_SHARED_EXCEPTIONS
