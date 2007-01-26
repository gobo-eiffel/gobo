indexing

	description:

		"Time durations"

	remark: "Do not take leap seconds into account"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TIME_DURATION

inherit

	DT_DURATION
		rename
			absolute_time as time
		undefine
			out
		redefine
			is_equal, time
		end

	DT_TIME_VALUE
		undefine
			is_equal
		end

	DT_GREGORIAN_CALENDAR
		undefine
			out, is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			out, is_equal
		end

create

	make, make_precise, make_canonical, make_precise_canonical

feature {NONE} -- Initialization

	make (h, m, s: INTEGER) is
			-- Create a new time duration.
		do
			hour := h
			minute := m
			second := s
			millisecond := 0
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s
			millisecond_set: millisecond = 0
		end

	make_precise (h, m, s, ms: INTEGER) is
			-- Create a new time duration with millisecond precision.
		do
			hour := h
			minute := m
			second := s
			millisecond := ms
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s
			millisecond_set: millisecond = ms
		end

	make_canonical (s: INTEGER) is
			-- Create a canonical time duration.
		local
			fs: INTEGER
		do
			if s < 0 then
				fs := -s
				second := -(fs \\ Seconds_in_minute)
				fs := fs // Seconds_in_minute
				minute := -(fs \\ Minutes_in_hour)
				hour := -(fs // Minutes_in_hour)
			else
				second := s \\ Seconds_in_minute
				fs := s // Seconds_in_minute
				minute := fs \\ Minutes_in_hour
				hour := fs // Minutes_in_hour
			end
			millisecond := 0
		ensure
			is_canonical: is_canonical
			second_count_set: second_count = s
			millisecond_set: millisecond = 0
		end

	make_precise_canonical (ms: INTEGER) is
			-- Create a canonical time duration
			-- with millisecond precision.
		local
			fs: INTEGER
		do
			if ms < 0 then
				fs := -ms
				millisecond := -(fs \\ 1000)
				fs := fs // 1000
				second := -(fs \\ Seconds_in_minute)
				fs := fs // Seconds_in_minute
				minute := -(fs \\ Minutes_in_hour)
				hour := -(fs // Minutes_in_hour)
			else
				millisecond := ms \\ 1000
				fs := ms // 1000
				second := fs \\ Seconds_in_minute
				fs := fs // Seconds_in_minute
				minute := fs \\ Minutes_in_hour
				hour := fs // Minutes_in_hour
			end
		ensure
			is_canonical: is_canonical
			millisecond_count_set: millisecond_count = ms
		end

feature -- Status report

	is_canonical: BOOLEAN is
			-- Has current duration a canonical form?
		do
			if millisecond_count > 0 then
				Result := (hour >= 0 and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000)
			else
				Result := (hour <= 0 and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000)
			end
		ensure
			positive_definition: Result implies
				(millisecond_count >= 0 implies (hour >= 0 and
					minute >= 0 and minute < Minutes_in_hour and
					second >= 0 and second < Seconds_in_minute and
					millisecond >= 0 and millisecond < 1000))
			negative_definition: Result implies
				(millisecond_count <= 0 implies (hour <= 0 and
					minute <= 0 and minute > -Minutes_in_hour and
					second <= 0 and second > -Seconds_in_minute and
					millisecond <= 0 and millisecond > -1000))
		end

feature -- Access

	hour: INTEGER
			-- Hour part

	minute: INTEGER
			-- Minute part

	second: INTEGER
			-- Second part

	millisecond: INTEGER
			-- Millisecond part

	second_count: INTEGER is
			-- Total number of seconds
		do
			Result := (hour * Minutes_in_hour + minute) * Seconds_in_minute + second
			if millisecond >= 0 then
				Result := Result + millisecond // 1000
			else
				Result := Result - ((-millisecond) // 1000)
			end
		ensure
			definition: Result = ((hour * Minutes_in_hour + minute) *
				Seconds_in_minute + second + INTEGER_.div (millisecond, 1000))
		end

	millisecond_count: INTEGER is
			-- Total number of milliseconds
		do
			Result := ((hour * Minutes_in_hour + minute) *
				Seconds_in_minute + second) * 1000 + millisecond
		ensure
			definition: Result = (((hour * Minutes_in_hour + minute) *
				Seconds_in_minute + second) * 1000 + millisecond)
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := millisecond_count
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	time (a_time: DT_TIME): DT_TIME is
			-- Addition of current duration to `a_time'
			-- (Create a new object at each call.)
		do
			Result := a_time + Current
		end

feature -- Status setting

	set_canonical is
			-- Set time duration to be canonical.
		do
			make_precise_canonical (millisecond_count)
		ensure
			is_canonical: is_canonical
			same_duration: is_equal (old cloned_object)
		end

feature -- Setting

	set_hour_minute_second (h, m, s: INTEGER) is
			-- Set `hour' to `h', `minute' to `m' and `second' to `s'.
		do
			hour := h
			minute := m
			second := s
			millisecond := 0
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s
			millisecond_set: millisecond = 0
		end

	set_precise_hour_minute_second (h, m, s, ms: INTEGER) is
			-- Set `hour' to `h', `minute' to `m',
			-- `second' to `s' and `millisecond' to `ms'.
		do
			hour := h
			minute := m
			second := s
			millisecond := ms
		ensure
			hour_set: hour = h
			minute_set: minute = m
			second_set: second = s
			millisecond_set: millisecond = ms
		end

	set_hour (h: INTEGER) is
			-- Set `hour' to `h'.
		do
			hour := h
		ensure
			hour_set: hour = h
			same_minute: minute = old minute
			same_second: second = old second
			same_millisecond: millisecond = old millisecond
		end

	set_minute (m: INTEGER) is
			-- Set `minute' to `m'.
		do
			minute := m
		ensure
			minute_set: minute = m
			same_hour: hour = old hour
			same_second: second = old second
			same_millisecond: millisecond = old millisecond
		end

	set_second (s: INTEGER) is
			-- Set `second' to `s'.
		do
			second := s
		ensure
			second_set: second = s
			same_hour: hour = old hour
			same_minute: minute = old minute
			same_millisecond: millisecond = old millisecond
		end

	set_millisecond (ms: INTEGER) is
			-- Set `millisecond' to `ms'.
		do
			millisecond := ms
		ensure
			same_hour: hour = old hour
			same_minute: minute = old minute
			same_second: second = old second
			millisecond_set: millisecond = ms
		end

feature -- Element change

	add_hours_minutes_seconds (h, m, s: INTEGER) is
			-- Add `h' hours, `m' minutes and `s' seconds
			-- to current duration.
		do
			hour := hour + h
			minute := minute + m
			second := second + s
		ensure
			hour_added: hour = old hour + h
			minute_added: minute = old minute + m
			second_added: second = old second + s
		end

	add_precise_hours_minutes_seconds (h, m, s, ms: INTEGER) is
			-- Add `h' hours, `m' minutes, `s' seconds and
			-- `ms' milliseconds to current duration.
		do
			hour := hour + h
			minute := minute + m
			second := second + s
			millisecond := millisecond + ms
		ensure
			hour_added: hour = old hour + h
			minute_added: minute = old minute + m
			second_added: second = old second + s
			millisecond_added: millisecond = old millisecond + ms
		end

	add_hours (h: INTEGER) is
			-- Add `h' hours to current duration.
		do
			hour := hour + h
		ensure
			hour_added: hour = old hour + h
		end

	add_minutes (m: INTEGER) is
			-- Add `m' minutes to current duration.
		do
			minute := minute + m
		ensure
			minute_added: minute = old minute + m
		end

	add_seconds (s: INTEGER) is
			-- Add `s' seconds to current duration.
		do
			second := second + s
		ensure
			second_added: second = old second + s
		end

	add_milliseconds (ms: INTEGER) is
			-- Add `ms' milliseconds to current duration.
		do
			millisecond := millisecond + ms
		ensure
			millisecond_added: millisecond = old millisecond + ms
		end

feature -- Basic operations

	infix "+" (other: like Current): like Current is
			-- Sum of current duration with `other'
		do
			Result := cloned_object
			Result.add_precise_hours_minutes_seconds (other.hour, other.minute,
				other.second, other.millisecond)
		end

	infix "-" (other: like Current): like Current is
			-- Difference with `other'
		do
			Result := cloned_object
			Result.add_precise_hours_minutes_seconds (-other.hour, -other.minute,
				-other.second, -other.millisecond)
		end

	prefix "-": like Current is
			-- Unary minus
		do
			Result := cloned_object
			Result.set_precise_hour_minute_second (-hour, -minute, -second, -millisecond)
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current time duration less than `other'?
		do
			Result := millisecond_count < other.millisecond_count
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is current time duration equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_time_duration (other)
			end
		end

	same_time_duration (other: DT_TIME_DURATION): BOOLEAN is
			-- Is current time duration equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := millisecond_count = other.millisecond_count
		ensure
			definition: Result = (millisecond_count = other.millisecond_count)
		end

feature -- Conversion

	to_date_time_duration: DT_DATE_TIME_DURATION is
			-- Date time duration equivalent to current time duration
		do
			create Result.make_precise (0, 0, 0, hour, minute, second, millisecond)
		ensure
			date_time_duration_not_void: Result /= Void
			year_set: Result.year = 0
			month_set: Result.month = 0
			day_set: Result.day = 0
			hour_set: Result.hour = hour
			minute_set: Result.minute = minute
			second_set: Result.second = second
			millisecond_set: Result.millisecond = millisecond
		end

	to_canonical: like Current is
			-- Canonical version of current time duration
		do
			create Result.make_precise_canonical (millisecond_count)
		ensure
			canonical_duration_not_void: Result /= Void
				-- TODO: The following assertion has been commented out
				-- because of a bug in SmallEiffel -0.76b1 (implicit
				-- feature renaming in DT_DATE_TIME).
			-- is_canonical: Result.is_canonical
			same_duration: Result.is_equal (Current)
		end

end
