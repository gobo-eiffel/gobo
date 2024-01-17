note

	description:

		"Date/times (Gregorian calendar)"

	note1: "year 0 means 1 BCE, year -1 means 2 BCE, etc."
	note2: "Do not take leap seconds into account"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "MIT License"

class DT_DATE_TIME

inherit

	DT_DATE
		rename
			make as make_date,
			make_from_day_count as make_date_from_day_count,
			make_from_storage as make_from_date_storage,
			storage as date_storage,
			set_storage as set_date_storage
		undefine
			out,
			append_to_string
		redefine
			add_duration,
			duration,
			is_less,
			hash_code
		end

	DT_TIME
		rename
			make as make_time,
			make_precise as make_precise_time,
			make_from_second_count as make_time_from_second_count,
			make_from_millisecond_count as make_time_from_millisecond_count,
			make_from_storage as make_from_time_storage,
			storage as time_storage,
			set_storage as set_time_storage
		undefine
			append_to_string,
			append_precise_to_string,
			is_less,
			hash_code,
			out,
			precise_out,
			canonical_duration
		redefine
			add_hours,
			add_minutes,
			add_seconds,
			add_milliseconds,
			add_duration,
			duration
		end

	DT_DATE_TIME_VALUE
		undefine
			append_date_to_string,
			append_time_to_string,
			append_precise_time_to_string
		end

	DT_DATE_TIME_HANDLER
		undefine
			out
		end

create

	make,
	make_precise,
	make_from_date_time,
	make_from_date,
	make_from_epoch

create {DT_DATE_TIME_HANDLER}

	make_from_storage

feature {NONE} -- Initialization

	make (y, m, d, h, mi, s: INTEGER)
			-- Create a new date time.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
			h_large_enough: h >= 0
			h_small_enough: h < Hours_in_day
			mi_large_enough: mi >= 0
			mi_small_enough: mi < Minutes_in_hour
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_minute
		do
			make_date (y, m, d)
			make_time (h, mi, s)
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = 0
		end

	make_precise (y, m, d, h, mi, s, ms: INTEGER)
			-- Create a new date time with millisecond precision.
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
			h_large_enough: h >= 0
			h_small_enough: h < Hours_in_day
			mi_large_enough: mi >= 0
			mi_small_enough: mi < Minutes_in_hour
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_minute
			ms_large_enough: ms >= 0
			ms_small_enough: ms < 1000
		do
			make_date (y, m, d)
			make_precise_time (h, mi, s, ms)
		ensure
			year_set: year = y
			month_set: month = m
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s
			millisecond_set: millisecond = ms
		end

	make_from_date_time (a_date: DT_DATE; a_time: DT_TIME)
			-- Create a new date time using `a_date' and `a_time'.
		require
			a_date_not_void: a_date /= Void
			a_time_not_void: a_time /= Void
		do
			date_storage := a_date.storage
			time_storage := a_time.storage
		ensure
			year_set: year = a_date.year
			month_set: month = a_date.month
			day_set: day = a_date.day
			hour_set: hour = a_time.hour
			minute_set: minute = a_time.minute
			second_set: second = a_time.second
			millisecond_set: millisecond = a_time.millisecond
		end

	make_from_date (a_date: DT_DATE)
			-- Create a new date time using `a_date'.
		require
			a_date_not_void: a_date /= Void
		do
			date_storage := a_date.storage
			time_storage := 0
		ensure
			year_set: year = a_date.year
			month_set: month = a_date.month
			day_set: day = a_date.day
			hour_set: hour = 0
			minute_set: minute = 0
			second_set: second = 0
			millisecond_set: millisecond = 0
		end

	make_from_epoch (s: INTEGER)
			-- Create a new date time from the number of
			-- seconds since epoch (1 Jan 1970 at 00:00:00).
		local
			d: INTEGER
			ss: INTEGER
		do
			if s < 0 then
				ss := -s
				d := -(ss // Seconds_in_day)
				ss := ss \\ Seconds_in_day
				if ss > 0 then
					ss := Seconds_in_day - ss
					d := d - 1
				end
			else
				d := s // Seconds_in_day
				ss := s \\ Seconds_in_day
			end
			make_date_from_day_count (d)
			make_time_from_second_count (ss)
		end

	make_from_storage (a_date_storage, a_time_storage: INTEGER)
			-- Create a new date time from `a_date_storage'
			-- and `a_time_storage'.
		do
			date_storage := a_date_storage
			time_storage := a_time_storage
		ensure
			date_storage_set: date_storage = a_date_storage
			time_storage_set: time_storage = a_time_storage
		end

feature -- Access

	date: DT_DATE
			-- Date part
		do
			create Result.make_from_storage (date_storage)
		ensure then
			year_set: Result.year = year
			month_set: Result.month = month
			day_set: Result.day = day
		end

	time: DT_TIME
			-- Time part
		do
			create Result.make_from_storage (time_storage)
		ensure then
			hour_set: Result.hour = hour
			minute_set: Result.minute = minute
			second_set: Result.second = second
			millisecond_set: Result.millisecond = millisecond
		end

	duration (other: like Current): DT_DATE_TIME_DURATION
			-- Duration between `other' and `Current'
		do
			create Result.make_precise (0, 0, day_count - other.day_count,
				hour - other.hour, minute - other.minute,
				second - other.second, millisecond - other.millisecond)
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := date_storage + time_storage
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

