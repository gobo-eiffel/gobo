indexing

	description:

		"Objects that pair a time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_ZONED_TIME

inherit

	DT_ZONED
		undefine
			is_equal
		redefine
			time_zone
		end

	HASHABLE

	COMPARABLE
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_time: like time; a_time_zone: like time_zone) is
			-- Establish invariant.
		require
			time_not_void: a_time /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			time := a_time
			time_zone := a_time_zone
			hash_code := time.hash_code 
		ensure
			time_set: time = a_time
			time_zone_set: time_zone = a_time_zone
		end

feature -- Access

	time: DT_TIME
			-- Time within `time_zone'

	time_zone: DT_FIXED_OFFSET_TIME_ZONE
		-- Time zone
		
	hash_code: INTEGER
			-- Hash code

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `Current' before `other' on the time axis?
		do
			Result := time_to_utc < other.time_to_utc
		end

	same_time (other: DT_ZONED_TIME): BOOLEAN is
			-- Is `Current' time equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := time_to_utc.same_time (other.time_to_utc)
		end

feature -- Conversion

	time_to_utc: DT_TIME is
			-- Convert `time' into the same time in the zone UTC+0.
			-- (Create a new time object at each call.)
		local
			a_date_time: DT_DATE_TIME -- dummy argument
		do
			create a_date_time.make_from_epoch (0)
			Result := clone (time)
			Result.add_milliseconds (-(time_zone.offset (a_date_time).millisecond_count))
		ensure
			time_not_void: Result /= Void
		end

invariant

	time_not_void: time /= Void

end
	
