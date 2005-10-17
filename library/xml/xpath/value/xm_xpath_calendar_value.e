indexing

	description:

		"Objects that represent XPath date/time/dateTime values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CALENDAR_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_calendar_value, as_calendar_value
		end

	DT_GREGORIAN_CALENDAR

feature -- Access

	utc_date_time: DT_DATE_TIME is
			-- Date_Time adjusted to UTC
		require
			zoned: zoned
		deferred
		ensure
			result_not_void: Result /= Void
		end

	implicitly_zoned_date_time (a_context: XM_XPATH_CONTEXT): DT_DATE_TIME is
			-- Date_Time adjusted to UTC via implicit time zone
		require
			not_zoned: not zoned
			context_not_void: a_context /= Void
		deferred
		ensure
			result_not_void: Result /= Void
		end

	year: INTEGER is
			-- Year
		require
			not_time_value: not is_time_value
		do
			if is_date_value then
				Result := as_date_value.date.year
			else
				Result := as_date_time_value.date.year
			end
		end

	absolute_year: INTEGER is
			-- Year
		require
			not_time_value: not is_time_value
		do
			if year > 0 then
				Result := year
			else
				Result := 1 - year
			end
		ensure
			strictly_positive_result: Result > 0
		end

	month: INTEGER is
			-- Month
		require
			not_time_value: not is_time_value
		do
			if is_date_value then
				Result := as_date_value.date.month
			else
				Result := as_date_time_value.date.month
			end
		ensure
			result_in_range: Result >= 1 and then Result <= 12
		end

	day_in_month: INTEGER is
			-- Day within month
		require
			not_time_value: not is_time_value
		do
			if is_date_value then
				Result := as_date_value.date.day
			else
				Result := as_date_time_value.date.day
			end
		ensure
			result_in_range: Result >= 1 and then Result <= 31
		end

	day_in_year: INTEGER is
			-- Day within year
		require
			not_time_value: not is_time_value
		do
			if is_date_value then
				Result := as_date_value.date.year_day
			else
				Result := as_date_time_value.date.year_day
			end
		ensure
			result_in_range: Result >= 1 and then Result <= 366
		end
	
	week_day_number: INTEGER is
			-- ISO 8601 day within week;
			-- Monday = 1; Sunday = 7
		require
			not_time_value: not is_time_value
		do
			if is_date_value then
				Result := as_date_value.date.day_of_week.as_week_day_from_monday.code
			else
				Result := as_date_time_value.date.day_of_week.as_week_day_from_monday.code
			end
		ensure
			result_in_range: Result >= 1 and then Result <= 7
		end
	
	week_in_year: INTEGER is
			-- ISO 8601 week within year
		require
			not_time_value: not is_time_value
		do
			Result := week_number (year, month, day_in_month)
		ensure
			result_in_range: Result >= 1 and then Result <= 53
		end
	
	week_in_month: INTEGER is
			-- Week within month
		require
			not_time_value: not is_time_value
		do
			Result := (day_in_month + 6) // 7
		ensure
			result_in_range: Result >= 1 and then Result <= 5
		end

	hour: INTEGER is
			-- Hour within day
		require
			not_date_value: not is_date_value
		do
			if is_time_value then
				Result := as_time_value.time.hour
			else
				Result := as_date_time_value.time.hour
			end
		ensure
			result_in_range: Result >= 0 and then Result <= 23
		end

	half_day_hour: INTEGER is
			-- Hour within half-day
		require
			not_date_value: not is_date_value
		do
			Result := hour
			if Result > 11 then Result := Result - 12 end
		ensure
			result_in_range: Result >= 0 and then Result <= 11
		end

	minutes_in_day: INTEGER is
			-- Minutes within day
		require
			not_date_value: not is_date_value
		do
			Result := hour * 60 + minute
		ensure
			result_in_range: Result >= 0 and then Result <= 1439
		end

	minute: INTEGER is
			-- Minutes within hour
		require
			not_date_value: not is_date_value
		do
			if is_time_value then
				Result := as_time_value.time.minute
			else
				Result := as_date_time_value.time.minute
			end
		ensure
			result_in_range: Result >= 0 and then Result <= 59
		end
	
	second: INTEGER is
			-- Seconds within minute
		require
			not_date_value: not is_date_value
		do
			if is_time_value then
				Result := as_time_value.time.second
			else
				Result := as_date_time_value.time.second
			end
		ensure
			result_in_range: Result >= 0 and then Result <= 59
		end
		
	millisecond: INTEGER is
			-- Milliseconds within second
		require
			not_date_value: not is_date_value
		do
			if is_time_value then
				Result := as_time_value.time.millisecond
			else
				Result := as_date_time_value.time.millisecond
			end
		ensure
			result_in_range: Result >= 0 and then Result <= 999
		end

	time_zone_description: STRING is
			-- Description of time zone in format [+|-]hh:mm
		require
			zoned_value: zoned
		local
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
		do
			if is_time_value then
				a_time_zone := as_time_value.zoned_time.time_zone
			elseif is_date_value then
				a_time_zone := as_date_value.zoned_date.time_zone
			else
				a_time_zone := as_date_time_value.zoned_date_time.time_zone
			end
			Result := a_time_zone.name
			if Result.count = 1 then
				check STRING_.same_string (Result, "Z") end
				Result := "+00:00"
			else
				check Result.count = 9 end
				-- Result begins with UTC
				Result := Result.substring (4, 9)
			end
		ensure
			six_characters: Result /= Void and then Result.count = 6
		end

feature -- Status report

	zoned: BOOLEAN
			-- Is `Current' zoned?

	is_calendar_value: BOOLEAN is
			-- Is `Current' a calendar value?
		do
			Result := True
		end

feature -- Conversion

	as_calendar_value: XM_XPATH_CALENDAR_VALUE is
			-- `Current' seen as a calendar value
		do
			Result := Current
		end

feature -- Basic operations

	plus (a_duration: XM_XPATH_DURATION_VALUE): like Current is
			-- Addition of `a_duration' to `Current'
		require
			duration_not_void: a_duration /= Void
		deferred
		ensure
			result_not_void: Result /= Void
		end

	minus (other: like Current; a_context: XM_XPATH_CONTEXT): XM_XPATH_SECONDS_DURATION_VALUE is
			-- Subtraction of `other' from `Current'
		require
			other_not_void: other /= Void
			context_not_void: not zoned or else not other.zoned implies a_context /= Void
		local
			dt1, dt2: DT_DATE_TIME
		do
			if zoned then
				dt1 := utc_date_time
			else
				dt1 := implicitly_zoned_date_time (a_context)
			end
			if other.zoned then
				dt2 := other.utc_date_time
			else
				dt2 := other.implicitly_zoned_date_time (a_context)
			end
			create Result.make_from_duration (dt1 - dt2)
		ensure
			result_not_void: Result /= Void
		end

end

