indexing

	description:

		"Objects that pair a date-time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_ZONED_DATE_TIME

inherit

	DT_ZONED
		undefine
			is_equal
		end

	HASHABLE

	COMPARABLE
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_date_time: like date_time; a_time_zone: like time_zone) is
			-- Establish invariant.
		require
			date_time_not_void: a_date_time /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			date_time := a_date_time
			time_zone := a_time_zone
			hash_code := date_time.hash_code 
		ensure
			date_time_set: date_time = a_date_time
			time_zone_set: time_zone = a_time_zone
		end

feature -- Access

	date_time: DT_DATE_TIME
			-- Date-time within `time_zone'

	hash_code: INTEGER
			-- Hash code

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `Current' before `other' on the time axis?
		do
			Result := date_time_to_utc < other.date_time_to_utc
		end

	same_date_time (other: DT_ZONED_DATE_TIME): BOOLEAN is
			-- Is `Current' time equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := date_time_to_utc.same_date_time (other.date_time_to_utc)
		end

feature -- Conversion

	date_time_to_utc: DT_DATE_TIME is
			-- Convert `date_time' into the same date-time in the zone UTC+0.
			-- (Create a new date_time object at each call.)
		do
			Result := time_zone.date_time_to_utc (date_time)
		ensure
			date_time_not_void: Result /= Void
		end

invariant

	date_time_not_void: date_time /= Void

end
	
