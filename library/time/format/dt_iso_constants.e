indexing

	description:

		"Constants used in ISO 8601 parsrers and formatters"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	DT_ISO_CONSTANTS

feature -- Access

	Full_calendar_precision: INTEGER is 0
			-- Calendar dates must not be reduced precision
	
	Specific_month: INTEGER is 1
			-- Calendar dates may be reduced to a specific month

	Specific_year: INTEGER is 2
			-- Calendar dates may be reduced to a specific year

	Specific_century: INTEGER is 3
			-- Calendar dates may be reduced to the century alone


end