feature -- Element change

	add_duration (a_duration: like duration)
			-- Add `a_duration' to `Current'.
			-- (Add `a_duration.year' and `a_duration.month' first, then
			-- set `day' to `day.min (day_in_month (new_month, new_year))'
			-- and finally add `a_duration.day', `a_duration.hour',
			-- `a_duration.minute', `a_duration.second' and
			-- `a_duration.millisecond'.)
		local
			ms: INTEGER
		do
			add_years_months_days (a_duration.year, a_duration.month, a_duration.day)
			ms := a_duration.millisecond_count
			if ms /= 0 then
				add_milliseconds (ms)
			end
		end

	add_hours (h: INTEGER)
			-- Add `h' hours to `Current'.
		local
			ts: INTEGER_64
			h64: INTEGER_64
		do
			if h /= 0 then
				h64 := h
				ts := time_storage + h64 * Hour_shift
				set_normalized_time_storage (ts)
			end
		end

	add_minutes (m: INTEGER)
			-- Add `m' minutes to `Current'.
		local
			ts: INTEGER_64
			m64: INTEGER_64
		do
			if m /= 0 then
				m64 := m
				ts := time_storage + m64 * Minute_shift
				set_normalized_time_storage (ts)
			end
		end

	add_seconds (s: INTEGER)
			-- Add `s' seconds to `Current'.
		local
			ts: INTEGER_64
			s64: INTEGER_64
		do
			if s /= 0 then
				s64 := s
				ts := time_storage + s64 * Second_shift
				set_normalized_time_storage (ts)
			end
		end

	add_milliseconds (ms: INTEGER)
			-- Add `ms' milliseconds to `Current'.
		local
			ts: INTEGER_64
			ms64: INTEGER_64
		do
			if ms /= 0 then
				ms64 := ms
				ts := time_storage + ms64
				set_normalized_time_storage (ts)
			end
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is `Current' before `other' on the time axis?
		do
			Result := date_storage < other.date_storage or else
				(date_storage = other.date_storage and then
				time_storage < other.time_storage)
		end

	same_date_time (other: DT_DATE_TIME): BOOLEAN
			-- Is `Current' date-time equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := date_storage = other.date_storage and time_storage = other.time_storage
		end

feature {NONE} -- Implementation

	set_normalized_time_storage (ts: INTEGER_64)
			-- Set `time_storage' to `ts', and next normalise it to best
			-- fit `date_storage' and `time_storage'.
		do
			if ts < 0 then
				add_days ((-((-ts) // Day_shift) - 1).to_integer)
				time_storage := (Day_shift - ((-ts) \\ Day_shift)).to_integer
			else
				add_days ((ts // Day_shift).to_integer)
				time_storage := (ts \\ Day_shift).to_integer
			end
		end

end
