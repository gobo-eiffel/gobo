indexing

	description:

		"Test features of class DT_DATE_TIME_VALUE"

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
			-- Test features of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			dt: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			!! dt.make_precise (1967, 5, 17, 6, 30, 15, 123)
			a_file.put_string ("DT_DATE_TIME 1967/05/17 6:30:15.123:%N")
			test_year_month_day (dt, a_file)
			test_hour_minute_second_millisecond (dt, a_file)
			test_date_time (dt, a_file)
			test_out (dt, a_file)
			test_date_out (dt, a_file)
			test_time_out (dt, a_file)
			test_append_to_string (dt, a_file)
			test_append_date_to_string (dt, a_file)
			test_append_time_to_string (dt, a_file)
			!! dt.make_precise (-156, 8, 16, 23, 12, 3, 2)
			a_file.put_string ("DT_DATE_TIME -156/08/16 23:12:03.002:%N")
			test_year_month_day (dt, a_file)
			test_hour_minute_second_millisecond (dt, a_file)
			test_date_time (dt, a_file)
			test_out (dt, a_file)
			test_date_out (dt, a_file)
			test_time_out (dt, a_file)
			test_append_to_string (dt, a_file)
			test_append_date_to_string (dt, a_file)
			test_append_time_to_string (dt, a_file)
			!! dtd.make_precise (3, -12, 123, 23, -3, 12, -45)
			a_file.put_string ("DT_DATE_TIME_DURATION 3/-12/123 23:-3:12.-45:%N")
			test_year_month_day (dtd, a_file)
			test_hour_minute_second_millisecond (dtd, a_file)
			test_date_time (dtd, a_file)
			test_out (dtd, a_file)
			test_date_out (dtd, a_file)
			test_time_out (dtd, a_file)
			test_append_to_string (dtd, a_file)
			test_append_date_to_string (dtd, a_file)
			test_append_time_to_string (dtd, a_file)
			!! dtd.make_precise (0, 3, 2, 0, 4, 3, 456) 
			a_file.put_string ("DT_DATE_TIME_DURATION 0/3/2 0:4:3.456:%N")
			test_year_month_day (dtd, a_file)
			test_hour_minute_second_millisecond (dtd, a_file)
			test_date_time (dtd, a_file)
			test_out (dtd, a_file)
			test_date_out (dtd, a_file)
			test_time_out (dtd, a_file)
			test_append_to_string (dtd, a_file)
			test_append_date_to_string (dtd, a_file)
			test_append_time_to_string (dtd, a_file)
		end

	test_year_month_day (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `year', `month' and `day' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Tyear: ")
			a_file.put_integer (dtv.year)
			a_file.put_character ('%N')
			a_file.put_string ("%Tmonth: ")
			a_file.put_integer (dtv.month)
			a_file.put_character ('%N')
			a_file.put_string ("%Tday: ")
			a_file.put_integer (dtv.day)
			a_file.put_character ('%N')
		end

	test_hour_minute_second_millisecond (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `hour', `minute', `second' and
			-- `millisecond' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Thour: ")
			a_file.put_integer (dtv.hour)
			a_file.put_character ('%N')
			a_file.put_string ("%Tminute: ")
			a_file.put_integer (dtv.minute)
			a_file.put_character ('%N')
			a_file.put_string ("%Tsecond: ")
			a_file.put_integer (dtv.second)
			a_file.put_character ('%N')
			a_file.put_string ("%Tmillisecond: ")
			a_file.put_integer (dtv.millisecond)
			a_file.put_character ('%N')
		end

	test_date_time (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `date' and `time' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Tdate: ")
			a_file.put_string (dtv.date.out)
			a_file.put_character ('%N')
			a_file.put_string ("%Ttime: ")
			a_file.put_string (dtv.time.out)
			a_file.put_character ('%N')
		end

	test_out (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `out' and `precise_out' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Tout: ")
			a_file.put_string (dtv.out)
			a_file.put_character ('%N')
			a_file.put_string ("%Tprecise_out: ")
			a_file.put_string (dtv.precise_out)
			a_file.put_character ('%N')
		end

	test_date_out (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `date_out' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Tdate_out: ")
			a_file.put_string (dtv.date_out)
			a_file.put_character ('%N')
		end

	test_time_out (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `time_out' and `precise_time_out' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		do
			a_file.put_string ("%Ttime_out: ")
			a_file.put_string (dtv.time_out)
			a_file.put_character ('%N')
			a_file.put_string ("%Tprecise_time_out: ")
			a_file.put_string (dtv.precise_time_out)
			a_file.put_character ('%N')
		end

	test_append_to_string (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `append_to_string' and
			-- `append_precise_to_string' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		local
			a_string: STRING
		do
			a_string := STRING_.make (50)
			dtv.append_to_string (a_string)
			a_file.put_string ("%Tappend_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
			a_string := STRING_.make (50)
			dtv.append_precise_to_string (a_string)
			a_file.put_string ("%Tappend_precise_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
		end

	test_append_date_to_string (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `append_date_to_string' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		local
			a_string: STRING
		do
			a_string := STRING_.make (50)
			dtv.append_date_to_string (a_string)
			a_file.put_string ("%Tappend_date_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
		end

	test_append_time_to_string (dtv: DT_DATE_TIME_VALUE; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `append_time_to_string' and 
			-- `append_precise_time_to_string' of class DT_DATE_TIME_VALUE.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			dtv_not_void: dtv /= Void
		local
			a_string: STRING
		do
			a_string := STRING_.make (50)
			dtv.append_time_to_string (a_string)
			a_file.put_string ("%Tappend_time_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
			a_string := STRING_.make (50)
			dtv.append_precise_time_to_string (a_string)
			a_file.put_string ("%Tappend_precise_time_to_string: ")
			a_file.put_string (a_string)
			a_file.put_character ('%N')
		end

end -- class TESTER
