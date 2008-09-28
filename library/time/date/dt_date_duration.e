indexing

	description:

		"Date durations (Gregorian calendar)"

	remark: "year 0 means 1 BCE, year -1 means 2 BCE, etc."
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_DATE_DURATION

inherit

	DT_DURATION
		rename
			absolute_time as date
		undefine
			out
		redefine
			is_equal,
			date
		end

	DT_DATE_VALUE
		undefine
			is_equal
		end

	DT_GREGORIAN_CALENDAR
		undefine
			out,
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			out,
			is_equal
		end

create

	make,
	make_definite

create {DT_DATE}

	make_canonical_from_dates

feature {NONE} -- Initialization

	make (y, m, d: INTEGER) is
			-- Create a new date duration.
		do
			year := y
			month := m
			day := d
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
		end

	make_definite (d: INTEGER) is
			-- Create a new definite date duration.
		do
			year := 0
			month := 0
			day := d
		ensure
			is_definite: is_definite
			day_set: day = d
		end

	make_canonical_from_dates (date_from, date_to: like date) is
			-- Create a new canonical duration between
			-- `date_from' and `date_to'.
		require
			date_from_not_void: date_from /= Void
			date_to_not_void: date_to /= Void
		local
			yy, mm, dd: INTEGER
			od, d: INTEGER
			dipm, dicm: INTEGER
		do
			yy := date_to.year - date_from.year
			mm := date_to.month - date_from.month
			d := date_to.day
			od := date_from.day
			dd := d - od
			if date_from < date_to then
				if dd < 0 then
					mm := mm - 1
					dipm := date_to.days_in_previous_month
					if dipm < od then
						dd := dd + od
					else
						dd := dd + dipm
					end
				end
				if mm < 0 then
					yy := yy - 1
					mm := Months_in_year + mm
				end
			else
				dicm := date_to.days_in_current_month
				if dd > 0 then
					mm := mm + 1
					dd := dd - dicm
				elseif dicm < od then
					dd := dd + od - dicm
				end
				if mm > 0 then
					yy := yy + 1
					mm := mm - Months_in_year
				end
			end
			make (yy, mm, dd)
		ensure
			canonical_duration: is_canonical (date_from)
			definition: (date_from + Current).is_equal (date_to)
		end

feature -- Access

	year: INTEGER
			-- Year part

	month: INTEGER
			-- Month part

	day: INTEGER
			-- Day part

	hash_code: INTEGER is
			-- Hash code
		do
			Result := day + month * Max_days_in_month + year * Days_in_year
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	date (a_date: DT_DATE): DT_DATE is
			-- Addition of current duration to `a_date'
			-- (Create a new object at each call.)
		do
			Result := a_date + Current
		end

feature -- Status report

	is_definite: BOOLEAN is
			-- Is current duration independent of the date
			-- on which it applies (use of `day' only)
			-- or not (use of `year', `month' and `day')?
		do
			Result := (year = 0 and month = 0)
		ensure
			definition: Result = (year = 0 and month = 0)
		end

	is_canonical (a_date: like date): BOOLEAN is
			-- Has current duration a canonical form
			-- when to be added to `a_date'?
		require
			a_date_not_void: a_date /= Void
		local
			final_date: like date
		do
			final_date := tmp_date
			final_date.set_date (a_date)
			final_date.add_duration (Current)
			if a_date <= final_date then
				if year >= 0 and month >= 0 and month < Months_in_year and day >= 0 then
					if day >= final_date.day then
						Result := day < final_date.days_in_previous_month
					else
						Result := day < final_date.days_in_current_month
					end
				end
			else
				Result := year <= 0 and month <= 0 and month > -Months_in_year and
					day <= 0 and day > -final_date.days_in_current_month
			end
		ensure
			positive_definition: Result implies ((a_date <= a_date + Current) implies
				(year >= 0 and month >= 0 and month < Months_in_year and day >= 0 and
				((day >= (a_date + Current).day implies
					day < (a_date + Current).days_in_previous_month) or
				 (day < (a_date + Current).day implies
				 	day < (a_date + Current).days_in_current_month))))
			negative_definition: Result implies ((a_date >= a_date + Current) implies
				(year <= 0 and month <= 0 and month > -Months_in_year and
				day <= 0 and day > -(a_date + Current).days_in_current_month))
		end

feature -- Status setting

	set_definite (a_date: like date) is
			-- Set current duration to be definite
			-- when to be added to `a_date'.
		require
			a_date_not_void: a_date /= Void
		local
			final_date: like tmp_date
		do
			if not is_definite then
				final_date := tmp_date
				final_date.set_date (a_date)
				final_date.add_date_duration (Current)
				make_definite (final_date.day_count - a_date.day_count)
			end
		ensure
			is_definite: is_definite
			same_duration: (a_date + Current).is_equal (a_date + old cloned_object)
		end

	set_canonical (a_date: like date) is
			-- Set current duration to be canonical
			-- when to be added to `a_date'.
		require
			a_date_not_void: a_date /= Void
		local
			final_date: like date
		do
			final_date := tmp_date
			final_date.set_date (a_date)
			final_date.add_duration (Current)
			make_canonical_from_dates (a_date, final_date)
		ensure
			is_canonical: is_canonical (a_date)
			same_duration: (a_date + Current).is_equal (a_date + old cloned_object)
		end

feature -- Setting

	set_year_month_day (y, m, d: INTEGER) is
			-- Set `year' to `y', `month' to `m' and `day' to `d'.
		do
			year := y
			month := m
			day := d
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
		end

	set_year (y: INTEGER) is
			-- Set `year' to `y'.
		do
			year := y
		ensure
			year_set: year = y
			same_month: month = old month
			same_day: day = old day
		end

	set_month (m: INTEGER) is
			-- Set `month' to `m'.
		do
			month := m
		ensure
			month_set: month = m
			same_year: year = old year
			same_day: day = old day
		end

	set_day (d: INTEGER) is
			-- Set `day' to `d'.
		do
			day := d
		ensure
			day_set: day = d
			same_year: year = old year
			same_month: month = old month
		end

