indexing

	description:

		"Test features of class DT_WEEK_DAY"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_WEEK_DAY

inherit

	TS_TEST_CASE

feature -- Test

	test_make_from_year_month_day_from_sunday is
			-- Test creation feature `make_from_year_month_day' of class DT_WEEK_DAY_FROM_SUNDAY
		local
			a_day: DT_WEEK_DAY_FROM_SUNDAY
		do
			create a_day.make_from_year_month_day (1970, 1, 1)
			assert ("Thursday", a_day.is_thursday)
			create a_day.make_from_year_month_day (2000, 3, 31)
			assert ("Friday", a_day.is_friday)
			create a_day.make_from_year_month_day (1968, 2, 24)
			assert ("Saturday", a_day.is_saturday)
			create a_day.make_from_year_month_day (2004, 12, 12)
			assert ("Sunday1", a_day.is_sunday)
			create a_day.make_from_year_month_day (1970, 1, 4)
			assert ("Sunday2", a_day.is_sunday)
		end
			
	test_make_from_year_month_day_from_monday is
			-- Test creation feature `make_from_year_month_day' of class DT_WEEK_DAY_FROM_MONDAY
		local
			a_day: DT_WEEK_DAY_FROM_MONDAY
		do
			create a_day.make_from_year_month_day (1970, 1, 1)
			assert ("Thursday", a_day.is_thursday)
			create a_day.make_from_year_month_day (2000, 3, 31)
			assert ("Friday", a_day.is_friday)
			create a_day.make_from_year_month_day (1968, 2, 24)
			assert ("Saturday", a_day.is_saturday)
			create a_day.make_from_year_month_day (2004, 12, 12)
			assert ("Sunday1", a_day.is_sunday)
			create a_day.make_from_year_month_day (1970, 1, 4)
			assert ("Sunday2", a_day.is_sunday)
		end

	test_next_day_from_sunday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			create sundays
			assert ("Monday follows Sunday", sundays.sunday.next_day.is_monday)
			assert ("Tuesday follows Monday", sundays.monday.next_day.is_tuesday)
			assert ("Wednesday follows Tuesday", sundays.tuesday.next_day.is_wednesday)
			assert ("Thursday follows Wednesday", sundays.wednesday.next_day.is_thursday)
			assert ("Friday follows Thursday", sundays.thursday.next_day.is_friday)
			assert ("Saturday follows Friday", sundays.friday.next_day.is_saturday)
			assert ("Sunday follows Saturday", sundays.saturday.next_day.is_sunday)
		end

	test_next_day_from_monday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_MONDAY
		do
			create mondays
			assert ("Monday follows Sunday", mondays.sunday.next_day.is_monday)
			assert ("Tuesday follows Monday", mondays.monday.next_day.is_tuesday)
			assert ("Wednesday follows Tuesday", mondays.tuesday.next_day.is_wednesday)
			assert ("Thursday follows Wednesday", mondays.wednesday.next_day.is_thursday)
			assert ("Friday follows Thursday", mondays.thursday.next_day.is_friday)
			assert ("Saturday follows Friday", mondays.friday.next_day.is_saturday)
			assert ("Sunday follows Saturday", mondays.saturday.next_day.is_sunday)
		end

	test_previous_day_from_sunday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			create sundays
			assert ("Monday precedes Sunday", sundays.monday.previous_day.is_sunday)
			assert ("Tuesday precedes Monday", sundays.tuesday.previous_day.is_monday)
			assert ("Wednesday precedes Tuesday", sundays.wednesday.previous_day.is_tuesday)
			assert ("Thursday precedes Wednesday", sundays.thursday.previous_day.is_wednesday)
			assert ("Friday precedes Thursday", sundays.friday.previous_day.is_thursday)
			assert ("Saturday precedes Friday", sundays.saturday.previous_day.is_friday)
			assert ("Sunday precedes Saturday", sundays.sunday.previous_day.is_saturday)
		end

	test_previous_day_from_monday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_MONDAY
		do
			create mondays
			assert ("Monday precedes Sunday", mondays.monday.previous_day.is_sunday)
			assert ("Tuesday precedes Monday", mondays.tuesday.previous_day.is_monday)
			assert ("Wednesday precedes Tuesday", mondays.wednesday.previous_day.is_tuesday)
			assert ("Thursday precedes Wednesday", mondays.thursday.previous_day.is_wednesday)
			assert ("Friday precedes Thursday", mondays.friday.previous_day.is_thursday)
			assert ("Saturday precedes Friday", mondays.saturday.previous_day.is_friday)
			assert ("Sunday precedes Saturday", mondays.sunday.previous_day.is_saturday)
		end

	test_as_week_day_from_monday_from_sunday is
			-- Test feature `as_week_day_from_monday' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			create sundays
			create mondays
			assert ("Mondays", sundays.monday.as_week_day_from_monday.is_monday)
		end

	test_as_week_day_from_sunday_from_monday is
			-- Test feature `as_week_day_from_sunday' of class DT_WEEK_DAY_FROM_MONDAY
		do
			create sundays
			create mondays
			assert ("Mondays", mondays.monday.as_week_day_from_sunday.is_monday)
		end

feature -- Shared objects

	sundays: DT_SHARED_WEEK_DAYS_FROM_SUNDAY
			-- Shared days based on a Sunday-first week

	mondays: DT_SHARED_WEEK_DAYS_FROM_MONDAY
			-- Shared days based on a Monday-first week
	
end
