indexing

	description:

		"EiffelTime DATE_TIME_DURATION class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DATE_TIME_DURATION

inherit

	DURATION
		rename
			absolute_time as date_time
		undefine
			out, is_equal, date_time, copy
		end

	DATE_TIME_VALUE
		undefine
			is_equal, copy
		end

	DATE_DURATION
		rename
			date as date_time,
			make as make_date_duration,
			make_definite as make_definite_date_duration,
			to_date_time_duration as date_to_date_time_duration
		undefine
			hash_code, date_time,
			infix "<", is_canonical,
			infix "-", infix "+",
			prefix "-", is_equal,
			out, append_to_string,
			make_canonical_from_dates,
			set_canonical, copy
		redefine
			zero
		end

	TIME_DURATION
		rename
			time as date_time,
			is_canonical as is_time_canonical,
			canonical as time_canonical,
			make as make_time_duration,
			make_fine as make_fine_time,
			make_precise as make_precise_time_duration,
			to_canonical as time_to_canonical,
			set_canonical as set_time_canonical,
			make_canonical as make_canonical_time_duration,
			make_precise_canonical as make_precise_canonical_time_duration,
			to_date_time_duration as time_to_date_time_duration
		undefine
			hash_code, date_time, zero, infix "<",
			append_to_string, append_precise_to_string,
			precise_out, infix "-", infix "+", prefix "-",
			is_equal, out, is_time_canonical,
			time_to_canonical, set_time_canonical,
			copy
		end

	DT_DATE_TIME_DURATION
		rename
			date_duration as date,
			time_duration as time,
			set_date_duration as set_date,
			set_time_duration as set_time,
			to_time_canonical as time_to_canonical,
			Days_in_year as Days_in_non_leap_year,
			leap_year as i_th_leap_year,
			days_in_month as days_in_i_th_month
		undefine
			tmp_date
		redefine
			date, time, date_time,
			tmp_date_time, copy
		end

create

	make, make_fine, make_by_date_time, make_definite,
	make_precise, make_precise_definite,
	make_canonical_definite,
	make_precise_canonical_definite,
	make_from_date_duration,
	make_from_date_time_duration

create {DATE_TIME}

	make_canonical_from_dates

feature {NONE} -- Initialization

	make_fine (y, mo, d, h, mi: INTEGER; s: DOUBLE) is
			-- set `year', `month', `day' to `y', `mo', `d'.
			-- set `hour', `minute', `second' to `h', `mi', `s'.
		local
			s_int: INTEGER
		do
			s_int := s.truncated_to_integer
			make_precise (y, mo, d, h, mi, s_int, ((s - s_int) * 1000).truncated_to_integer)
		ensure
			year_set: year = y
			month_set: month = mo
			day_set: day = d
			hour_set: hour = h
			minute_set: minute = mi
			second_set: second = s.truncated_to_integer
			millisecond_set: millisecond = ((s - second) * 1000).truncated_to_integer
		end

	make_by_date_time (d: DATE_DURATION; t: TIME_DURATION) is
			-- Set `date' to `d' and `time' to `t'.
		require
			d_exists: d /= Void
			t_exists: t /= Void
		do
			make_from_date_time_duration (d, t)
		end

feature -- Access

	date: DATE_DURATION is
			-- Date duration part
		do
			if date_impl /= Void then
				date_impl.set_year_month_day (year, month, day)
			else
				create date_impl.make (year, month, day)
			end
			Result := date_impl
		end

	time: TIME_DURATION is
			-- Time duration part
		do
			if time_impl /= Void then
				time_impl.set_precise_hour_minute_second (hour, minute, second, millisecond)
			else
				create time_impl.make_precise (hour, minute, second, millisecond)
			end
			Result := time_impl
		end

	zero: DATE_TIME_DURATION is
			-- Neutral element for "+" and "-"
		once
			create Result.make (0, 0, 0, 0, 0, 0)
		end

	date_time (a_date_time: DATE_TIME): DATE_TIME is
			-- Addition of current duration to `a_date_time'
			-- (Create a new object at each call.)
		do
			Result := a_date_time + Current
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current duration.
		do
			standard_copy (other)
			date_impl := Void
			time_impl := Void
		end

feature {NONE} -- Implementation

	tmp_date_time: DATE_TIME is
			-- Temporary date time
		once
			create Result.make (1, 1, 1, 0, 0, 0)
		end

	date_impl: DATE_DURATION
			-- Implementation of `date'

	time_impl: TIME_DURATION
			-- Implementation of `time'

end
