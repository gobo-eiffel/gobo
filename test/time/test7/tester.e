indexing

	description:

		"Test features of class DT_DATE_DURATION"

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
			dd1, dd2: DT_DATE_DURATION
			d: DT_DATE
		do
			!! dd1.make (4, 11, 4)
			!! dd2.make (4, 11, 4)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_is_equal (dd1, dd2, a_file)
			test_is_definite (dd1, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! dd2.make (4, 11, 12)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			test_is_equal (dd1, dd2, a_file)
			test_is_definite (dd2, a_file)
			test_to_date_time_duration (dd2, a_file)
			!! dd2.make (2, 8, 12)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			test_is_equal (dd1, dd2, a_file)
			test_is_definite (dd2, a_file)
			test_to_date_time_duration (dd2, a_file)
			!! dd2.make (-12, 8, -23)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			test_is_equal (dd1, dd2, a_file)
			test_is_definite (dd2, a_file)
			test_to_date_time_duration (dd2, a_file)
			!! dd1.make (0, 0, 4)
			!! d.make (2000, 1, 31)
			test_date (dd1, d, a_file)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! dd1.make (0, 0, 472)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! d.make (2000, 2, 29)
			!! dd1.make (0, 0, 30)
			test_date (dd1, d, a_file)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! dd1.make (0, 1, 2)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! d.make (2000, 2, 1)
			!! dd1.make (0, 1, 30)
			test_date (dd1, d, a_file)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! d.make (2000, 4, 30)
			!! dd1.make (0, 0, -30)
			test_date (dd1, d, a_file)
			test_is_definite (dd1, a_file)
			test_is_canonical (dd1, d, a_file)
			test_to_definite (dd1, d, a_file)
			test_to_canonical (dd1, d, a_file)
			test_to_date_time_duration (dd1, a_file)
			!! dd1.make (2, 8, 30)
			test_set_year_month_day (dd1, 10, 3, 23, a_file)
			test_set_year (dd1, -4, a_file)
			test_set_month (dd1, 16, a_file)
			test_set_day (dd1, 0, a_file)
			test_add_years_months_days (dd1, 10, 3, 23, a_file)
			test_add_years (dd1, -4, a_file)
			test_add_months (dd1, 16, a_file)
			test_add_days (dd1, 0, a_file)
			!! dd1.make (2, 0, 30)
			!! dd2.make (1, 12, 30)
			test_is_equal (dd1, dd2, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			!! dd2.make (1, 12, 12)
			test_is_equal (dd1, dd2, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
		end

	test_date (dd: DT_DATE_DURATION; d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").date (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string (dd.date (d).out)
			a_file.put_character ('%N')
		end

	test_infix_plus (d1, d2: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_DATE_DURATION.
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

	test_infix_minus (d1, d2: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_DATE_DURATION.
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

	test_prefix_plus (d: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "+"' of class DT_DATE_DURATION.
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

	test_prefix_minus (d: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "-"' of class DT_DATE_DURATION.
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

	test_infix_less (d1, d2: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_DATE_DURATION.
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

	test_is_equal (d1, d2: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_equal' of class DT_DATE_DURATION.
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

	test_is_definite (d: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_definite' of class DT_DATE_DURATION.
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

	test_is_canonical (dd: DT_DATE_DURATION; d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_canonical' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").is_canonical (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			if dd.is_canonical (d) then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_to_definite (dd: DT_DATE_DURATION; d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_definite' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").to_definite (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string (dd.to_definite (d).out)
			a_file.put_character ('%N')
		end

	test_to_canonical (dd: DT_DATE_DURATION; d: DT_DATE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_canonical' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").to_canonical (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string (dd.to_canonical (d).out)
			a_file.put_character ('%N')
		end

	test_to_date_time_duration (dd: DT_DATE_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_date_time_duration' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").to_date_time_duration: ")
			a_file.put_string (dd.to_date_time_duration.out)
			a_file.put_character ('%N')
		end

	test_set_year_month_day (dd: DT_DATE_DURATION; y, m, d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year_month_day' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").set_year_month_day (")
			a_file.put_integer (y)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dd.set_year_month_day (y, m, d)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_set_year (dd: DT_DATE_DURATION; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_year' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").set_year (")
			a_file.put_integer (y)
			a_file.put_string ("): ")
			dd.set_year (y)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_set_month (dd: DT_DATE_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_month' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").set_month (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			dd.set_month (m)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_set_day (dd: DT_DATE_DURATION; d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_day' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").set_day (")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dd.set_day (d)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_add_years_months_days (dd: DT_DATE_DURATION; y, m, d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years_months_days' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").add_years_months_days (")
			a_file.put_integer (y)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dd.add_years_months_days (y, m, d)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_add_years (dd: DT_DATE_DURATION; y: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_years' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").add_years (")
			a_file.put_integer (y)
			a_file.put_string ("): ")
			dd.add_years (y)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_add_months (dd: DT_DATE_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_months' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").add_months (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			dd.add_months (m)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

	test_add_days (dd: DT_DATE_DURATION; d: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_days' of class DT_DATE_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dd_not_void: dd /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (dd.out)
			a_file.put_string (").add_days (")
			a_file.put_integer (d)
			a_file.put_string ("): ")
			dd.add_days (d)
			a_file.put_string (dd.out)
			a_file.put_character ('%N')
		end

end -- class TESTER
