indexing

	description:

		"Test features of class DT_TIME"

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
			-- Test features of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			t1, t2: DT_TIME
			td: DT_TIME_DURATION
		do
			!! t1.make_precise (14, 03, 24, 432)
			!! t2.make_precise (14, 03, 24, 432)
			test_infix_minus (t1, t2, a_file)
			test_duration (t1, t2, a_file)
			test_canonical_duration (t1, t2, a_file)
			test_time_duration (t1, t2, a_file)
			test_infix_less (t1, t2, a_file)
			test_second_count (t1, a_file)
			!! t2.make_precise (17, 31, 56, 476)
			test_infix_minus (t1, t2, a_file)
			test_duration (t1, t2, a_file)
			test_canonical_duration (t1, t2, a_file)
			test_time_duration (t1, t2, a_file)
			test_infix_less (t1, t2, a_file)
			test_infix_minus (t2, t1, a_file)
			test_duration (t2, t1, a_file)
			test_canonical_duration (t2, t1, a_file)
			test_time_duration (t2, t1, a_file)
			test_infix_less (t2, t1, a_file)
			test_second_count (t2, a_file)
			!! td.make_precise (12, 4, 31, 876)
			test_infix_plus (t1, td, a_file)
			test_infix_ampersand_t (t1, td, a_file)
			test_add_duration (t1, td, a_file)
			!! t1.make_precise (14, 03, 24, 432)
			!! td.make_precise (-4, -2, -12, 678)
			test_infix_plus (t1, td, a_file)
			test_infix_ampersand_t (t1, td, a_file)
			test_second_count (t1, a_file)
			test_add_duration (t1, td, a_file)
			!! t1.make_precise (14, 03, 24, 432)
			test_add_time_duration (t1, td, a_file)

			!! t1.make_precise (12, 3, 24, 235)
			test_set_hour_minute_second (t1, 4, 23, 56, a_file)
			test_set_precise_hour_minute_second (t1, 6, 12, 8, 28, a_file)
			test_set_hour (t1, 14, a_file)
			test_set_minute (t1, 15, a_file)
			test_set_second (t1, 30, a_file)
			test_set_millisecond (t1, 999, a_file)
			test_add_hours_minutes_seconds (t1, 4, 23, 56, a_file)
			test_add_precise_hours_minutes_seconds (t1, -6, 12, 8, 28, a_file)
			test_add_hours (t1, 14, a_file)
			test_add_minutes (t1, 15, a_file)
			test_add_seconds (t1, 30, a_file)
			test_add_milliseconds (t1, 999, a_file)
			test_set_second_count (t1, 53805, a_file)
			test_set_millisecond_count (t1, 53805345, a_file)
		end

	test_infix_minus (t1, t2: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t1_not_void: t1 /= Void
			t2_not_void: t2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t1.out)
			a_file.put_string (") - (")
			a_file.put_string (t2.out)
			a_file.put_string ("): ")
			a_file.put_string ((t1 - t2).out)
			a_file.put_character ('%N')
		end

	test_duration (t1, t2: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `duration' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t1_not_void: t1 /= Void
			t2_not_void: t2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t1.out)
			a_file.put_string (").duration (")
			a_file.put_string (t2.out)
			a_file.put_string ("): ")
			a_file.put_string (t1.duration (t2).out)
			a_file.put_character ('%N')
		end

	test_canonical_duration (t1, t2: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `canonical_duration' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t1_not_void: t1 /= Void
			t2_not_void: t2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t1.out)
			a_file.put_string (").canonical_duration (")
			a_file.put_string (t2.out)
			a_file.put_string ("): ")
			a_file.put_string (t1.canonical_duration (t2).out)
			a_file.put_character ('%N')
		end

	test_time_duration (t1, t2: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `time_duration' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t1_not_void: t1 /= Void
			t2_not_void: t2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t1.out)
			a_file.put_string (").time_duration (")
			a_file.put_string (t2.out)
			a_file.put_string ("): ")
			a_file.put_string (t1.time_duration (t2).out)
			a_file.put_character ('%N')
		end

	test_infix_plus (t: DT_TIME; d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (") + (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			a_file.put_string ((t + d).out)
			a_file.put_character ('%N')
		end

	test_infix_ampersand_t (t: DT_TIME; td: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "&t"' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
			td_not_void: td /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (") &t (")
			a_file.put_string (td.out)
			a_file.put_string ("): ")
			a_file.put_string ((t &t td).out)
			a_file.put_character ('%N')
		end

	test_add_duration (t: DT_TIME; d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_duration' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_duration (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			t.add_duration (d)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_time_duration (t: DT_TIME; d: DT_TIME_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_time_duration' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
			d_not_void: d /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_time_duration (")
			a_file.put_string (d.out)
			a_file.put_string ("): ")
			t.add_time_duration (d)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_infix_less (t1, t2: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t1_not_void: t1 /= Void
			t2_not_void: t2 /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t1.out)
			a_file.put_string (") < (")
			a_file.put_string (t2.out)
			a_file.put_string ("): ")
			if t1 < t2 then
				a_file.put_string ("True")
			else
				a_file.put_string ("False")
			end
			a_file.put_character ('%N')
		end

	test_second_count (t: DT_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test features `second_count' and
			-- `millisecond_count' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").second_count: ")
			a_file.put_integer (t.second_count)
			a_file.put_character ('%N')
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").millisecond_count: ")
			a_file.put_integer (t.millisecond_count)
			a_file.put_character ('%N')
		end

	test_set_hour_minute_second (t: DT_TIME; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour_minute_second' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_hour_minute_second (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			t.set_hour_minute_second (h, m, s)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_precise_hour_minute_second (t: DT_TIME; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_precise_hour_minute_second' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_precise_hour_minute_second (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string (", ")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			t.set_precise_hour_minute_second (h, m, s, ms)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_hour (t: DT_TIME; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_hour' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_hour (")
			a_file.put_integer (h)
			a_file.put_string ("): ")
			t.set_hour (h)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_minute (t: DT_TIME; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_minute' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_minute (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			t.set_minute (m)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_second (t: DT_TIME; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_second' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_second (")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			t.set_second (s)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_millisecond (t: DT_TIME; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_millisecond' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_millisecond (")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			t.set_millisecond (ms)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_second_count (t: DT_TIME; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_second_count' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_second_count (")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			t.set_second_count (s)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_set_millisecond_count (t: DT_TIME; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `set_millisecond_count' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").set_millisecond_count (")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			t.set_millisecond_count (ms)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_hours_minutes_seconds (t: DT_TIME; h, m, s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours_minutes_seconds' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_hours_minutes_seconds (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			t.add_hours_minutes_seconds (h, m, s)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_precise_hours_minutes_seconds (t: DT_TIME; h, m, s, ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_precise_hours_minutes_seconds' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_precise_hours_minutes_seconds (")
			a_file.put_integer (h)
			a_file.put_string (", ")
			a_file.put_integer (m)
			a_file.put_string (", ")
			a_file.put_integer (s)
			a_file.put_string (", ")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			t.add_precise_hours_minutes_seconds (h, m, s, ms)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_hours (t: DT_TIME; h: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_hours' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_hours (")
			a_file.put_integer (h)
			a_file.put_string ("): ")
			t.add_hours (h)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_minutes (t: DT_TIME; m: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_minutes' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_minutes (")
			a_file.put_integer (m)
			a_file.put_string ("): ")
			t.add_minutes (m)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_seconds (t: DT_TIME; s: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_seconds' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_seconds (")
			a_file.put_integer (s)
			a_file.put_string ("): ")
			t.add_seconds (s)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

	test_add_milliseconds (t: DT_TIME; ms: INTEGER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_milliseconds' of class DT_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (t.out)
			a_file.put_string (").add_milliseconds (")
			a_file.put_integer (ms)
			a_file.put_string ("): ")
			t.add_milliseconds (ms)
			a_file.put_string (t.out)
			a_file.put_character ('%N')
		end

end -- class TESTER
