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

	DT_SHARED_WEEK_DAYS_FROM_MONDAY

	DT_SHARED_WEEK_DAYS_FROM_SUNDAY

feature -- Test

	test_make_from_year_month_day_from_sunday is
			-- Test creation feature `make_from_year_month_day' of class DT_WEEK_DAY_FROM_SUNDAY
		local
			a_day: DT_WEEK_DAY_FROM_SUNDAY
		do
			a_day := week_days_from_sunday.week_day_from_year_month_day (1970, 1, 1)
			assert ("Thursday", a_day.is_thursday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (2000, 3, 31)
			assert ("Friday", a_day.is_friday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (1968, 2, 24)
			assert ("Saturday", a_day.is_saturday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (2004, 12, 12)
			assert ("Sunday1", a_day.is_sunday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (1970, 1, 4)
			assert ("Sunday2", a_day.is_sunday)
		end
			
	test_make_from_year_month_day_from_monday is
			-- Test creation feature `make_from_year_month_day' of class DT_WEEK_DAY_FROM_MONDAY
		local
			a_day: DT_WEEK_DAY_FROM_MONDAY
		do
			a_day := week_days_from_monday.week_day_from_year_month_day (1970, 1, 1)
			assert ("Thursday", a_day.is_thursday)
			a_day := week_days_from_monday.week_day_from_year_month_day (2000, 3, 31)
			assert ("Friday", a_day.is_friday)
			a_day := week_days_from_monday.week_day_from_year_month_day (1968, 2, 24)
			assert ("Saturday", a_day.is_saturday)
			a_day := week_days_from_monday.week_day_from_year_month_day (2004, 12, 12)
			assert ("Sunday1", a_day.is_sunday)
			a_day := week_days_from_monday.week_day_from_year_month_day (1970, 1, 4)
			assert ("Sunday2", a_day.is_sunday)
		end

	test_next_day_from_sunday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			assert ("Monday follows Sunday", week_days_from_sunday.sunday.next_day.is_monday)
			assert ("Tuesday follows Monday", week_days_from_sunday.monday.next_day.is_tuesday)
			assert ("Wednesday follows Tuesday", week_days_from_sunday.tuesday.next_day.is_wednesday)
			assert ("Thursday follows Wednesday", week_days_from_sunday.wednesday.next_day.is_thursday)
			assert ("Friday follows Thursday", week_days_from_sunday.thursday.next_day.is_friday)
			assert ("Saturday follows Friday", week_days_from_sunday.friday.next_day.is_saturday)
			assert ("Sunday follows Saturday", week_days_from_sunday.saturday.next_day.is_sunday)
		end

	test_next_day_from_monday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_MONDAY
		do
			assert ("Monday follows Sunday", week_days_from_monday.sunday.next_day.is_monday)
			assert ("Tuesday follows Monday", week_days_from_monday.monday.next_day.is_tuesday)
			assert ("Wednesday follows Tuesday", week_days_from_monday.tuesday.next_day.is_wednesday)
			assert ("Thursday follows Wednesday", week_days_from_monday.wednesday.next_day.is_thursday)
			assert ("Friday follows Thursday", week_days_from_monday.thursday.next_day.is_friday)
			assert ("Saturday follows Friday", week_days_from_monday.friday.next_day.is_saturday)
			assert ("Sunday follows Saturday", week_days_from_monday.saturday.next_day.is_sunday)
		end

	test_previous_day_from_sunday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			assert ("Monday precedes Sunday", week_days_from_sunday.monday.previous_day.is_sunday)
			assert ("Tuesday precedes Monday", week_days_from_sunday.tuesday.previous_day.is_monday)
			assert ("Wednesday precedes Tuesday", week_days_from_sunday.wednesday.previous_day.is_tuesday)
			assert ("Thursday precedes Wednesday", week_days_from_sunday.thursday.previous_day.is_wednesday)
			assert ("Friday precedes Thursday", week_days_from_sunday.friday.previous_day.is_thursday)
			assert ("Saturday precedes Friday", week_days_from_sunday.saturday.previous_day.is_friday)
			assert ("Sunday precedes Saturday", week_days_from_sunday.sunday.previous_day.is_saturday)
		end

	test_previous_day_from_monday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_MONDAY
		do
			assert ("Monday precedes Sunday", week_days_from_monday.monday.previous_day.is_sunday)
			assert ("Tuesday precedes Monday", week_days_from_monday.tuesday.previous_day.is_monday)
			assert ("Wednesday precedes Tuesday", week_days_from_monday.wednesday.previous_day.is_tuesday)
			assert ("Thursday precedes Wednesday", week_days_from_monday.thursday.previous_day.is_wednesday)
			assert ("Friday precedes Thursday", week_days_from_monday.friday.previous_day.is_thursday)
			assert ("Saturday precedes Friday", week_days_from_monday.saturday.previous_day.is_friday)
			assert ("Sunday precedes Saturday", week_days_from_monday.sunday.previous_day.is_saturday)
		end

	test_as_week_day_from_monday_from_sunday is
			-- Test feature `as_week_day_from_monday' of class DT_WEEK_DAY_FROM_SUNDAY
		do
			assert ("Mondays", week_days_from_sunday.monday.as_week_day_from_monday.is_monday)
		end

	test_as_week_day_from_sunday_from_monday is
			-- Test feature `as_week_day_from_sunday' of class DT_WEEK_DAY_FROM_MONDAY
		do
			assert ("Mondays", week_days_from_monday.monday.as_week_day_from_sunday.is_monday)
		end

end
