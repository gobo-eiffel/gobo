indexing

	description:

		"EiffelTime DATE_CONSTANTS class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DATE_CONSTANTS

inherit

	DT_GREGORIAN_CALENDAR
		rename
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		end

feature -- Access

	Max_weeks_in_year: INTEGER is 53
				-- Maximun number of weeks in a year 

end
