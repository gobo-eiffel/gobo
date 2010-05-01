note

	description:

		"Test features of class DT_TIME_DURATION"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_TIME_DURATION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_time_duration1 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2, d3: DT_TIME_DURATION
			dtd: DT_DATE_TIME_DURATION
			t1, t2: DT_TIME
		do
			create d1.make_precise (4, 11, 4, 543)
			create d2.make_precise (4, 11, 4, 543)
			create t1.make_precise (14, 23, 54, 583)
			create t2.make_precise (18, 34, 59, 126)
			assert_equal ("time", t2, d1.time (t1))
			create dtd.make_precise (0, 0, 0, 4, 11, 4, 543)
			assert_equal ("to_date_time_duration", dtd, d1.to_date_time_duration)
			create d3.make_precise (8, 22, 8, 1086)
			assert_equal ("infix_plus1", d3, d1 + d1)
			assert_equal ("infix_plus2", d3, d1 + d2)
			create d3.make (0, 0, 0)
			assert_equal ("infix_minus1", d3, d1 - d1)
			assert_equal ("infix_minus2", d3, d1 - d2)
			create d3.make_precise (4, 11, 4, 543)
			assert_equal ("prefix_plus", d3, + d1)
			create d3.make_precise (-4, -11, -4, -543)
			assert_equal ("prefix_minus", d3, - d1)
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
			assert ("is_equal1", d1.is_equal (d1))
			assert ("is_equal2", d1.is_equal (d2))
		end

	test_time_duration2 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2, d3: DT_TIME_DURATION
			dtd: DT_DATE_TIME_DURATION
			t1, t2: DT_TIME
		do
			create d1.make_precise (4, 11, 4, 543)
			create d2.make_precise (4, 11, 12, 754)
			create t1.make_precise (14, 23, 54, 583)
			create t2.make_precise (18, 35, 7, 337)
			assert_equal ("time", t2, d2.time (t1))
			create dtd.make_precise (0, 0, 0, 4, 11, 12, 754)
			assert_equal ("to_date_time_duration", dtd, d2.to_date_time_duration)
			create d3.make_precise (8, 22, 16, 1297)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make_precise (0, 0, -8, -211)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make_precise (4, 11, 12, 754)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make_precise (-4, -11, -12, -754)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", d1 < d2)
			assert ("infix_less2", not (d2 < d1))
			assert ("is_equal", not d1.is_equal (d2))
		end

	test_time_duration3 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2, d3: DT_TIME_DURATION
			dtd: DT_DATE_TIME_DURATION
			t1, t2: DT_TIME
		do
			create d1.make_precise (4, 11, 4, 543)
			create d2.make_precise (2, 8, 12, 0)
			create t1.make_precise (14, 23, 54, 583)
			create t2.make_precise (16, 32, 6, 583)
			assert_equal ("time", t2, d2.time (t1))
			create dtd.make (0, 0, 0, 2, 8, 12)
			assert_equal ("to_date_time_duration", dtd, d2.to_date_time_duration)
			create d3.make_precise (6, 19, 16, 543)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make_precise (2, 3, -8, 543)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make (2, 8, 12)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make (-2, -8, -12)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
			assert ("is_equal", not d1.is_equal (d2))
		end

	test_time_duration4 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2, d3: DT_TIME_DURATION
			dtd: DT_DATE_TIME_DURATION
			t1, t2: DT_TIME
		do
			create d1.make_precise (4, 11, 4, 543)
			create d2.make_precise (-12, 8, -23, 2)
			create t1.make_precise (14, 23, 54, 583)
			create t2.make_precise (2, 31, 31, 585)
			assert_equal ("time", t2, d2.time (t1))
			create dtd.make_precise (0, 0, 0, -12, 8, -23, 2)
			assert_equal ("to_date_time_duration", dtd, d2.to_date_time_duration)
			create d3.make_precise (-8, 19, -19, 545)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make_precise (16, 3, 27, 541)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make_precise (-12, 8, -23, 2)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make_precise (12, -8, 23, -2)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
			assert ("is_equal", not d1.is_equal (d2))
		end

	test_time_duration5 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2: DT_TIME_DURATION
		do
			create d1.make (2, 30, 2)
			create d2.make (3, -30, 2)
			assert ("is_equal", d1.is_equal (d2))
		end

	test_time_duration6 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2: DT_TIME_DURATION
		do
			create d1.make_precise (0, 0, 0, 675452089)
			create d2.make_precise (187, 37, 32, 89)
			assert_equal ("to_canonical1", d2, d1.to_canonical)
			create d1.make_precise_canonical (675452089)
			assert_equal ("out", "187:37:32.89", d1.out)
			assert ("is_canonical", d1.is_canonical)
			assert_equal ("to_canonical2", d2, d1.to_canonical)
			assert_integers_equal ("second_count", 675452, d1.second_count)
			assert_integers_equal ("millisecond_count", 675452089, d1.millisecond_count)
		end

	test_time_duration7 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2: DT_TIME_DURATION
		do
			create d1.make (0, 0, -45638)
			create d2.make (-12, -40, -38)
			assert_equal ("to_canonical1", d2, d1.to_canonical)
			create d1.make_canonical (-45638)
			assert_equal ("out", "-12:-40:-38", d1.out)
			assert ("is_canonical", d1.is_canonical)
			assert_equal ("to_canonical2", d2, d1.to_canonical)
			assert_integers_equal ("second_count", -45638, d1.second_count)
			assert_integers_equal ("millisecond_count", -45638000, d1.millisecond_count)
		end

	test_time_duration8 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2: DT_TIME_DURATION
		do
			create d1.make (12, 60, -2)
			assert ("is_canonical", not d1.is_canonical)
			create d2.make (12, 59, 58)
			assert_equal ("to_canonical", d2, d1.to_canonical)
			assert_integers_equal ("second_count", 46798, d1.second_count)
			assert_integers_equal ("millisecond_count", 46798000, d1.millisecond_count)
		end

	test_time_duration9 is
			-- Test features of DT_TIME_DURATION.
		local
			d1, d2: DT_TIME_DURATION
		do
			create d1.make_precise (12, 3, 24, 235)
			d1.set_hour_minute_second (4, 23, 56)
			create d2.make_precise (4, 23, 56, 0)
			assert_equal ("set_hour_minute_second", d2, d1)
			d1.set_precise_hour_minute_second (-6, 12, 8, 28)
			create d2.make_precise (-6, 12, 8, 28)
			assert_equal ("set_precise_hour_minute_second", d2, d1)
			d1.set_hour (14)
			create d2.make_precise (14, 12, 8, 28)
			assert_equal ("set_hour", d2, d1)
			d1.set_minute (15)
			create d2.make_precise (14, 15, 8, 28)
			assert_equal ("set_minute", d2, d1)
			d1.set_second (30)
			create d2.make_precise (14, 15, 30, 28)
			assert_equal ("set_second", d2, d1)
			d1.set_millisecond (999)
			create d2.make_precise (14, 15, 30, 999)
			assert_equal ("set_millisecond", d2, d1)
			d1.add_hours_minutes_seconds (4, 23, 56)
			create d2.make_precise (18, 38, 86, 999)
			assert_equal ("add_hours_minutes_seconds", d2, d1)
			d1.add_precise_hours_minutes_seconds (-6, 12, 8, 28)
			create d2.make_precise (12, 50, 94, 1027)
			assert_equal ("add_precise_hours_minutes_seconds", d2, d1)
			d1.add_hours (14)
			create d2.make_precise (26, 50, 94, 1027)
			assert_equal ("add_hours", d2, d1)
			d1.add_minutes (15)
			create d2.make_precise (26, 65, 94, 1027)
			assert_equal ("add_minutes", d2, d1)
			d1.add_seconds (30)
			create d2.make_precise (26, 65, 124, 1027)
			assert_equal ("add_seconds", d2, d1)
			d1.add_milliseconds (999)
			create d2.make_precise (26, 65, 124, 2026)
			assert_equal ("add_milliseconds", d2, d1)
		end

end
