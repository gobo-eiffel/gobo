indexing

	description:

		"Test features of class DT_DATE"

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
			-- Test features of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			d1, d2: DT_DATE
			dd: DT_DATE_DURATION
		do
			!! d1.make (2000, 3, 24)
			!! d2.make (2000, 3, 24)
			test_infix_minus (d1, d2, a_file)
			test_duration (d1, d2, a_file)
			test_date_duration (d1, d2, a_file)
			test_canonical_duration (d1, d2, a_file)
			test_infix_less (d1, d2, a_file)
			!! d2.make (2001, 11, 3)
			test_infix_minus (d1, d2, a_file)
			test_duration (d1, d2, a_file)
			test_date_duration (d1, d2, a_file)
			test_canonical_duration (d1, d2, a_file)
			test_infix_less (d1, d2, a_file)
			test_infix_minus (d2, d1, a_file)
			test_duration (d2, d1, a_file)
			test_date_duration (d2, d1, a_file)
			test_canonical_duration (d2, d1, a_file)
			test_infix_less (d2, d1, a_file)

			!! d1.make (2000, 3, 24)
			!! dd.make (12, 4, 31)
			test_infix_plus (d1, dd, a_file)
			test_infix_ampersand_d (d1, dd, a_file)
			test_add_duration (d1, dd, a_file)
			test_add_date_duration (d1, dd, a_file)
			!! d1.make (2000, 3, 24)
			!! dd.make (-4, -2, -12)
			test_infix_plus (d1, dd, a_file)
			test_infix_ampersand_d (d1, dd, a_file)
			test_add_duration (d1, dd, a_file)
			test_add_date_duration (d1, dd, a_file)

			!! d1.make (1970, 1, 1)
			test_week_day (d1, a_file)
			test_year_day (d1, a_file)
			test_day_count (d1, a_file)
			!! d1.make (2000, 3, 31)
			test_week_day (d1, a_file)
			test_year_day (d1, a_file)
			test_day_count (d1, a_file)
			!! d1.make (1968, 2, 24)
			test_week_day (d1, a_file)
			test_year_day (d1, a_file)
			test_day_count (d1, a_file)

			!! d1.make (2000, 4, 30)
			!! d2.make (2000, 5, 31)
			test_duration (d1, d2, a_file)
			test_date_duration (d1, d2, a_file)
			test_canonical_duration (d1, d2, a_file)
			test_duration (d2, d1, a_file)
			test_date_duration (d2, d1, a_file)
			test_canonical_duration (d2, d1, a_file)
			!! d1.make (2000, 5, 29)
			!! d2.make (2000, 1, 31)
			test_duration (d1, d2, a_file)
			test_date_duration (d1, d2, a_file)
			test_canonical_duration (d1, d2, a_file)
			test_duration (d2, d1, a_file)
			test_date_duration (d2, d1, a_file)
			test_canonical_duration (d2, d1, a_file)

			!! d1.make (2000, 1, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 2, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 3, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 4, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 5, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 6, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 7, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 8, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 9, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 10, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 11, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2000, 12, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 1, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 2, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 3, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 4, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 5, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 6, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 7, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 8, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 9, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 10, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 11, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2001, 12, 2)
			test_days_in_month (d1, a_file)
			!! d1.make (2002, 1, 2)
			test_days_in_month (d1, a_file)

			!! d1.make (2000, 1, 2)
			test_is_leap_year (d1, a_file)
			!! d1.make (2001, 1, 2)
			test_is_leap_year (d1, a_file)
			!! d1.make (1900, 1, 2)
			test_is_leap_year (d1, a_file)
			!! d1.make (1996, 1, 2)
			test_is_leap_year (d1, a_file)
			!! d1.make (1999, 1, 2)
			test_is_leap_year (d1, a_file)

			!! d1.make (2000, 4, 1)
			test_set_year_month_day (d1, 2000, 5, 17, a_file)
			test_set_year (d1, 1998, a_file)
			test_set_month (d1, 11, a_file)
			test_set_day (d1, 23, a_file)
			test_add_years_months_days (d1, 2, 3, 25, a_file)
			test_add_years (d1, 5, a_file)
			test_add_months (d1, -2, a_file)
			test_add_days (d1, -13, a_file)
			!! d1.make (2000, 2, 29)
			test_add_years (d1, 1, a_file)
			!! d1.make (2000, 5, 31)
			test_add_months (d1, -1, a_file)
			test_set_day_count (d1, 0, a_file)
			test_set_day_count (d1, 11055, a_file)
			test_set_day_count (d1, 11688, a_file)
		end

	test_infix_minus (d1, d2: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (") - (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			a_file.put_string ((d1 - d2).out)
			a_file.put_character ('%N')
		end

	test_duration (d1, d2: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `duration' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (").duration (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			a_file.put_string (d1.duration (d2).out)
			a_file.put_character ('%N')
		end

	test_canonical_duration (d1, d2: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `canonical_duration' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (").canonical_duration (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			a_file.put_string (d1.canonical_duration (d2).out)
			a_file.put_character ('%N')
		end

	test_date_duration (d1, d2: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date_duration' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (").date_duration (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			a_file.put_string (d1.date_duration (d2).out)
			a_file.put_character ('%N')
		end

	test_infix_plus (d: DT_DATE; dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (") + (")
			a_file.put_string (dd.out)
			a_file.put_string ("): ")
			a_file.put_string ((d + dd).out)
			a_file.put_character ('%N')
		end

	test_infix_ampersand_d (d: DT_DATE; dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "&d"' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (") &d (")
			a_file.put_string (dd.out)
			a_file.put_string ("): ")
			a_file.put_string ((d &d dd).out)
			a_file.put_character ('%N')
		end

	test_add_duration (d: DT_DATE; dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_duration' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_duration (")
			a_file.put_string (dd.out)
			a_file.put_string ("): ")
			d.add_duration (dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_date_duration (d: DT_DATE; dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_date_duration' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_date_duration (")
			a_file.put_string (dd.out)
			a_file.put_string ("): ")
			d.add_date_duration (dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_infix_less (d1, d2: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (") < (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			if d1 < d2 then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_week_day (d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `week_day' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").week_day: ")
			print_week_day (d.week_day, a_file)
			a_file.put_character ('%N')
		end

	test_year_day (d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `year_day' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").year_day: ")
			a_file.put_integer (d.year_day)
			a_file.put_character ('%N')
		end

	test_day_count (d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `day_count' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").day_count: ")
			a_file.put_integer (d.day_count)
			a_file.put_character ('%N')
		end

	test_days_in_month (d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `days_in_current_month' and
			-- `days_in_previous_month' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").days_in_current_month: ")
			a_file.put_integer (d.days_in_current_month)
			a_file.put_character ('%N')
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").days_in_previous_month: ")
			a_file.put_integer (d.days_in_previous_month)
			a_file.put_character ('%N')
		end

	test_is_leap_year (d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_leap_year' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").is_leap_year: ")
			if d.is_leap_year then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_set_year_month_day (d: DT_DATE; yy, mm, dd: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year_month_day' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_year_month_day (")
			a_file.put_integer (yy)
			a_file.put_string (", ")
			a_file.put_integer (mm)
			a_file.put_string (", ")
			a_file.put_integer (dd)
			a_file.put_string ("): ")
			d.set_year_month_day (yy, mm, dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_year (d: DT_DATE; yy: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_year (")
			a_file.put_integer (yy)
			a_file.put_string ("): ")
			d.set_year (yy)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_month (d: DT_DATE; mm: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_month' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_month (")
			a_file.put_integer (mm)
			a_file.put_string ("): ")
			d.set_month (mm)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_day (d: DT_DATE; dd: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_day' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_day (")
			a_file.put_integer (dd)
			a_file.put_string ("): ")
			d.set_day (dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_day_count (d: DT_DATE; dd: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_day_count' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_day_count (")
			a_file.put_integer (dd)
			a_file.put_string ("): ")
			d.set_day_count (dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_years_months_days (d: DT_DATE; yy, mm, dd: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years_months_days' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_years_months_days (")
			a_file.put_integer (yy)
			a_file.put_string (", ")
			a_file.put_integer (mm)
			a_file.put_string (", ")
			a_file.put_integer (dd)
			a_file.put_string ("): ")
			d.add_years_months_days (yy, mm, dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_years (d: DT_DATE; yy: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_years (")
			a_file.put_integer (yy)
			a_file.put_string ("): ")
			d.add_years (yy)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_months (d: DT_DATE; mm: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_months' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_months (")
			a_file.put_integer (mm)
			a_file.put_string ("): ")
			d.add_months (mm)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_days (d: DT_DATE; dd: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_days' of class DT_DATE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_days (")
			a_file.put_integer (dd)
			a_file.put_string ("): ")
			d.add_days (dd)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

feature {NONE} -- Implementation

	print_week_day (d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of week day `d' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			gc: DT_GREGORIAN_CALENDAR
		do
			!! gc
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
