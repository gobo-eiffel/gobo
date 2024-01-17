note

	description:

		"Test features of class DT_DATE_TIME"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"

class DT_TEST_DATE_TIME

inherit

	TS_TEST_CASE
	DT_GREGORIAN_CALENDAR

create

	make_default

feature -- Test

	test_date_duration
			-- Test feature `date_duration'.
		local
			dt1, dt2: DT_DATE_TIME
			dd1: DT_DATE_DURATION
		do
			create dt1.make (2007, 9, 18, 16, 0, 0)
			create dt2.make (2007, 9, 18, 17, 0, 0)
			create dd1.make (0, 0, 0)
			assert_equal ("date_duration1", dd1, dt1.date_duration (dt1))
			assert_equal ("date_duration2", dd1, dt1.date_duration (dt2))
		end

	test_time_duration
			-- Test feature `time_duration'.
		local
			dt1, dt2: DT_DATE_TIME
			td1: DT_TIME_DURATION
		do
			create dt1.make (2007, 9, 20, 16, 0, 0)
			create dt2.make (2007, 9, 18, 16, 0, 0)
			create td1.make (0, 0, 0)
			assert_equal ("time_duration1", td1, dt1.time_duration (dt1))
			assert_equal ("time_duration2", td1, dt1.time_duration (dt2))
		end

end
