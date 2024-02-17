note

	description:

		"Shared environment variables defined and used in Gobo's tools."

	pattern: "Singleton"
	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class UT_SHARED_GOBO_VARIABLES

feature -- Access

	gobo_variables: UT_GOBO_VARIABLES
			-- Environment variables defined and used in Gobo's tools
		once
			create Result
		ensure
			instance_free: class
			gobo_variables_not_void: Result /= Void
		end

end
