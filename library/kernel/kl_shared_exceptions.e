indexing

	description:

		"Shared exception handling"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_EXCEPTIONS

feature -- Access

	Exceptions: KL_EXCEPTIONS is
			-- Exception handling
		once
			!! Result
		ensure
			exceptions_not_void: Result /= Void
		end

feature -- Obsolete

	exceptions_: KL_EXCEPTIONS is
			-- Exception handling
		obsolete
			"Use `Exceptions' instead."
		once
			Result := Exceptions
		ensure
			exceptions__not_void: Result /= Void
		end

end -- class KL_SHARED_EXCEPTIONS
