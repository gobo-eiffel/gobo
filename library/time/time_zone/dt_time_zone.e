indexing

	description:

		"Time zones"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TIME_ZONE

feature -- Access

	name: STRING
			-- Time zone name

	abbreviation: STRING
			-- Time zone abbreviation

	offset: DT_TIME_DURATION
			-- GMT offset

feature -- Conversion

	date_time_to_utc (a_date_time: DT_DATE_TIME): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to current
			-- time zone, into the same time but relative to UTC.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
		do
			Result := clone (a_date_time)
			convert_to_utc (Result)
		ensure
			date_time_not_void: Result /= Void
		end

	date_time_from_utc (a_date_time: DT_DATE_TIME): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to UTC,
			-- into the same time but relative to current time zone.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
		do
			Result := clone (a_date_time)
			convert_from_utc (Result)
		ensure
			date_time_not_void: Result /= Void
		end

	date_time_from (a_date_time: DT_DATE_TIME; a_time_zone: DT_TIME_ZONE): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to `a_time_zone',
			-- into the same time but relative to current time zone.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
			a_time_zone_not_void: a_time_zone /= Void
		do
			Result := clone (a_date_time)
			if a_time_zone /= Current then
				a_time_zone.convert_to_utc (Result)
				convert_from_utc (Result)
			end
		ensure
			date_time_not_void: Result /= Void
		end

	convert_to_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to current
			-- time zone, into the same time but relative to UTC.
			-- (`a_date_time' will be altered by the call.)
		require
			a_date_time_not_void: a_date_time /= Void
		deferred
		end

	convert_from_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to UTC,
			-- into the same time but relative to current time zone.
			-- (`a_date_time' will be altered by the call.)
		require
			a_date_time_not_void: a_date_time /= Void
		deferred
		end

invariant

	name_not_void: name /= Void
	abbreviation_not_void: abbreviation /= Void
	offset_not_void: offset /= Void

end
