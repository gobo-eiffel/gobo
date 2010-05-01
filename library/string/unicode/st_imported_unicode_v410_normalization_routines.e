note

	description:

		"Imported normalization routines for Unicode version 4.1.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_V410_NORMALIZATION_ROUTINES

feature -- Access

	normalization_v410: ST_UNICODE_V410_NORMALIZATION_ROUTINES is
			-- Unicode V 4.1.0 normalization routines
		once
			create Result
		ensure
			normalization_v410_not_void: Result /= Void
		end

end
