indexing

	description:

		"EiffelTime TIME_DURATION class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TIME_DURATION

inherit

	DURATION
		rename
			absolute_time as time
		undefine
			is_equal, out, time
		end

	TIME_VALUE
		undefine
			is_equal
		end

	DT_TIME_DURATION
		rename
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		redefine
			time
		end

create

	make, make_fine, make_by_seconds, make_by_fine_seconds,
	make_precise, make_canonical, make_precise_canonical

feature {NONE} -- Initialization

	make_fine (h, m: INTEGER; s: DOUBLE) is
			-- Set `hour, `minute' and `second' to `h', `m' and truncated to integer part of `s' respectively.
			-- Set `fractionnal_second' to the fractionnal part of `s'.
		do
			make_precise (h, m, s.truncated_to_integer,
				((s - second) * 1000).truncated_to_integer)
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s.truncated_to_integer
			millisecond_set: milli_second = ((s - second) * 1000).truncated_to_integer
		end

	make_by_seconds (s: INTEGER) is
			-- Set the object by the number of seconds `s'.
		do
			make_canonical (s)
		ensure
			seconds_count_set: seconds_count = s
		end

	make_by_fine_seconds (s: DOUBLE) is
			-- Set the object by the number of seconds `s'.
		do
			make_precise_canonical ((s * 1000).truncated_to_integer)
		ensure
			millisecond_count_set: millisecond_count = (s * 1000).truncated_to_integer
		end

feature -- Access

	zero: TIME_DURATION is
			-- Neutral element for "+" and "-"
		once
			create Result.make (0, 0, 0)
		end

	seconds_count: INTEGER is
			-- Total number of seconds of the current duration
		do
			Result := second_count
		end

	fine_seconds_count: DOUBLE is
			-- Number of seconds and fractionnals of seconds of the current duration
		do
			Result := millisecond_count / 1000
		end

	time (a_time: TIME): TIME is
			-- Addition of current duration to `a_time'
			-- (Create a new object at each call.)
		do
			Result := a_time + Current
		end

feature -- Status report

	canonical: BOOLEAN is
			-- Is duration expressed minimally, i.e.
			--	If duration is positive then
			--		`hour' positive,
			--		`minute' and `second' between 0 and 59,
			--		`fractionnal_second' between 0 and 999?
			--	If duration is negative then
			--		`hour' negative,
			--		`minute' and `second' between -59 and 0,
			--		`fractionnal_second' between -999 and 0?
		do
			Result := is_canonical
		end

feature -- Setting

	set_fine_second (s: DOUBLE) is
			-- Set `fine_second' to `s'.
		do
			set_second (s.truncated_to_integer)
			set_millisecond (((s - second) * 1000).truncated_to_integer)
		ensure
			second_set: second = s.truncated_to_integer
			millisecond_set: milli_second = ((s - second) * 1000).truncated_to_integer
		end

feature -- Element change

	second_add (s: INTEGER) is
			-- Add `s' seconds to the current duration.
		do
			add_seconds (s)
		ensure
			second_set: second = old second + s
		end

	minute_add (m: INTEGER) is
			-- Add `m' minutes to the current duration.
		do
			add_minutes (m)
		ensure
			minute_set: minute = old minute + m
		end

	hour_add (h: INTEGER) is
			-- Add `h' hours to the current duration.
		do
			add_hours (h)
		ensure
			hour_set: hour = old hour + h
		end

end
