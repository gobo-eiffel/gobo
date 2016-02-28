note

	description:

		"Imported routines to handle feature names"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IMPORTED_FEATURE_NAME_ROUTINES

feature -- Access

	feature_name_routines: ET_FEATURE_NAME_ROUTINES
			-- Routines to handle feature names
		once
			create Result
		ensure
			feature_name_routines_not_void: Result /= Void
		end

end
