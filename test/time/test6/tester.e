indexing

	description:

		"Test features of class DT_DURATION"

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
			-- Test features of class DT_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			dd1, dd2: DT_DATE_DURATION
			d: DT_DATE
			td1, td2: DT_TIME_DURATION
			t: DT_TIME
			dtd1, dtd2: DT_DATE_TIME_DURATION
			dt: DT_DATE_TIME
		do
			!! d.make (2000, 4, 8)
			!! dd1.make (4, 11, 4)
			!! dd2.make (4, 11, 4)
			test_absolute_time (dd1, d, a_file)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			!! dd2.make (4, 11, 12)
			test_absolute_time (dd2, d, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			!! dd2.make (2, 8, 12)
			test_absolute_time (dd2, d, a_file)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			!! dd2.make (-12, 8, -23)
			test_absolute_time (dd2, d, a_file)
			test_infix_plus (dd1, dd2, a_file)
			test_infix_minus (dd1, dd2, a_file)
			test_prefix_plus (dd1, a_file)
			test_prefix_minus (dd1, a_file)
			test_infix_less (dd1, dd2, a_file)
			test_infix_less (dd2, dd1, a_file)
			!! t.make (16, 30, 5)
			!! td1.make_precise (4, 11, 4, 543)
			!! td2.make_precise (4, 11, 4, 543)
			test_absolute_time (td1, t, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			!! td2.make_precise (4, 11, 12, 754)
			test_absolute_time (td2, t, a_file)
			test_infix_less (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)
			!! td2.make_precise (2, 8, 12, 0)
			test_absolute_time (td2, t, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)
			!! td2.make_precise (-12, 8, -23, 2)
			test_absolute_time (td2, t, a_file)
			test_infix_plus (td1, td2, a_file)
			test_infix_minus (td1, td2, a_file)
			test_prefix_plus (td1, a_file)
			test_prefix_minus (td1, a_file)
			test_infix_less (td1, td2, a_file)
			test_infix_less (td2, td1, a_file)
			!! dt.make_precise (2000, 2, 29, 6, 25, 34, 472)
			!! dtd1.make_precise (2, 10, 14, 4, 11, 4, 543)
			!! dtd2.make_precise (2, 10, 14, 4, 11, 4, 543)
			test_absolute_time (dtd1, dt, a_file)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			!! dtd2.make_precise (2, 10, 14, 4, 11, 12, 754)
			test_absolute_time (dtd2, dt, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			!! dtd2.make_precise (8, 7, 6, 2, 8, 12, 0)
			test_absolute_time (dtd2, dt, a_file)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
			!! dtd2.make_precise (-4, 4, -28, -12, 8, -23, 2)
			test_absolute_time (dtd2, dt, a_file)
			test_infix_plus (dtd1, dtd2, a_file)
			test_infix_minus (dtd1, dtd2, a_file)
			test_prefix_plus (dtd1, a_file)
			test_prefix_minus (dtd1, a_file)
			test_infix_less (dtd1, dtd2, a_file)
			test_infix_less (dtd2, dtd1, a_file)
		end

	test_infix_plus (d1, d2: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_DURATION.
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

	test_absolute_time (d: DT_DURATION; t: DT_ABSOLUTE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `absolute_time' of class DT_DURATION.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
			d_not_void: d /= Void
			t_not_void: t /= Void
		do
			a_file.put_string ("%T(")
			a_file.put_string (d.out)
			a_file.put_string (").absolute_time (")
			a_file.put_string (t.out)
			a_file.put_string ("): ")
			a_file.put_string (d.absolute_time (t).out)
			a_file.put_character ('%N')
		end

	test_infix_minus (d1, d2: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_DURATION.
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

	test_prefix_plus (d: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "+"' of class DT_DURATION.
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

	test_prefix_minus (d: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `prefix "-"' of class DT_DURATION.
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

	test_infix_less (d1, d2: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_DURATION.
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

end -- class TESTER
