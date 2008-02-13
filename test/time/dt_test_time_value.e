indexing

	description:

		"Test features of class DT_TIME_VALUE"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_TIME_VALUE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_hour_minute_second_millisecond is
			-- Test features `hour', `minute', `second' and
			-- `millisecond' of class DT_TIME_VALUE.
		local
			tv: DT_TIME_VALUE
		do
			create {DT_TIME} tv.make_precise (13, 5, 12, 45)
			assert_integers_equal ("hour1", 13, tv.hour)
			assert_integers_equal ("minute1", 5, tv.minute)
			assert_integers_equal ("second1", 12, tv.second)
			assert_integers_equal ("millisecond1", 45, tv.millisecond)
			create {DT_TIME} tv.make_precise (0, 0, 0, 0)
			assert_integers_equal ("hour2", 0, tv.hour)
			assert_integers_equal ("minute2", 0, tv.minute)
			assert_integers_equal ("second2", 0, tv.second)
			assert_integers_equal ("millisecond2", 0, tv.millisecond)
			create {DT_TIME_DURATION} tv.make_precise (-1, 0, 5, -3)
			assert_integers_equal ("hour3", -1, tv.hour)
			assert_integers_equal ("minute3", 0, tv.minute)
			assert_integers_equal ("second3", 5, tv.second)
			assert_integers_equal ("millisecond3", -3, tv.millisecond)
			create {DT_TIME_DURATION} tv.make_precise (4, 5, 5, 234)
			assert_integers_equal ("hour4", 4, tv.hour)
			assert_integers_equal ("minute4", 5, tv.minute)
			assert_integers_equal ("second4", 5, tv.second)
			assert_integers_equal ("millisecond4", 234, tv.millisecond)
			create {DT_DATE_TIME} tv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_integers_equal ("hour5", 6, tv.hour)
			assert_integers_equal ("minute5", 30, tv.minute)
			assert_integers_equal ("second5", 15, tv.second)
			assert_integers_equal ("millisecond5", 123, tv.millisecond)
			create {DT_DATE_TIME} tv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_integers_equal ("hour6", 23, tv.hour)
			assert_integers_equal ("minute6", 12, tv.minute)
			assert_integers_equal ("second6", 3, tv.second)
			assert_integers_equal ("millisecond6", 2, tv.millisecond)
			create {DT_DATE_TIME_DURATION} tv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_integers_equal ("hour7", 23, tv.hour)
			assert_integers_equal ("minute7", -3, tv.minute)
			assert_integers_equal ("second7", 12, tv.second)
			assert_integers_equal ("millisecond7", -45, tv.millisecond)
			create {DT_DATE_TIME_DURATION} tv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_integers_equal ("hour8", 0, tv.hour)
			assert_integers_equal ("minute8", 4, tv.minute)
			assert_integers_equal ("second8", 3, tv.second)
			assert_integers_equal ("millisecond8", 456, tv.millisecond)
		end

	test_out is
			-- Test features `out' and `precise_out' of class DT_TIME_VALUE.
		local
			tv: DT_TIME_VALUE
		do
			create {DT_TIME} tv.make_precise (13, 5, 12, 45)
			assert_strings_equal ("out1", "13:05:12.045", tv.out)
			assert_strings_equal ("precise_out1", "13:05:12.045", tv.precise_out)
			create {DT_TIME} tv.make_precise (0, 0, 0, 0)
			assert_strings_equal ("out2", "00:00:00", tv.out)
			assert_strings_equal ("precise_out2", "00:00:00.000", tv.precise_out)
			create {DT_TIME_DURATION} tv.make_precise (-1, 0, 5, -3)
			assert_strings_equal ("out3", "-1:0:5.-3", tv.out)
			assert_strings_equal ("precise_out3", "-1:0:5.-3", tv.precise_out)
			create {DT_TIME_DURATION} tv.make_precise (4, 5, 5, 234)
			assert_strings_equal ("out4", "4:5:5.234", tv.out)
			assert_strings_equal ("precise_out4", "4:5:5.234", tv.precise_out)
			create {DT_DATE_TIME} tv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_strings_equal ("out5", "1967/05/17 06:30:15.123", tv.out)
			assert_strings_equal ("precise_out5", "1967/05/17 06:30:15.123", tv.precise_out)
			create {DT_DATE_TIME} tv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_strings_equal ("out6", "-156/08/16 23:12:03.002", tv.out)
			assert_strings_equal ("precise_out6", "-156/08/16 23:12:03.002", tv.precise_out)
			create {DT_DATE_TIME_DURATION} tv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_strings_equal ("out7", "3/-12/123 23:-3:12.-45", tv.out)
			assert_strings_equal ("precise_out7", "3/-12/123 23:-3:12.-45", tv.precise_out)
			create {DT_DATE_TIME_DURATION} tv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_strings_equal ("out8", "0/3/2 0:4:3.456", tv.out)
			assert_strings_equal ("precise_out8", "0/3/2 0:4:3.456", tv.precise_out)
		end

	test_time_out is
			-- Test features `time_out' and `precise_time_out' of class DT_TIME_VALUE.
		local
			tv: DT_TIME_VALUE
		do
			create {DT_TIME} tv.make_precise (13, 5, 12, 45)
			assert_strings_equal ("time_out1", "13:05:12.045", tv.time_out)
			assert_strings_equal ("precise_time_out1", "13:05:12.045", tv.precise_time_out)
			create {DT_TIME} tv.make_precise (0, 0, 0, 0)
			assert_strings_equal ("time_out2", "00:00:00", tv.time_out)
			assert_strings_equal ("precise_time_out2", "00:00:00.000", tv.precise_time_out)
			create {DT_TIME_DURATION} tv.make_precise (-1, 0, 5, -3)
			assert_strings_equal ("time_out3", "-1:0:5.-3", tv.time_out)
			assert_strings_equal ("precise_time_out3", "-1:0:5.-3", tv.precise_time_out)
			create {DT_TIME_DURATION} tv.make_precise (4, 5, 5, 234)
			assert_strings_equal ("time_out4", "4:5:5.234", tv.time_out)
			assert_strings_equal ("precise_time_out4", "4:5:5.234", tv.precise_time_out)
			create {DT_DATE_TIME} tv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			assert_strings_equal ("time_out5", "06:30:15.123", tv.time_out)
			assert_strings_equal ("precise_time_out5", "06:30:15.123", tv.precise_time_out)
			create {DT_DATE_TIME} tv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			assert_strings_equal ("time_out6", "23:12:03.002", tv.time_out)
			assert_strings_equal ("precise_time_out6", "23:12:03.002", tv.precise_time_out)
			create {DT_DATE_TIME_DURATION} tv.make_precise (3, -12, 123, 23, -3, 12, -45)
			assert_strings_equal ("time_out7", "23:-3:12.-45", tv.time_out)
			assert_strings_equal ("precise_time_out7", "23:-3:12.-45", tv.precise_time_out)
			create {DT_DATE_TIME_DURATION} tv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			assert_strings_equal ("time_out8", "0:4:3.456", tv.time_out)
			assert_strings_equal ("precise_time_out8", "0:4:3.456", tv.precise_time_out)
		end

	test_append_to_string is
			-- Test features `append_to_string' and
			-- `append_precise_to_string' of class DT_TIME_VALUE.
		local
			tv: DT_TIME_VALUE
			a_string: STRING
		do
			create {DT_TIME} tv.make_precise (13, 5, 12, 45)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string1", "G#13:05:12.045", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string1", "G#13:05:12.045", a_string)

			create {DT_TIME} tv.make_precise (0, 0, 0, 0)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string2", "G#00:00:00", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string2", "G#00:00:00.000", a_string)

			create {DT_TIME_DURATION} tv.make_precise (-1, 0, 5, -3)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string3", "G#-1:0:5.-3", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string3", "G#-1:0:5.-3", a_string)

			create {DT_TIME_DURATION} tv.make_precise (4, 5, 5, 234)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string4", "G#4:5:5.234", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string4", "G#4:5:5.234", a_string)

			create {DT_DATE_TIME} tv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string5", "G#1967/05/17 06:30:15.123", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string5", "G#1967/05/17 06:30:15.123", a_string)

			create {DT_DATE_TIME} tv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string6", "G#-156/08/16 23:12:03.002", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string6", "G#-156/08/16 23:12:03.002", a_string)

			create {DT_DATE_TIME_DURATION} tv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string7", "G#3/-12/123 23:-3:12.-45", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string7", "G#3/-12/123 23:-3:12.-45", a_string)

			create {DT_DATE_TIME_DURATION} tv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_to_string (a_string)
			assert_strings_equal ("append_to_string8", "G#0/3/2 0:4:3.456", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_to_string (a_string)
			assert_strings_equal ("append_precise_to_string8", "G#0/3/2 0:4:3.456", a_string)
		end

	test_append_time_to_string is
			-- Test features `append_time_to_string' and 
			-- `append_precise_time_to_string' of class DT_TIME_VALUE.
		local
			tv: DT_TIME_VALUE
			a_string: STRING
		do
			create {DT_TIME} tv.make_precise (13, 5, 12, 45)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string1", "G#13:05:12.045", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string1", "G#13:05:12.045", a_string)

			create {DT_TIME} tv.make_precise (0, 0, 0, 0)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string2", "G#00:00:00", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string2", "G#00:00:00.000", a_string)

			create {DT_TIME_DURATION} tv.make_precise (-1, 0, 5, -3)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string3", "G#-1:0:5.-3", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string3", "G#-1:0:5.-3", a_string)

			create {DT_TIME_DURATION} tv.make_precise (4, 5, 5, 234)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string4", "G#4:5:5.234", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string4", "G#4:5:5.234", a_string)

			create {DT_DATE_TIME} tv.make_precise (1967, 5, 17, 6, 30, 15, 123)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string5", "G#06:30:15.123", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string5", "G#06:30:15.123", a_string)

			create {DT_DATE_TIME} tv.make_precise (-156, 8, 16, 23, 12, 3, 2)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string6", "G#23:12:03.002", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string6", "G#23:12:03.002", a_string)

			create {DT_DATE_TIME_DURATION} tv.make_precise (3, -12, 123, 23, -3, 12, -45)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string7", "G#23:-3:12.-45", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string7", "G#23:-3:12.-45", a_string)

			create {DT_DATE_TIME_DURATION} tv.make_precise (0, 3, 2, 0, 4, 3, 456) 
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_time_to_string (a_string)
			assert_strings_equal ("append_time_to_string8", "G#0:4:3.456", a_string)
			create a_string.make (50)
			a_string.append_string ("G#")
			tv.append_precise_time_to_string (a_string)
			assert_strings_equal ("append_precise_time_to_string8", "G#0:4:3.456", a_string)
		end

end
