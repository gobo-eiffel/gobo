note

	description:

		"Objects that pair a date-time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_ZONED_DATE_TIME

inherit

	DT_ZONED
		redefine
			is_equal
		end

	HASHABLE
		redefine
			is_equal
		end

	KL_COMPARABLE
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

	make (a_date_time: like date_time; a_time_zone: like time_zone) is
			-- Create a new date-time `a_date_time' in time zone `a_time_zone'.
		require
			date_time_not_void: a_date_time /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			date_time := a_date_time
			time_zone := a_time_zone
		ensure
			date_time_set: date_time = a_date_time
			time_zone_set: time_zone = a_time_zone
		end

feature -- Access

	date_time: DT_DATE_TIME
			-- Date-time within `time_zone'

	hash_code: INTEGER is
			-- Hash code
		do
			Result := date_time.hash_code
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN is
			-- Is `Current' before `other' on the time axis?
		do
			Result := date_time_to_utc < other.date_time_to_utc
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `Current' date-time equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_date_time (other)
			end
		end

	same_date_time (other: DT_ZONED_DATE_TIME): BOOLEAN is
			-- Is `Current' date-time equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := date_time_to_utc.same_date_time (other.date_time_to_utc)
		end

feature -- Conversion

	date_time_to_utc: DT_DATE_TIME is
			-- Convert `date_time' into the same date-time but relative to UTC.
			-- (Create a new date-time object at each call.)
		do
			Result := time_zone.date_time_to_utc (date_time)
		ensure
			date_time_not_void: Result /= Void
		end

invariant

	date_time_not_void: date_time /= Void

end