feature -- Element change

	add_years_months_days (y, m, d: INTEGER) is
			-- Add `y' years, `m' months and `d' days
			-- to current duration.
		do
			year := year + y
			month := month + m
			day := day + d
		ensure
			years_added: year = old year + y
			months_added: month = old month + m
			days_added: day = old day + d
		end

	add_years (y: INTEGER) is
			-- Add `y' years to current duration.
		do
			year := year + y
		ensure
			years_added: year = old year + y
		end

	add_months (m: INTEGER) is
			-- Add `m' months to current duration.
		do
			month := month + m
		ensure
			months_added: month = old month + m
		end

	add_days (d: INTEGER) is
			-- Add `d' days to current duration.
		do
			day := day + d
		ensure
			days_added: day = old day + d
		end

feature -- Basic operations

	infix "+" (other: like Current): like Current is
			-- Sum of current duration with `other'
		do
			Result := cloned_object
			Result.add_years_months_days (other.year, other.month, other.day)
		end

	infix "-" (other: like Current): like Current is
			-- Difference with `other'
		do
			Result := cloned_object
			Result.add_years_months_days (-other.year, -other.month, -other.day)
		end

	prefix "-": like Current is
			-- Unary minus
		do
			Result := cloned_object
			Result.set_year_month_day (-year, -month, -day)
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current date duration less than `other'?
		local
			m: INTEGER
		do
			m := (year - other.year) * Months_in_year + (month - other.month)
			if m = 0 then
				Result := day < other.day
			elseif m < 0 then
				Result := day <= other.day
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is current date duration equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_date_duration (other)
			end
		end

	same_date_duration (other: DT_DATE_DURATION): BOOLEAN is
			-- Is current date duration equal to `other'?
		require
			other_not_void: other /= Void
		do
			if (year - other.year) * Months_in_year + (month - other.month) = 0 then
				Result := day = other.day
			end
		ensure
			definition: Result = ((day = other.day) and
				((year * Months_in_year + month) =
					(other.year * Months_in_year + other.month)))
		end

feature -- Conversion

	to_date_time_duration: DT_DATE_TIME_DURATION is
			-- Date time duration equivalent to current date duration
		do
			create Result.make (year, month, day, 0, 0, 0)
		ensure
			date_time_duration_not_void: Result /= Void
			year_set: Result.year = year
			month_set: Result.month = month
			day_set: Result.day = day
			hour_set: Result.hour = 0
			minute_set: Result.minute = 0
			second_set: Result.second = 0
			millisecond_set: Result.millisecond = 0
		end

	to_canonical (a_date: like date): like Current is
			-- Canonical version of current duration
			-- when to be added to `a_date'
		require
			a_date_not_void: a_date /= Void
		do
			Result := cloned_object
			Result.set_canonical (a_date)
		ensure
			canonical_duration_not_void: Result /= Void
			is_canonical: Result.is_canonical (a_date)
			same_duration: (a_date + Current).is_equal (a_date + Result)
		end

	to_definite (a_date: like date): like Current is
			-- Definite version of current duration
			-- when to be added to `a_date'
		require
			a_date_not_void: a_date /= Void
		do
			Result := cloned_object
			Result.set_definite (a_date)
		ensure
			definite_duration_not_void: Result /= Void
			is_definite: Result.is_definite
			same_duration: (a_date + Current).is_equal (a_date + Result)
		end

feature {NONE} -- Implementation

	tmp_date: DT_DATE is
			-- Temporary date
		once
			create Result.make (1, 1, 1)
		ensure
			tmp_date_not_void: Result /= Void
		end

end
