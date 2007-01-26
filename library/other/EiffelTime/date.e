indexing

	description:

		"EiffelTime DATE class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DATE

inherit

	ABSOLUTE
		undefine
			out
		end

	DATE_VALUE
		undefine
			append_date_to_string
		end

	DT_DATE
		rename
			duration as relative_duration,
			date_duration as relative_date_duration,
			infix "-" as dt_infix_minus,
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		export
			{ANY} make
		redefine
			relative_duration, relative_date_duration
		end

create

	make, make_by_days, make_from_day_count

create {DATE_TIME}

	make_from_storage

feature {NINE} -- Initialization

	make_by_days (d: INTEGER) is
			-- Set the current date with the number of days `d' since `origin'.
		do
			make (1600, 1, 1)
			add_days (d)
		end

feature -- Access

	origin: DATE is
			-- Origin date
		once
			create Result.make (1600, 1, 1)
		end

	relative_duration (other: like Current): DATE_DURATION is
			-- Duration between `other' and current date
		do
			Result := relative_date_duration (other)
		end

	relative_date_duration (other: like Current): DATE_DURATION is
			-- Duration between `other' and current date
		do
			create Result.make (0, 0, day_count - other.day_count)
		end

	days: INTEGER is
			-- Number of days elapsed since `origin'
		do
			Result := epoch_days (year, month, day) - epoch_days (1600, 1, 1)
		end

	day_of_the_week: INTEGER is
			-- Number of day from the beginning of the week
			-- sunday is 1, etc.., saturday is 7
		do
			Result := day_of_week.as_week_day_from_sunday.code
		ensure
			day_of_the_week_range: Result > 0 and then Result < 8
		end

feature -- Status report

	leap_year: BOOLEAN is
			-- Is the current year a leap year?
		do
			Result := is_leap_year
		end

feature -- Element change

	add (a_duration: like relative_duration) is
			-- Add `a_duration' to current date.
			-- (Add `a_duration.year' and `a_duration.month' first, then
			-- set `day' to `day.min (days_in_month (new_month, new_year))'
			-- and finally add `a_duration.day'.)
		do
			add_date_duration (a_duration)
		end

	day_add (d: INTEGER) is
			-- Add `d' days to the current date.
		do
			add_days (d)
		ensure
			days_set: days = old days + d
		end

	day_forth is
			-- Move to next day.
		do
			add_days (1)
		end

	day_back is
			-- Move to previous day.
		do
			add_days (-1)
		end

	month_add (m: INTEGER) is
			-- add `m' months to the current date.
			-- Can move days backward.
		do
			add_months (m)
		end

	month_forth is
			-- Move to next month.
		do
			add_months (1)
		ensure
			day_adjusted: day = (old day).min (days_in_i_th_month (month, year))
		end

	month_back is
			-- Move to previous month.
		do
			add_months (-1)
		ensure
			day_adjusted: day = (old day).min (days_in_i_th_month (month, year))
		end

	year_add (y: INTEGER) is
			-- Add `y' years to the current date.
			-- May cut the 29th february.
		do
			add_years (y)
		ensure
			year_set: year = old year + y
		end

end
