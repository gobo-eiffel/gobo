indexing

	description:

		"Test features of class DT_TIME_DURATION"

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
			-- Test features of class DT_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			td1, td2: DT_TIME_DURATION
			t: DT_TIME
		do
			!! t.make_precise (14, 23, 54, 583)
			!! td1.make_precise (4, 11, 4, 543)
			!! td2.make_precise (4, 11, 4, 543)
			test_time (td1, t, a_file)
			test_to_date_time_duration (td1, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			test_is_equal (td1, td2, a_file)
			!! td2.make_precise (4, 11, 12, 754)
			test_time (td2, t, a_file)
			test_infix_less (td1, td2, a_file)
			test_is_equal (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)
			!! td2.make_precise (2, 8, 12, 0)
			test_time (td2, t, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			test_is_equal (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)
			!! td2.make_precise (-12, 8, -23, 2)
			test_time (td2, t, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			test_is_equal (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)

			!! td1.make (2, 30, 2)
			!! td2.make (3, -30, 2)
			test_is_equal (td1, td2, a_file)

			!! td1.make_precise (0, 0, 0, 675452089)
			test_to_canonical (td1, a_file)
			!! td1.make_precise_canonical (675452089)
			test_is_canonical (td1, a_file)
			test_to_canonical (td1, a_file)
			test_second_count (td1, a_file)
			!! td1.make (0, 0, -45638)
			test_to_canonical (td1, a_file)
			!! td1.make_canonical (-45638)
			test_is_canonical (td1, a_file)
			test_to_canonical (td1, a_file)
			test_second_count (td1, a_file)
			!! td1.make (12, 60, -2)
			test_is_canonical (td1, a_file)
			test_to_canonical (td1, a_file)
			test_second_count (td1, a_file)

			!! td1.make_precise (12, 3, 24, 235)
			test_set_hour_minute_second (td1, 4, 23, 56, a_file)
			test_set_precise_hour_minute_second (td1, -6, 12, 8, 28, a_file)
			test_set_hour (td1, 14, a_file)
			test_set_minute (td1, 15, a_file)
			test_set_second (td1, 30, a_file)
			test_set_millisecond (td1, 999, a_file)
			test_add_hours_minutes_seconds (td1, 4, 23, 56, a_file)
			test_add_precise_hours_minutes_seconds (td1, -6, 12, 8, 28, a_file)
			test_add_hours (td1, 14, a_file)
			test_add_minutes (td1, 15, a_file)
			test_add_seconds (td1, 30, a_file)
			test_add_milliseconds (td1, 999, a_file)
		end

	test_time (td: DT_TIME_DURATION; t: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `time' of class DT_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			td_not_void: td /= Void
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (td.out)
			a_file.put_string (").time (")
			a_file.put_string (t.out)
			a_file.put_string ("): ")
			a_file.put_string (td.time (t).out)
			a_file.put_character ('%N')
		end

	test_infix_plus (d1, d2: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_TIME_DURATION.
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

	test_infix_minus (d1, d2: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_TIME_DURATION.
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

	test_prefix_plus (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "+"' of class DT_TIME_DURATION.
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

	test_prefix_minus (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "-"' of class DT_TIME_DURATION.
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

	test_infix_less (d1, d2: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_TIME_DURATION.
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

	test_is_equal (d1, d2: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_equal' of class DT_TIME_DURATION.
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

	test_is_canonical (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `is_canonical' of class DT_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").is_canonical: ")
			if d.is_canonical then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_second_count (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `second_count' and
			-- `millisecond_count' of class DT_TIME_DURATION.
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

	test_to_canonical (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_canonical' of class DT_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").to_canonical: ")
			a_file.put_string (d.to_canonical.out)
			a_file.put_character ('%N')
		end

	test_to_date_time_duration (d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `to_date_time_duration' of class DT_TIME_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").to_date_time_duration: ")
			a_file.put_string (d.to_date_time_duration.out)
			a_file.put_character ('%N')
		end

	test_set_hour_minute_second (d: DT_TIME_DURATION; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour_minute_second' of class DT_TIME_DURATION.
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

	test_set_precise_hour_minute_second (d: DT_TIME_DURATION; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_precise_hour_minute_second' of class DT_TIME_DURATION.
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

	test_set_hour (d: DT_TIME_DURATION; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour' of class DT_TIME_DURATION.
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

	test_set_minute (d: DT_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_minute' of class DT_TIME_DURATION.
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

	test_set_second (d: DT_TIME_DURATION; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_second' of class DT_TIME_DURATION.
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

	test_set_millisecond (d: DT_TIME_DURATION; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_millisecond' of class DT_TIME_DURATION.
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

	test_add_hours_minutes_seconds (d: DT_TIME_DURATION; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours_minutes_seconds' of class DT_TIME_DURATION.
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

	test_add_precise_hours_minutes_seconds (d: DT_TIME_DURATION; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_precise_hours_minutes_seconds' of class DT_TIME_DURATION.
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

	test_add_hours (d: DT_TIME_DURATION; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours' of class DT_TIME_DURATION.
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

	test_add_minutes (d: DT_TIME_DURATION; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_minutes' of class DT_TIME_DURATION.
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

	test_add_seconds (d: DT_TIME_DURATION; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_seconds' of class DT_TIME_DURATION.
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

	test_add_milliseconds (d: DT_TIME_DURATION; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_milliseconds' of class DT_TIME_DURATION.
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
