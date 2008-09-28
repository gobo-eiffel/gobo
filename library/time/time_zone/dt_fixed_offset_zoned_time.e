indexing

	description:

		"Objects that pair a time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_FIXED_OFFSET_ZONED_TIME

inherit

	DT_ZONED
		redefine
			time_zone,
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

	COMPARABLE
		redefine
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (a_time: like time; a_time_zone: like time_zone) is
			-- Create a new time `a_time' in time zone `a_time_zone'.
		require
			time_not_void: a_time /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			time := a_time
			time_zone := a_time_zone
		ensure
			time_set: time = a_time
			time_zone_set: time_zone = a_time_zone
		end

feature -- Access

	time: DT_TIME
			-- Time within `time_zone'

	time_zone: DT_FIXED_OFFSET_TIME_ZONE
			-- Time zone

	hash_code: INTEGER is
			-- Hash code
		do
			Result := time.hash_code
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `Current' before `other' on the time axis?
		do
			Result := time_to_utc < other.time_to_utc
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `Current' time equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_time (other)
			end
		end

	same_time (other: DT_FIXED_OFFSET_ZONED_TIME): BOOLEAN is
			-- Is `Current' time equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := time_to_utc.same_time (other.time_to_utc)
		end

feature -- Conversion

	time_to_utc: DT_TIME is
			-- Convert `time' into the same time but relative to UTC.
			-- (Create a new time object at each call.)
		do
			Result := time.cloned_object
			Result.add_milliseconds (-(time_zone.fixed_offset.millisecond_count))
		ensure
			time_not_void: Result /= Void
		end

invariant

	time_not_void: time /= Void

end
