indexing

	description:

		"Shared execution environment facilities"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_EXECUTION_ENVIRONMENT

feature -- Access

	Execution_environment: KL_EXECUTION_ENVIRONMENT is
			-- Execution environment
		once
			!! Result
		ensure
			execution_environment_not_void: Result /= Void
		end

end -- class KL_SHARED_EXECUTION_ENVIRONMENT
