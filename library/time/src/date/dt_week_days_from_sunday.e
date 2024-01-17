note

	description:

		"Shared days of the week which start on Sunday"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

class DT_WEEK_DAYS_FROM_SUNDAY

inherit

	DT_GREGORIAN_CALENDAR

feature -- Access

	monday: DT_WEEK_DAY_FROM_SUNDAY
			-- Monday
		once
			create Result.make_monday
		ensure
			instance_free: class
			monday_not_void: Result /= Void
			is_monday: Result.is_monday
		end

	tuesday: DT_WEEK_DAY_FROM_SUNDAY
			-- Tuesday
		once
			create Result.make_tuesday
		ensure
			instance_free: class
			tuesday_not_void: Result /= Void
			is_tuesday: Result.is_tuesday
		end

	wednesday: DT_WEEK_DAY_FROM_SUNDAY
			-- Wednesday
		once
			create Result.make_wednesday
		ensure
			instance_free: class
			wednesday_not_void: Result /= Void
			is_wednesday: Result.is_wednesday
		end

	thursday: DT_WEEK_DAY_FROM_SUNDAY
			-- Thursday
		once
			create Result.make_thursday
		ensure
			instance_free: class
			thursday_not_void: Result /= Void
			is_thursday: Result.is_thursday
		end

	friday: DT_WEEK_DAY_FROM_SUNDAY
			-- Friday
		once
			create Result.make_friday
		ensure
			instance_free: class
			friday_not_void: Result /= Void
			is_friday: Result.is_friday
		end

	saturday: DT_WEEK_DAY_FROM_SUNDAY
			-- Saturday
		once
			create Result.make_saturday
		ensure
			instance_free: class
			saturday_not_void: Result /= Void
			is_saturday: Result.is_saturday
		end

	sunday: DT_WEEK_DAY_FROM_SUNDAY
			-- Sunday
		once
			create Result.make_sunday
		ensure
			instance_free: class
			sunday_not_void: Result /= Void
			is_sunday: Result.is_sunday
		end

	week_day_from_code (a_code: INTEGER): DT_WEEK_DAY_FROM_SUNDAY
			-- Week day with code `a_code'
		require
			a_code_valid: a_code >= 1 and a_code <= Days_in_week
		do
			inspect a_code
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
		ensure
			instance_free: class
			monday: a_code = monday_code implies Result = monday
			tuesday: a_code = tuesday_code implies Result = tuesday
			wednesday: a_code = wednesday_code implies Result = wednesday
			thursday: a_code = thursday_code implies Result = thursday
			friday: a_code = friday_code implies Result = friday
			saturday: a_code = saturday_code implies Result = saturday
			sunday: a_code = sunday_code implies Result = sunday
		end

	week_day_from_date (a_date: DT_DATE): DT_WEEK_DAY_FROM_SUNDAY
			-- Week day for `a_date'
		require
			a_date_not_void: a_date /= Void
		do
			Result := week_day_from_year_month_day (a_date.year, a_date.month, a_date.day)
		ensure
			instance_free: class
			week_day_not_void: Result /= Void
		end

	week_day_from_year_month_day (a_year, a_month, a_day: INTEGER): DT_WEEK_DAY_FROM_SUNDAY
			-- Week day for `a_day' in `a_month' of `a_year'
		require
			month_large_enough: a_month >= January
			month_small_enough: a_month <= December
			day_large_enough: a_day >= 1
			day_small_enough: a_day <= days_in_month (a_month, a_year)
		local
			dd, a_code: INTEGER
		do
				-- 1 January 1970 is a Thursday.
				-- (thursday_code - sunday_code = 4)
			dd := epoch_days (a_year, a_month, a_day) + 4
			if dd < 0 then
				a_code := saturday_code - ((-(dd + 1)) \\ Days_in_week)
			else
				a_code := sunday_code + dd \\ Days_in_week
			end
			Result := week_day_from_code (a_code)
		ensure
			instance_free: class
			week_day_not_void: Result /= Void
		end

feature -- Codes

	monday_code: INTEGER = 2
			-- Code for Monday

	tuesday_code: INTEGER = 3
			-- Code for Tuesday

	wednesday_code: INTEGER = 4
			-- Code for Wednesday

	thursday_code: INTEGER = 5
			-- Code for Thursday

	friday_code: INTEGER = 6
			-- Code for Friday

	saturday_code: INTEGER = 7
			-- Code for Saturday

	sunday_code: INTEGER = 1
			-- Code for Sunday

end
