indexing

	description:

		"Shared execution environment facilities"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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
