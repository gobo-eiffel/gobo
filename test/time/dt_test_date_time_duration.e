indexing

	description:

		"Test features of class DT_DATE_TIME_DURATION"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TEST_DATE_TIME_DURATION

inherit

	TS_TEST_CASE

feature -- Test

	test_date_time_duration1 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DATE_TIME_DURATION
			dd1: DT_DATE_DURATION
			td1: DT_TIME_DURATION
		do
			create d1.make (4, 11, 4, 20, 5, 21)
			create d2.make (4, 11, 4, 20, 5, 21)
			create d3.make (8, 22, 8, 40, 10, 42)
			assert_equal ("infix_plus1", d3, d1 + d1)
			assert_equal ("infix_plus2", d3, d1 + d2)
			create d3.make (0, 0, 0, 0, 0, 0)
			assert_equal ("infix_minus1", d3, d1 - d1)
			assert_equal ("infix_minus2", d3, d1 - d2)
			create d3.make (4, 11, 4, 20, 5, 21)
			assert_equal ("prefix_plus", d3, + d1)
			create d3.make (-4, -11, -4, -20, -5, -21)
			assert_equal ("prefix_minus", d3, - d1)
			assert ("infix_less1", not (d1 < d1))
			assert ("infix_less2", not (d1 < d2))
			assert ("is_equal1", d1.is_equal (d1))
			assert ("is_equal2", d1.is_equal (d2))
			assert ("is_definite", not d1.is_definite)
			create d3.make (4, 11, 4, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d3, d1.date_to_date_time_duration)
			create d3.make (0, 0, 0, 20, 5, 21)
			assert_equal ("time_to_date_time_duration", d3, d1.time_to_date_time_duration)
			assert_integers_equal ("second_count", 72321, d1.second_count)
			assert_integers_equal ("millisecond_count", 72321000, d1.millisecond_count)
			create dd1.make (4, 11, 4)
			assert_equal ("date_duration", dd1, d1.date_duration)
			create td1.make (20, 5, 21)
			assert_equal ("time_duration", td1, d1.time_duration)
		end

	test_date_time_duration2 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DATE_TIME_DURATION
			dd1: DT_DATE_DURATION
			td1: DT_TIME_DURATION
		do
			create d1.make (4, 11, 4, 20, 5, 21)
			create d2.make_precise (4, 11, 12, 5, 45, 32, 653)
			create d3.make_precise (8, 22, 16, 25, 50, 53, 653)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make_precise (0, 0, -8, 15, -40, -11, -653)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make_precise (4, 11, 12, 5, 45, 32, 653)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make_precise (-4, -11, -12, -5, -45, -32, -653)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", d1 < d2)
			assert ("infix_less2", not (d2 < d1))
			assert ("is_equal", not d1.is_equal (d2))
			assert ("is_definite", not d2.is_definite)
			create d3.make (4, 11, 12, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d3, d2.date_to_date_time_duration)
			create d3.make_precise (0, 0, 0, 5, 45, 32, 653)
			assert_equal ("time_to_date_time_duration", d3, d2.time_to_date_time_duration)
			assert_integers_equal ("second_count", 20732, d2.second_count)
			assert_integers_equal ("millisecond_count", 20732653, d2.millisecond_count)
			create dd1.make (4, 11, 12)
			assert_equal ("date_duration", dd1, d2.date_duration)
			create td1.make_precise (5, 45, 32, 653)
			assert_equal ("time_duration", td1, d2.time_duration)
		end

	test_date_time_duration3 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DATE_TIME_DURATION
			dd1: DT_DATE_DURATION
			td1: DT_TIME_DURATION
		do
			create d1.make (4, 11, 4, 20, 5, 21)
			create d2.make (2, 8, 12, 3, 12, 3)
			create d3.make (6, 19, 16, 23, 17, 24)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make (2, 3, -8, 17, -7, 18)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make (2, 8, 12, 3, 12, 3)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make (-2, -8, -12, -3, -12, -3)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", not (d2 < d1))
			assert ("is_equal", not d1.is_equal (d2))
			assert ("is_definite", not d2.is_definite)
			create d3.make (2, 8, 12, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d3, d2.date_to_date_time_duration)
			create d3.make_precise (0, 0, 0, 3, 12, 3, 0)
			assert_equal ("time_to_date_time_duration", d3, d2.time_to_date_time_duration)
			assert_integers_equal ("second_count", 11523, d2.second_count)
			assert_integers_equal ("millisecond_count", 11523000, d2.millisecond_count)
			create dd1.make (2, 8, 12)
			assert_equal ("date_duration", dd1, d2.date_duration)
			create td1.make_precise (3, 12, 3, 0)
			assert_equal ("time_duration", td1, d2.time_duration)
		end

	test_date_time_duration4 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2, d3: DT_DATE_TIME_DURATION
			dd1: DT_DATE_DURATION
			td1: DT_TIME_DURATION
		do
			create d1.make (4, 11, 4, 20, 5, 21)
			create d2.make_precise (-12, 8, -23, 23, 2, -34, 43)
			create d3.make_precise (-8, 19, -19, 43, 7, -13, 43)
			assert_equal ("infix_plus", d3, d1 + d2)
			create d3.make_precise (16, 3, 27, -3, 3, 55, -43)
			assert_equal ("infix_minus", d3, d1 - d2)
			create d3.make_precise (-12, 8, -23, 23, 2, -34, 43)
			assert_equal ("prefix_plus", d3, + d2)
			create d3.make_precise (12, -8, 23, -23, -2, 34, -43)
			assert_equal ("prefix_minus", d3, - d2)
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", d2 < d1)
			assert ("is_equal", not d1.is_equal (d2))
			assert ("is_definite", not d2.is_definite)
			create d3.make (-12, 8, -23, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d3, d2.date_to_date_time_duration)
			create d3.make_precise (0, 0, 0, 23, 2, -34, 43)
			assert_equal ("time_to_date_time_duration", d3, d2.time_to_date_time_duration)
			assert_integers_equal ("second_count", 82886, d2.second_count)
			assert_integers_equal ("millisecond_count", 82886043, d2.millisecond_count)
			create dd1.make (-12, 8, -23)
			assert_equal ("date_duration", dd1, d2.date_duration)
			create td1.make_precise (23, 2, -34, 43)
			assert_equal ("time_duration", td1, d2.time_duration)
		end

	test_date_time_duration5 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1, dt2: DT_DATE_TIME
		do
			create d1.make (0, 0, 4, 2, 53, 3)
			create dt1.make (2000, 1, 31, 15, 23, 45)
			create dt2.make (2000, 2, 4, 18, 16, 48)
			assert_equal ("date_time", dt2, d1.date_time (dt1))
			assert ("is_definite", d1.is_definite)
			assert ("is_canonical", d1.is_canonical (dt1))
			assert ("is_time_canonical", d1.is_time_canonical)
			create d2.make (0, 0, 4, 2, 53, 3)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 0, 4, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 2, 53, 3, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration6 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1: DT_DATE_TIME
		do
			create d1.make (0, 0, 472, 45, 6, 1)
			create dt1.make (2000, 1, 31, 15, 23, 45)
			assert ("is_definite", d1.is_definite)
			assert ("is_canonical", not d1.is_canonical (dt1))
			assert ("is_time_canonical", not d1.is_time_canonical)
			create d2.make (0, 0, 472, 45, 6, 1)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			create d2.make (1, 3, 18, 21, 6, 1)
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			create d2.make (0, 0, 473, 21, 6, 1)
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 0, 472, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 45, 6, 1, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration7 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1, dt2: DT_DATE_TIME
		do
			create d1.make (0, 0, 30, 2, 4, 12)
			create dt1.make (2000, 2, 29, 12, 44, 3)
			create dt2.make (2000, 3, 30, 14, 48, 15)
			assert_equal ("date_time", dt2, d1.date_time (dt1))
			assert ("is_definite", d1.is_definite)
			assert ("is_canonical", not d1.is_canonical (dt1))
			assert ("is_time_canonical", d1.is_time_canonical)
			create d2.make (0, 0, 30, 2, 4, 12)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			create d2.make (0, 1, 1, 2, 4, 12)
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			create d2.make (0, 0, 30, 2, 4, 12)
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 0, 30, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 2, 4, 12, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration8 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1: DT_DATE_TIME
		do
			create d1.make (0, 1, 2, 12, 3, 12)
			create dt1.make (2000, 2, 29, 12, 44, 3)
			assert ("is_definite", not d1.is_definite)
			assert ("is_canonical", d1.is_canonical (dt1))
			assert ("is_time_canonical", d1.is_time_canonical)
			create d2.make (0, 0, 31, 12, 3, 12)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			create d2.make (0, 1, 2, 12, 3, 12)
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 1, 2, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 12, 3, 12, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration9 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1, dt2: DT_DATE_TIME
		do
			create d1.make (0, 1, 30, 10, 20, 3)
			create dt1.make (2000, 2, 1, 6, 32, 12)
			create dt2.make (2000, 3, 31, 16, 52, 15)
			assert_equal ("date_time", dt2, d1.date_time (dt1))
			assert ("is_definite", not d1.is_definite)
			assert ("is_canonical", d1.is_canonical (dt1))
			assert ("is_time_canonical", d1.is_time_canonical)
			create d2.make (0, 0, 59, 10, 20, 3)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			create d2.make (0, 1, 30, 10, 20, 3)
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 1, 30, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 10, 20, 3, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration10 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dt1, dt2: DT_DATE_TIME
		do
			create d1.make (0, 0, -30, 0, 3, 0)
			create dt1.make (2000, 4, 30, 20, 25, 4)
			create dt2.make (2000, 3, 31, 20, 28, 4)
			assert_equal ("date_time", dt2, d1.date_time (dt1))
			assert ("is_definite", d1.is_definite)
			assert ("is_canonical", not d1.is_canonical (dt1))
			assert ("is_time_canonical", not d1.is_time_canonical)
			create d2.make (0, 0, -30, 0, 3, 0)
			assert_equal ("to_definite", d2, d1.to_definite (dt1))
			create d2.make (0, 0, -29, -23, -57, 0)
			assert_equal ("to_canonical", d2, d1.to_canonical (dt1))
			assert_equal ("to_time_canonical", d2, d1.to_time_canonical)
			create d2.make (0, 0, -30, 0, 0, 0)
			assert_equal ("date_to_date_time_duration", d2, d1.date_to_date_time_duration)
			create d2.make_precise (0, 0, 0, 0, 3, 0, 0)
			assert_equal ("time_to_date_time_duration", d2, d1.time_to_date_time_duration)
		end

	test_date_time_duration11 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
			dd1: DT_DATE_DURATION
			td1: DT_TIME_DURATION
		do
			create d1.make (2, 8, 30, 2, 12, 43)
			d1.set_year_month_day (10, 3, 23)
			create d2.make (10, 3, 23, 2, 12, 43)
			assert_equal ("set_year_month_day", d2, d1)
			d1.set_year (-4)
			create d2.make (-4, 3, 23, 2, 12, 43)
			assert_equal ("set_year", d2, d1)
			d1.set_month (16)
			create d2.make (-4, 16, 23, 2, 12, 43)
			assert_equal ("set_month", d2, d1)
			d1.set_day (0)
			create d2.make (-4, 16, 0, 2, 12, 43)
			assert_equal ("set_day", d2, d1)
			d1.set_hour_minute_second (4, 23, 56)
			create d2.make (-4, 16, 0, 4, 23, 56)
			assert_equal ("set_hour_minute_second", d2, d1)
			d1.set_precise_hour_minute_second (-6, 12, 8, 28)
			create d2.make_precise (-4, 16, 0, -6, 12, 8, 28)
			assert_equal ("set_precise_hour_minute_second", d2, d1)
			d1.set_hour (14)
			create d2.make_precise (-4, 16, 0, 14, 12, 8, 28)
			assert_equal ("set_hour", d2, d1)
			d1.set_minute (15)
			create d2.make_precise (-4, 16, 0, 14, 15, 8, 28)
			assert_equal ("set_minute", d2, d1)
			d1.set_second (30)
			create d2.make_precise (-4, 16, 0, 14, 15, 30, 28)
			assert_equal ("set_second", d2, d1)
			d1.set_millisecond (999)
			create d2.make_precise (-4, 16, 0, 14, 15, 30, 999)
			assert_equal ("set_millisecond", d2, d1)
			d1.add_years_months_days (10, 3, 23)
			create d2.make_precise (6, 19, 23, 14, 15, 30, 999)
			assert_equal ("add_years_months_days", d2, d1)
			d1.add_years (-4)
			create d2.make_precise (2, 19, 23, 14, 15, 30, 999)
			assert_equal ("add_years", d2, d1)
			d1.add_months (16)
			create d2.make_precise (2, 35, 23, 14, 15, 30, 999)
			assert_equal ("add_months", d2, d1)
			d1.add_days (0)
			create d2.make_precise (2, 35, 23, 14, 15, 30, 999)
			assert_equal ("add_days", d2, d1)
			d1.add_hours_minutes_seconds (4, 23, 56)
			create d2.make_precise (2, 35, 23, 18, 38, 86, 999)
			assert_equal ("add_hours_minutes_seconds", d2, d1)
			d1.add_precise_hours_minutes_seconds (-6, 12, 8, 28)
			create d2.make_precise (2, 35, 23, 12, 50, 94, 1027)
			assert_equal ("add_precise_hours_minutes_seconds", d2, d1)
			d1.add_hours (14)
			create d2.make_precise (2, 35, 23, 26, 50, 94, 1027)
			assert_equal ("add_hours", d2, d1)
			d1.add_minutes (15)
			create d2.make_precise (2, 35, 23, 26, 65, 94, 1027)
			assert_equal ("add_minutes", d2, d1)
			d1.add_seconds (30)
			create d2.make_precise (2, 35, 23, 26, 65, 124, 1027)
			assert_equal ("add_seconds", d2, d1)
			d1.add_milliseconds (999)
			create d2.make_precise (2, 35, 23, 26, 65, 124, 2026)
			assert_equal ("add_milliseconds", d2, d1)
			create dd1.make (12, 43, 5)
			d1.set_date_duration (dd1)
			create d2.make_precise (12, 43, 5, 26, 65, 124, 2026)
			assert_equal ("set_date_duration", d2, d1)
			create td1.make_precise (10, 12, 21, 89)
			d1.set_time_duration (td1)
			create d2.make_precise (12, 43, 5, 10, 12, 21, 89)
			assert_equal ("set_time_duration", d2, d1)
		end

	test_date_time_duration12 is
			-- Test features of DT_DATE_TIME_DURATION.
		local
			d1, d2: DT_DATE_TIME_DURATION
		do
			create d1.make (2, 0, 30, 20, 2, 12)
			create d2.make (1, 12, 30, 20, 2, 12)
			assert ("is_equal1", d1.is_equal (d2))
			assert ("infix_less1", not (d1 < d2))
			assert ("infix_less2", not (d2 < d1))
			create d2.make (1, 12, 12, 20, 2, 12)
			assert ("is_equal2", not d1.is_equal (d2))
			assert ("infix_less3", not (d1 < d2))
			assert ("infix_less4", d2 < d1)
		end

	test_is_time_canonical is
			-- Test feature 'is_time_canonical'.
		local
			d1: DT_DATE_TIME_DURATION
		do
			create d1.make (0, 0, 337, 0, 0, 0)
			assert ("is_time_canonical1", d1.is_time_canonical)
		end

end
