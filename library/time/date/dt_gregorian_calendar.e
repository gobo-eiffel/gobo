indexing

	description:

		"Gregorian calendar properties"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_GREGORIAN_CALENDAR

inherit

	KL_GREGORIAN_CALENDAR

feature -- Access

	is_week (a_week, a_year: INTEGER): BOOLEAN is
			-- Is `a_week' a valid ISO 8601 week in `a_year'?
			-- Week number 1 contains first Thursday of the year.
			-- Weeks start on Monday, so this is equivalent
			--  to saying January 1st is not a Friday or a Saturday.
		require
			valid_year: a_year /= 0
		local
			a_day: DT_WEEK_DAY_FROM_MONDAY
		do
			Result := a_week > 0 and then a_week < 54
			if Result and then a_week = 53 then
				create a_day.make_from_year_month_day (a_year, January, 1)
				Result := (not a_day.is_friday) and then (not a_day.is_saturday)
			end
		end

end
