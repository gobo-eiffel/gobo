note

	description:

		"Shared environment variables defined and used in ISE's tools."

	pattern: "Singleton"
	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2010-2018, Eric Bezault and others"
	license: "MIT License"

class UT_SHARED_ISE_VARIABLES

feature -- Access

	ise_variables: UT_ISE_VARIABLES
			-- Environment variables defined and used in ISE's tools
		once
			create Result
		ensure
			instance_free: class
			ise_variables_not_void: Result /= Void
		end

end
