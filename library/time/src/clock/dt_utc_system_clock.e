note

	description:

		"UTC system clocks (precision to the millisecond)"

	remark: "With SmartEiffel under Windows the millisecond part may be stuck to zero."
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"

class DT_UTC_SYSTEM_CLOCK

inherit

	DT_CLOCK

	DT_GREGORIAN_CALENDAR
		export {NONE} all end

	KL_SYSTEM_CLOCK
		export {NONE} all end

create

	make

feature -- Setting

	set_time_to_now (a_time: DT_TIME)
			-- Set `a_time' to current UTC time.
		do
			set_utc_time
			if second >= Seconds_in_minute then
				second := Seconds_in_minute - 1
			end
			a_time.set_precise_hour_minute_second (hour, minute, second, millisecond)
		end

	set_date_to_now (a_date: DT_DATE)
			-- Set `a_date' to current UTC date.
		do
			set_utc_time
			a_date.set_year_month_day (year, month, day)
		end

	set_date_time_to_now (a_date_time: DT_DATE_TIME)
			-- Set `a_date_time' to current UTC date time.
		do
			set_utc_time
			if second >= Seconds_in_minute then
				second := Seconds_in_minute - 1
			end
			a_date_time.set_year_month_day (year, month, day)
			a_date_time.set_precise_hour_minute_second (hour, minute, second, millisecond)
		end

end
