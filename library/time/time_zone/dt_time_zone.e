indexing

	description:

		"Time zones"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TIME_ZONE

inherit

	ANY -- Needed for SE 2.1b1.

feature -- Access

	name: STRING is
			-- Time zone name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	offset (a_date_time: DT_DATE_TIME): DT_TIME_DURATION is
			-- UTC offset for `a_date_time' in `Current' time zone
		require
			a_date_time_not_void: a_date_time /= Void
		do
			Result := a_date_time.canonical_duration (date_time_to_utc (a_date_time)).time_duration
		ensure
			offset_not_void: Result /= Void
			offset_is_canonical: Result.is_canonical
			definition: Result.same_time_duration (a_date_time.canonical_duration (date_time_to_utc (a_date_time)).time_duration)
		end

feature -- Conversion

	date_time_to_utc (a_date_time: DT_DATE_TIME): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to `Current'
			-- time zone, into the same time but relative to UTC.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
		do
			Result := a_date_time.cloned_object
			convert_to_utc (Result)
		ensure
			date_time_not_void: Result /= Void
		end

	date_time_from_utc (a_date_time: DT_DATE_TIME): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to UTC,
			-- into the same time but relative to `Current' time zone.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
		do
			Result := a_date_time.cloned_object
			convert_from_utc (Result)
		ensure
			date_time_not_void: Result /= Void
		end

	date_time_from (a_date_time: DT_DATE_TIME; a_time_zone: DT_TIME_ZONE): DT_DATE_TIME is
			-- Convert `a_date_time', considered to be relative to `a_time_zone',
			-- into the same time but relative to `Current' time zone.
			-- (Create a new date_time object at each call.)
		require
			a_date_time_not_void: a_date_time /= Void
			a_time_zone_not_void: a_time_zone /= Void
		do
			Result := a_date_time.cloned_object
			if a_time_zone /= Current then
				a_time_zone.convert_to_utc (Result)
				convert_from_utc (Result)
			end
		ensure
			date_time_not_void: Result /= Void
		end

	convert_to_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to `Current'
			-- time zone, into the same time but relative to UTC.
			-- (`a_date_time' will be altered by the call.)
		require
			a_date_time_not_void: a_date_time /= Void
		deferred
		end

	convert_from_utc (a_date_time: DT_DATE_TIME) is
			-- Convert `a_date_time', considered to be relative to UTC,
			-- into the same time but relative to `Current' time zone.
			-- (`a_date_time' will be altered by the call.)
		require
			a_date_time_not_void: a_date_time /= Void
		deferred
		end

end
