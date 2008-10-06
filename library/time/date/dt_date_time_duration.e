indexing

	description:

		"Date/time durations (Gregorian calendar)"

	note1: "year 0 means 1 BCE, year -1 means 2 BCE, etc."
	note2: "Does not take leap seconds into account"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_DATE_TIME_DURATION

inherit

	DT_DATE_DURATION
		rename
			make as make_date_duration,
			make_definite as make_definite_date_duration,
			to_date_time_duration as date_to_date_time_duration,
			date as date_time
		undefine
			out,
			append_to_string,
			is_equal
		redefine
			infix "<",
			infix "+",
			infix "-",
			prefix "-",
			hash_code,
			is_canonical,
			date_time,
			make_canonical_from_dates,
			set_canonical
		end

	DT_TIME_DURATION
		rename
			make as make_time_duration,
			make_precise as make_precise_time_duration,
			make_canonical as make_canonical_time_duration,
			make_precise_canonical as make_precise_canonical_time_duration,
			to_date_time_duration as time_to_date_time_duration,
			is_canonical as is_time_canonical,
			to_canonical as to_time_canonical,
			set_canonical as set_time_canonical,
			time as date_time
		undefine
			infix "<",
			infix "+",
			infix "-",
			prefix "-",
			hash_code,
			out,
			precise_out,
			append_to_string,
			append_precise_to_string,
			is_equal,
			date_time
		redefine
			is_time_canonical,
			set_time_canonical,
			to_time_canonical
		end

	DT_DATE_TIME_VALUE
		rename
			date as date_duration,
			time as time_duration
		redefine
			is_equal
		end

create

	make,
	make_precise,
	make_definite,
	make_precise_definite,
	make_canonical_definite,
	make_precise_canonical_definite,
	make_from_date_duration,
	make_from_date_time_duration

create {DT_DATE, DT_DATE_TIME}

	make_canonical_from_dates

