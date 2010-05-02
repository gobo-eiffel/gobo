note

	description:

		"Shared exception handling"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_EXCEPTIONS

feature -- Access

	Exceptions: KL_EXCEPTIONS
			-- Exception handling
		once
			create Result
		ensure
			exceptions_not_void: Result /= Void
		end

end
