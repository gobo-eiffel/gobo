indexing

	description:

		"Test features of class DT_DATE_VALUE"

	library:    "Gobo Eiffel Time Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TESTER

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
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
			-- Test features of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			d: DT_DATE
			dd: DT_DATE_DURATION
			dt: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			!! d.make (2000, 3, 24)
			a_file.put_string ("DT_DATE 2000/03/24:%N")
			test_year_month_day (d, a_file)
			test_out (d, a_file)
			test_date_out (d, a_file)
			test_append_to_string (d, a_file)
			test_append_date_to_string (d, a_file)
			!! d.make (-50, 12, 4)
			a_file.put_string ("DT_DATE -50/12/04:%N")
			test_year_month_day (d, a_file)
			test_out (d, a_file)
			test_date_out (d, a_file)
			test_append_to_string (d, a_file)
			test_append_date_to_string (d, a_file)
			!! dd.make (10, 5, 58)
			a_file.put_string ("DT_DATE_DURATION 10/5/58:%N")
			test_year_month_day (dd, a_file)
			test_out (dd, a_file)
			test_date_out (dd, a_file)
			test_append_to_string (dd, a_file)
			test_append_date_to_string (dd, a_file)
			!! dd.make (-2, 40, -23)
			a_file.put_string ("DT_DATE_DURATION -2/40/-23:%N")
			test_year_month_day (dd, a_file)
			test_out (dd, a_file)
			test_date_out (dd, a_file)
			test_append_to_string (dd, a_file)
			test_append_date_to_string (dd, a_file)
			!! dt.make_precise (1967, 5, 17, 6, 30, 15, 123)
			a_file.put_string ("DT_DATE_TIME 1967/05/17 6:30:15.123:%N")
			test_year_month_day (dt, a_file)
			test_out (dt, a_file)
			test_date_out (dt, a_file)
			test_append_to_string (dt, a_file)
			test_append_date_to_string (dt, a_file)
			!! dt.make_precise (-156, 8, 16, 23, 12, 3, 2)
			a_file.put_string ("DT_DATE_TIME -156/08/16 23:12:03.002:%N")
			test_year_month_day (dt, a_file)
			test_out (dt, a_file)
			test_date_out (dt, a_file)
			test_append_to_string (dt, a_file)
			test_append_date_to_string (dt, a_file)
			!! dtd.make_precise (3, -12, 123, 23, -3, 12, -45)
			a_file.put_string ("DT_DATE_TIME_DURATION 3/-12/123 23:-3:12.-45:%N")
			test_year_month_day (dtd, a_file)
			test_out (dtd, a_file)
			test_date_out (dtd, a_file)
			test_append_to_string (dtd, a_file)
			test_append_date_to_string (dtd, a_file)
			!! dtd.make_precise (0, 3, 2, 0, 4, 3, 456) 
			a_file.put_string ("DT_DATE_TIME_DURATION 0/3/2 0:4:3.456:%N")
			test_year_month_day (dtd, a_file)
			test_out (dtd, a_file)
			test_date_out (dtd, a_file)
			test_append_to_string (dtd, a_file)
			test_append_date_to_string (dtd, a_file)
		end

	test_year_month_day (dv: DT_DATE_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `year', `month' and `day' of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dv_not_void: dv /= Void
		do
			a_file.put_string ("%Tyear: ")
			a_file.put_integer (dv.year)
			a_file.put_character ('%N')
			a_file.put_string ("%Tmonth: ")
			a_file.put_integer (dv.month)
			a_file.put_character ('%N')
			a_file.put_string ("%Tday: ")
			a_file.put_integer (dv.day)
			a_file.put_character ('%N')
		end

	test_out (dv: DT_DATE_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `out' of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dv_not_void: dv /= Void
		do
			a_file.put_string ("%Tout: ")
			a_file.put_string (dv.out)
			a_file.put_character ('%N')
		end

	test_date_out (dv: DT_DATE_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date_out' of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dv_not_void: dv /= Void
		do
			a_file.put_string ("%Tdate_out: ")
			a_file.put_string (dv.date_out)
			a_file.put_character ('%N')
		end

	test_append_to_string (dv: DT_DATE_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `append_to_string' of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dv_not_void: dv /= Void
		local
			a_string: STRING
		do
			a_string := STRING_.make (50)
			dv.append_to_string (a_string)
			a_file.put_string ("%Tappend_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
		end

	test_append_date_to_string (dv: DT_DATE_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `append_date_to_string' of class DT_DATE_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dv_not_void: dv /= Void
		local
			a_string: STRING
		do
			a_string := STRING_.make (50)
			dv.append_date_to_string (a_string)
			a_file.put_string ("%Tappend_date_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
		end

end -- class TESTER
