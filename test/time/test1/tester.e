indexing

	description:

		"Test features of class DT_GREGORIAN_CALENDAR"

	library:    "Gobo Eiffel Time Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TESTER

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_SHARED_EXCEPTIONS

creation

	make, make_and_test

feature {NONE} -- Initialization

	make is
			-- Make a new tester.
		do
		end

	make_and_test is
			-- Make a new tester and run the test.
		local
			a_filename: STRING
			a_file: like OUTPUT_STREAM_TYPE
			cannot_write: UT_CANNOT_WRITE_TO_FILE_ERROR
			error_handler: UT_ERROR_HANDLER
		do
			a_filename := "output.txt"
			a_file := OUTPUT_STREAM_.make_file_open_write (a_filename)
			if OUTPUT_STREAM_.is_open_write (a_file) then
				test (a_file)
				a_file.put_string ("%NEnd of Test%N")
				OUTPUT_STREAM_.close (a_file)
			else
				!! cannot_write.make (a_filename)
				!! error_handler.make_standard
				error_handler.report_error (cannot_write)
				Exceptions.die (1)
			end
		end

feature -- Test

	test (a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			!! gc
			test_leap_year (gc, a_file)
			test_max_days_in_month (gc, a_file)
			test_days_in_month (gc, a_file)
			test_days_at_month (gc, a_file)
			test_next_day (gc, a_file)
			test_previous_day (gc, a_file)
			test_epoch_days (gc, a_file)
			test_months_in_year (gc, a_file)
			test_days_in_year (gc, a_file)
			test_days_in_leap_year (gc, a_file)
			test_month_numbers (gc, a_file)
			test_days_in_week (gc, a_file)
			test_week_day_numbers (gc, a_file)
			test_seconds_in_minute (gc, a_file)
			test_seconds_in_hour (gc, a_file)
			test_seconds_in_day (gc, a_file)
			test_milliseconds_in_day (gc, a_file)
			test_minutes_in_hour (gc, a_file)
			test_hours_in_day (gc, a_file)
		end

	test_leap_year (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `leap_year' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		local
			i: INTEGER
		do
			a_file.put_string ("Leap years between 1850 and 2010:%N")
			from i := 1850 until i > 2010 loop
				if gc.leap_year (i) then
					a_file.put_character ('%T')
					a_file.put_integer (i)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
		end

	test_max_days_in_month (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `max_days_in_month' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Maximum number of days in a month: ")
			a_file.put_integer (gc.Max_days_in_month)
			a_file.put_character ('%N')
		end

	test_days_in_month (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_in_month' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days in month (non-leap year 1999):%N")
			test_days_in_month_with_year (gc, 1999, a_file)
			a_file.put_string ("Number of days in month (leap year 2000):%N")
			test_days_in_month_with_year (gc, 2000, a_file)
		end

	test_days_in_month_with_year (gc: DT_GREGORIAN_CALENDAR; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_in_month' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("%TJanuary: ")
			a_file.put_integer (gc.days_in_month (gc.January, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TFebruary: ")
			a_file.put_integer (gc.days_in_month (gc.February, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TMarch: ")
			a_file.put_integer (gc.days_in_month (gc.March, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TApril: ")
			a_file.put_integer (gc.days_in_month (gc.April, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TMay: ")
			a_file.put_integer (gc.days_in_month (gc.May, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TJune: ")
			a_file.put_integer (gc.days_in_month (gc.June, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TJuly: ")
			a_file.put_integer (gc.days_in_month (gc.July, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TAugust: ")
			a_file.put_integer (gc.days_in_month (gc.August, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TSeptember: ")
			a_file.put_integer (gc.days_in_month (gc.September, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TOctober: ")
			a_file.put_integer (gc.days_in_month (gc.October, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TNovember: ")
			a_file.put_integer (gc.days_in_month (gc.November, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TDecember: ")
			a_file.put_integer (gc.days_in_month (gc.December, y))
			a_file.put_character ('%N')
		end

	test_days_at_month (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_at_month' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days from beginning of year until beginning of month (non-leap year 1999):%N")
			test_days_at_month_with_year (gc, 1999, a_file)
			a_file.put_string ("Number of days from beginning of year until beginning of month (leap year 2000):%N")
			test_days_at_month_with_year (gc, 2000, a_file)
		end

	test_days_at_month_with_year (gc: DT_GREGORIAN_CALENDAR; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_at_month' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("%TJanuary: ")
			a_file.put_integer (gc.days_at_month (gc.January, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TFebruary: ")
			a_file.put_integer (gc.days_at_month (gc.February, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TMarch: ")
			a_file.put_integer (gc.days_at_month (gc.March, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TApril: ")
			a_file.put_integer (gc.days_at_month (gc.April, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TMay: ")
			a_file.put_integer (gc.days_at_month (gc.May, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TJune: ")
			a_file.put_integer (gc.days_at_month (gc.June, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TJuly: ")
			a_file.put_integer (gc.days_at_month (gc.July, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TAugust: ")
			a_file.put_integer (gc.days_at_month (gc.August, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TSeptember: ")
			a_file.put_integer (gc.days_at_month (gc.September, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TOctober: ")
			a_file.put_integer (gc.days_at_month (gc.October, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TNovember: ")
			a_file.put_integer (gc.days_at_month (gc.November, y))
			a_file.put_character ('%N')
			a_file.put_string ("%TDecember: ")
			a_file.put_integer (gc.days_at_month (gc.December, y))
			a_file.put_character ('%N')
		end

	test_next_day (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `next_day' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Next week day:%N")
			a_file.put_string ("%TSunday: ")
			print_week_day (gc, gc.next_day (gc.Sunday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TMonday: ")
			print_week_day (gc, gc.next_day (gc.Monday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TTuesday: ")
			print_week_day (gc, gc.next_day (gc.Tuesday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TWednesday: ")
			print_week_day (gc, gc.next_day (gc.Wednesday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TThursday: ")
			print_week_day (gc, gc.next_day (gc.Thursday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TFriday: ")
			print_week_day (gc, gc.next_day (gc.Friday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TSaturday: ")
			print_week_day (gc, gc.next_day (gc.Saturday), a_file)
			a_file.put_character ('%N')
		end

	test_previous_day (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `previous_day' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Previous week day:%N")
			a_file.put_string ("%TSunday: ")
			print_week_day (gc, gc.previous_day (gc.Sunday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TMonday: ")
			print_week_day (gc, gc.previous_day (gc.Monday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TTuesday: ")
			print_week_day (gc, gc.previous_day (gc.Tuesday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TWednesday: ")
			print_week_day (gc, gc.previous_day (gc.Wednesday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TThursday: ")
			print_week_day (gc, gc.previous_day (gc.Thursday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TFriday: ")
			print_week_day (gc, gc.previous_day (gc.Friday), a_file)
			a_file.put_character ('%N')
			a_file.put_string ("%TSaturday: ")
			print_week_day (gc, gc.previous_day (gc.Saturday), a_file)
			a_file.put_character ('%N')
		end

	test_epoch_days (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `epoch_days' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days since 1 Jan 1970:%N")
			a_file.put_string ("%T1 Jan 2000: ")
			a_file.put_integer (gc.epoch_days (2000, 1, 1))
			a_file.put_character ('%N')
			a_file.put_string ("%T1 Jan 1970: ")
			a_file.put_integer (gc.epoch_days (1970, 1, 1))
			a_file.put_character ('%N')
			a_file.put_string ("%T31 Dec 1970: ")
			a_file.put_integer (gc.epoch_days (1970, 12, 31))
			a_file.put_character ('%N')
			a_file.put_string ("%T31 Dec 1969: ")
			a_file.put_integer (gc.epoch_days (1969, 12, 31))
			a_file.put_character ('%N')
			a_file.put_string ("%T1 Jan 1969: ")
			a_file.put_integer (gc.epoch_days (1969, 1, 1))
			a_file.put_character ('%N')
		end

	test_months_in_year (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `months_in_year' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of months in a year: ")
			a_file.put_integer (gc.Months_in_year)
			a_file.put_character ('%N')
		end

	test_days_in_year (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_in_year' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days in a non-leap year: ")
			a_file.put_integer (gc.Days_in_year)
			a_file.put_character ('%N')
		end

	test_days_in_leap_year (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_in_leap_year' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days in a leap year: ")
			a_file.put_integer (gc.Days_in_leap_year)
			a_file.put_character ('%N')
		end

	test_month_numbers (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature month numbers of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Month numbers:%N")
			a_file.put_string ("%TJanuary: ")
			a_file.put_integer (gc.January)
			a_file.put_character ('%N')
			a_file.put_string ("%TFebruary: ")
			a_file.put_integer (gc.February)
			a_file.put_character ('%N')
			a_file.put_string ("%TMarch: ")
			a_file.put_integer (gc.March)
			a_file.put_character ('%N')
			a_file.put_string ("%TApril: ")
			a_file.put_integer (gc.April)
			a_file.put_character ('%N')
			a_file.put_string ("%TMay: ")
			a_file.put_integer (gc.May)
			a_file.put_character ('%N')
			a_file.put_string ("%TJune: ")
			a_file.put_integer (gc.June)
			a_file.put_character ('%N')
			a_file.put_string ("%TJuly: ")
			a_file.put_integer (gc.July)
			a_file.put_character ('%N')
			a_file.put_string ("%TAugust: ")
			a_file.put_integer (gc.August)
			a_file.put_character ('%N')
			a_file.put_string ("%TSeptember: ")
			a_file.put_integer (gc.September)
			a_file.put_character ('%N')
			a_file.put_string ("%TOctober: ")
			a_file.put_integer (gc.October)
			a_file.put_character ('%N')
			a_file.put_string ("%TNovember: ")
			a_file.put_integer (gc.November)
			a_file.put_character ('%N')
			a_file.put_string ("%TDecember: ")
			a_file.put_integer (gc.December)
			a_file.put_character ('%N')
		end

	test_days_in_week (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `days_in_week' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of days in a week: ")
			a_file.put_integer (gc.Days_in_week)
			a_file.put_character ('%N')
		end

	test_week_day_numbers (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature week day numbers of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Week day numbers:%N")
			a_file.put_string ("%TSunday: ")
			a_file.put_integer (gc.Sunday)
			a_file.put_character ('%N')
			a_file.put_string ("%TMonday: ")
			a_file.put_integer (gc.Monday)
			a_file.put_character ('%N')
			a_file.put_string ("%TTuesday: ")
			a_file.put_integer (gc.Tuesday)
			a_file.put_character ('%N')
			a_file.put_string ("%TWednesday: ")
			a_file.put_integer (gc.Wednesday)
			a_file.put_character ('%N')
			a_file.put_string ("%TThursday: ")
			a_file.put_integer (gc.Thursday)
			a_file.put_character ('%N')
			a_file.put_string ("%TFriday: ")
			a_file.put_integer (gc.Friday)
			a_file.put_character ('%N')
			a_file.put_string ("%TSaturday: ")
			a_file.put_integer (gc.Saturday)
			a_file.put_character ('%N')
		end

	test_seconds_in_minute (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `seconds_in_minute' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of seconds in a minute: ")
			a_file.put_integer (gc.Seconds_in_minute)
			a_file.put_character ('%N')
		end

	test_seconds_in_hour (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `seconds_in_hour' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of seconds in an hour: ")
			a_file.put_integer (gc.Seconds_in_hour)
			a_file.put_character ('%N')
		end

	test_seconds_in_day (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `seconds_in_day' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of seconds in a day: ")
			a_file.put_integer (gc.Seconds_in_day)
			a_file.put_character ('%N')
		end

	test_milliseconds_in_day (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `milliseconds_in_day' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of milliseconds in a day: ")
			a_file.put_integer (gc.Milliseconds_in_day)
			a_file.put_character ('%N')
		end

	test_minutes_in_hour (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `minutes_in_hour' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of minutes in an hour: ")
			a_file.put_integer (gc.Minutes_in_hour)
			a_file.put_character ('%N')
		end

	test_hours_in_day (gc: DT_GREGORIAN_CALENDAR; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `hours_in_day' of class DT_GREGORIAN_CALENDAR.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			a_file.put_string ("Number of hours in a day: ")
			a_file.put_integer (gc.Hours_in_day)
			a_file.put_character ('%N')
		end

feature {NONE} -- Implementation

	print_week_day (gc: DT_GREGORIAN_CALENDAR; d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of week day `d' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			gc_not_void: gc /= Void
		do
			if d = gc.Sunday then
				a_file.put_string ("Sunday")
			elseif d = gc.Monday then
				a_file.put_string ("Monday")
			elseif d = gc.Tuesday then
				a_file.put_string ("Tuesday")
			elseif d = gc.Wednesday then
				a_file.put_string ("Wednesday")
			elseif d = gc.Thursday then
				a_file.put_string ("Thursday")
			elseif d = gc.Friday then
				a_file.put_string ("Friday")
			elseif d = gc.Saturday then
				a_file.put_string ("Saturday")
			else
				a_file.put_string ("?? (")
				a_file.put_integer (d)
				a_file.put_character (')')
			end
		end

end -- class TESTER
