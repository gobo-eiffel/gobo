indexing

	description:

		"Test features of class DT_DATE_TIME_VALUE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_DATE_TIME_VALUE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_year_month_day is
			-- Test features `year', `month' and `day' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_integers_equal ("year1", 1967, dtv.year)
			assert_integers_equal ("month1", 5, dtv.month)
			assert_integers_equal ("day1", 17, dtv.day)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_integers_equal ("year2", -156, dtv.year)
			assert_integers_equal ("month2", 8, dtv.month)
			assert_integers_equal ("day2", 16, dtv.day)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_integers_equal ("year3", 3, dtv.year)
			assert_integers_equal ("month3", -12, dtv.month)
			assert_integers_equal ("day3", 123, dtv.day)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_integers_equal ("year4", 0, dtv.year)
			assert_integers_equal ("month4", 3, dtv.month)
			assert_integers_equal ("day4", 2, dtv.day)
		end

	test_hour_minute_second_millisecond is
			-- Test features `hour', `minute', `second' and
			-- `millisecond' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_integers_equal ("hour1", 6, dtv.hour)
			assert_integers_equal ("minute1", 30, dtv.minute)
			assert_integers_equal ("second1", 15, dtv.second)
			assert_integers_equal ("millisecond1", 123, dtv.millisecond)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_integers_equal ("hour2", 23, dtv.hour)
			assert_integers_equal ("minute2", 12, dtv.minute)
			assert_integers_equal ("second2", 3, dtv.second)
			assert_integers_equal ("millisecond2", 2, dtv.millisecond)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_integers_equal ("hour3", 23, dtv.hour)
			assert_integers_equal ("minute3", -3, dtv.minute)
			assert_integers_equal ("second3", 12, dtv.second)
			assert_integers_equal ("millisecond3", -45, dtv.millisecond)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_integers_equal ("hour4", 0, dtv.hour)
			assert_integers_equal ("minute4", 4, dtv.minute)
			assert_integers_equal ("second4", 3, dtv.second)
			assert_integers_equal ("millisecond4", 456, dtv.millisecond)
		end

	test_date_time is
			-- Test features `date' and `time' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
			dv: DT_DATE_VALUE
			tv: DT_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create {DT_DATE} dv.make (1967, 5, 17)
			create {DT_TIME} tv.make_precise (6, 30, 15, 123)
			assert_equal ("date1", dv, dtv.date)
			assert_equal ("time1", tv, dtv.time)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create {DT_DATE} dv.make (-156, 8, 16)
			create {DT_TIME} tv.make_precise (23, 12, 3, 2)
			assert_equal ("date2", dv, dtv.date)
			assert_equal ("time2", tv, dtv.time)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create {DT_DATE_DURATION} dv.make (3, -12, 123)
			create {DT_TIME_DURATION} tv.make_precise (23, -3, 12, -45)
			assert_equal ("date3", dv, dtv.date)
			assert_equal ("time3", tv, dtv.time)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create {DT_DATE_DURATION} dv.make (0, 3, 2)
			create {DT_TIME_DURATION} tv.make_precise (0, 4, 3, 456)
			assert_equal ("date4", dv, dtv.date)
			assert_equal ("time4", tv, dtv.time)
		end

	test_out is
			-- Test features `out' and `precise_out' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_equal ("out1", "1967/05/17 06:30:15.123", dtv.out)
			assert_equal ("precise_out1", "1967/05/17 06:30:15.123", dtv.precise_out)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_equal ("out2", "-156/08/16 23:12:03.002", dtv.out)
			assert_equal ("precise_out2", "-156/08/16 23:12:03.002", dtv.precise_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_equal ("out3", "3/-12/123 23:-3:12.-45", dtv.out)
			assert_equal ("precise_out3", "3/-12/123 23:-3:12.-45", dtv.precise_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_equal ("out4", "0/3/2 0:4:3.456", dtv.out)
			assert_equal ("precise_out4", "0/3/2 0:4:3.456", dtv.precise_out)
		end

	test_date_out is
			-- Test feature `date_out' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_strings_equal ("date_out1", "1967/05/17", dtv.date_out)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_strings_equal ("date_out2", "-156/08/16", dtv.date_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_strings_equal ("date_out3", "3/-12/123", dtv.date_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_strings_equal ("date_out4", "0/3/2", dtv.date_out)
		end

	test_time_out is
			-- Test features `time_out' and `precise_time_out' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_strings_equal ("time_out1", "06:30:15.123", dtv.time_out)
			assert_strings_equal ("precise_time_out1", "06:30:15.123", dtv.precise_time_out)
			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_strings_equal ("time_out2", "23:12:03.002", dtv.time_out)
			assert_strings_equal ("precise_time_out2", "23:12:03.002", dtv.precise_time_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_strings_equal ("time_out3", "23:-3:12.-45", dtv.time_out)
			assert_strings_equal ("precise_time_out3", "23:-3:12.-45", dtv.precise_time_out)
			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_strings_equal ("time_out4", "0:4:3.456", dtv.time_out)
			assert_strings_equal ("precise_time_out4", "0:4:3.456", dtv.precise_time_out)
		end

	test_append_to_string is
			-- Test features `append_to_string' and
			-- `append_precise_to_string' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
			a_string: STRING
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_to_string (a_string)
			assert_strings_equal ("append_to_string1", "G#1967/05/17 06:30:15.123", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string1", "G#1967/05/17 06:30:15.123", a_string)

			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_to_string (a_string)
			assert_equal ("append_to_string2", "G#-156/08/16 23:12:03.002", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string2", "G#-156/08/16 23:12:03.002", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_to_string (a_string)
			assert_strings_equal ("append_to_string3", "G#3/-12/123 23:-3:12.-45", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_to_string (a_string)
			assert_equal ("append_precise_to_string3", "G#3/-12/123 23:-3:12.-45", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_to_string (a_string)
			assert_strings_equal ("append_to_string4", "G#0/3/2 0:4:3.456", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string4", "G#0/3/2 0:4:3.456", a_string)
		end

	test_append_date_to_string is
			-- Test feature `append_date_to_string' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
			a_string: STRING
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_date_to_string (a_string)
			assert_strings_equal ("append_date_to_string1", "G#1967/05/17", a_string)

			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_date_to_string (a_string)
			assert_strings_equal ("append_date_to_string2", "G#-156/08/16", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_date_to_string (a_string)
			assert_strings_equal ("append_date_to_string3", "G#3/-12/123", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_date_to_string (a_string)
			assert_strings_equal ("append_date_to_string4", "G#0/3/2", a_string)
		end

	test_append_time_to_string is
			-- Test features `append_time_to_string' and 
			-- `append_precise_time_to_string' of class DT_DATE_TIME_VALUE.
		local
			dtv: DT_DATE_TIME_VALUE
			a_string: STRING
		do
			create {DT_DATE_TIME} dtv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string1", "G#06:30:15.123", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string1", "G#06:30:15.123", a_string)

			create {DT_DATE_TIME} dtv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string2", "G#23:12:03.002", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string2", "G#23:12:03.002", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string3", "G#23:-3:12.-45", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string3", "G#23:-3:12.-45", a_string)

			create {DT_DATE_TIME_DURATION} dtv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string4", "G#0:4:3.456", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			dtv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string4", "G#0:4:3.456", a_string)
		end

end
