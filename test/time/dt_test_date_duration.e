indexing

	description:

		"Test features of class DT_DATE_DURATION"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_DATE_DURATION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_date_duration1 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2, dd3: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
		do
			create dd1.make (4, 11, 4)
			create dd2.make (4, 11, 4)
			create dd3.make (8, 22, 8)
			assert_equal ("infix_plus1", dd3, dd1 + dd1)
			assert_equal ("infix_plus2", dd3, dd1 + dd2)
			create dd3.make (0, 0, 0)
			assert_equal ("infix_minus1", dd3, dd1 - dd1)
			assert_equal ("infix_minus2", dd3, dd1 - dd2)
			create dd3.make (4, 11, 4)
			assert_equal ("prefix_plus", dd3, + dd1)
			create dd3.make (-4, -11, -4)
			assert_equal ("prefix_minus", dd3, - dd1)
			assert ("infix_less1", not (dd1 < dd1))
			assert ("infix_less2", not (dd1 < dd2))
			assert ("is_equal1", dd1.is_equal (dd1))
			assert ("is_equal2", dd1.is_equal (dd2))
			assert ("is_definite", not dd1.is_definite)
			create dtd.make (4, 11, 4, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration2 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
		do
			create dd1.make (4, 11, 4)
			create dd2.make (4, 11, 12)
			assert ("infix_less1", dd1 < dd2)
			assert ("infix_less2", not (dd2 < dd1))
			assert ("is_equal", not dd1.is_equal (dd2))
			assert ("is_definite", not dd2.is_definite)
			create dtd.make (4, 11, 12, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd2.to_date_time_duration)
		end

	test_date_duration3 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2, dd3: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
		do
			create dd1.make (4, 11, 4)
			create dd2.make (2, 8, 12)
			create dd3.make (6, 19, 16)
			assert_equal ("infix_plus", dd3, dd1 + dd2)
			create dd3.make (2, 3, -8)
			assert_equal ("infix_minus", dd3, dd1 - dd2)
			create dd3.make (2, 8, 12)
			assert_equal ("prefix_plus", dd3, + dd2)
			create dd3.make (-2, -8, -12)
			assert_equal ("prefix_minus", dd3, - dd2)
			assert ("infix_less1", not (dd1 < dd2))
			assert ("infix_less2", not (dd2 < dd1))
			assert ("is_equal", not dd1.is_equal (dd2))
			assert ("is_definite", not dd2.is_definite)
			create dtd.make (2, 8, 12, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd2.to_date_time_duration)
		end

	test_date_duration4 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2, dd3: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
		do
			create dd1.make (4, 11, 4)
			create dd2.make (-12, 8, -23)
			create dd3.make (-8, 19, -19)
			assert_equal ("infix_plus", dd3, dd1 + dd2)
			create dd3.make (16, 3, 27)
			assert_equal ("infix_minus", dd3, dd1 - dd2)
			create dd3.make (-12, 8, -23)
			assert_equal ("prefix_plus", dd3, + dd2)
			create dd3.make (12, -8, 23)
			assert_equal ("prefix_minus", dd3, - dd2)
			assert ("infix_less1", not (dd1 < dd2))
			assert ("infix_less2", dd2 < dd1)
			assert ("is_equal", not dd1.is_equal (dd2))
			assert ("is_definite", not dd2.is_definite)
			create dtd.make (-12, 8, -23, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd2.to_date_time_duration)
		end

	test_date_duration5 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1, d2: DT_DATE
		do
			create dd1.make (0, 0, 4)
			create d1.make (2000, 1, 31)
			create d2.make (2000, 2, 4)
			assert_equal ("date", d2, dd1.date (d1))
			assert ("is_definite", dd1.is_definite)
			assert ("is_canonical", dd1.is_canonical (d1))
			create dd2.make (0, 0, 4)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 0, 4, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration6 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1: DT_DATE
		do
			create dd1.make (0, 0, 472)
			create d1.make (2000, 1, 31)
			assert ("is_definite", dd1.is_definite)
			assert ("is_canonical", not dd1.is_canonical (d1))
			create dd2.make (0, 0, 472)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			create dd2.make (1, 3, 17)
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 0, 472, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration7 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1, d2: DT_DATE
		do
			create dd1.make (0, 0, 30)
			create d1.make (2000, 2, 29)
			create d2.make (2000, 3, 30)
			assert_equal ("date", d2, dd1.date (d1))
			assert ("is_definite", dd1.is_definite)
			assert ("is_canonical", not dd1.is_canonical (d1))
			create dd2.make (0, 0, 30)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			create dd2.make (0, 1, 1)
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 0, 30, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration8 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1: DT_DATE
		do
			create dd1.make (0, 1, 2)
			create d1.make (2000, 2, 29)
			assert ("is_definite", not dd1.is_definite)
			assert ("is_canonical", dd1.is_canonical (d1))
			create dd2.make (0, 0, 31)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			create dd2.make (0, 1, 2)
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 1, 2, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration9 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1, d2: DT_DATE
		do
			create dd1.make (0, 1, 30)
			create d1.make (2000, 2, 1)
			create d2.make (2000, 3, 31)
			assert_equal ("date", d2, dd1.date (d1))
			assert ("is_definite", not dd1.is_definite)
			assert ("is_canonical", dd1.is_canonical (d1))
			create dd2.make (0, 0, 59)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			create dd2.make (0, 1, 30)
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 1, 30, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration10 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
			dtd: DT_DATE_TIME_DURATION
			d1, d2: DT_DATE
		do
			create dd1.make (0, 0, -30)
			create d1.make (2000, 4, 30)
			create d2.make (2000, 3, 31)
			assert_equal ("date", d2, dd1.date (d1))
			assert ("is_definite", dd1.is_definite)
			assert ("is_canonical", dd1.is_canonical (d1))
			create dd2.make (0, 0, -30)
			assert_equal ("to_definite", dd2, dd1.to_definite (d1))
			assert_equal ("to_canonical", dd2, dd1.to_canonical (d1))
			create dtd.make (0, 0, -30, 0, 0, 0)
			assert_equal ("to_date_time_duration", dtd, dd1.to_date_time_duration)
		end

	test_date_duration11 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
		do
			create dd1.make (2, 8, 30)
			dd1.set_year_month_day (10, 3, 23)
			create dd2.make (10, 3, 23)
			assert_equal ("set_year_month_day", dd2, dd1)
			dd1.set_year (-4)
			create dd2.make (-4, 3, 23)
			assert_equal ("set_year", dd2, dd1)
			dd1.set_month (16)
			create dd2.make (-4, 16, 23)
			assert_equal ("set_month", dd2, dd1)
			dd1.set_day (0)
			create dd2.make (-4, 16, 0)
			assert_equal ("set_day", dd2, dd1)
			dd1.add_years_months_days (10, 3, 23)
			create dd2.make (6, 19, 23)
			assert_equal ("add_years_months_days", dd2, dd1)
			dd1.add_years (-4)
			create dd2.make (2, 19, 23)
			assert_equal ("add_years", dd2, dd1)
			dd1.add_months (16)
			create dd2.make (2, 35, 23)
			assert_equal ("add_months", dd2, dd1)
			dd1.add_days (0)
			create dd2.make (2, 35, 23)
			assert_equal ("add_days", dd2, dd1)
		end

	test_date_duration12 is
			-- Test features of DT_DATE_DURATION.
		local
			dd1, dd2: DT_DATE_DURATION
		do
			create dd1.make (2, 0, 30)
			create dd2.make (1, 12, 30)
			assert ("is_equal1", dd1.is_equal (dd2))
			assert ("infix_less1", not (dd1 < dd2))
			assert ("infix_less2", not (dd2 < dd1))
			create dd2.make (1, 12, 12)
			assert ("is_equal2", not dd1.is_equal (dd2))
			assert ("infix_less3", not (dd1 < dd2))
			assert ("infix_less4", dd2 < dd1)
		end

end
