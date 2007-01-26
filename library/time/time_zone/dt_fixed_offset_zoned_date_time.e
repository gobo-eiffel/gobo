indexing

	description:

		"Objects that pair a date-time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_FIXED_OFFSET_ZONED_DATE_TIME

inherit

	DT_ZONED_DATE_TIME
		redefine
			time_zone
		end

create

	make, make_from_zoned_date

feature {NONE} -- Initialization

	make_from_zoned_date (a_date: DT_FIXED_OFFSET_ZONED_DATE) is
			-- Create a new date-time from `a_date' at zero time.
		require
			date_not_void: a_date /= Void
		do
			create date_time.make_from_date (a_date.date)
			time_zone := a_date.time_zone
		ensure
			date_set: zoned_date.is_equal (a_date)
			time_zone_set: time_zone = a_date.time_zone
		end

feature -- Access

	time_zone: DT_FIXED_OFFSET_TIME_ZONE
			-- Time zone

	zoned_date: DT_FIXED_OFFSET_ZONED_DATE is
			-- Date with time zone
		do
			create Result.make (date_time.date, time_zone)
		ensure
			result_not_void: Result /= Void
		end

	zoned_time: DT_FIXED_OFFSET_ZONED_TIME is
			-- Time with time zone
		do
			create Result.make (date_time.time, time_zone)
		ensure
			result_not_void: Result /= Void
		end

end
	
