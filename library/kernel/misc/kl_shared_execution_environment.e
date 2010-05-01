note

	description:

		"Shared execution environment facilities"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_EXECUTION_ENVIRONMENT

feature -- Access

	Execution_environment: KL_EXECUTION_ENVIRONMENT is
			-- Execution environment
		once
			create Result
		ensure
			execution_environment_not_void: Result /= Void
		end

end
