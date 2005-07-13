indexing

	description:

		"EiffelTime TIME class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TIME

inherit

	ABSOLUTE
		undefine
			out
		end

	TIME_VALUE
		undefine
			append_time_to_string, append_precise_time_to_string
		end

	DT_TIME
		rename
			duration as relative_duration,
			time_duration as relative_time_duration,
			infix "-" as dt_infix_minus,
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		export
			{ANY} make
		redefine
			relative_duration, relative_time_duration
		end

create

	make, make_fine, make_by_fine_seconds,
	make_precise, make_from_second_count,
	make_from_millisecond_count, make_by_seconds

create {DATE_TIME}

	make_from_storage

feature {NONE} -- Initialization

	make_fine (h, m: INTEGER; s: DOUBLE) is
			-- Create a new time.
		require
			h_large_enough: h >= 0
			h_small_enough: h < Hours_in_day
			m_large_enough: m >= 0
			m_small_enough: m < Minutes_in_hour
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_minute
		local
			new_second: INTEGER
		do
			new_second := s.truncated_to_integer
			make_precise (h, m, new_second,
				((s - new_second) * 1000).truncated_to_integer)
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s.truncated_to_integer
			millisecond_set: milli_second = ((s - s.truncated_to_integer) * 1000).truncated_to_integer
		end

	make_by_seconds (s: INTEGER) is
			-- Set the object by the number of seconds `s' from midnight.
		require
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_day
		do
			make_from_second_count (s)
		ensure
			seconds_set: seconds = s
		end

	make_by_fine_seconds (s: DOUBLE) is
			-- Set the object by the number of seconds `s'.
		require
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_day
		do
			make (0, 0, 0)
			fine_second_add (s)
		end

feature -- Access

	origin: TIME is
			-- Origin time
		once
			create Result.make (0, 0, 0)
		end

	seconds: INTEGER is
			-- Number of seconds elapsed from midnight
		do
			Result := second_count
		ensure
			result_definition: Result = duration.seconds_count
		end

	fine_seconds: DOUBLE is
			-- Number of fine seconds since midnight
		do
			Result := millisecond_count / 1000
		end

	relative_duration (other: like Current): TIME_DURATION is
			-- Duration between `other' and current time
		do
			Result := relative_time_duration (other)
		end

	relative_time_duration (other: like Current): TIME_DURATION is
			-- Duration between `other' and current time
		do
			create Result.make_precise (0, 0, 0, millisecond_count - other.millisecond_count)
		end

feature -- Setting

	set_fine_second (s: DOUBLE) is
			-- Set `fine_second' to `s'.
		require
			s_large_enough: s >= 0
			s_small_enough: s < Seconds_in_minute
		do
			set_second (s.truncated_to_integer)
			set_millisecond (((s - second) * 1000).truncated_to_integer)
		ensure
			second_set: second = s.truncated_to_integer
			millisecond_set: milli_second = ((s - second) * 1000).truncated_to_integer
		end

feature -- Element change

	add (a_duration: like relative_duration) is
			-- Add `a_duration' to current time.
		do
			add_time_duration (a_duration)
		end

	fine_second_add (s: DOUBLE) is
			-- Add `f' seconds to current time.
		do
			if s /= 0.0 then
				add_milliseconds ((s * 1000).truncated_to_integer)
			end
		end

	second_add (s: INTEGER) is
			-- Add `s' seconds to the current time.
		do
			add_seconds (s)
		end

	minute_add (m: INTEGER) is
			-- Add `m' minutes to the current object.
		do
			add_minutes (m)
		end

	hour_add (h: INTEGER) is
			-- Add `h' hours to the current object.
		do
			add_hours (h)
		end

end
