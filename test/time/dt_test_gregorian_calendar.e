indexing

	description:

		"Test features of class DT_GREGORIAN_CALENDAR"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_GREGORIAN_CALENDAR

inherit

	TS_TEST_CASE

feature -- Test

	test_leap_year is
			-- Test feature `leap_year' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert ("leap_year_1852", gc.leap_year (1852))
			assert ("not_leap_year_1853", not gc.leap_year (1853))
			assert ("not_leap_year_1854", not gc.leap_year (1854))
			assert ("not_leap_year_1855", not gc.leap_year (1855))
			assert ("leap_year_1856", gc.leap_year (1856))
			assert ("not_leap_year_1857", not gc.leap_year (1857))
			assert ("not_leap_year_1858", not gc.leap_year (1858))
			assert ("not_leap_year_1859", not gc.leap_year (1859))
			assert ("leap_year_1860", gc.leap_year (1860))
			assert ("not_leap_year_1861", not gc.leap_year (1861))
			assert ("not_leap_year_1862", not gc.leap_year (1862))
			assert ("not_leap_year_1863", not gc.leap_year (1863))
			assert ("leap_year_1864", gc.leap_year (1864))
			assert ("not_leap_year_1865", not gc.leap_year (1865))
			assert ("not_leap_year_1866", not gc.leap_year (1866))
			assert ("not_leap_year_1867", not gc.leap_year (1867))
			assert ("leap_year_1868", gc.leap_year (1868))
			assert ("not_leap_year_1869", not gc.leap_year (1869))
			assert ("not_leap_year_1870", not gc.leap_year (1870))
			assert ("not_leap_year_1871", not gc.leap_year (1871))
			assert ("leap_year_1872", gc.leap_year (1872))
			assert ("not_leap_year_1873", not gc.leap_year (1873))
			assert ("not_leap_year_1874", not gc.leap_year (1874))
			assert ("not_leap_year_1875", not gc.leap_year (1875))
			assert ("leap_year_1876", gc.leap_year (1876))
			assert ("not_leap_year_1877", not gc.leap_year (1877))
			assert ("not_leap_year_1878", not gc.leap_year (1878))
			assert ("not_leap_year_1879", not gc.leap_year (1879))
			assert ("leap_year_1880", gc.leap_year (1880))
			assert ("not_leap_year_1881", not gc.leap_year (1881))
			assert ("not_leap_year_1882", not gc.leap_year (1882))
			assert ("not_leap_year_1883", not gc.leap_year (1883))
			assert ("leap_year_1884", gc.leap_year (1884))
			assert ("not_leap_year_1885", not gc.leap_year (1885))
			assert ("not_leap_year_1886", not gc.leap_year (1886))
			assert ("not_leap_year_1887", not gc.leap_year (1887))
			assert ("leap_year_1888", gc.leap_year (1888))
			assert ("not_leap_year_1889", not gc.leap_year (1889))
			assert ("not_leap_year_1890", not gc.leap_year (1890))
			assert ("not_leap_year_1891", not gc.leap_year (1891))
			assert ("leap_year_1892", gc.leap_year (1892))
			assert ("not_leap_year_1893", not gc.leap_year (1893))
			assert ("not_leap_year_1894", not gc.leap_year (1894))
			assert ("not_leap_year_1895", not gc.leap_year (1895))
			assert ("leap_year_1896", gc.leap_year (1896))
			assert ("not_leap_year_1897", not gc.leap_year (1897))
			assert ("not_leap_year_1898", not gc.leap_year (1898))
			assert ("not_leap_year_1899", not gc.leap_year (1899))
			assert ("not_leap_year_1900", not gc.leap_year (1900))
			assert ("not_leap_year_1901", not gc.leap_year (1901))
			assert ("not_leap_year_1902", not gc.leap_year (1902))
			assert ("not_leap_year_1903", not gc.leap_year (1903))
			assert ("leap_year_1904", gc.leap_year (1904))
			assert ("not_leap_year_1905", not gc.leap_year (1905))
			assert ("not_leap_year_1906", not gc.leap_year (1906))
			assert ("not_leap_year_1907", not gc.leap_year (1907))

			assert ("leap_year_1996", gc.leap_year (1996))
			assert ("not_leap_year_1997", not gc.leap_year (1997))
			assert ("not_leap_year_1998", not gc.leap_year (1998))
			assert ("not_leap_year_1999", not gc.leap_year (1999))
			assert ("leap_year_2000", gc.leap_year (2000))
			assert ("not_leap_year_2001", not gc.leap_year (2001))
			assert ("not_leap_year_2002", not gc.leap_year (2002))
			assert ("not_leap_year_2003", not gc.leap_year (2003))
			assert ("leap_year_2004", gc.leap_year (2004))
			assert ("not_leap_year_2005", not gc.leap_year (2005))
			assert ("not_leap_year_2006", not gc.leap_year (2006))
			assert ("not_leap_year_2007", not gc.leap_year (2007))
			assert ("leap_year_2008", gc.leap_year (2008))
		end

	test_max_days_in_month is
			-- Test feature `max_days_in_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("max_days_in_month", 31, gc.Max_days_in_month)
		end

	test_days_in_month is
			-- Test feature `days_in_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days in month (non-leap year 1999).
			assert_integers_equal ("january_1999", 31, gc.days_in_month (gc.January, 1999))
			assert_integers_equal ("february_1999", 28, gc.days_in_month (gc.February, 1999))
			assert_integers_equal ("march_1999", 31, gc.days_in_month (gc.March, 1999))
			assert_integers_equal ("april_1999", 30, gc.days_in_month (gc.April, 1999))
			assert_integers_equal ("may_1999", 31, gc.days_in_month (gc.May, 1999))
			assert_integers_equal ("june_1999", 30, gc.days_in_month (gc.June, 1999))
			assert_integers_equal ("july_1999", 31, gc.days_in_month (gc.July, 1999))
			assert_integers_equal ("august_1999", 31, gc.days_in_month (gc.August, 1999))
			assert_integers_equal ("september_1999", 30, gc.days_in_month (gc.September, 1999))
			assert_integers_equal ("october_1999", 31, gc.days_in_month (gc.October, 1999))
			assert_integers_equal ("november_1999", 30, gc.days_in_month (gc.November, 1999))
			assert_integers_equal ("december_1999", 31, gc.days_in_month (gc.December, 1999))
				-- Number of days in month (leap year 2000).
			assert_integers_equal ("january_2000", 31, gc.days_in_month (gc.January, 2000))
			assert_integers_equal ("february_2000", 29, gc.days_in_month (gc.February, 2000))
			assert_integers_equal ("march_2000", 31, gc.days_in_month (gc.March, 2000))
			assert_integers_equal ("april_2000", 30, gc.days_in_month (gc.April, 2000))
			assert_integers_equal ("may_2000", 31, gc.days_in_month (gc.May, 2000))
			assert_integers_equal ("june_2000", 30, gc.days_in_month (gc.June, 2000))
			assert_integers_equal ("july_2000", 31, gc.days_in_month (gc.July, 2000))
			assert_integers_equal ("august_2000", 31, gc.days_in_month (gc.August, 2000))
			assert_integers_equal ("september_2000", 30, gc.days_in_month (gc.September, 2000))
			assert_integers_equal ("october_2000", 31, gc.days_in_month (gc.October, 2000))
			assert_integers_equal ("november_2000", 30, gc.days_in_month (gc.November, 2000))
			assert_integers_equal ("december_2000", 31, gc.days_in_month (gc.December, 2000))
		end

	test_days_at_month is
			-- Test feature `days_at_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days from beginning of year until
				-- beginning of month (non-leap year 1999).
			assert_integers_equal ("january_1999", 0, gc.days_at_month (gc.January, 1999))
			assert_integers_equal ("february_1999", 31, gc.days_at_month (gc.February, 1999))
			assert_integers_equal ("march_1999", 59, gc.days_at_month (gc.March, 1999))
			assert_integers_equal ("april_1999", 90, gc.days_at_month (gc.April, 1999))
			assert_integers_equal ("may_1999", 120, gc.days_at_month (gc.May, 1999))
			assert_integers_equal ("june_1999", 151, gc.days_at_month (gc.June, 1999))
			assert_integers_equal ("july_1999", 181, gc.days_at_month (gc.July, 1999))
			assert_integers_equal ("august_1999", 212, gc.days_at_month (gc.August, 1999))
			assert_integers_equal ("september_1999", 243, gc.days_at_month (gc.September, 1999))
			assert_integers_equal ("october_1999", 273, gc.days_at_month (gc.October, 1999))
			assert_integers_equal ("november_1999", 304, gc.days_at_month (gc.November, 1999))
			assert_integers_equal ("december_1999", 334, gc.days_at_month (gc.December, 1999))
				-- Number of days from beginning of year until
				-- beginning of month (leap year 2000).
			assert_integers_equal ("january_2000", 0, gc.days_at_month (gc.January, 2000))
			assert_integers_equal ("february_2000", 31, gc.days_at_month (gc.February, 2000))
			assert_integers_equal ("march_2000", 60, gc.days_at_month (gc.March, 2000))
			assert_integers_equal ("april_2000", 91, gc.days_at_month (gc.April, 2000))
			assert_integers_equal ("may_2000", 121, gc.days_at_month (gc.May, 2000))
			assert_integers_equal ("june_2000", 152, gc.days_at_month (gc.June, 2000))
			assert_integers_equal ("july_2000", 182, gc.days_at_month (gc.July, 2000))
			assert_integers_equal ("august_2000", 213, gc.days_at_month (gc.August, 2000))
			assert_integers_equal ("september_2000", 244, gc.days_at_month (gc.September, 2000))
			assert_integers_equal ("october_2000", 274, gc.days_at_month (gc.October, 2000))
			assert_integers_equal ("november_2000", 305, gc.days_at_month (gc.November, 2000))
			assert_integers_equal ("december_2000", 335, gc.days_at_month (gc.December, 2000))
		end

	test_next_day is
			-- Test feature `next_day' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("sunday", gc.Monday, gc.next_day (gc.Sunday))
			assert_integers_equal ("monday", gc.Tuesday, gc.next_day (gc.Monday))
			assert_integers_equal ("tuesday", gc.Wednesday, gc.next_day (gc.Tuesday))
			assert_integers_equal ("wednesday", gc.Thursday, gc.next_day (gc.Wednesday))
			assert_integers_equal ("thursday", gc.Friday, gc.next_day (gc.Thursday))
			assert_integers_equal ("friday", gc.Saturday, gc.next_day (gc.Friday))
			assert_integers_equal ("saturday", gc.Sunday, gc.next_day (gc.Saturday))
		end

	test_previous_day is
			-- Test feature `previous_day' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("sunday", gc.Saturday, gc.previous_day (gc.Sunday))
			assert_integers_equal ("monday", gc.Sunday, gc.previous_day (gc.Monday))
			assert_integers_equal ("tuesday", gc.Monday, gc.previous_day (gc.Tuesday))
			assert_integers_equal ("wednesday", gc.Tuesday, gc.previous_day (gc.Wednesday))
			assert_integers_equal ("thursday", gc.Wednesday, gc.previous_day (gc.Thursday))
			assert_integers_equal ("friday", gc.Thursday, gc.previous_day (gc.Friday))
			assert_integers_equal ("saturday", gc.Friday, gc.previous_day (gc.Saturday))
		end

	test_epoch_days is
			-- Test feature `epoch_days' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days since 1 Jan 1970.
			assert_integers_equal ("epoch_1_jan_2000", 10957, gc.epoch_days (2000, 1, 1))
			assert_integers_equal ("epoch_1_jan_1970", 0, gc.epoch_days (1970, 1, 1))
			assert_integers_equal ("epoch_31_dec_1970", 364, gc.epoch_days (1970, 12, 31))
			assert_integers_equal ("epoch_31_dec_1969", -1, gc.epoch_days (1969, 12, 31))
			assert_integers_equal ("epoch_1_jan_1969", -365, gc.epoch_days (1969, 1, 1))
		end

	test_days_and_months_in_year is
			-- Test features `months_in_year', `days_in_year' and
			-- `days_in_leap_year' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("months_in_year", 12, gc.Months_in_year)
			assert_integers_equal ("days_in_year", 365, gc.Days_in_year)
			assert_integers_equal ("days_in_leap_year", 366, gc.Days_in_leap_year)
		end

	test_month_numbers is
			-- Test month number features of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("january", 1, gc.January)
			assert_integers_equal ("february", 2, gc.February)
			assert_integers_equal ("march", 3, gc.March)
			assert_integers_equal ("april", 4, gc.April)
			assert_integers_equal ("may", 5, gc.May)
			assert_integers_equal ("june", 6, gc.June)
			assert_integers_equal ("july", 7, gc.July)
			assert_integers_equal ("august", 8, gc.August)
			assert_integers_equal ("september", 9, gc.September)
			assert_integers_equal ("october", 10, gc.October)
			assert_integers_equal ("november", 11, gc.November)
			assert_integers_equal ("december", 12, gc.December)
		end

	test_days_in_week is
			-- Test feature `days_in_week' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("days_in_week", 7, gc.Days_in_week)
		end

	test_week_day_numbers is
			-- Test feature week day numbers of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("sunday", 1, gc.Sunday)
			assert_integers_equal ("monday", 2, gc.Monday)
			assert_integers_equal ("tuesday", 3, gc.Tuesday)
			assert_integers_equal ("wednesday", 4, gc.Wednesday)
			assert_integers_equal ("thursday", 5, gc.Thursday)
			assert_integers_equal ("friday", 6, gc.Friday)
			assert_integers_equal ("saturday", 7, gc.Saturday)
		end

	test_time_constants is
			-- Test time constants of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_integers_equal ("seconds_in_minute", 60, gc.Seconds_in_minute)
			assert_integers_equal ("seconds_in_hour", 3600, gc.Seconds_in_hour)
			assert_integers_equal ("seconds_in_day", 86400, gc.Seconds_in_day)
			assert_integers_equal ("milliseconds_in_day", 86400000, gc.Milliseconds_in_day)
			assert_integers_equal ("minutes_in_hour", 60, gc.Minutes_in_hour)
			assert_integers_equal ("hours_in_day", 24, gc.Hours_in_day)
		end

	test_week_number is
			-- Test feature `week_number' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Saturday 1 January 2005.
			assert_integers_equal ("week_number_2005_1_1", 53, gc.week_number (2005, 1, 1))
				-- Sunday 2 January 2005.
			assert_integers_equal ("week_number_2005_1_2", 53, gc.week_number (2005, 1, 2))
				-- Monday 3 January 2005.
			assert_integers_equal ("week_number_2005_1_3", 1, gc.week_number (2005, 1, 3))
				-- Sunday 9 January 2005.
			assert_integers_equal ("week_number_2005_1_9", 1, gc.week_number (2005, 1, 9))
				-- Monday 10 January 2005.
			assert_integers_equal ("week_number_2005_1_10", 2, gc.week_number (2005, 1, 10))
				-- Thursday 14 July 2005.
			assert_integers_equal ("week_number_2005_7_14", 28, gc.week_number (2005, 7, 14))
				-- Saturday 31 December 2005.
			assert_integers_equal ("week_number_2005_12_31", 52, gc.week_number (2005, 12, 31))
				-- Sunday 1 January 2006.
			assert_integers_equal ("week_number_2006_1_1", 52, gc.week_number (2006, 1, 1))
				-- Monday 2 January 2006.
			assert_integers_equal ("week_number_2006_1_2", 1, gc.week_number (2006, 1, 2))
				-- Tuesday 3 January 2006.
			assert_integers_equal ("week_number_2006_1_3", 1, gc.week_number (2006, 1, 3))
		end

end
