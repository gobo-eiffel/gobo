indexing

	description:

		"Test features of class DT_ABSOLUTE_TIME"

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
			-- Test features of class DT_ABSOLUTE_TIME.
			-- Make results of test available in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			d1, d2: DT_DATE
			dd: DT_DATE_DURATION
			t1, t2: DT_TIME
			td: DT_TIME_DURATION
			dt1, dt2: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			!! d1.make (2000, 03, 24)
			!! d2.make (2000, 03, 24)
			test_infix_minus (d1, d2, a_file)
			test_duration (d1, d2, a_file)
			test_infix_less (d1, d2, a_file)
			!! d2.make (2001, 11, 3)
			test_infix_minus (d1, d2, a_file)
			test_duration (d1, d2, a_file)
			test_infix_less (d1, d2, a_file)
			test_infix_minus (d2, d1, a_file)
			test_duration (d2, d1, a_file)
			test_infix_less (d2, d1, a_file)
			!! dd.make (12, 4, 31)
			test_infix_plus (d1, dd, a_file)
			test_add_duration (d1, dd, a_file)
			!! d1.make (2000, 03, 24)
			!! dd.make (-4, -2, -12)
			test_infix_plus (d1, dd, a_file)
			test_add_duration (d1, dd, a_file)
			!! t1.make_precise (14, 03, 24, 432)
			!! t2.make_precise (14, 03, 24, 432)
			test_infix_minus (t1, t2, a_file)
			test_duration (t1, t2, a_file)
			test_infix_less (t1, t2, a_file)
			!! t2.make_precise (17, 31, 56, 476)
			test_infix_minus (t1, t2, a_file)
			test_duration (t1, t2, a_file)
			test_infix_less (t1, t2, a_file)
			test_infix_minus (t2, t1, a_file)
			test_duration (t2, t1, a_file)
			test_infix_less (t2, t1, a_file)
			!! td.make_precise (12, 4, 31, 876)
			test_infix_plus (t1, td, a_file)
			test_add_duration (t1, td, a_file)
			!! t1.make_precise (14, 03, 24, 432)
			!! td.make_precise (-4, -2, -12, 678)
			test_infix_plus (t1, td, a_file)
			test_add_duration (t1, td, a_file)
			!! dt1.make_precise (2000, 4, 1, 14, 03, 24, 432)
			!! dt2.make_precise (2000, 4, 1, 14, 03, 24, 432)
			test_infix_minus (dt1, dt2, a_file)
			test_duration (dt1, dt2, a_file)
			test_infix_less (dt1, dt2, a_file)
			!! dt2.make_precise (1999, 12, 25, 17, 31, 56, 476)
			test_infix_minus (dt1, dt2, a_file)
			test_duration (dt1, dt2, a_file)
			test_infix_less (dt1, dt2, a_file)
			test_infix_minus (dt2, dt1, a_file)
			test_duration (dt2, dt1, a_file)
			test_infix_less (dt2, dt1, a_file)
			!! dtd.make_precise (3, 11, 14, 12, 4, 31, 876)
			test_infix_plus (dt1, dtd, a_file)
			test_add_duration (dt1, dtd, a_file)
			!! dt1.make_precise (2000, 4, 1, 14, 03, 24, 432)
			!! dtd.make_precise (4, -5, 3, -4, -2, -12, 678)
			test_infix_plus (dt1, dtd, a_file)
			test_add_duration (dt1, dtd, a_file)
		end

	test_infix_minus (t1, t2: DT_ABSOLUTE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "-"' of class DT_ABSOLUTE_TIME.
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

	test_duration (t1, t2: DT_ABSOLUTE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `duration' of class DT_ABSOLUTE_TIME.
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

	test_infix_plus (t: DT_ABSOLUTE_TIME; d: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "+"' of class DT_ABSOLUTE_TIME.
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

	test_add_duration (t: DT_ABSOLUTE_TIME; d: DT_DURATION; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `add_duration' of class DT_ABSOLUTE_TIME.
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

	test_infix_less (t1, t2: DT_ABSOLUTE_TIME; a_file: like OUTPUT_STREAM_TYPE) is
			-- Test feature `infix "<"' of class DT_ABSOLUTE_TIME.
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

end -- class TESTER
