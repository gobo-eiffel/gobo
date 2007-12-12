indexing

	description:

		"Time zones with fixed offsets to UTC"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_FIXED_OFFSET_TIME_ZONE

inherit

	DT_TIME_ZONE
		redefine
			offset
		end

	DT_GREGORIAN_CALENDAR

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make, make_hours_minutes, make_hours_minutes_seconds,
	make_named, make_named_hours_minutes, make_named_hours_minutes_seconds

feature {NONE} -- Initialization

	make (an_offset: like fixed_offset) is
			-- Create a new time zone with `an_offset'.
		require
			an_offset_not_void: an_offset /= Void
			an_offset_is_canonical: an_offset.is_canonical
		local
			l_name: STRING
			l_positive: BOOLEAN
			l_hour: INTEGER
			l_minute: INTEGER
			l_second: INTEGER
			l_millisecond: INTEGER
		do
			create l_name.make (16)
			l_positive := (an_offset.millisecond_count >= 0)
			if l_positive then
				l_name.append_string ("UTC+")
				l_hour := an_offset.hour
				l_minute := an_offset.minute
				l_second := an_offset.second
				l_millisecond := an_offset.millisecond
			else
				l_name.append_string ("UTC-")
				l_hour := -an_offset.hour
				l_minute := -an_offset.minute
				l_second := -an_offset.second
				l_millisecond := -an_offset.millisecond
			end
			if l_hour < 10 then
				l_name.append_character ('0')
			end
			INTEGER_.append_decimal_integer (l_hour, l_name)
			l_name.append_character (':')
			if l_minute < 10 then
				l_name.append_character ('0')
			end
			INTEGER_.append_decimal_integer (l_minute, l_name)
			if l_second /= 0 then
				if l_second < 10 then
					l_name.append_character ('0')
				end
				INTEGER_.append_decimal_integer (l_second, l_name)
				if l_millisecond /= 0 then
					l_name.append_character ('.')
					if l_millisecond < 10 then
						l_name.append_character ('0')
						l_name.append_character ('0')
					elseif l_millisecond < 100 then
						l_name.append_character ('0')
					end
					INTEGER_.append_decimal_integer (l_millisecond, l_name)
				end
			elseif l_millisecond /= 0 then
				l_name.append_character (':')
				l_name.append_character ('0')
				l_name.append_character ('0')
				l_name.append_character ('.')
				if l_millisecond < 10 then
					l_name.append_character ('0')
					l_name.append_character ('0')
				elseif l_millisecond < 100 then
					l_name.append_character ('0')
				end
				INTEGER_.append_decimal_integer (l_millisecond, l_name)
			end
			make_named (l_name, an_offset)
		ensure
			fixed_offset_set: fixed_offset = an_offset
		end

	make_hours_minutes (h, m: INTEGER) is
			-- Create a new time zone with offset `h':`m'.
		require
			h_large_enough: h > -Hours_in_day
			h_small_enough: h < Hours_in_day
			m_large_enough_positive: h > 0 implies m >= 0
			m_small_enough_positive: h > 0 implies m < Minutes_in_hour
			m_large_enough_negative: h < 0 implies m > -Minutes_in_hour
			m_small_enough_negative: h < 0 implies m <= 0
			m_large_enough_null: h = 0 implies m > -Minutes_in_hour
			m_small_enough_null: h = 0 implies m < Minutes_in_hour
		do
			make_hours_minutes_seconds (h, m, 0)
		end

	make_hours_minutes_seconds (h, m, s: INTEGER) is
			-- Create a new time zone with offset `h':`m':`s'.
		require
			h_large_enough: h > -Hours_in_day
			h_small_enough: h < Hours_in_day
			m_large_enough_positive: h > 0 implies m >= 0
			m_small_enough_positive: h > 0 implies m < Minutes_in_hour
			m_large_enough_negative: h < 0 implies m > -Minutes_in_hour
			m_small_enough_positive: h < 0 implies m <= 0
			m_large_enough_null: h = 0 implies m > -Minutes_in_hour
			m_small_enough_null: h = 0 implies m < Minutes_in_hour
			s_large_enough_positive: (h > 0 or m > 0) implies s >= 0
			s_small_enough_positive: (h > 0 or m > 0) implies s < Seconds_in_minute
			s_large_enough_negative: (h < 0 or m < 0) implies s > -Seconds_in_minute
			s_small_enough_negative: (h < 0 or m < 0) implies s <= 0
			s_large_enough_null: (h = 0 and m = 0) implies s > -Seconds_in_minute
			s_small_enough_null: (h = 0 and m = 0) implies s < Seconds_in_minute
		local
			l_offset: like fixed_offset
		do
			create l_offset.make (h, m, s)
			make (l_offset)
		end

	make_named (a_name: like name; an_offset: like fixed_offset) is
			-- Create a new time zone with `an_offset' named `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			an_offset_not_void: an_offset /= Void
			an_offset_is_canonical: an_offset.is_canonical
		do
			name := a_name
			fixed_offset := an_offset
		ensure
			name_set: name = a_name
			fixed_offset_set: fixed_offset = an_offset
		end

	make_named_hours_minutes (a_name: like name; h, m: INTEGER) is
			-- Create a new time zone with offset `h':`m'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			h_small_enough: h < Hours_in_day
			m_large_enough_positive: h > 0 implies m >= 0
			m_small_enough_positive: h > 0 implies m < Minutes_in_hour
			m_large_enough_negative: h < 0 implies m > -Minutes_in_hour
			m_small_enough_negative: h < 0 implies m <= 0
			m_large_enough_null: h = 0 implies m > -Minutes_in_hour
			m_small_enough_null: h = 0 implies m < Minutes_in_hour
		do
			make_named_hours_minutes_seconds (a_name, h, m, 0)
		ensure
			name_set: name = a_name
		end

	make_named_hours_minutes_seconds (a_name: like name; h, m, s: INTEGER) is
			-- Create a new time zone with offset `h':`m':`s'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			h_large_enough: h > -Hours_in_day
			h_small_enough: h < Hours_in_day
			m_large_enough_positive: h > 0 implies m >= 0
			m_small_enough_positive: h > 0 implies m < Minutes_in_hour
			m_large_enough_negative: h < 0 implies m > -Minutes_in_hour
			m_small_enough_negative: h < 0 implies m <= 0
			m_large_enough_null: h = 0 implies m > -Minutes_in_hour
			m_small_enough_null: h = 0 implies m < Minutes_in_hour
			s_large_enough_positive: (h > 0 or m > 0) implies s >= 0
			s_small_enough_positive: (h > 0 or m > 0) implies s < Seconds_in_minute
			s_large_enough_negative: (h < 0 or m < 0) implies s > -Seconds_in_minute
			s_small_enough_negative: (h < 0 or m < 0) implies s <= 0
			s_large_enough_null: (h = 0 and m = 0) implies s > -Seconds_in_minute
			s_small_enough_null: (h = 0 and m = 0) implies s < Seconds_in_minute
		local
			l_offset: like fixed_offset
		do
			create l_offset.make (h, m, s)
			make_named (a_name, l_offset)
		end

feature -- Access

	name: STRING
			-- Time zone name

	offset (a_date_time: DT_DATE_TIME): DT_TIME_DURATION is
			-- UTC offset for `a_date_time' in `Current' time zone
		do
			Result := fixed_offset
		end

	fixed_offset: DT_TIME_DURATION
			-- UTC offset

feature -- Conversion

	convert_to_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to `Current'
			-- time zone, into the same time but relative to UTC.
			-- (`a_date_time' will be altered by the call.)
		do
			a_date_time.add_milliseconds (-(fixed_offset.millisecond_count))
		end

	convert_from_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to UTC,
			-- into the same time but relative to `Current' time zone.
			-- (`a_date_time' will be altered by the call.)
		do
			a_date_time.add_time_duration (fixed_offset)
		end

invariant

	fixed_offset_not_void: fixed_offset /= Void
	fixed_offset_is_canonical: fixed_offset.is_canonical

end
