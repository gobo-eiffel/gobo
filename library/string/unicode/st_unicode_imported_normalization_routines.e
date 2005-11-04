indexing

	description:

		"Imported normalization routines"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_UNICODE_IMPORTED_NORMALIZATION_ROUTINES

feature -- Access

	normalization: ST_UNICODE_NORMALIZATION_ROUTINES is
			-- Unicode character class routines
		once
			create Result
		ensure
			normalization_not_void: Result /= Void
		end

end
