indexing

	description:

		"Test features of class DT_GREGORIAN_CALENDAR"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			assert ("1852 leap year", gc.leap_year (1852))
			assert ("1853 not leap year", not gc.leap_year (1853))
			assert ("1854 not leap year", not gc.leap_year (1854))
			assert ("1855 not leap year", not gc.leap_year (1855))
			assert ("1856 leap year", gc.leap_year (1856))
			assert ("1857 not leap year", not gc.leap_year (1857))
			assert ("1858 not leap year", not gc.leap_year (1858))
			assert ("1859 not leap year", not gc.leap_year (1859))
			assert ("1860 leap year", gc.leap_year (1860))
			assert ("1861 not leap year", not gc.leap_year (1861))
			assert ("1862 not leap year", not gc.leap_year (1862))
			assert ("1863 not leap year", not gc.leap_year (1863))
			assert ("1864 leap year", gc.leap_year (1864))
			assert ("1865 not leap year", not gc.leap_year (1865))
			assert ("1866 not leap year", not gc.leap_year (1866))
			assert ("1867 not leap year", not gc.leap_year (1867))
			assert ("1868 leap year", gc.leap_year (1868))
			assert ("1869 not leap year", not gc.leap_year (1869))
			assert ("1870 not leap year", not gc.leap_year (1870))
			assert ("1871 not leap year", not gc.leap_year (1871))
			assert ("1872 leap year", gc.leap_year (1872))
			assert ("1873 not leap year", not gc.leap_year (1873))
			assert ("1874 not leap year", not gc.leap_year (1874))
			assert ("1875 not leap year", not gc.leap_year (1875))
			assert ("1876 leap year", gc.leap_year (1876))
			assert ("1877 not leap year", not gc.leap_year (1877))
			assert ("1878 not leap year", not gc.leap_year (1878))
			assert ("1879 not leap year", not gc.leap_year (1879))
			assert ("1880 leap year", gc.leap_year (1880))
			assert ("1881 not leap year", not gc.leap_year (1881))
			assert ("1882 not leap year", not gc.leap_year (1882))
			assert ("1883 not leap year", not gc.leap_year (1883))
			assert ("1884 leap year", gc.leap_year (1884))
			assert ("1885 not leap year", not gc.leap_year (1885))
			assert ("1886 not leap year", not gc.leap_year (1886))
			assert ("1887 not leap year", not gc.leap_year (1887))
			assert ("1888 leap year", gc.leap_year (1888))
			assert ("1889 not leap year", not gc.leap_year (1889))
			assert ("1890 not leap year", not gc.leap_year (1890))
			assert ("1891 not leap year", not gc.leap_year (1891))
			assert ("1892 leap year", gc.leap_year (1892))
			assert ("1893 not leap year", not gc.leap_year (1893))
			assert ("1894 not leap year", not gc.leap_year (1894))
			assert ("1895 not leap year", not gc.leap_year (1895))
			assert ("1896 leap year", gc.leap_year (1896))
			assert ("1897 not leap year", not gc.leap_year (1897))
			assert ("1898 not leap year", not gc.leap_year (1898))
			assert ("1899 not leap year", not gc.leap_year (1899))
			assert ("1900 not leap year", not gc.leap_year (1900))
			assert ("1901 not leap year", not gc.leap_year (1901))
			assert ("1902 not leap year", not gc.leap_year (1902))
			assert ("1903 not leap year", not gc.leap_year (1903))
			assert ("1904 leap year", gc.leap_year (1904))
			assert ("1905 not leap year", not gc.leap_year (1905))
			assert ("1906 not leap year", not gc.leap_year (1906))
			assert ("1907 not leap year", not gc.leap_year (1907))

			assert ("1996 leap year", gc.leap_year (1996))
			assert ("1997 not leap year", not gc.leap_year (1997))
			assert ("1998 not leap year", not gc.leap_year (1998))
			assert ("1999 not leap year", not gc.leap_year (1999))
			assert ("2000 leap year", gc.leap_year (2000))
			assert ("2001 not leap year", not gc.leap_year (2001))
			assert ("2002 not leap year", not gc.leap_year (2002))
			assert ("2003 not leap year", not gc.leap_year (2003))
			assert ("2004 leap year", gc.leap_year (2004))
			assert ("2005 not leap year", not gc.leap_year (2005))
			assert ("2006 not leap year", not gc.leap_year (2006))
			assert ("2007 not leap year", not gc.leap_year (2007))
			assert ("2008 leap year", gc.leap_year (2008))
		end

	test_max_days_in_month is
			-- Test feature `max_days_in_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("Max_days_in_month", 31, gc.Max_days_in_month)
		end

	test_days_in_month is
			-- Test feature `days_in_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days in month (non-leap year 1999):
			assert_equal ("January 1999", 31, gc.days_in_month (gc.January, 1999))
			assert_equal ("February 1999", 28, gc.days_in_month (gc.February, 1999))
			assert_equal ("March 1999", 31, gc.days_in_month (gc.March, 1999))
			assert_equal ("April 1999", 30, gc.days_in_month (gc.April, 1999))
			assert_equal ("May 1999", 31, gc.days_in_month (gc.May, 1999))
			assert_equal ("June 1999", 30, gc.days_in_month (gc.June, 1999))
			assert_equal ("July 1999", 31, gc.days_in_month (gc.July, 1999))
			assert_equal ("August 1999", 31, gc.days_in_month (gc.August, 1999))
			assert_equal ("September 1999", 30, gc.days_in_month (gc.September, 1999))
			assert_equal ("October 1999", 31, gc.days_in_month (gc.October, 1999))
			assert_equal ("November 1999", 30, gc.days_in_month (gc.November, 1999))
			assert_equal ("December 1999", 31, gc.days_in_month (gc.December, 1999))
				-- Number of days in month (leap year 2000):
			assert_equal ("January 2000", 31, gc.days_in_month (gc.January, 2000))
			assert_equal ("February 2000", 29, gc.days_in_month (gc.February, 2000))
			assert_equal ("March 2000", 31, gc.days_in_month (gc.March, 2000))
			assert_equal ("April 2000", 30, gc.days_in_month (gc.April, 2000))
			assert_equal ("May 2000", 31, gc.days_in_month (gc.May, 2000))
			assert_equal ("June 2000", 30, gc.days_in_month (gc.June, 2000))
			assert_equal ("July 2000", 31, gc.days_in_month (gc.July, 2000))
			assert_equal ("August 2000", 31, gc.days_in_month (gc.August, 2000))
			assert_equal ("September 2000", 30, gc.days_in_month (gc.September, 2000))
			assert_equal ("October 2000", 31, gc.days_in_month (gc.October, 2000))
			assert_equal ("November 2000", 30, gc.days_in_month (gc.November, 2000))
			assert_equal ("December 2000", 31, gc.days_in_month (gc.December, 2000))
		end

	test_days_at_month is
			-- Test feature `days_at_month' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days from beginning of year until
				-- beginning of month (non-leap year 1999):
			assert_equal ("January 1999", 0, gc.days_at_month (gc.January, 1999))
			assert_equal ("February 1999", 31, gc.days_at_month (gc.February, 1999))
			assert_equal ("March 1999", 59, gc.days_at_month (gc.March, 1999))
			assert_equal ("April 1999", 90, gc.days_at_month (gc.April, 1999))
			assert_equal ("May 1999", 120, gc.days_at_month (gc.May, 1999))
			assert_equal ("June 1999", 151, gc.days_at_month (gc.June, 1999))
			assert_equal ("July 1999", 181, gc.days_at_month (gc.July, 1999))
			assert_equal ("August 1999", 212, gc.days_at_month (gc.August, 1999))
			assert_equal ("September 1999", 243, gc.days_at_month (gc.September, 1999))
			assert_equal ("October 1999", 273, gc.days_at_month (gc.October, 1999))
			assert_equal ("November 1999", 304, gc.days_at_month (gc.November, 1999))
			assert_equal ("December 1999", 334, gc.days_at_month (gc.December, 1999))
				-- Number of days from beginning of year until
				-- beginning of month (leap year 2000):
			assert_equal ("January 2000", 0, gc.days_at_month (gc.January, 2000))
			assert_equal ("February 2000", 31, gc.days_at_month (gc.February, 2000))
			assert_equal ("March 2000", 60, gc.days_at_month (gc.March, 2000))
			assert_equal ("April 2000", 91, gc.days_at_month (gc.April, 2000))
			assert_equal ("May 2000", 121, gc.days_at_month (gc.May, 2000))
			assert_equal ("June 2000", 152, gc.days_at_month (gc.June, 2000))
			assert_equal ("July 2000", 182, gc.days_at_month (gc.July, 2000))
			assert_equal ("August 2000", 213, gc.days_at_month (gc.August, 2000))
			assert_equal ("September 2000", 244, gc.days_at_month (gc.September, 2000))
			assert_equal ("October 2000", 274, gc.days_at_month (gc.October, 2000))
			assert_equal ("November 2000", 305, gc.days_at_month (gc.November, 2000))
			assert_equal ("December 2000", 335, gc.days_at_month (gc.December, 2000))
		end

	test_next_day is
			-- Test feature `next_day' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("Sunday", gc.Monday, gc.next_day (gc.Sunday))
			assert_equal ("Monday", gc.Tuesday, gc.next_day (gc.Monday))
			assert_equal ("Tuesday", gc.Wednesday, gc.next_day (gc.Tuesday))
			assert_equal ("Wednesday", gc.Thursday, gc.next_day (gc.Wednesday))
			assert_equal ("Thursday", gc.Friday, gc.next_day (gc.Thursday))
			assert_equal ("Friday", gc.Saturday, gc.next_day (gc.Friday))
			assert_equal ("Saturday", gc.Sunday, gc.next_day (gc.Saturday))
		end

	test_previous_day is
			-- Test feature `previous_day' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("Sunday", gc.Saturday, gc.previous_day (gc.Sunday))
			assert_equal ("Monday", gc.Sunday, gc.previous_day (gc.Monday))
			assert_equal ("Tuesday", gc.Monday, gc.previous_day (gc.Tuesday))
			assert_equal ("Wednesday", gc.Tuesday, gc.previous_day (gc.Wednesday))
			assert_equal ("Thursday", gc.Wednesday, gc.previous_day (gc.Thursday))
			assert_equal ("Friday", gc.Thursday, gc.previous_day (gc.Friday))
			assert_equal ("Saturday", gc.Friday, gc.previous_day (gc.Saturday))
		end

	test_epoch_days is
			-- Test feature `epoch_days' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
				-- Number of days since 1 Jan 1970:
			assert_equal ("1 Jan 2000", 10957, gc.epoch_days (2000, 1, 1))
			assert_equal ("1 Jan 1970", 0, gc.epoch_days (1970, 1, 1))
			assert_equal ("31 Dec 1970", 364, gc.epoch_days (1970, 12, 31))
			assert_equal ("31 Dec 1969", -1, gc.epoch_days (1969, 12, 31))
			assert_equal ("1 Jan 1969", -365, gc.epoch_days (1969, 1, 1))
		end

	test_days_and_months_in_year is
			-- Test features `months_in_year', `days_in_year' and
			-- `days_in_leap_year' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("months_in_year", 12, gc.Months_in_year)
			assert_equal ("days_in_year", 365, gc.Days_in_year)
			assert_equal ("days_in_leap_year", 366, gc.Days_in_leap_year)
		end

	test_month_numbers is
			-- Test feature month numbers of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("January", 1, gc.January)
			assert_equal ("February", 2, gc.February)
			assert_equal ("March", 3, gc.March)
			assert_equal ("April", 4, gc.April)
			assert_equal ("May", 5, gc.May)
			assert_equal ("June", 6, gc.June)
			assert_equal ("July", 7, gc.July)
			assert_equal ("August", 8, gc.August)
			assert_equal ("September", 9, gc.September)
			assert_equal ("October", 10, gc.October)
			assert_equal ("November", 11, gc.November)
			assert_equal ("December", 12, gc.December)
		end

	test_days_in_week is
			-- Test feature `days_in_week' of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("days_in_week", 7, gc.Days_in_week)
		end

	test_week_day_numbers is
			-- Test feature week day numbers of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("Sunday", 1, gc.Sunday)
			assert_equal ("Monday", 2, gc.Monday)
			assert_equal ("Tuesday", 3, gc.Tuesday)
			assert_equal ("Wednesday", 4, gc.Wednesday)
			assert_equal ("Thursday", 5, gc.Thursday)
			assert_equal ("Friday", 6, gc.Friday)
			assert_equal ("Saturday", 7, gc.Saturday)
		end

	test_time_constants is
			-- Test time constants of class DT_GREGORIAN_CALENDAR.
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			create gc
			assert_equal ("seconds_in_minute", 60, gc.Seconds_in_minute)
			assert_equal ("seconds_in_hour", 3600, gc.Seconds_in_hour)
			assert_equal ("seconds_in_day", 86400, gc.Seconds_in_day)
			assert_equal ("milliseconds_in_day", 86400000, gc.Milliseconds_in_day)
			assert_equal ("minutes_in_hour", 60, gc.Minutes_in_hour)
			assert_equal ("hours_in_day", 24, gc.Hours_in_day)
		end

end
