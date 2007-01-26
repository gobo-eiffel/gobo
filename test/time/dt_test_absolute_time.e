indexing

	description:

		"Test features of class DT_ABSOLUTE_TIME"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_ABSOLUTE_TIME

inherit

	TS_TEST_CASE

feature -- Test

	test_date1 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE} t1.make (2000, 3, 24)
			create {DT_DATE_DURATION} d.make (0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t1)
			assert_equal ("duration", d, t1.duration (t1))
			assert ("infix_less", not (t1 < t1))
			create {DT_DATE_DURATION} d.make (12, 4, 31)
			create {DT_DATE} t2.make (2012, 8, 24)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_date2 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE} t1.make (2000, 3, 24)
			create {DT_DATE} t2.make (2000, 3, 24)
			create {DT_DATE_DURATION} d.make (0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t2)
			assert_equal ("duration", d, t1.duration (t2))
			assert ("infix_less", not (t1 < t2))
			create {DT_DATE_DURATION} d.make (-4, -2, -12)
			create {DT_DATE} t2.make (1996, 1, 12)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_date3 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE} t1.make (2000, 3, 24)
			create {DT_DATE} t2.make (2001, 11, 3)
			create {DT_DATE_DURATION} d.make (0, 0, -589)
			assert_equal ("infix_minus1", d, t1 - t2)
			assert_equal ("duration1", d, t1.duration (t2))
			assert ("infix_less1", t1 < t2)
			create {DT_DATE_DURATION} d.make (0, 0, 589)
			assert_equal ("infix_minus2", d, t2 - t1)
			assert_equal ("duration2", d, t2.duration (t1))
			assert ("infix_less2", not (t2 < t1))
		end

	test_time1 is
			-- Test features of DT_ABSOLUTE_TIME using DT_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_TIME} t1.make_precise (14, 3, 24, 432)
			create {DT_TIME_DURATION} d.make_precise (0, 0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t1)
			assert_equal ("duration", d, t1.duration (t1))
			assert ("infix_less", not (t1 < t1))
			create {DT_TIME_DURATION} d.make_precise (12, 4, 31, 876)
			create {DT_TIME} t2.make_precise (2, 7, 56, 308)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_time2 is
			-- Test features of DT_ABSOLUTE_TIME using DT_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_TIME} t1.make_precise (14, 3, 24, 432)
			create {DT_TIME} t2.make_precise (14, 3, 24, 432)
			create {DT_TIME_DURATION} d.make_precise (0, 0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t2)
			assert_equal ("duration", d, t1.duration (t2))
			assert ("infix_less", not (t1 < t2))
			create {DT_TIME_DURATION} d.make_precise (-4, -2, -12, 678)
			create {DT_TIME} t2.make_precise (10, 1, 13, 110)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_time3 is
			-- Test features of DT_ABSOLUTE_TIME using DT_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_TIME} t1.make_precise (14, 3, 24, 432)
			create {DT_TIME} t2.make_precise (17, 31, 56, 476)
			create {DT_TIME_DURATION} d.make_precise (-3, -28, -32, -44)
			assert_equal ("infix_minus1", d, t1 - t2)
			assert_equal ("duration1", d, t1.duration (t2))
			assert ("infix_less1", t1 < t2)
			create {DT_TIME_DURATION} d.make_precise (3, 28, 32, 44)
			assert_equal ("infix_minus2", d, t2 - t1)
			assert_equal ("duration2", d, t2.duration (t1))
			assert ("infix_less2", not (t2 < t1))
		end

	test_date_time1 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE_TIME} t1.make_precise (2000, 4, 1, 14, 03, 24, 432)
			create {DT_DATE_TIME_DURATION} d.make_precise (0, 0, 0, 0, 0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t1)
			assert_equal ("duration", d, t1.duration (t1))
			assert ("infix_less", not (t1 < t1))
			create {DT_DATE_TIME_DURATION} d.make_precise (3, 11, 14, 12, 4, 31, 876)
			create {DT_DATE_TIME} t2.make_precise (2004, 3, 16, 2, 7, 56, 308)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_date_time2 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE_TIME} t1.make_precise (2000, 4, 1, 14, 03, 24, 432)
			create {DT_DATE_TIME} t2.make_precise (2000, 4, 1, 14, 03, 24, 432)
			create {DT_DATE_TIME_DURATION} d.make_precise (0, 0, 0, 0, 0, 0, 0)
			assert_equal ("infix_minus", d, t1 - t2)
			assert_equal ("duration", d, t1.duration (t2))
			assert ("infix_less", not (t1 < t2))
			create {DT_DATE_TIME_DURATION} d.make_precise (4, -5, 3, -4, -2, -12, 678)
			create {DT_DATE_TIME} t2.make_precise (2003, 11, 4, 10, 1, 13, 110)
			assert_equal ("infix_plus", t2, t1 + d)
			t1.add_duration (d)
			assert_equal ("add_duration", t2, t1)
		end

	test_date_time3 is
			-- Test features of DT_ABSOLUTE_TIME using DT_DATE_TIME.
		local
			t1: DT_ABSOLUTE_TIME
			t2: DT_ABSOLUTE_TIME
			d: DT_DURATION
		do
			create {DT_DATE_TIME} t1.make_precise (2000, 4, 1, 14, 03, 24, 432)
			create {DT_DATE_TIME} t2.make_precise (1999, 12, 25, 17, 31, 56, 476)
			create {DT_DATE_TIME_DURATION} d.make_precise (0, 0, 98, -3, -28, -32, -44)
			assert_equal ("infix_minus1", d, t1 - t2)
			assert_equal ("duration1", d, t1.duration (t2))
			assert ("infix_less1", not (t1 < t2))
			create {DT_DATE_TIME_DURATION} d.make_precise (0, 0, -98, 3, 28, 32, 44)
			assert_equal ("infix_minus2", d, t2 - t1)
			assert_equal ("duration2", d, t2.duration (t1))
			assert ("infix_less2", t2 < t1)
		end

end
