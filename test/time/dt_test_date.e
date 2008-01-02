indexing

	description:

		"Test features of class DT_DATE"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_DATE

inherit

	TS_TEST_CASE
	DT_GREGORIAN_CALENDAR

feature -- Test

	test_date1 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 3, 24)
			create d2.make (2000, 3, 24)
			create dd1.make (0, 0, 0)
			assert_equal ("infix_minus1", dd1, d1 - d1)
			assert_equal ("infix_minus2", dd1, d1 - d2)
			assert_equal ("duration1", dd1, d1.duration (d1))
			assert_equal ("duration2", dd1, d1.duration (d2))
			assert_equal ("date_duration1", dd1, d1.date_duration (d1))
			assert_equal ("date_duration2", dd1, d1.date_duration (d2))
			assert_equal ("canonical_duration1", dd1, d1.canonical_duration (d1))
			assert_equal ("canonical_duration2", dd1, d1.canonical_duration (d2))
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
		end

	test_date2 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 3, 24)
			create d2.make (2001, 11, 3)
			create dd1.make (0, 0, -589)
			assert_equal ("infix_minus1", dd1, d1 - d2)
			assert_equal ("duration1", dd1, d1.duration (d2))
			assert_equal ("date_duration1", dd1, d1.date_duration (d2))
			create dd1.make (-1, -7, -10)
			assert_equal ("canonical_duration1", dd1, d1.canonical_duration (d2))
			assert ("infix_less1", d1 < d2)
			create dd1.make (0, 0, 589)
			assert_equal ("infix_minus2", dd1, d2 - d1)
			assert_equal ("duration2", dd1, d2.duration (d1))
			assert_equal ("date_duration2", dd1, d2.date_duration (d1))
			create dd1.make (1, 7, 10)
			assert_equal ("canonical_duration2", dd1, d2.canonical_duration (d1))
			assert ("infix_less2", not (d2 < d1))
		end

	test_date3 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 3, 24)
			create dd1.make (12, 4, 31)
			create d2.make (2012, 8, 24)
			assert_equal ("infix_plus", d2, d1 + dd1)
			assert_equal ("infix_&@", d2, d1 &@ dd1)
			d1.add_duration (dd1)
			assert_equal ("add_duration", d2, d1)
			d1.add_date_duration (dd1)
			create d2.make (2025, 1, 24)
			assert_equal ("add_date_duration", d2, d1)
		end

	test_date4 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 3, 24)
			create dd1.make (-4, -2, -12)
			create d2.make (1996, 1, 12)
			assert_equal ("infix_plus", d2, d1 + dd1)
			assert_equal ("infix_&@", d2, d1 &@ dd1)
			d1.add_duration (dd1)
			assert_equal ("add_duration", d2, d1)
			d1.add_date_duration (dd1)
			create d2.make (1991, 10, 31)
			assert_equal ("add_date_duration", d2, d1)
		end

	test_date5 is
			-- Test features of DT_DATE.
		local
			d1: DT_DATE
		do
			create d1.make (1970, 1, 1)
			assert_integers_equal ("week_day1", Thursday, d1.week_day)
			assert_integers_equal ("year_day1", 1, d1.year_day)
			assert_integers_equal ("day_count1", 0, d1.day_count)
			create d1.make (2000, 3, 31)
			assert_integers_equal ("week_day2", Friday, d1.week_day)
			assert_integers_equal ("year_day2", 91, d1.year_day)
			assert_integers_equal ("day_count2", 11047, d1.day_count)
			create d1.make (1968, 2, 24)
			assert_integers_equal ("week_day3", Saturday, d1.week_day)
			assert_integers_equal ("year_day3", 55, d1.year_day)
			assert_integers_equal ("day_count3", -677, d1.day_count)
		end

	test_date6 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 4, 30)
			create d2.make (2000, 5, 31)
			create dd1.make (0, 0, -31)
			assert_equal ("duration1", dd1, d1.duration (d2))
			assert_equal ("date_duration1", dd1, d1.date_duration (d2))
			create dd1.make (0, -1, 0)
			assert_equal ("canonical_duration1", dd1, d1.canonical_duration (d2))
			create dd1.make (0, 0, 31)
			assert_equal ("duration2", dd1, d2.duration (d1))
			assert_equal ("date_duration2", dd1, d2.date_duration (d1))
			create dd1.make (0, 1, 1)
			assert_equal ("canonical_duration2", dd1, d2.canonical_duration (d1))
		end

	test_date7 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 5, 29)
			create d2.make (2000, 1, 31)
			create dd1.make (0, 0, 119)
			assert_equal ("duration1", dd1, d1.duration (d2))
			assert_equal ("date_duration1", dd1, d1.date_duration (d2))
			create dd1.make (0, 3, 29)
			assert_equal ("canonical_duration1", dd1, d1.canonical_duration (d2))
			create dd1.make (0, 0, -119)
			assert_equal ("duration2", dd1, d2.duration (d1))
			assert_equal ("date_duration2", dd1, d2.date_duration (d1))
			create dd1.make (0, -3, -29)
			assert_equal ("canonical_duration2", dd1, d2.canonical_duration (d1))
		end

	test_date8 is
			-- Test features of DT_DATE.
		local
			d1: DT_DATE
		do
			create d1.make (2000, 1, 2)
			assert_integers_equal ("days_in_current_month1", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month1", 31, d1.days_in_previous_month)
			create d1.make (2000, 2, 2)
			assert_integers_equal ("days_in_current_month2", 29, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month2", 31, d1.days_in_previous_month)
			create d1.make (2000, 3, 2)
			assert_integers_equal ("days_in_current_month3", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month3", 29, d1.days_in_previous_month)
			create d1.make (2000, 4, 2)
			assert_integers_equal ("days_in_current_month4", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month4", 31, d1.days_in_previous_month)
			create d1.make (2000, 5, 2)
			assert_integers_equal ("days_in_current_month5", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month5", 30, d1.days_in_previous_month)
			create d1.make (2000, 6, 2)
			assert_integers_equal ("days_in_current_month6", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month6", 31, d1.days_in_previous_month)
			create d1.make (2000, 7, 2)
			assert_integers_equal ("days_in_current_month7", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month7", 30, d1.days_in_previous_month)
			create d1.make (2000, 8, 2)
			assert_integers_equal ("days_in_current_month8", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month8", 31, d1.days_in_previous_month)
			create d1.make (2000, 9, 2)
			assert_integers_equal ("days_in_current_month9", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month9", 31, d1.days_in_previous_month)
			create d1.make (2000, 10, 2)
			assert_integers_equal ("days_in_current_month10", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month10", 30, d1.days_in_previous_month)
			create d1.make (2000, 11, 2)
			assert_integers_equal ("days_in_current_month11", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month11", 31, d1.days_in_previous_month)
			create d1.make (2000, 12, 2)
			assert_integers_equal ("days_in_current_month12", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month12", 30, d1.days_in_previous_month)
			create d1.make (2001, 1, 2)
			assert_integers_equal ("days_in_current_month13", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month13", 31, d1.days_in_previous_month)
			create d1.make (2001, 2, 2)
			assert_integers_equal ("days_in_current_month14", 28, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month14", 31, d1.days_in_previous_month)
			create d1.make (2001, 3, 2)
			assert_integers_equal ("days_in_current_month15", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month15", 28, d1.days_in_previous_month)
			create d1.make (2001, 4, 2)
			assert_integers_equal ("days_in_current_month16", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month16", 31, d1.days_in_previous_month)
			create d1.make (2001, 5, 2)
			assert_integers_equal ("days_in_current_month17", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month17", 30, d1.days_in_previous_month)
			create d1.make (2001, 6, 2)
			assert_integers_equal ("days_in_current_month18", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month18", 31, d1.days_in_previous_month)
			create d1.make (2001, 7, 2)
			assert_integers_equal ("days_in_current_month19", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month19", 30, d1.days_in_previous_month)
			create d1.make (2001, 8, 2)
			assert_integers_equal ("days_in_current_month20", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month20", 31, d1.days_in_previous_month)
			create d1.make (2001, 9, 2)
			assert_integers_equal ("days_in_current_month21", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month21", 31, d1.days_in_previous_month)
			create d1.make (2001, 10, 2)
			assert_integers_equal ("days_in_current_month22", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month22", 30, d1.days_in_previous_month)
			create d1.make (2001, 11, 2)
			assert_integers_equal ("days_in_current_month23", 30, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month23", 31, d1.days_in_previous_month)
			create d1.make (2001, 12, 2)
			assert_integers_equal ("days_in_current_month24", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month24", 30, d1.days_in_previous_month)
			create d1.make (2002, 1, 2)
			assert_integers_equal ("days_in_current_month25", 31, d1.days_in_current_month)
			assert_integers_equal ("days_in_previous_month25", 31, d1.days_in_previous_month)
		end

	test_date9 is
			-- Test features of DT_DATE.
		local
			d1: DT_DATE
		do
			create d1.make (2000, 1, 2)
			assert ("is_leap_year1", d1.is_leap_year)
			create d1.make (2001, 1, 2)
			assert ("is_leap_year2", not d1.is_leap_year)
			create d1.make (1900, 1, 2)
			assert ("is_leap_year3", not d1.is_leap_year)
			create d1.make (1996, 1, 2)
			assert ("is_leap_year4", d1.is_leap_year)
			create d1.make (1999, 1, 2)
			assert ("is_leap_year5", not d1.is_leap_year)
		end

	test_date10 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
		do
			create d1.make (2000, 4, 1)
			d1.set_year_month_day (2000, 5, 17)
			create d2.make (2000, 5, 17)
			assert_equal ("set_year_month_day", d2, d1)
			d1.set_year (1998)
			create d2.make (1998, 5, 17)
			assert_equal ("set_year", d2, d1)
			d1.set_month (11)
			create d2.make (1998, 11, 17)
			assert_equal ("set_month", d2, d1)
			d1.set_day (23)
			create d2.make (1998, 11, 23)
			assert_equal ("set_day", d2, d1)
			d1.add_years_months_days (2, 3, 25)
			create d2.make (2001, 3, 20)
			assert_equal ("add_years_months_days", d2, d1)
			d1.add_years (5)
			create d2.make (2006, 3, 20)
			assert_equal ("add_years", d2, d1)
			d1.add_months (-2)
			create d2.make (2006, 1, 20)
			assert_equal ("add_months", d2, d1)
			d1.add_days (-13)
			create d2.make (2006, 1, 7)
			assert_equal ("add_days", d2, d1)
		end

	test_date11 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
		do
			create d1.make (2000, 2, 29)
			d1.add_years (1)
			create d2.make (2001, 2, 28)
			assert_equal ("add_years", d2, d1)

			create d1.make (2000, 5, 31)
			d1.add_months (-1)
			create d2.make (2000, 4, 30)
			assert_equal ("add_months", d2, d1)
		end

	test_date12 is
			-- Test features of DT_DATE.
		local
			d1, d2: DT_DATE
		do
			create d1.make (2000, 5, 31)
			d1.set_day_count (0)
			create d2.make (1970, 1, 1)
			assert_equal ("set_day_count1", d2, d1)
			d1.set_day_count (11055)
			create d2.make (2000, 4, 8)
			assert_equal ("set_day_count2", d2, d1)
			d1.set_day_count (11688)
			create d2.make (2002, 1, 1)
			assert_equal ("set_day_count3", d2, d1)
		end

	test_date13 is
			-- Test features of DT_DATE.
			-- (Regression test written after finding a bug in feature
			-- `set_from_epoch_days'; Reported by Emmanuel Bouyer.)
		local
			d1, d2: DT_DATE
			dd1: DT_DATE_DURATION
		do
			create d1.make (2000, 1, 1)
			create d2.make (1600, 1, 1)
			create dd1.make (0, 0, - Days_in_400_years)
			assert_equal ("infix_plus", d2, d1 + dd1)
			assert_equal ("infix_&@", d2, d1 &@ dd1)
			d1.add_duration (dd1)
			assert_equal ("add_duration", d2, d1)
			d1.add_date_duration (dd1)
			create d2.make (1200, 1, 1)
			assert_equal ("add_date_duration", d2, d1)
		end

	test_week is
			-- Test feature `week' of class DT_DATE.
		local
			a_date: DT_DATE
		do
				-- Saturday 1 January 2005.
			create a_date.make (2005, 1, 1)
			assert_integers_equal ("week_2005_1_1", 53, a_date.week)
				-- Sunday 2 January 2005.
			create a_date.make (2005, 1, 2)
			assert_integers_equal ("week_2005_1_2", 53, a_date.week)
				-- Monday 3 January 2005.
			create a_date.make (2005, 1, 3)
			assert_integers_equal ("week_2005_1_3", 1, a_date.week)
				-- Sunday 9 January 2005.
			create a_date.make (2005, 1, 9)
			assert_integers_equal ("week_2005_1_9", 1, a_date.week)
				-- Monday 10 January 2005.
			create a_date.make (2005, 1, 10)
			assert_integers_equal ("week_2005_1_10", 2, a_date.week)
				-- Thursday 14 July 2005.
			create a_date.make (2005, 7, 14)
			assert_integers_equal ("week_2005_7_14", 28, a_date.week)
				-- Saturday 31 December 2005.
			create a_date.make (2005, 12, 31)
			assert_integers_equal ("week_2005_12_31", 52, a_date.week)
				-- Sunday 1 January 2006.
			create a_date.make (2006, 1, 1)
			assert_integers_equal ("week_2006_1_1", 52, a_date.week)
				-- Monday 2 January 2006.
			create a_date.make (2006, 1, 2)
			assert_integers_equal ("week_2006_1_2", 1, a_date.week)
				-- Tuesday 3 January 2006.
			create a_date.make (2006, 1, 3)
			assert_integers_equal ("week_2006_1_3", 1, a_date.week)
		end

	text_xslt_formatting is
			-- Test feature `xslt_formatted' of class DT_DATE.
		local
			l_date: DT_DATE
			l_result: DT_FORMAT_DATE_TIME_RESULT
		do
			-- Saturday 1 January 2005.
			create l_date.make (2005, 1, 1)
			l_result := l_date.xslt_formatted (Void, "[FNn] [Do] of [MNn], [Y]", Void, Void, Void)
			assert ("Result not void", l_result /= Void)
			assert ("No error", not l_result.is_error)
			assert ("Non-void value", l_result.value /= Void)
			assert_strings_equal ("Correct result", "Saturday 1st of January, 2005", l_result.value)
		end

end
