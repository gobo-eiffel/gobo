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

	DT_SHARED_WEEK_DAYS_FROM_MONDAY
		export {NONE} all end

feature -- Access

	is_week (a_week, a_year: INTEGER): BOOLEAN is
			-- Is `a_week' a valid ISO 8601 week in `a_year'?
			-- Week number 1 contains first Thursday of the year.
			-- Weeks start on Monday, so this is equivalent to
			-- saying January 1st is not a Friday or a Saturday.
		require
			valid_year: a_year /= 0
		local
			a_day: DT_WEEK_DAY
		do
			if a_week >= 1 and a_week <= 52 then
				Result := True
			elseif a_week = 53 then
				a_day := week_days_from_monday.week_day_from_year_month_day (a_year, January, 1)
				Result := not a_day.is_friday and not a_day.is_saturday
			end
		end

end
