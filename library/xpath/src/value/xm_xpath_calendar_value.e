note

	description:

		"Objects that represent XPath date/time/dateTime values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_CALENDAR_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_calendar_value, as_calendar_value
		end

	ST_XPATH_CALENDAR_VALUE

feature -- Access

	utc_date_time: DT_DATE_TIME
			-- Date_Time adjusted to UTC
		require
			zoned: zoned
		deferred
		ensure
			result_not_void: Result /= Void
		end

	implicitly_zoned_date_time (a_context: XM_XPATH_CONTEXT): DT_DATE_TIME
			-- Date_Time adjusted to UTC via implicit time zone
		require
			not_zoned: not zoned
			context_not_void: a_context /= Void
		deferred
		ensure
			result_not_void: Result /= Void
		end

feature -- Status report

	is_calendar_value: BOOLEAN
			-- Is `Current' a calendar value?
		do
			Result := True
		end

feature -- Conversion

	as_calendar_value: XM_XPATH_CALENDAR_VALUE
			-- `Current' seen as a calendar value
		do
			Result := Current
		end

feature -- Basic operations

	plus (a_duration: XM_XPATH_DURATION_VALUE): like Current
			-- Addition of `a_duration' to `Current'
		require
			duration_not_void: a_duration /= Void
		deferred
		ensure
			result_not_void: Result /= Void
		end

	minus (other: XM_XPATH_CALENDAR_VALUE; a_context: XM_XPATH_CONTEXT): XM_XPATH_SECONDS_DURATION_VALUE
			-- Subtraction of `other' from `Current'
		require
			other_not_void: other /= Void
			context_not_void: not zoned or else not other.zoned implies a_context /= Void
			valid_other: (is_date_value and other.is_date_value) or
				(is_date_time_value and other.is_date_time_value) or
				(is_time_value and other.is_time_value)

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

