indexing

	description:

		"UTC system clocks (precision to the second)"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_UTC_SYSTEM_CLOCK

inherit

	DT_CLOCK

	DT_GREGORIAN_CALENDAR
		export {NONE} all end

	KL_SYSTEM_CLOCK
		export {NONE} all end

creation

	make

feature -- Setting

	set_time_to_now (a_time: DT_TIME) is
			-- Set `a_time' to current UTC time.
		do
			set_utc_time
			if second >= Seconds_in_minute then
				second := Seconds_in_minute - 1
			end
			a_time.set_precise_hour_minute_second (hour, minute, second, 0)
		end

	set_date_to_now (a_date: DT_DATE) is
			-- Set `a_date' to current UTC date.
		do
			set_utc_time
			a_date.set_year_month_day (year, month, day)
		end

	set_date_time_to_now (a_date_time: DT_DATE_TIME) is
			-- Set `a_date_time' to current UTC date time.
		do
			set_utc_time
			if second >= Seconds_in_minute then
				second := Seconds_in_minute - 1
			end
			a_date_time.set_year_month_day (year, month, day)
			a_date_time.set_precise_hour_minute_second (hour, minute, second, 0)
		end

end
