indexing

	description:

		"Objects that pair a date with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_ZONED_DATE

inherit

	DT_ZONED
		undefine
			is_equal
		end

	HASHABLE

creation

	make

feature {NONE} -- Initialization

	make (a_date: like date; a_time_zone: like time_zone) is
			-- Establish invariant.
		require
			date_not_void: a_date /= Void
			time_zone_not_void: a_time_zone /= Void
		do
			date := a_date
			time_zone := a_time_zone
			hash_code := date.hash_code
		ensure
			date_set: date = a_date
			time_zone_set: time_zone = a_time_zone
		end


feature -- Access

	date: DT_DATE
			-- Date at midnight in `time_zone'

	hash_code: INTEGER
			-- Hash code

feature -- Conversion

	date_to_utc: DT_DATE is
			-- Convert `date' into the same date but relative to UTC.
			-- (Create a new date object at each call.)
		local
			a_date_time: DT_DATE_TIME
		do
			create a_date_time.make_from_date (date)
			Result := time_zone.date_time_to_utc (a_date_time).date
		ensure
			date_not_void: Result /= Void
		end

invariant

	date_not_void: date /= Void

end
	
