indexing

	description:

		"EiffelTime DATE_TIME class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DATE_TIME

inherit

	ABSOLUTE
		undefine
			out, copy, is_equal
		end

	DATE_TIME_VALUE
		undefine
			append_date_to_string,
			append_time_to_string,
			append_precise_time_to_string,
			copy, is_equal
		end

	DATE
		rename
			make_from_storage as make_from_date_storage,
			make_from_day_count as make_date_from_day_count,
			storage as date_storage,
			set_storage as set_date_storage,
			make as make_date
		undefine
			hash_code, add_duration,
			relative_duration,
			append_to_string,
			infix "<", out,
			canonical_duration,
			relative_date_duration,
			copy, is_equal
		redefine
			origin, add
		end

	TIME
		rename
			make_precise as make_precise_time,
			make_from_storage as make_from_time_storage,
			make_fine as make_fine_time,
			make as make_time,
			make_from_second_count as make_time_from_second_count,
			make_from_millisecond_count as make_time_from_millisecond_count,
			storage as time_storage,
			set_storage as set_time_storage
		undefine
			origin, hash_code,
			add, infix "<",
			add_milliseconds,
			add_minutes, add_hours,
			add_duration, add_seconds,
			relative_duration,
			append_to_string,
			append_precise_to_string,
			precise_out, out, out_fine,
			canonical_duration,
			relative_time_duration,
			copy, is_equal
		end

	DT_DATE_TIME
		rename
			duration as relative_duration,
			date_duration as relative_date_duration,
			time_duration as relative_time_duration,
			infix "-" as dt_infix_minus,
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		export
			{ANY} make
		redefine
			relative_duration, date, time,
			relative_date_duration, relative_time_duration,
			copy, is_equal
		end

create

	make, make_fine, make_by_date_time, make_by_date,
	make_precise, make_from_date_time, make_from_date

feature {NONE} -- Initialization

	make_fine (y, mo, d, h, mi: INTEGER; s: DOUBLE) is
			-- Set `year', `month' `day' to `y', `mo', `d'.
			-- Set `hour', `minute', `second' to `h', `m', `s'.
		require
			month_large_enough: mo >= 1
			month_small_enough: mo <= Months_in_year
			day_large_enough: d >= 1
			day_small_enough: d <= days_in_i_th_month (mo, y)
			h_large_enough: h >= 0
			h_small_enough: h < Hours_in_day
			m_large_enough: mi >= 0
			m_small_enough: mi < Minutes_in_hour
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_minute
		local
			new_second: INTEGER
		do
			make_date (y, mo, d)
			new_second := s.truncated_to_integer
			make_precise_time (h, mi, new_second,
				((s - new_second) * 1000).truncated_to_integer)
		ensure
			year_set: year = y
			month_set: month = mo
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s.truncated_to_integer
			millisecond_set: millisecond = ((s - s.truncated_to_integer) * 1000).truncated_to_integer
		end

	make_by_date_time (d: DATE; t: TIME) is
			-- Set `date' to `d' and `time' to `t'.
		require
			d_exists: d /= Void
			t_exists: t /= Void
		do
			make_from_date_time (d, t)
		ensure
			date_set: date.is_equal (d)
			time_set: time.is_equal (t)
		end
 
feature -- Initialization

	make_by_date (d: DATE) is
			-- Set `date' to `d' and `time' to origin of time.
		require
			d_exists: d /= Void
		do
			make_from_date (d)
		ensure
			date_set: date.is_equal (d)
			time_set: time.is_equal (time.origin)
		end

feature -- Access

	origin: DATE_TIME is
			-- Origin date time
		once
			create Result.make (1600, 1, 1, 0, 0, 0)
		end

	date: DATE is
			-- Date part
		do
			if date_impl /= Void then
				date_impl.set_storage (date_storage)
			else
				create date_impl.make_from_storage (date_storage)
			end
			Result := date_impl
		end

	time: TIME is
			-- Time part
		do
			if time_impl /= Void then
				time_impl.set_storage (time_storage)
			else
				create time_impl.make_from_storage (time_storage)
			end
			Result := time_impl
		end

	relative_duration (other: like Current): DATE_TIME_DURATION is
			-- Duration between `other' and current date time
		do
			create Result.make_precise (0, 0, day_count - other.day_count,
				0, 0, 0, millisecond_count - other.millisecond_count)
		end

	definite_duration (other: like Current): DATE_TIME_DURATION is
			-- Duration between `other' and current date time
		require
			other_not_void: other /= Void
		do
			Result := relative_duration (other)
		ensure
			duration_not_void: Result /= Void
		end

	date_duration: DATE_DURATION is
			-- Definite duration between origin of date and current date time
		do
			Result := relative_date_duration (origin)
		end

	time_duration: TIME_DURATION is
			-- Duration elapsed from midnight of current date time
		do
			Result := relative_time_duration (origin)
		end

	relative_date_duration (other: like Current): DATE_DURATION is
			-- Duration between `other' and current date
		do
			create Result.make (0, 0, day_count - other.day_count)
		end

	relative_time_duration (other: like Current): TIME_DURATION is
			-- Duration between `other' and current time
		do
			create Result.make_precise (0, 0, 0, millisecond_count - other.millisecond_count)
		end

feature -- Element change

	add (a_duration: like relative_duration) is
			-- Add `a_duration' to current date time.
			-- (Add `a_duration.year' and `a_duration.month' first, then
			-- set `day' to `day.min (day_in_month (new_month, new_year))'
			-- and finally add `a_duration.day', `a_duration.hour',
			-- `a_duration.minute', `a_duration.second' and 
			-- `a_duration.millisecond'.)
		do
			add_duration (a_duration)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current date time equal to `other'?
		do
			Result := date_storage = other.date_storage and
				time_storage = other.time_storage
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current date time.
		do
			standard_copy (other)
			date_impl := Void
			time_impl := Void
		end

feature {NONE} -- Implementation

	date_impl: DATE
			-- Implementation of `date'

	time_impl: TIME
			-- Implementation of `time'

end