feature {NONE} -- Initialization

	make (y, m, d, h, mi, s: INTEGER) is
			-- Create a new date time duration.
		do
			make_date_duration (y, m, d)
			make_time_duration (h, mi, s)
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = 0
		end

	make_precise (y, m, d, h, mi, s, ms: INTEGER) is
			-- Create a new date time duration with millisecond precision.
		do
			make_date_duration (y, m, d)
			make_precise_time_duration (h, mi, s, ms)
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = ms
		end

	make_definite (d, h, mi, s: INTEGER) is
			-- Create a new definite date time duration.
		do
			make_definite_date_duration (d)
			make_time_duration (h, mi, s)
		ensure
			is_definite: is_definite
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = 0
		end

	make_precise_definite (d, h, mi, s, ms: INTEGER) is
			-- Create a new definite date time duration
			-- with millisecond precision.
		do
			make_definite_date_duration (d)
			make_precise_time_duration (h, mi, s, ms)
		ensure
			is_definite: is_definite
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = ms
		end

	make_canonical_definite (s: INTEGER) is
			-- Create a new definite date time duration
			-- where the time part is canonical and has
			-- the same sign as the day part.
		local
			d, ss: INTEGER
		do
			if s < 0 then
				d := -((-s) // Seconds_in_day)
				ss := -((-s) \\ Seconds_in_day)
			else
				d := s // Seconds_in_day
				ss := s \\ Seconds_in_day
			end
			make_definite_date_duration (d)
			make_canonical_time_duration (ss)
		ensure
			is_definite: is_definite
			canonical_time: time_duration.is_canonical
			second_count_set: s = second_count + day * Seconds_in_day
			millisecond_set: millisecond = 0
		end

	make_precise_canonical_definite (ms: INTEGER) is
			-- Create a new definite date time duration
			-- with millisecond precision, where the time
			-- part is canonical and has the same sign as
			-- the day part.
		local
			d, mms: INTEGER
		do
			if ms < 0 then
				d := -((-ms) // Milliseconds_in_day)
				mms := -((-ms) \\ Milliseconds_in_day)
			else
				d := ms // Milliseconds_in_day
				mms := ms \\ Milliseconds_in_day
			end
			make_definite_date_duration (d)
			make_precise_canonical_time_duration (mms)
		ensure
			is_definite: is_definite
			canonical_time: time_duration.is_canonical
			millisecond_count_set: ms = millisecond_count + day * Milliseconds_in_day
		end

	make_from_date_time_duration (a_date_duration: DT_DATE_DURATION; a_time_duration: DT_TIME_DURATION) is
			-- Create a new date time duration using
			-- `a_date_duration' and `a_time_duration'.
		require
			a_date_duration_not_void: a_date_duration /= Void
			a_time_duration_not_void: a_time_duration /= Void
		do
			year := a_date_duration.year
			month := a_date_duration.month
			day := a_date_duration.day
			hour := a_time_duration.hour
			minute := a_time_duration.minute
			second := a_time_duration.second
			millisecond := a_time_duration.millisecond
		ensure
			year_set: year = a_date_duration.year
			month_set: month = a_date_duration.month
			day_set: day = a_date_duration.day
			hour_set: hour = a_time_duration.hour
			minute_set: minute = a_time_duration.minute
			second_set: second = a_time_duration.second
			millisecond_set: millisecond = a_time_duration.millisecond
		end

	make_from_date_duration (a_date_duration: DT_DATE_DURATION) is
			-- Create a new date time duration using `a_date_duration'.
		require
			a_date_duration_not_void: a_date_duration /= Void
		do
			year := a_date_duration.year
			month := a_date_duration.month
			day := a_date_duration.day
			hour := 0
			minute := 0
			second := 0
			millisecond := 0
		ensure
			year_set: year = a_date_duration.year
			month_set: month = a_date_duration.month
			day_set: day = a_date_duration.day
			hour_set: hour = 0
			minute_set: minute = 0
			second_set: second = 0
			millisecond_set: millisecond = 0
		end

	make_canonical_from_dates (date_from, date_to: like date_time) is
			-- Create a new canonical duration between
			-- `date_from' and `date_to'.
		local
			yy, mm, dd: INTEGER
			tt, h, mi, s, ms: INTEGER
			od, d: INTEGER
			dipm, dicm: INTEGER
		do
			yy := date_to.year - date_from.year
			mm := date_to.month - date_from.month
			d := date_to.day
			od := date_from.day
			dd := d - od
			tt := date_to.millisecond_count - date_from.millisecond_count
			if date_from < date_to then
				if tt < 0 then
					dd := dd - 1
					tt := tt + Milliseconds_in_day
				end
				ms := tt \\ 1000
				tt := tt // 1000
				s := tt \\ Seconds_in_minute
				tt := tt // Seconds_in_minute
				mi := tt \\ Minutes_in_hour
				h := tt // Minutes_in_hour
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
				if tt > 0 then
					dd := dd + 1
					tt := tt - Milliseconds_in_day
				end
				tt := -tt
				ms := -(tt \\ 1000)
				tt := tt // 1000
				s := -(tt \\ Seconds_in_minute)
				tt := tt // Seconds_in_minute
				mi := -(tt \\ Minutes_in_hour)
				h := -(tt // Minutes_in_hour)
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
			make_precise (yy, mm, dd, h, mi, s, ms)
		end

feature -- Status report

	is_canonical (a_date_time: like date_time): BOOLEAN is
			-- Has current duration a canonical form
			-- when to be added to `a_date_time'?
		local
			final_date_time: like date_time
		do
			final_date_time := tmp_date_time
			final_date_time.set_date (a_date_time)
			final_date_time.set_time (a_date_time)
			final_date_time.add_duration (Current)
			if a_date_time <= final_date_time then
				if
					hour >= 0 and hour < Hours_in_day and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000 and
					year >= 0 and
					month >= 0 and month < Months_in_year and
					day >= 0
				then
					if day >= final_date_time.day then
						Result := day < final_date_time.days_in_previous_month
					else
						Result := day < final_date_time.days_in_current_month
					end
				end
			else
				Result := hour <= 0 and hour > -Hours_in_day and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000 and
					year <= 0 and month <= 0 and month > -Months_in_year and
					day <= 0 and day > -final_date_time.days_in_current_month
			end
		ensure then
			positive_definition: Result implies
				((a_date_time <= a_date_time + Current) implies
					(hour >= 0 and hour < Hours_in_day and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000 and
					year >= 0 and month >= 0 and month < Months_in_year and
					day >= 0 and
					((day >= (a_date_time + Current).day implies
						day < (a_date_time + Current).days_in_previous_month) or
				 	(day < (a_date_time + Current).day implies
				 		day < (a_date_time + Current).days_in_current_month))))
			negative_definition: Result implies
				((a_date_time >= a_date_time + Current) implies
					(hour <= 0 and hour > -Hours_in_day and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000 and
					year <= 0 and month <= 0 and month > -Months_in_year and
					day <= 0 and day > -(a_date_time + Current).days_in_current_month))
		end

	is_time_canonical: BOOLEAN is
			-- Has date time duration a canonical time part
			-- and has the time part same sign as the day part?
		do
			if millisecond_count = 0 then
				Result := (hour = 0 and minute = 0 and second = 0 and millisecond = 0)
			elseif millisecond_count > 0 then
				Result := (hour >= 0 and hour < Hours_in_day and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000 and
					day >= 0)
			else
				Result := (hour <= 0 and hour > -Hours_in_day and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000 and
					day <= 0)
			end
		ensure then
			zero_definition: Result implies
				(millisecond_count = 0 implies
					(hour = 0 and minute = 0 and
					second = 0 and millisecond = 0))
			positive_definition: Result implies
				(millisecond_count > 0 implies
					(hour >= 0 and hour < Hours_in_day and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000 and day >= 0))
			negative_definition: Result implies
				(millisecond_count < 0 implies
					(hour <= 0 and hour > -Hours_in_day and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000 and day <= 0))
		end

feature -- Access

	date_duration: DT_DATE_DURATION is
			-- Date duration part
		do
			create Result.make (year, month, day)
		ensure then
			year_set: Result.year = year
			month_set: Result.month = month
			day_set: Result.day = day
		end

	time_duration: DT_TIME_DURATION is
			-- Time duration part
		do
			create Result.make_precise (hour, minute, second, millisecond)
		ensure then
			hour_set: Result.hour = hour
			minute_set: Result.minute = minute
			second_set: Result.second = second
			millisecond_set: Result.millisecond = millisecond
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := day + month * Max_days_in_month + year * Days_in_year + millisecond_count
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	date_time (a_date_time: DT_DATE_TIME): DT_DATE_TIME is
			-- Addition of current duration to `a_date_time'
			-- (Create a new object at each call.)
		do
			Result := a_date_time + Current
		end

feature -- Status setting

	set_canonical (a_date_time: like date_time) is
			-- Set current duration to be canonical
			-- when to be added to `a_date_time'.
		local
			final_date_time: like date_time
		do
			final_date_time := tmp_date_time
			final_date_time.set_date (a_date_time)
			final_date_time.set_time (a_date_time)
			final_date_time.add_duration (Current)
			make_canonical_from_dates (a_date_time, final_date_time)
		end

	set_time_canonical is
			-- Set duration with its time part canonical
			-- and with the same sign as its day part.
		local
			d, ms: INTEGER
			m, y: INTEGER
		do
			y := year
			m := month
			ms := millisecond_count
			if ms < 0 then
				ms := -ms
				d := day - ms // Milliseconds_in_day
				ms := -(ms \\ Milliseconds_in_day)
				if d > 0 and ms /= 0 then
					d := d - 1
					ms := Milliseconds_in_day + ms
				end
			else
				d := day + ms // Milliseconds_in_day
				ms := ms \\ Milliseconds_in_day
				if d < 0 and ms /= 0 then
					d := d + 1
					ms := ms - Milliseconds_in_day
				end
			end
			make_precise_canonical_definite (ms)
			set_year_month_day (y, m, d)
		ensure then
			same_year: year = old year
			same_month: month = old month
		end

feature -- Setting

	set_date_duration (a_date_duration: like date_duration) is
			-- Set date part of current date time duration.
		require
			a_date_duration_not_void: a_date_duration /= Void
		do
			year := a_date_duration.year
			month := a_date_duration.month
			day := a_date_duration.day
		ensure
			year_set: year = a_date_duration.year
			month_set: month = a_date_duration.month
			day_set: day = a_date_duration.day
		end

	set_time_duration (a_time_duration: like time_duration) is
			-- Set time part of current date time duration.
		require
			a_time_duration_not_void: a_time_duration /= Void
		do
			hour := a_time_duration.hour
			minute := a_time_duration.minute
			second := a_time_duration.second
			millisecond := a_time_duration.millisecond
		ensure
			hour_set: hour = a_time_duration.hour
			minute_set: minute = a_time_duration.minute
			second_set: second = a_time_duration.second
			millisecond_set: millisecond = a_time_duration.millisecond
		end

feature -- Basic operations

	infix "+" (other: like Current): like Current is
			-- Sum of current duration with `other'
		do
			Result := cloned_object
			Result.add_years_months_days (other.year, other.month, other.day)
			Result.add_precise_hours_minutes_seconds (other.hour, other.minute, other.second, other.millisecond)
		end

	infix "-" (other: like Current): like Current is
			-- Difference with `other'
		do
			Result := cloned_object
			Result.add_years_months_days (-other.year, -other.month, -other.day)
			Result.add_precise_hours_minutes_seconds (-other.hour, -other.minute, -other.second, -other.millisecond)
		end

	prefix "-": like Current is
			-- Unary minus
		do
			Result := cloned_object
			Result.set_year_month_day (-year, -month, -day)
			Result.set_precise_hour_minute_second (-hour, -minute, -second, -millisecond)
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current date time duration less than `other'?
		local
			m, d, ms: INTEGER
		do
			m := (year - other.year) * Months_in_year + (month - other.month)
			ms := millisecond_count - other.millisecond_count
			if ms < 0 then
				ms := -ms
				d := (day - other.day) - ms // Milliseconds_in_day
				ms := -(ms \\ Milliseconds_in_day)
				if d > 0 and ms /= 0 then
					d := d - 1
					ms := Milliseconds_in_day + ms
				end
			else
				d := (day - other.day) + ms // Milliseconds_in_day
				ms := ms \\ Milliseconds_in_day
				if d < 0 and ms /= 0 then
					d := d + 1
					ms := ms - Milliseconds_in_day
				end
			end
			if m = 0 then
				Result := d < 0 or else (d = 0 and ms < 0)
			elseif m < 0 then
				Result := d < 0 or else (d = 0 and ms <= 0)
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is current date time duration equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_date_time_duration (other)
			end
		end

	same_date_time_duration (other: DT_DATE_TIME_DURATION): BOOLEAN is
			-- Is current date time duration equal to `other'?
		require
			other_not_void: other /= Void
		local
			d, ms: INTEGER
		do
			if (year - other.year) * Months_in_year + (month - other.month) = 0 then
				ms := millisecond_count - other.millisecond_count
				if ms < 0 then
					ms := -ms
					d := (day - other.day) - ms // Milliseconds_in_day
					ms := -(ms \\ Milliseconds_in_day)
				else
					d := (day - other.day) + ms // Milliseconds_in_day
					ms := ms \\ Milliseconds_in_day
				end
				Result := ms = 0 and d = 0
			end
		ensure
				-- Commented out because of possible overflow:
--			definition: Result =
--				(((day * Milliseconds_in_day + millisecond_count) = (other.day * Milliseconds_in_day + other.millisecond_count)) and
--				((year * Months_in_year + month) = (other.year * Months_in_year + other.month)))
		end

feature -- Conversion

	to_time_canonical: like Current is
			-- Version of current duration where the time part
			-- is canonical and has the same sign as the day part
		do
			Result := cloned_object
			Result.set_time_canonical
		ensure then
			same_year: Result.year = year
			same_month: Result.month = month
		end

feature {NONE} -- Implementation

	tmp_date_time: DT_DATE_TIME is
			-- Temporary date time
		once
			create Result.make (1, 1, 1, 0, 0, 0)
		ensure
			tmp_date_time_not_void: Result /= Void
		end

end
