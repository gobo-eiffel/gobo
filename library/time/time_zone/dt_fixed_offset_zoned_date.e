indexing

	description:

		"Objects that pair a date with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_FIXED_OFFSET_ZONED_DATE

inherit

	DT_ZONED
		redefine
			is_equal, time_zone
		end

	HASHABLE
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

	make (a_date: like date; a_time_zone: like time_zone) is
			-- Create a new date `a_date' in time zone `a_time_zone'.
		require
			date_not_void: a_date /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			date := a_date
			time_zone := a_time_zone
		ensure
			date_set: date = a_date
			time_zone_set: time_zone = a_time_zone
		end

feature -- Access

	date: DT_DATE
			-- Date at midnight in `time_zone'

	time_zone: DT_FIXED_OFFSET_TIME_ZONE
			-- Time zone

	hash_code: INTEGER is
			-- Hash code
		do
			Result := date.hash_code
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is `Current' date equal to `other'?
		do
			if ANY_.same_types (Current, other) then
				Result := same_date (other)
			end
		end

	same_date (other: DT_FIXED_OFFSET_ZONED_DATE): BOOLEAN is
			-- Is `Current' date equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := date_to_utc.same_date (other.date_to_utc)
		end

feature -- Conversion

	date_to_utc: DT_DATE is
			-- Convert `date' into the same date but relative to UTC.
			-- (Create a new date object at each call.)
		do
			tmp_date_time.set_date (date)
			tmp_date_time.set_hour_minute_second (0, 0, 0)
			time_zone.convert_to_utc (tmp_date_time)
			Result := tmp_date_time.date
		ensure
			date_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	tmp_date_time: DT_DATE_TIME is
			-- Temporary date-time used for time zone conversion
		once
			create Result.make (1970, 1, 1, 0, 0, 0)
		ensure
			tmp_date_time_not_void: Result /= Void
		end

invariant

	date_not_void: date /= Void

end
	
