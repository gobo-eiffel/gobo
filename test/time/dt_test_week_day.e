indexing

	description:

		"Test features of class DT_WEEK_DAY"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_WEEK_DAY

inherit

	TS_TEST_CASE

	DT_SHARED_WEEK_DAYS_FROM_MONDAY

	DT_SHARED_WEEK_DAYS_FROM_SUNDAY

create

	make_default

feature -- Test

	test_make_from_year_month_day_from_sunday is
			-- Test feature `week_day_from_year_month_day' of class DT_WEEK_DAYS_FROM_SUNDAY.
		local
			a_day: DT_WEEK_DAY_FROM_SUNDAY
		do
			a_day := week_days_from_sunday.week_day_from_year_month_day (1970, 1, 1)
			assert ("thursday", a_day.is_thursday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (2000, 3, 31)
			assert ("friday", a_day.is_friday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (1968, 2, 24)
			assert ("saturday", a_day.is_saturday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (2004, 12, 12)
			assert ("sunday1", a_day.is_sunday)
			a_day := week_days_from_sunday.week_day_from_year_month_day (1970, 1, 4)
			assert ("sunday2", a_day.is_sunday)
		end

	test_make_from_year_month_day_from_monday is
			-- Test feature `week_day_from_year_month_day' of class DT_WEEK_DAYS_FROM_MONDAY.
		local
			a_day: DT_WEEK_DAY_FROM_MONDAY
		do
			a_day := week_days_from_monday.week_day_from_year_month_day (1970, 1, 1)
			assert ("thursday", a_day.is_thursday)
			a_day := week_days_from_monday.week_day_from_year_month_day (2000, 3, 31)
			assert ("friday", a_day.is_friday)
			a_day := week_days_from_monday.week_day_from_year_month_day (1968, 2, 24)
			assert ("saturday", a_day.is_saturday)
			a_day := week_days_from_monday.week_day_from_year_month_day (2004, 12, 12)
			assert ("sunday1", a_day.is_sunday)
			a_day := week_days_from_monday.week_day_from_year_month_day (1970, 1, 4)
			assert ("sunday2", a_day.is_sunday)
		end

	test_next_day_from_sunday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_SUNDAY.
		do
			assert ("sunday", week_days_from_sunday.sunday.next_day.is_monday)
			assert ("monday", week_days_from_sunday.monday.next_day.is_tuesday)
			assert ("tuesday", week_days_from_sunday.tuesday.next_day.is_wednesday)
			assert ("wednesday", week_days_from_sunday.wednesday.next_day.is_thursday)
			assert ("thursday", week_days_from_sunday.thursday.next_day.is_friday)
			assert ("friday", week_days_from_sunday.friday.next_day.is_saturday)
			assert ("saturday", week_days_from_sunday.saturday.next_day.is_sunday)
		end

	test_next_day_from_monday is
			-- Test feature `next_day' of class DT_WEEK_DAY_FROM_MONDAY.
		do
			assert ("sunday", week_days_from_monday.sunday.next_day.is_monday)
			assert ("monday", week_days_from_monday.monday.next_day.is_tuesday)
			assert ("tuesday", week_days_from_monday.tuesday.next_day.is_wednesday)
			assert ("wednesday", week_days_from_monday.wednesday.next_day.is_thursday)
			assert ("thursday", week_days_from_monday.thursday.next_day.is_friday)
			assert ("friday", week_days_from_monday.friday.next_day.is_saturday)
			assert ("saturday", week_days_from_monday.saturday.next_day.is_sunday)
		end

	test_previous_day_from_sunday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_SUNDAY.
		do
			assert ("sunday", week_days_from_sunday.monday.previous_day.is_sunday)
			assert ("monday", week_days_from_sunday.tuesday.previous_day.is_monday)
			assert ("tuesday", week_days_from_sunday.wednesday.previous_day.is_tuesday)
			assert ("wednesday", week_days_from_sunday.thursday.previous_day.is_wednesday)
			assert ("thursday", week_days_from_sunday.friday.previous_day.is_thursday)
			assert ("friday", week_days_from_sunday.saturday.previous_day.is_friday)
			assert ("saturday", week_days_from_sunday.sunday.previous_day.is_saturday)
		end

	test_previous_day_from_monday is
			-- Test feature `previous_day' of class DT_WEEK_DAY_FROM_MONDAY.
		do
			assert ("sunday", week_days_from_monday.monday.previous_day.is_sunday)
			assert ("monday", week_days_from_monday.tuesday.previous_day.is_monday)
			assert ("tuesday", week_days_from_monday.wednesday.previous_day.is_tuesday)
			assert ("wednesday", week_days_from_monday.thursday.previous_day.is_wednesday)
			assert ("thursday", week_days_from_monday.friday.previous_day.is_thursday)
			assert ("friday", week_days_from_monday.saturday.previous_day.is_friday)
			assert ("saturday", week_days_from_monday.sunday.previous_day.is_saturday)
		end

	test_as_week_day_from_monday_from_sunday is
			-- Test feature `as_week_day_from_monday' of class DT_WEEK_DAY_FROM_SUNDAY.
		do
			assert ("monday", week_days_from_sunday.monday.as_week_day_from_monday.is_monday)
		end

	test_as_week_day_from_sunday_from_monday is
			-- Test feature `as_week_day_from_sunday' of class DT_WEEK_DAY_FROM_MONDAY.
		do
			assert ("monday", week_days_from_monday.monday.as_week_day_from_sunday.is_monday)
		end

end
