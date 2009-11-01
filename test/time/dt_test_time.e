indexing

	description:

		"Test features of class DT_TIME"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_TIME

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_time1 is
			-- Test features of DT_TIME.
		local
			t1, t2: DT_TIME
			td1: DT_TIME_DURATION
		do
			create t1.make_precise (14, 3, 24, 432)
			create t2.make_precise (14, 3, 24, 432)
			create td1.make (0, 0, 0)
			assert_equal ("infix_minus1", td1, t1 - t1)
			assert_equal ("infix_minus2", td1, t1 - t2)
			assert_equal ("duration1", td1, t1.duration (t1))
			assert_equal ("duration2", td1, t1.duration (t2))
			assert_equal ("canonical_duration1", td1, t1.canonical_duration (t1))
			assert_equal ("canonical_duration2", td1, t1.canonical_duration (t2))
			assert_equal ("time_duration1", td1, t1.time_duration (t1))
			assert_equal ("time_duration2", td1, t1.time_duration (t2))
			assert ("infix_less1", not (t1 < t1))
			assert ("infix_less2", not (t1 < t2))
			assert_integers_equal ("second_count", 50604, t1.second_count)
			assert_integers_equal ("millisecond_count", 50604432, t1.millisecond_count)
		end

	test_time2 is
			-- Test features of DT_TIME.
		local
			t1, t2: DT_TIME
			td1: DT_TIME_DURATION
		do
			create t1.make_precise (14, 3, 24, 432)
			create t2.make_precise (17, 31, 56, 476)
			create td1.make_precise (-3, -28, -32, -44)
			assert_equal ("infix_minus1", td1, t1 - t2)
			assert_equal ("duration1", td1, t1.duration (t2))
			assert_equal ("canonical_duration1", td1, t1.canonical_duration (t2))
			assert_equal ("time_duration1", td1, t1.time_duration (t2))
			create td1.make_precise (3, 28, 32, 44)
			assert_equal ("infix_minus2", td1, t2 - t1)
			assert_equal ("duration2", td1, t2.duration (t1))
			assert_equal ("canonical_duration2", td1, t2.canonical_duration (t1))
			assert_equal ("time_duration2", td1, t2.time_duration (t1))
			assert ("infix_less1", t1 < t2)
			assert ("infix_less2", not (t2 < t1))
			assert_integers_equal ("second_count", 63116, t2.second_count)
			assert_integers_equal ("millisecond_count", 63116476, t2.millisecond_count)
		end

	test_time3 is
			-- Test features of DT_TIME.
		local
			t1, t2: DT_TIME
			td1: DT_TIME_DURATION
		do
			create t1.make_precise (14, 3, 24, 432)
			create td1.make_precise (12, 4, 31, 876)
			create t2.make_precise (2, 7, 56, 308)
			assert_equal ("infix_plus", t2, t1 + td1)
			assert_equal ("infix_&|", t2, t1 &| td1)
			t1.add_duration (td1)
			assert_equal ("add_duration", t2, t1)
		end

	test_time4 is
			-- Test features of DT_TIME.
		local
			t1, t2: DT_TIME
			td1: DT_TIME_DURATION
		do
			create t1.make_precise (14, 3, 24, 432)
			create td1.make_precise (-4, -2, -12, 678)
			create t2.make_precise (10, 1, 13, 110)
			assert_equal ("infix_plus", t2, t1 + td1)
			assert_equal ("infix_&|", t2, t1 &| td1)
			t1.add_duration (td1)
			assert_equal ("add_duration", t2, t1)
			create t1.make_precise (14, 3, 24, 432)
			t1.add_time_duration (td1)
			assert_equal ("add_time_duration", t2, t1)
		end

	test_time5 is
			-- Test features of DT_TIME.
		local
			t1, t2: DT_TIME
		do
			create t1.make_precise (12, 3, 24, 235)
			t1.set_hour_minute_second (4, 23, 56)
			create t2.make_precise (4, 23, 56, 0)
			assert_equal ("set_hour_minute_second", t2, t1)
			t1.set_precise_hour_minute_second (6, 12, 8, 28)
			create t2.make_precise (6, 12, 8, 28)
			assert_equal ("set_precise_hour_minute_second", t2, t1)
			t1.set_hour (14)
			create t2.make_precise (14, 12, 8, 28)
			assert_equal ("set_hour", t2, t1)
			t1.set_minute (15)
			create t2.make_precise (14, 15, 8, 28)
			assert_equal ("set_minute", t2, t1)
			t1.set_second (30)
			create t2.make_precise (14, 15, 30, 28)
			assert_equal ("set_second", t2, t1)
			t1.set_millisecond (999)
			create t2.make_precise (14, 15, 30, 999)
			assert_equal ("set_millisecond", t2, t1)
			t1.add_hours_minutes_seconds (4, 23, 56)
			create t2.make_precise (18, 39, 26, 999)
			assert_equal ("add_hours_minutes_seconds", t2, t1)
			t1.add_precise_hours_minutes_seconds (-6, 12, 8, 28)
			create t2.make_precise (12, 51, 35, 27)
			assert_equal ("add_precise_hours_minutes_seconds", t2, t1)
			t1.add_hours (14)
			create t2.make_precise (2, 51, 35, 27)
			assert_equal ("add_hours", t2, t1)
			t1.add_minutes (15)
			create t2.make_precise (3, 6, 35, 27)
			assert_equal ("add_minutes", t2, t1)
			t1.add_seconds (30)
			create t2.make_precise (3, 7, 5, 27)
			assert_equal ("add_seconds", t2, t1)
			t1.add_milliseconds (999)
			create t2.make_precise (3, 7, 6, 26)
			assert_equal ("add_milliseconds", t2, t1)
			t1.set_second_count (53805)
			create t2.make_precise (14, 56, 45, 0)
			assert_equal ("set_second_count", t2, t1)
			t1.set_millisecond_count (53805345)
			create t2.make_precise (14, 56, 45, 345)
			assert_equal ("set_millisecond_count", t2, t1)
		end

end
