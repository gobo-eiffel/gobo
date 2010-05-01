note

	description:

		"Gregorian calendar properties"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_GREGORIAN_CALENDAR

inherit

	KL_GREGORIAN_CALENDAR

	DT_SHARED_WEEK_DAYS_FROM_MONDAY
		export {NONE} all end

feature -- Status report

	valid_week (a_week, a_year: INTEGER): BOOLEAN is
			-- Is `a_week' a valid ISO 8601 week in `a_year'?
			-- Weeks start on Monday and week number 1 contains
			-- the first Thursday of the year.
		local
			a_day: DT_WEEK_DAY
		do
			if a_week >= 1 and a_week <= 52 then
				Result := True
			elseif a_week = 53 then
				a_day := week_days_from_monday.week_day_from_year_month_day (a_year, January, 1)
				if leap_year (a_year) then
					Result := not a_day.is_friday and not a_day.is_saturday
				else
					Result := not a_day.is_friday and not a_day.is_saturday and not a_day.is_sunday
				end
			end
		end

feature -- Access

	week_number (y, m, d: INTEGER): INTEGER is
			-- Week number for date of year `y', month `m' and day `d',
			-- using ISO 8601 specification: weeks start on Monday and
			-- week number 1 contains the first Thursday of the year.
			-- Dates before the first week of the year have the week
			-- number of of last day of the previous year.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
		local
			a_day: DT_WEEK_DAY
			yd: INTEGER
		do
			yd := days_at_month (m, y) + d
			a_day := week_days_from_monday.week_day_from_year_month_day (y, January, 1)
			if a_day.is_monday then
				yd := yd - 1
			elseif a_day.is_wednesday then
				yd := yd + 1
			elseif a_day.is_thursday then
				yd := yd + 2
			elseif a_day.is_friday then
				yd := yd - 4
			elseif a_day.is_saturday then
				yd := yd - 3
			elseif a_day.is_sunday then
				yd := yd - 2
			end
			if yd < 0 then
				Result := week_number (y - 1, December, 31)
			else
				Result := (yd // Days_in_week) + 1
			end
		ensure
			week_number_large_enough: Result >= 1
			week_number_small_enough: Result <= 53
		end

end
