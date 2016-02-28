note

	description:

		"Shared environment variables defined and used in ISE's tools."

	pattern: "Singleton"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_ISE_VARIABLES

feature -- Acess

	ise_variables: ET_ISE_VARIABLES
			-- Environment variables defined and used in ISE's tools
		once
			create Result
		ensure
			ise_variables_not_void: Result /= Void
		end

end
