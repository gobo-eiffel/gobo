indexing

	description:

		"Test features of class DT_DATE_TIME_DURATION"

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
			-- Test features of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			dtd1, dtd2: DT_DATE_TIME_DURATION
			dd: DT_DATE_DURATION
			td: DT_TIME_DURATION
			dt: DT_DATE_TIME
		do
			!! dtd1.make (4, 11, 4, 20, 5, 21)
			!! dtd2.make (4, 11, 4, 20, 5, 21)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_is_equal (dtd1, dtd2, a_file)
			test_is_definite (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			test_second_count (dtd1, a_file)
			test_date_duration (dtd1, a_file)
			test_time_duration (dtd1, a_file)
			!! dtd2.make_precise (4, 11, 12, 5, 45, 32, 653)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			test_is_equal (dtd1, dtd2, a_file)
			test_is_definite (dtd2, a_file)
			test_date_to_date_time_duration (dtd2, a_file)
			test_time_to_date_time_duration (dtd2, a_file)
			test_second_count (dtd2, a_file)
			!! dtd2.make (2, 8, 12, 3, 12, 3)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			test_is_equal (dtd1, dtd2, a_file)
			test_is_definite (dtd2, a_file)
			test_date_to_date_time_duration (dtd2, a_file)
			test_time_to_date_time_duration (dtd2, a_file)
			test_second_count (dtd2, a_file)
			!! dtd2.make_precise (-12, 8, -23, 23, 2, -34, 43)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			test_is_equal (dtd1, dtd2, a_file)
			test_is_definite (dtd2, a_file)
			test_date_to_date_time_duration (dtd2, a_file)
			test_time_to_date_time_duration (dtd2, a_file)
			test_second_count (dtd2, a_file)

			!! dtd1.make (0, 0, 4, 2, 53, 3)
			!! dt.make (2000, 1, 31, 15, 23, 45)
			test_date_time (dtd1, dt, a_file)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			!! dtd1.make (0, 0, 472, 45, 6, 1)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			!! dt.make (2000, 2, 29, 12, 44, 3)
			!! dtd1.make (0, 0, 30, 2, 4, 12)
			test_date_time (dtd1, dt, a_file)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			!! dtd1.make (0, 1, 2, 12, 3, 12)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			!! dt.make (2000, 2, 1, 6, 32, 12)
			!! dtd1.make (0, 1, 30, 10, 20, 3)
			test_date_time (dtd1, dt, a_file)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)
			!! dt.make (2000, 4, 30, 20, 25, 4)
			!! dtd1.make (0, 0, -30, 0, 3, 0)
			test_date_time (dtd1, dt, a_file)
			test_is_definite (dtd1, a_file)
			test_is_canonical (dtd1, dt, a_file)
			test_is_time_canonical (dtd1, a_file)
			test_to_definite (dtd1, dt, a_file)
			test_to_canonical (dtd1, dt, a_file)
			test_to_time_canonical (dtd1, a_file)
			test_date_to_date_time_duration (dtd1, a_file)
			test_time_to_date_time_duration (dtd1, a_file)

			!! dtd1.make (2, 8, 30, 2, 12, 43)
			test_set_year_month_day (dtd1, 10, 3, 23, a_file)
			test_set_year (dtd1, -4, a_file)
			test_set_month (dtd1, 16, a_file)
			test_set_day (dtd1, 0, a_file)
			test_set_hour_minute_second (dtd1, 4, 23, 56, a_file)
			test_set_precise_hour_minute_second (dtd1, -6, 12, 8, 28, a_file)
			test_set_hour (dtd1, 14, a_file)
			test_set_minute (dtd1, 15, a_file)
			test_set_second (dtd1, 30, a_file)
			test_set_millisecond (dtd1, 999, a_file)
			test_add_years_months_days (dtd1, 10, 3, 23, a_file)
			test_add_years (dtd1, -4, a_file)
			test_add_months (dtd1, 16, a_file)
			test_add_days (dtd1, 0, a_file)
			test_add_hours_minutes_seconds (dtd1, 4, 23, 56, a_file)
			test_add_precise_hours_minutes_seconds (dtd1, -6, 12, 8, 28, a_file)
			test_add_hours (dtd1, 14, a_file)
			test_add_minutes (dtd1, 15, a_file)
			test_add_seconds (dtd1, 30, a_file)
			test_add_milliseconds (dtd1, 999, a_file)
			!! dd.make (12, 43, 5)
			test_set_date_duration (dtd1, dd, a_file)
			!! td.make_precise (10, 12, 21, 89)
			test_set_time_duration (dtd1, td, a_file)

			!! dtd1.make (2, 0, 30, 20, 2, 12)
			!! dtd2.make (1, 12, 30, 20, 2, 12)
			test_is_equal (dtd1, dtd2, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			!! dtd2.make (1, 12, 12, 20, 2, 12)
			test_is_equal (dtd1, dtd2, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
		end

	test_date_time (dtd: DT_DATE_TIME_DURATION; dt: DT_DATE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date_time' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			dt_not_void: dt /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").date_time (")
			a_file.put_string (dt.out)
			a_file.put_string ("): ")
			a_file.put_string (dtd.date_time (dt).out)
			a_file.put_character ('%N')
		end

	test_infix_plus (d1, d2: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (") + (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			a_file.put_string ((d1 + d2).out)
			a_file.put_character ('%N')
		end

	test_infix_minus (d1, d2: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_DATE_TIME_DURATION.
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

	test_prefix_plus (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "+"' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T+(")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string ((+d).out)
			a_file.put_character ('%N')
		end

	test_prefix_minus (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "-"' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T-(")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string ((-d).out)
			a_file.put_character ('%N')
		end

	test_infix_less (d1, d2: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_DATE_TIME_DURATION.
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

	test_is_equal (d1, d2: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_equal' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d1_not_void: d1 /= Void
			d2_not_void: d2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d1.out)
			a_file.put_string (").is_equal (")
			a_file.put_string (d2.out)
			a_file.put_string ("): ")
			if d1.is_equal (d2) then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_is_definite (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_definite' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").is_definite: ")
			if d.is_definite then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_is_canonical (dtd: DT_DATE_TIME_DURATION; dt: DT_DATE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_canonical' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			dt_not_void: dt /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").is_canonical (")
			a_file.put_string (dt.out)
			a_file.put_string ("): ")
			if dtd.is_canonical (dt) then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_is_time_canonical (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_time_canonical' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").is_time_canonical: ")
			if d.is_time_canonical then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_second_count (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `second_count' and
			-- `millisecond_count' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").second_count: ")
			a_file.put_integer (d.second_count)
			a_file.put_character ('%N')
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").millisecond_count: ")
			a_file.put_integer (d.millisecond_count)
			a_file.put_character ('%N')
		end

	test_date_duration (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").date_duration: ")
			a_file.put_string (d.date_duration.out)
			a_file.put_character ('%N')
		end

	test_time_duration (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `time_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").time_duration: ")
			a_file.put_string (d.time_duration.out)
			a_file.put_character ('%N')
		end

	test_to_definite (dtd: DT_DATE_TIME_DURATION; dt: DT_DATE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_definite' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			dt_not_void: dt /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").to_definite (")
			a_file.put_string (dt.out)
			a_file.put_string ("): ")
			a_file.put_string (dtd.to_definite (dt).out)
			a_file.put_character ('%N')
		end

	test_to_canonical (dtd: DT_DATE_TIME_DURATION; dt: DT_DATE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_canonical' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			dt_not_void: dt /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").to_canonical (")
			a_file.put_string (dt.out)
			a_file.put_string ("): ")
			a_file.put_string (dtd.to_canonical (dt).out)
			a_file.put_character ('%N')
		end

	test_to_time_canonical (dtd: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_time_canonical' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").to_time_canonical: ")
			a_file.put_string (dtd.to_time_canonical.out)
			a_file.put_character ('%N')
		end

	test_date_to_date_time_duration (dtd: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_date_time_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").date_to_date_time_duration: ")
			a_file.put_string (dtd.date_to_date_time_duration.out)
			a_file.put_character ('%N')
		end

	test_time_to_date_time_duration (d: DT_DATE_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `time_to_date_time_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").time_to_date_time_duration: ")
			a_file.put_string (d.time_to_date_time_duration.out)
			a_file.put_character ('%N')
		end

	test_set_year_month_day (dtd: DT_DATE_TIME_DURATION; y, m, d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year_month_day' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_year_month_day (")
			a_file.put_integer (y)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dtd.set_year_month_day (y, m, d)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_set_year (dtd: DT_DATE_TIME_DURATION; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_year (")
			a_file.put_integer (y)
			a_file.put_string ("): ")
			dtd.set_year (y)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_set_month (dtd: DT_DATE_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_month' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_month (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			dtd.set_month (m)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_set_day (dtd: DT_DATE_TIME_DURATION; d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_day' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_day (")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dtd.set_day (d)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_set_hour_minute_second (d: DT_DATE_TIME_DURATION; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour_minute_second' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_hour_minute_second (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			d.set_hour_minute_second (h, m, s)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_precise_hour_minute_second (d: DT_DATE_TIME_DURATION; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_precise_hour_minute_second' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_precise_hour_minute_second (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string (", ")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			d.set_precise_hour_minute_second (h, m, s, ms)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_hour (d: DT_DATE_TIME_DURATION; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_hour (")
			a_file.put_integer (h)
			a_file.put_string ("): ")
			d.set_hour (h)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_minute (d: DT_DATE_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_minute' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_minute (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			d.set_minute (m)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_second (d: DT_DATE_TIME_DURATION; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_second' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_second (")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			d.set_second (s)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_millisecond (d: DT_DATE_TIME_DURATION; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_millisecond' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").set_millisecond (")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			d.set_millisecond (ms)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_set_date_duration (dtd: DT_DATE_TIME_DURATION; dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_date_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_date_duration (")
			a_file.put_string (dd.out)
			a_file.put_string ("): ")
			dtd.set_date_duration (dd)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_set_time_duration (dtd: DT_DATE_TIME_DURATION; td: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_time_duration' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
			td_not_void: td /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").set_time_duration (")
			a_file.put_string (td.out)
			a_file.put_string ("): ")
			dtd.set_time_duration (td)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_add_years_months_days (dtd: DT_DATE_TIME_DURATION; y, m, d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years_months_days' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").add_years_months_days (")
			a_file.put_integer (y)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dtd.add_years_months_days (y, m, d)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_add_years (dtd: DT_DATE_TIME_DURATION; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").add_years (")
			a_file.put_integer (y)
			a_file.put_string ("): ")
			dtd.add_years (y)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_add_months (dtd: DT_DATE_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_months' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").add_months (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			dtd.add_months (m)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_add_days (dtd: DT_DATE_TIME_DURATION; d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_days' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtd_not_void: dtd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dtd.out)
			a_file.put_string (").add_days (")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dtd.add_days (d)
			a_file.put_string (dtd.out)
			a_file.put_character ('%N')
		end

	test_add_hours_minutes_seconds (d: DT_DATE_TIME_DURATION; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours_minutes_seconds' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_hours_minutes_seconds (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			d.add_hours_minutes_seconds (h, m, s)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_precise_hours_minutes_seconds (d: DT_DATE_TIME_DURATION; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_precise_hours_minutes_seconds' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_precise_hours_minutes_seconds (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string (", ")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			d.add_precise_hours_minutes_seconds (h, m, s, ms)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_hours (d: DT_DATE_TIME_DURATION; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_hours (")
			a_file.put_integer (h)
			a_file.put_string ("): ")
			d.add_hours (h)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_minutes (d: DT_DATE_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_minutes' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_minutes (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			d.add_minutes (m)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_seconds (d: DT_DATE_TIME_DURATION; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_seconds' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_seconds (")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			d.add_seconds (s)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

	test_add_milliseconds (d: DT_DATE_TIME_DURATION; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_milliseconds' of class DT_DATE_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").add_milliseconds (")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			d.add_milliseconds (ms)
			a_file.put_string (d.out)
			a_file.put_character ('%N')
		end

end -- class TESTER
