indexing

	description:

		"Dates (Gregorian calendar)"

	remark: "year 0 means 1 BCE, year -1 means 2 BCE, etc."
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_DATE

inherit

	DT_ABSOLUTE_TIME
		undefine
			out
		end

	DT_DATE_VALUE
		redefine
			append_date_to_string
		end

	DT_GREGORIAN_CALENDAR
		undefine
			out
		end

	DT_SHARED_WEEK_DAYS_FROM_MONDAY
		export
			{NONE} all
		undefine
			out
		end

	DT_DATE_HANDLER
		undefine
			out
		end

create

	make,
	make_from_day_count

create {DT_DATE_HANDLER}

	make_from_storage

feature {NONE} -- Initialization

	make (y, m, d: INTEGER) is
			-- Create a new date.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
		do
			set_year_month_day (y, m, d)
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
		end

	make_from_day_count (d: INTEGER) is
			-- Create a new date from the number
			-- of days since epoch (1 Jan 1970).
		do
			set_day_count (d)
		ensure
			day_count_set: day_count = d
		end

	make_from_storage (a_storage: INTEGER) is
			-- Create a new date from `a_storage'.
		do
			storage := a_storage
		ensure
			storage_set: storage = a_storage
		end

feature -- Access

	year: INTEGER is
			-- Year
		do
			if storage < 0 then
				Result := -((-storage) // Year_shift)
			else
				Result := storage // Year_shift
			end
		end

	month: INTEGER is
			-- Month
		do
			if storage < 0 then
				Result := Year_shift // Month_shift - (((-storage) \\ Year_shift) // Month_shift)
			else
				Result := (storage \\ Year_shift) // Month_shift
			end
		ensure then
			month_large_enough: Result >= January
			month_small_enough: Result <= December
		end

	day: INTEGER is
			-- Day
		do
			if storage < 0 then
				Result := Month_shift - ((-storage) \\ Month_shift)
			else
				Result := storage \\ Month_shift
			end
		ensure then
			day_large_enough: Result >= 1
			day_small_enough: Result <= days_in_month (month, year)
		end

	year_day: INTEGER is
			-- Day in current year
		do
			Result := days_at_month (month, year) + day
		ensure
			non_leap_year: not is_leap_year implies (Result >= 1 and Result <= Days_in_year)
			leap_year: is_leap_year implies (Result >= 1 and Result <= Days_in_leap_year)
		end

	week: INTEGER is
			-- Week number for `Current' using ISO 8601 specification:
			-- weeks start on Monday and week number 1 contains the
			-- first Thursday of the year. Dates before the first week
			-- of the year have the week number of of last day of
			-- the previous year.
		do
			Result := week_number (year, month, day)
		end

	week_day: INTEGER is
			-- Day of week for `Current'
		obsolete
			"[041224] Use `day_of_week' instead."
		local
			d: INTEGER
		do
				-- 1 January 1970 is a Thursday.
				-- (Thursday - Sunday = 4)
			d := day_count + 4
			if d < 0 then
				Result := Saturday - ((-(d + 1)) \\ Days_in_week)
			else
				Result := Sunday + d \\ Days_in_week
			end
		ensure
			valid_day: Result >= Sunday and Result <= Saturday
		end

	day_of_week: DT_WEEK_DAY is
			-- Day of week for `Current'
		do
			Result := week_days_from_monday.week_day_from_date (Current)
		ensure
			day_of_week_not_void: Result /= Void
		end

	duration (other: like Current): DT_DATE_DURATION is
			-- Duration between `other' and `Current'
		do
			Result := date_duration (other)
		ensure then
			definite_duration: Result.is_definite
		end

	canonical_duration (other: like Current): like duration is
			-- Canonical duration between `other' and `Current'
		require
			other_not_void: other /= Void
		do
			create Result.make_canonical_from_dates (other, Current)
		ensure
			duration_not_void: Result /= Void
			canonical_duration: Result.is_canonical (other)
			definition: (other + Result).is_equal (Current)
		end

	date_duration (other: like Current): DT_DATE_DURATION is
			-- Duration between `other' and `Current'
		require
			other_not_void: other /= Void
		do
			create Result.make_definite (day_count - other.day_count)
		ensure
			date_duration_not_void: Result /= Void
			definite_duration: Result.is_definite
			definition: (other &@ Result).same_date (Current)
		end

	day_count: INTEGER is
			-- Number of days since epoch (1 Jan 1970)
		do
			Result := epoch_days (year, month, day)
		end

	days_in_current_month: INTEGER is
			-- Number of days in `Current''s month
		do
			Result := days_in_month (month, year)
		ensure
			at_least_one: Result >= 1
			max_days_in_month: Result <= Max_days_in_month
		end

	days_in_previous_month: INTEGER is
			-- Number of days in `Current''s previous month
		local
			mm, yy: INTEGER
		do
			mm := month - 1
			yy := year
			if mm <= 0 then
				yy := yy - ((-mm) // Months_in_year) - 1
				mm := December - ((-mm) \\ Months_in_year)
			end
			Result := days_in_month (mm, yy)
		ensure
			at_least_one: Result >= 1
			max_days_in_month: Result <= Max_days_in_month
		end

	plus_date_duration alias "&@" (a_duration: like date_duration): like Current is
			-- Addition of `a_duration' to `Current'
			-- (Create a new object at each call.)
		require
			a_duration_not_void: a_duration /= Void
		do
			Result := cloned_object
			Result.add_date_duration (a_duration)
		ensure
			addition_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := storage
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

feature -- Status report

	is_leap_year: BOOLEAN is
			-- Is `year' a leap year?
		do
			Result := leap_year (year)
		end

feature -- Setting

	set_date (a_date: DT_DATE) is
			-- Set `year', `month' and `day' from `a_date'.
		require
			a_date_not_void: a_date /= Void
		do
			storage := a_date.storage
		ensure
			year_set: year = a_date.year
			month_set: month = a_date.month
			day_set: day = a_date.day
		end

	set_year_month_day (y, m, d: INTEGER) is
			-- Set `year' to `y', `month' to `m' and `day' to `d'.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
		do
			if y < 0 then
				storage := -((-y) * Year_shift + Year_shift - m * Month_shift + Month_shift - d)
			else
				storage := y * Year_shift + m * Month_shift + d
			end
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
		end

	set_year (y: INTEGER) is
			-- Set `year' to `y'.
		require
			leap_year_aware: day <= days_in_month (month, y)
		local
			st: INTEGER
			mm, dd: INTEGER
		do
			if storage < 0 then
				if y < 0 then
					storage := y * Year_shift - ((-storage) \\ Year_shift)
				else
					st := -storage
					mm := Year_shift // Month_shift - ((st \\ Year_shift) // Month_shift)
					dd := Month_shift - (st \\ Month_shift)
					storage := y * Year_shift + mm * Month_shift + dd
				end
			else
				if y < 0 then
					st := storage
					mm := (st \\ Year_shift) // Month_shift
					dd := st \\ Month_shift
					storage := -((-y) * Year_shift + Year_shift - mm * Month_shift + Month_shift - dd)
				else
					storage := y * Year_shift + storage \\ Year_shift
				end
			end
		ensure
			year_set: year = y
			same_month: month = old month
			same_day: day = old day
		end

	set_month (m: INTEGER) is
			-- Set `month' to `m'.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			leap_year_aware: day <= days_in_month (m, year)
		local
			st: INTEGER
		do
			st := storage
			if st < 0 then
				st := -st
				storage := -((st // Year_shift) * Year_shift + Year_shift - m * Month_shift + st \\ Month_shift)
			else
				storage := (st // Year_shift) * Year_shift + m * Month_shift + st \\ Month_shift
			end
		ensure
			month_set: month = m
			same_year: year = old year
			same_day: day = old day
		end

	set_day (d: INTEGER) is
			-- Set `day' to `d'.
		require
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (month, year)
		do
			if storage < 0 then
				storage := -(((-storage) // Month_shift) * Month_shift + Month_shift - d)
			else
				storage := (storage // Month_shift) * Month_shift + d
			end
		ensure
			day_set: day = d
			same_year: year = old year
			same_month: month = old month
		end

	set_day_count (d: INTEGER) is
			-- Set `day_count' to `d'.
		do
			set_from_epoch_days (d)
		ensure
			day_count_set: day_count = d
		end

feature -- Element change

	add_duration (a_duration: like duration) is
			-- Add `a_duration' to `Current'.
			-- (Add `a_duration.year' and `a_duration.month' first, then
			-- set `day' to `day.min (days_in_month (new_month, new_year))'
			-- and finally add `a_duration.day'.)
		do
			add_date_duration (a_duration)
		end

	add_date_duration (a_duration: like date_duration) is
			-- Add `a_duration' to `Current'.
			-- (Add `a_duration.year' and `a_duration.month' first, then
			-- set `day' to `day.min (days_in_month (new_month, new_year))'
			-- and finally add `a_duration.day'.)
		require
			a_duration_not_void: a_duration /= Void
		do
			add_years_months_days (a_duration.year, a_duration.month, a_duration.day)
		end

	add_years_months_days (y, m, d: INTEGER) is
			-- Add `y' years, `m' months and `d' days to `Current'.
			-- (Add `y' and `m' first, then set `day' to
			-- `day.min (days_in_month (new_month, new_year))'
			-- and finally add `d'.)
		local
			yy, mm, dd: INTEGER
			dim: INTEGER
			new_day: INTEGER
		do
			if y /= 0 or m /= 0 or d /= 0 then
				yy := year + y
				mm := month
				dd := day
				if m /= 0 then
					mm := mm + m
					if mm <= 0 then
						yy := yy - (-mm) // Months_in_year - 1
						mm := December - (-mm) \\ Months_in_year
					else
						yy := yy + (mm - 1) // Months_in_year
						mm := January + (mm - 1) \\ Months_in_year
					end
				end
				if y /= 0 or m /= 0 then
					dim := days_in_month (mm, yy)
					if dd > dim then
						dd := dim
					end
				end
				new_day := dd + d
				if new_day >= 1 and new_day <= days_in_month (mm, yy) then
					if y = 0 and m = 0 then
						set_day (new_day)
					else
						set_year_month_day (yy, mm, new_day)
					end
				else
					set_from_epoch_days (epoch_days (yy, mm, 1) + dd - 1 + d)
				end
			end
		end

	add_years (y: INTEGER) is
			-- Add `y' years to `Current'.
		local
			yy, mm, dd: INTEGER
			dim: INTEGER
		do
			if y /= 0 then
				yy := year + y
				mm := month
				dd := day
				dim := days_in_month (mm, yy)
				if dd > dim then
					dd := dim
				end
				set_year_month_day (yy, mm, dd)
			end
		ensure
			day_adjusted: day = (old day).min (days_in_month (month, year))
		end

	add_months (m: INTEGER) is
			-- Add `m' months to `Current'.
		local
			yy, mm, dd: INTEGER
			dim: INTEGER
		do
			if m /= 0 then
				yy := year
				mm := month + m
				dd := day
				if mm <= 0 then
					yy := yy - ((-mm) // Months_in_year) - 1
					mm := December - ((-mm) \\ Months_in_year)
				else
					yy := yy + (mm - 1) // Months_in_year
					mm := January + (mm - 1) \\ Months_in_year
				end
				dim := days_in_month (mm, yy)
				if dd > dim then
					dd := dim
				end
				set_year_month_day (yy, mm, dd)
			end
		ensure
			day_adjusted: day = (old day).min (days_in_month (month, year))
		end

	add_days (d: INTEGER) is
			-- Add `d' days to `Current'.
		local
			yy, mm, dd: INTEGER
			new_day: INTEGER
		do
			if d /= 0 then
				yy := year
				mm := month
				dd := day
				new_day := dd + d
				if new_day >= 1 and new_day <= days_in_month (mm, yy) then
					set_day (new_day)
				else
					set_from_epoch_days (epoch_days (yy, mm, dd) + d)
				end
			end
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN is
			-- Is `Current' before `other' on the time axis?
		do
			Result := storage < other.storage
		end

	same_date (other: DT_DATE): BOOLEAN is
			-- Is `Current' date equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := storage = other.storage
		end

feature -- Output

	append_date_to_string (a_string: STRING) is
			-- Append printable representation to `a_string'.
			-- The day and month parts are printing with exactly two digits.
		local
			yy, mm, dd: INTEGER
		do
			yy := year
			mm := month
			dd := day
			INTEGER_.append_decimal_integer (yy, a_string)
			a_string.append_character ('/')
			if mm < 10 then
				a_string.append_character ('0')
			end
			INTEGER_.append_decimal_integer (mm, a_string)
			a_string.append_character ('/')
			if dd < 10 then
				a_string.append_character ('0')
			end
			INTEGER_.append_decimal_integer (dd, a_string)
		end

feature {DT_DATE_HANDLER} -- Implementation

	storage: INTEGER
			-- Compact version of `Current'
			-- (INTEGER should have at least 32 bits.)

	set_storage (a_storage: INTEGER) is
			-- Set `storage' to `a_storage'.
		do
			storage := a_storage
		ensure
			storage_set: storage = a_storage
		end

feature {NONE} -- Implementation

	set_from_epoch_days (d: INTEGER) is
			-- Set `Current' from number of
			-- days `d' since epoch (1 Jan 1970).
		local
			yy, mm, dd: INTEGER
			yy100: INTEGER
			dim: INTEGER
		do
			dd := d - Epoch_to_Y2K_days
			if dd < 0 then
					-- Date before 1 Jan 2000.
				dd := -dd
				yy := (dd // Days_in_400_years) * 400
				dd := dd \\ Days_in_400_years
				yy100 := dd // Days_in_100_years
				if yy100 = 4 then
					yy := yy + 300
					dd := dd - 3 * Days_in_100_years
				else
					yy := yy + yy100 * 100
					dd := dd \\ Days_in_100_years
				end
				yy := yy + (dd // Days_in_4_years) * 4
				dd := dd \\ Days_in_4_years
				if dd > Days_in_3_years then
					yy := yy + 4
					dd := Days_in_4_years - dd
				elseif dd > Days_in_2_years then
					yy := yy + 3
					dd := Days_in_3_years - dd
				elseif dd > Days_in_year then
					yy := yy + 2
					dd := Days_in_2_years - dd
				elseif dd > 0 then
					yy := yy + 1
					dd := Days_in_year - dd
				end
				from
					yy := 2000 - yy
					mm := January
					dd := dd + 1
					dim := days_in_month (mm, yy)
				until
					dd <= dim
				loop
					dd := dd - dim
					mm := mm + 1
					dim := days_in_month (mm, yy)
				end
				set_year_month_day (yy, mm, dd)
			else
					-- Date after 1 Jan 2000.
				yy := (dd // Days_in_400_years) * 400
				dd := dd \\ Days_in_400_years
				yy100 := dd // Days_in_100_years
				if yy100 = 4 then
					yy := yy + 300
					dd := dd - 3 * Days_in_100_years
				else
					yy := yy + yy100 * 100
					dd := dd \\ Days_in_100_years
				end
				yy := yy + (dd // Days_in_4_years) * 4
				dd := dd \\ Days_in_4_years
				if dd >= Days_in_3_leap_years then
					yy := yy + 3
					dd := dd - Days_in_3_leap_years
				elseif dd >= Days_in_2_leap_years then
					yy := yy + 2
					dd := dd - Days_in_2_leap_years
				elseif dd >= Days_in_leap_year then
					yy := yy + 1
					dd := dd - Days_in_leap_year
				end
				from
					yy := yy + 2000
					mm := January
					dd := dd + 1
					dim := days_in_month (mm, yy)
				until
					dd <= dim
				loop
					dd := dd - dim
					mm := mm + 1
					dim := days_in_month (mm, yy)
				end
				set_year_month_day (yy, mm, dd)
			end
		ensure
			date_set: epoch_days (year, month, day) = d
		end

feature {NONE} -- Constants

	Month_shift: INTEGER is 32
			-- 2^5

	Year_shift: INTEGER is 512
			-- 2^9 (= 16*32)

end
