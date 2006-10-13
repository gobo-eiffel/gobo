indexing

	description:

		"Imported normalization routines for Unicode version 5.0.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_V500_NORMALIZATION_ROUTINES

feature -- Access

	normalization_v500: ST_UNICODE_V500_NORMALIZATION_ROUTINES is
			-- Unicode V500 normalization routines
		once
			create Result
		ensure
			normalization_v500_not_void: Result /= Void
		end

end

