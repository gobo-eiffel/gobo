indexing

	description:

		"Days of the week which starts on Monday"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_WEEK_DAY_FROM_MONDAY

inherit

	DT_WEEK_DAY

	DT_SHARED_WEEK_DAYS_FROM_MONDAY

creation

	make_monday, make_tuesday, make_wednesday, make_thursday,
	make_friday, make_saturday, make_sunday, make, make_from_date, make_from_year_month_day

feature {NONE} -- Initialization

	make_from_date (a_date: DT_DATE) is
			-- Create a day for `a_date'.
		local
			dd, a_code: INTEGER
		do
				-- 1 January 1970 is a Thursday.
			dd := a_date.day_count + 3 -- (thursday - monday = 3)
			if dd < 0 then
				a_code := sunday_code - (-(dd + 1) \\ Days_in_week)
			else
				a_code := monday_code + dd \\ Days_in_week
			end
			make (a_code)
		end

feature -- Access

	next_day: like Current is
			-- Week day after `Current' day
		do
			if is_sunday then
				Result := monday
			else
				Result := shared_day_from_code (code + 1)
			end
		end

	previous_day: like Current is
			-- Week day before `Current' day
		do
			if is_monday then
				Result := sunday
			else
				Result := shared_day_from_code (code - 1)
			end
		end

	monday_code: INTEGER is 1
			-- Code for Monday

	tuesday_code: INTEGER is 2
			-- Code for Tuesday

	wednesday_code: INTEGER is 3
			-- Code for Wednesday

	thursday_code: INTEGER is 4
			-- Code for Thursday

	friday_code: INTEGER is 5
			-- Code for Friday

	saturday_code: INTEGER is 6
			-- Code for Saturday

	sunday_code: INTEGER is 7
			-- Code for Sunday

	shared_day_from_code (a_code: INTEGER): like Current is
			-- Shared object corresponding to `a_code'
		do
			inspect
				a_code
			when monday_code then
				Result := monday
			when tuesday_code then
				Result := tuesday
			when wednesday_code then
				Result := wednesday
			when thursday_code then
				Result := thursday
			when friday_code then
				Result := friday
			when saturday_code then
				Result := saturday
			when sunday_code then
				Result := sunday
			end
		end

feature -- Conversion

	as_week_day_from_sunday: DT_WEEK_DAY_FROM_SUNDAY is
			-- Version of `Current' day in a week that starts on Sunday
		do
			if is_monday then
				create Result.make_monday
			else
				create Result.make (code - 1)
			end
		end

	as_week_day_from_monday: DT_WEEK_DAY_FROM_MONDAY is
			-- Version of `Current' day in a week that starts on monday
		do
			Result := Current
		end

invariant

	first_day: monday_code = 1

end
	
