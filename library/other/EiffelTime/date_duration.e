indexing

	description:

		"EiffelTime DATE_DURATION class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DATE_DURATION

inherit

	DURATION
		rename
			absolute_time as date
		undefine
			out, is_equal, date
		end

	DATE_VALUE
		undefine
			is_equal
		end

	DT_DATE_DURATION
		rename
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		redefine
			date, tmp_date
		end

create

	make, make_definite, make_by_days

create {DATE}

	make_canonical_from_dates

feature {NONE} -- Initialization

	make_by_days (d: INTEGER) is
			-- Set `day' to `d'.
			-- The duration is definite
		do
			make_definite (d)
		ensure
			day_set: day = d
			definite_duration: definite
		end

feature -- Status report

	definite: BOOLEAN is
			-- Is the duration is independant of the date
			-- on which it applies? (use of `day' only)?
			-- or not (use of `year', `month' and `day')?
		do
			Result := is_definite
		ensure
			result_definition: Result = ((year = 0) and then (month = 0))
		end

	canonical (a_date: like date): BOOLEAN is
			-- Is duration expressed minimally for adding to `a_date', i.e.
			--	If addition will yield a date after `date', then:
			--		`year' positive,
			--		`month' between 0 and `Months_in_year - 1',
			--		`day' between 0 and (number of days of the month before the yielded) - 1?
			--	If addition will yield a date before `date', then:
			--		`year' negative, 
			--		`month' between `1 - Months_in_year' and 0, 
			--		`day' between (number of days of the month before the yielded) and 0?
		require
			a_date_exist: a_date /= Void
		do
			Result := is_canonical (a_date)
		end

feature -- Access

	zero: DATE_DURATION is 
			-- Neutral element for "+" and "-"
		once
				create Result.make (0, 0, 0)
		end

	date (a_date: DATE): DATE is
			-- Addition of current duration to `a_date'
			-- (Create a new object at each call.)
		do
			Result := a_date + Current
		end

feature -- Element change

	day_add (d: INTEGER) is
			-- Add `d' days to `Current'.
		do
			add_days (d)
		ensure
			day_set: day = old day + d
		end

	month_add (m: INTEGER) is
			-- Add `m' months to `Current'.
		do
			add_months (m)
		ensure
			month_set: month = old month + m
		end

	year_add (y: INTEGER) is
			-- Add `y' years to `Current'.
		do
			add_years (y)
		ensure
			year_set: year = old year + y
		end

feature {NONE} -- Implementation

	tmp_date: DATE is
			-- Temporary date
		once
			create Result.make (1, 1, 1)
		end

end
