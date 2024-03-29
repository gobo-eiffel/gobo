﻿note

	description:

		"Shared exception handling"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

class KL_SHARED_EXCEPTIONS

feature -- Access

	Exceptions: KL_EXCEPTIONS
			-- Exception handling
		once
			create Result
		ensure
			instance_free: class
			exceptions_not_void: Result /= Void
		end

end
