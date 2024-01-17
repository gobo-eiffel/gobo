note

	description:

		"Test features of class DT_FIXED_OFFSET_TIME_ZONE"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class DT_TEST_FIXED_OFFSET_TIME_ZONE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_date_time_to_utc
			-- Test feature `date_time_to_utc' class DT_FIXED_OFFSET_TIME_ZONE.
		local
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			dt1, dt2: DT_DATE_TIME
		do
				-- Positive offset.
			create l_time_zone.make_hours_minutes (5, 0)
			create dt1.make (2004, 12, 7, 22, 35, 34)
			create dt2.make (2004, 12, 7, 17, 35, 34)
			assert_equal ("date_time_to_utc1", dt2, l_time_zone.date_time_to_utc (dt1))
			create dt1.make (2004, 12, 7, 4, 3, 0)
			create dt2.make (2004, 12, 6, 23, 3, 0)
			assert_equal ("date_time_to_utc2", dt2, l_time_zone.date_time_to_utc (dt1))
				-- Negative offset.
			create l_time_zone.make_hours_minutes (-11, -3)
			create dt1.make (2004, 12, 7, 22, 35, 34)
			create dt2.make (2004, 12, 8, 9, 38, 34)
			assert_equal ("date_time_to_utc3", dt2, l_time_zone.date_time_to_utc (dt1))
			create dt1.make (2004, 12, 7, 6, 6, 0)
			create dt2.make (2004, 12, 7, 17, 9, 0)
			assert_equal ("date_time_to_utc4", dt2, l_time_zone.date_time_to_utc (dt1))
		end

	test_date_time_from_utc
			-- Test feature `date_time_from_utc' class DT_FIXED_OFFSET_TIME_ZONE.
		local
			l_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			dt1, dt2: DT_DATE_TIME
		do
				-- Positive offset.
			create l_time_zone.make_hours_minutes (3, 30)
			create dt1.make (2004, 12, 7, 22, 35, 34)
			create dt2.make (2004, 12, 8, 2, 5, 34)
			assert_equal ("date_time_from_utc1", dt2, l_time_zone.date_time_from_utc (dt1))
			create dt1.make (2004, 12, 7, 12, 3, 0)
			create dt2.make (2004, 12, 7, 15, 33, 0)
			assert_equal ("date_time_from_utc2", dt2, l_time_zone.date_time_from_utc (dt1))
				-- Negative offset.
			create l_time_zone.make_hours_minutes (-8, -10)
			create dt1.make (2004, 12, 7, 22, 35, 34)
			create dt2.make (2004, 12, 7, 14, 25, 34)
			assert_equal ("date_time_from_utc3", dt2, l_time_zone.date_time_from_utc (dt1))
			create dt1.make (2004, 12, 7, 6, 6, 0)
			create dt2.make (2004, 12, 6, 21, 56, 0)
			assert_equal ("date_time_from_utc4", dt2, l_time_zone.date_time_from_utc (dt1))
		end

end
